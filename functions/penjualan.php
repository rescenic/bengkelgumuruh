<?php
/**
 * Logika bisnis transaksi penjualan suku cadang & jasa servis.
 */

declare(strict_types=1);

const TARIF_PPN = 0.10; // PPN 10% dari (subtotal suku cadang + biaya jasa - diskon)

/**
 * Membuat nomor invoice berikutnya dengan format INV/{tahun}/{urut 3 digit}.
 */
function buatNomorInvoice(PDO $pdo, string $tanggal): string
{
    $tahun = date('Y', strtotime($tanggal));
    $stmt  = $pdo->prepare(
        "SELECT MAX(CAST(SUBSTRING_INDEX(no_invoice, '/', -1) AS UNSIGNED))
           FROM transaksi_penjualan
          WHERE no_invoice LIKE ?"
    );
    $stmt->execute(["INV/{$tahun}/%"]);
    $urut = (int) $stmt->fetchColumn() + 1;

    return sprintf('INV/%s/%03d', $tahun, $urut);
}

/**
 * Menyimpan satu transaksi penjualan beserta detail suku cadangnya.
 *
 * Semua langkah dijalankan dalam satu transaksi database (ACID):
 *  1. Mengunci baris suku cadang (SELECT ... FOR UPDATE) dan memvalidasi stok.
 *  2. Menghitung subtotal, pajak, dan total bayar di sisi server.
 *  3. Menyimpan header ke tabel transaksi_penjualan.
 *  4. Menyimpan item ke tabel detail_transaksi_penjualan (termasuk masa garansi).
 *  5. Mengurangi stok_saat_ini dan mencatat jejaknya di tabel stok_movement.
 *  6. Memperbarui akumulasi transaksi pada tabel customer.
 * Jika salah satu langkah gagal, seluruh perubahan dibatalkan (rollback).
 *
 * @param array $header data header transaksi dari formulir
 * @param array $items  daftar item: [['id_suku_cadang' => int, 'qty' => int], ...]
 * @return int id_transaksi_penjualan yang baru dibuat
 * @throws InvalidArgumentException jika data tidak valid / stok tidak cukup
 */
