<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();
$id  = (int) ($_GET['id'] ?? 0);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['aksi'] ?? '') === 'lunasi') {
    cek_csrf();
    $pdo->prepare(
        "UPDATE transaksi_penjualan
            SET status_pembayaran = 'paid', sisa_bayar = 0, tanggal_pembayaran = NOW(),
                status_service = 'selesai', id_kasir = ?, updated_by = ?
          WHERE id_transaksi_penjualan = ? AND status_pembayaran = 'unpaid'"
    )->execute([pengguna()['id'], pengguna()['id'], $id]);
    flash('success', 'Pembayaran telah dicatat lunas.');
    redirect('penjualan_detail.php?id=' . $id);
}

$stmt = $pdo->prepare(
    'SELECT tp.*, c.nama_customer, c.no_telepon_customer, c.no_polisi, c.kendaraan_merk, c.kendaraan_model,
            m.nama_mekanik, p.nama_pengguna AS nama_kasir
       FROM transaksi_penjualan tp
       JOIN customer c ON c.id_customer = tp.id_customer
       LEFT JOIN mekanik m ON m.id = tp.id_mekanik
       LEFT JOIN pengguna p ON p.id = tp.id_kasir
      WHERE tp.id_transaksi_penjualan = ?'
);
$stmt->execute([$id]);
$t = $stmt->fetch();
if (!$t) {
    flash('danger', 'Transaksi tidak ditemukan.');
    redirect('penjualan.php');
}

$detail = $pdo->prepare(
    'SELECT d.*, s.kode_suku_cadang, s.nama_suku_cadang, s.satuan
       FROM detail_transaksi_penjualan d
       JOIN suku_cadang s ON s.id_suku_cadang = d.id_suku_cadang
      WHERE d.id_transaksi_penjualan = ?'
);
$detail->execute([$id]);
$items = $detail->fetchAll();

$judul = 'Invoice ' . $t['no_invoice'];
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <h2><?= e($t['no_invoice']) ?> <?= badge($t['status_pembayaran']) ?> <?= badge($t['status_service']) ?></h2>
        <div class="actions no-print">
            <?php if ($t['status_pembayaran'] === 'unpaid'): ?>
                <form method="post">
                    <?= csrf_field() ?>
                    <input type="hidden" name="aksi" value="lunasi">
                    <button class="btn btn-success btn-sm" type="submit">Catat Pelunasan</button>
                </form>
            <?php endif; ?>
            <button class="btn btn-light btn-sm" onclick="window.print()">Cetak</button>
            <a class="btn btn-light btn-sm" href="penjualan.php">Kembali</a>
        </div>
    </div>
    <div class="card-body">
        <div class="invoice-head">
            <dl>
                <dt>Customer</dt><dd><?= e($t['nama_customer']) ?></dd>
                <dt>Telepon</dt><dd><?= e($t['no_telepon_customer']) ?></dd>
                <dt>Kendaraan</dt><dd><?= e("{$t['kendaraan_merk']} {$t['kendaraan_model']} · {$t['no_polisi']}") ?></dd>
                <dt>Kilometer</dt><dd><?= $t['km_kendaraan'] ? number_format($t['km_kendaraan'], 0, ',', '.') . ' km' : '-' ?></dd>
            </dl>
            <dl>
                <dt>Tanggal</dt><dd><?= tanggal_indo($t['tanggal_transaksi']) ?></dd>
                <dt>Jenis Servis</dt><dd><?= e($t['jenis_service']) ?></dd>
                <dt>Mekanik</dt><dd><?= e($t['nama_mekanik']) ?></dd>
                <dt>Kasir</dt><dd><?= e($t['nama_kasir'] ?? '-') ?></dd>
            </dl>
        </div>
        <?php if ($t['keluhan']): ?>
            <p><strong>Keluhan:</strong> <?= e($t['keluhan']) ?></p>
        <?php endif; ?>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Kode</th><th>Suku Cadang</th><th class="num">Qty</th><th class="num">Harga</th><th class="num">Subtotal</th><th>Garansi s.d.</th></tr></thead>
            <tbody>
            <?php foreach ($items as $i): ?>
                <tr>
                    <td><?= e($i['kode_suku_cadang']) ?></td>
                    <td><?= e($i['nama_suku_cadang']) ?></td>
                    <td class="num"><?= (int) $i['qty'] ?> <?= e($i['satuan']) ?></td>
                    <td class="num"><?= rupiah($i['harga_jual_satuan']) ?></td>
                    <td class="num"><?= rupiah($i['subtotal']) ?></td>
                    <td><?= tanggal_indo($i['garansi_selesai']) ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="card-body">
        <table class="summary">
            <tr><td>Subtotal Suku Cadang</td><td class="num"><?= rupiah($t['subtotal_suku_cadang']) ?></td></tr>
            <tr><td>Biaya Jasa</td><td class="num"><?= rupiah($t['biaya_jasa']) ?></td></tr>
            <tr><td>Diskon</td><td class="num">- <?= rupiah($t['diskon']) ?></td></tr>
            <tr><td>PPN</td><td class="num"><?= rupiah($t['pajak']) ?></td></tr>
            <tr class="total"><td>Total Bayar</td><td class="num"><?= rupiah($t['total_bayar']) ?></td></tr>
            <?php if ($t['metode_pembayaran']): ?>
                <tr><td>Metode</td><td class="num"><?= e(ucfirst($t['metode_pembayaran'])) ?></td></tr>
            <?php endif; ?>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