function simpanTransaksiPenjualan(PDO $pdo, array $header, array $items, int $idKasir): int
{
    $items = array_values(array_filter($items, fn ($i) => (int) ($i['id_suku_cadang'] ?? 0) > 0 && (int) ($i['qty'] ?? 0) > 0));
    if (empty($header['id_customer']) || empty($header['id_mekanik'])) {
        throw new InvalidArgumentException('Customer dan mekanik wajib dipilih.');
    }
    if (count($items) === 0) {
        throw new InvalidArgumentException('Minimal satu suku cadang harus ditambahkan.');
    }

    $tanggal   = $header['tanggal_transaksi'] ?: date('Y-m-d');
    $biayaJasa = max(0, (float) ($header['biaya_jasa'] ?? 0));
    $diskon    = max(0, (float) ($header['diskon'] ?? 0));
    $lunas     = ($header['status_pembayaran'] ?? 'unpaid') === 'paid';

    $pdo->beginTransaction();
    try {
        // 1 & 2. Kunci stok, validasi, dan hitung subtotal
        $cariPart = $pdo->prepare(
            'SELECT id_suku_cadang, nama_suku_cadang, harga_jual, stok_saat_ini, garansi_bulan
               FROM suku_cadang
              WHERE id_suku_cadang = ? AND status_produk = 1
              FOR UPDATE'
        );

        $baris = [];
        $subtotalPart = 0.0;
        $totalItem = 0;
        foreach ($items as $item) {
            $cariPart->execute([(int) $item['id_suku_cadang']]);
            $part = $cariPart->fetch();
            $qty  = (int) $item['qty'];

            if (!$part) {
                throw new InvalidArgumentException('Suku cadang tidak ditemukan atau nonaktif.');
            }
            if ($part['stok_saat_ini'] < $qty) {
                throw new InvalidArgumentException(sprintf(
                    'Stok %s tidak cukup (tersisa %d).', $part['nama_suku_cadang'], $part['stok_saat_ini']
                ));
            }

            $subtotal      = $qty * (float) $part['harga_jual'];
            $subtotalPart += $subtotal;
            $totalItem    += $qty;
            $baris[]       = $part + ['qty' => $qty, 'subtotal' => $subtotal];
        }

        $dpp        = max(0, $subtotalPart + $biayaJasa - $diskon);
        $pajak      = round($dpp * TARIF_PPN, 2);
        $totalBayar = $dpp + $pajak;

        // 3. Simpan header transaksi
        $noInvoice = buatNomorInvoice($pdo, $tanggal);
        $pdo->prepare(
            'INSERT INTO transaksi_penjualan
                (no_invoice, tanggal_transaksi, jam_masuk, jenis_service, keluhan, km_kendaraan,
                 total_item_suku_cadang, subtotal_suku_cadang, biaya_jasa, diskon, pajak, total_bayar,
                 status_service, status_pembayaran, metode_pembayaran, tanggal_pembayaran, sisa_bayar,
                 catatan, id_customer, id_mekanik, id_kasir, created_by)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
        )->execute([
            $noInvoice, $tanggal, date('H:i:s'), $header['jenis_service'] ?? null,
            $header['keluhan'] ?: null, $header['km_kendaraan'] !== '' ? (int) $header['km_kendaraan'] : null,
            $totalItem, $subtotalPart, $biayaJasa, $diskon, $pajak, $totalBayar,
            $lunas ? 'selesai' : 'dikerjakan', $lunas ? 'paid' : 'unpaid',
            $header['metode_pembayaran'] ?: null, $lunas ? date('Y-m-d H:i:s') : null,
            $lunas ? 0 : $totalBayar, $header['catatan'] ?: null,
            (int) $header['id_customer'], (int) $header['id_mekanik'], $idKasir, $idKasir,
        ]);
        $idTransaksi = (int) $pdo->lastInsertId();

        // 4 & 5. Simpan detail, kurangi stok, catat stok_movement
        $simpanDetail = $pdo->prepare(
            "INSERT INTO detail_transaksi_penjualan
                (id_transaksi_penjualan, id_suku_cadang, qty, harga_jual_satuan, subtotal,
                 garansi_mulai, garansi_selesai, status_garansi, created_by)
             VALUES (?, ?, ?, ?, ?, ?, ?, 'aktif', ?)"
        );
        $kurangiStok = $pdo->prepare(
            'UPDATE suku_cadang SET stok_saat_ini = stok_saat_ini - ?, updated_by = ? WHERE id_suku_cadang = ?'
        );
        $catatMovement = $pdo->prepare(
            "INSERT INTO stok_movement
                (id_suku_cadang, jenis_movement, qty_before, qty_change, qty_after,
                 referensi_type, referensi_id, keterangan, id_pengguna, created_by)
             VALUES (?, 'keluar', ?, ?, ?, 'penjualan', ?, ?, ?, ?)"
        );

        foreach ($baris as $b) {
            $garansiSelesai = $b['garansi_bulan']
                ? date('Y-m-d', strtotime("{$tanggal} +{$b['garansi_bulan']} months"))
                : null;

            $simpanDetail->execute([
                $idTransaksi, $b['id_suku_cadang'], $b['qty'], $b['harga_jual'], $b['subtotal'],
                $tanggal, $garansiSelesai, $idKasir,
            ]);
            $kurangiStok->execute([$b['qty'], $idKasir, $b['id_suku_cadang']]);
            $catatMovement->execute([
                $b['id_suku_cadang'], $b['stok_saat_ini'], -$b['qty'], $b['stok_saat_ini'] - $b['qty'],
                $idTransaksi, "Penjualan {$noInvoice}", $idKasir, $idKasir,
            ]);
        }

        // 6. Perbarui akumulasi transaksi customer
        $pdo->prepare(
            'UPDATE customer
                SET total_transaksi = total_transaksi + 1,
                    total_nilai_transaksi = total_nilai_transaksi + ?,
                    updated_by = ?
              WHERE id_customer = ?'
        )->execute([$totalBayar, $idKasir, (int) $header['id_customer']]);

        $pdo->commit();
        return $idTransaksi;
    } catch (Throwable $e) {
        $pdo->rollBack();
        throw $e;
    }
}
