<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_role([ROLE_SUPER_ADMIN, ROLE_BENDAHARA]);

$pdo = db();
$id  = (int) ($_GET['id'] ?? 0);

$stmt = $pdo->prepare(
    'SELECT tp.*, v.nama_vendor, v.nama_perusahaan, v.no_telepon_vendor, p.nama_pengguna
       FROM transaksi_pengadaan tp
       LEFT JOIN vendor v ON v.id_vendor = tp.id_vendor
       LEFT JOIN pengguna p ON p.id = tp.id_pengguna
      WHERE tp.id_transaksi_pengadaan = ?'
);
$stmt->execute([$id]);
$po = $stmt->fetch() ?: redirect('pengadaan.php');

$detail = $pdo->prepare(
    'SELECT d.*, s.kode_suku_cadang, s.nama_suku_cadang
       FROM detail_transaksi_pengadaan d
       JOIN suku_cadang s ON s.id_suku_cadang = d.id_suku_cadang
      WHERE d.id_transaksi_pengadaan = ?'
);
$detail->execute([$id]);

$bayar = $pdo->prepare(
    'SELECT pp.*, p.nama_pengguna FROM pembayaran_pengadaan pp
       LEFT JOIN pengguna p ON p.id = pp.id_pengguna
      WHERE pp.id_transaksi_pengadaan = ? ORDER BY pp.tanggal_bayar'
);
$bayar->execute([$id]);

$judul = 'Purchase Order ' . $po['no_po'];
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <h2><?= e($po['no_po']) ?> <?= badge($po['status_pengadaan']) ?> <?= badge($po['status_pembayaran']) ?></h2>
        <a class="btn btn-light btn-sm" href="pengadaan.php">Kembali</a>
    </div>
    <div class="card-body invoice-head">
        <dl>
            <dt>Vendor</dt><dd><?= e($po['nama_vendor']) ?></dd>
            <dt>Perusahaan</dt><dd><?= e($po['nama_perusahaan']) ?></dd>
            <dt>Salesman</dt><dd><?= e($po['nama_salesman'] ?? '-') ?></dd>
        </dl>
        <dl>
            <dt>Tanggal PO</dt><dd><?= tanggal_indo($po['tanggal_po']) ?></dd>
            <dt>Kedatangan</dt><dd><?= tanggal_indo($po['tanggal_kedatangan']) ?></dd>
            <dt>Invoice Vendor</dt><dd><?= e($po['no_invoice_vendor'] ?? '-') ?></dd>
            <dt>Dibuat oleh</dt><dd><?= e($po['nama_pengguna'] ?? '-') ?></dd>
        </dl>
    </div>
    <table>
        <thead><tr><th>Kode</th><th>Suku Cadang</th><th class="num">Qty Order</th><th class="num">Diterima</th><th class="num">Harga Beli</th><th class="num">Subtotal</th><th>Kondisi</th></tr></thead>
        <tbody>
        <?php foreach ($detail as $d): ?>
            <tr>
                <td><?= e($d['kode_suku_cadang']) ?></td>
                <td><?= e($d['nama_suku_cadang']) ?></td>
                <td class="num"><?= (int) $d['qty_order'] ?></td>
                <td class="num"><?= (int) $d['qty_diterima'] ?></td>
                <td class="num"><?= rupiah($d['harga_beli_satuan']) ?></td>
                <td class="num"><?= rupiah($d['subtotal']) ?></td>
                <td><?= e($d['kondisi_barang'] ?? '-') ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <div class="card-body">
        <table class="summary">
            <tr><td>Subtotal</td><td class="num"><?= rupiah($po['subtotal']) ?></td></tr>
            <tr><td>Pajak</td><td class="num"><?= rupiah($po['pajak']) ?></td></tr>
            <tr class="total"><td>Total</td><td class="num"><?= rupiah($po['total_bayar']) ?></td></tr>
        </table>
    </div>
</div>
<div class="card">
    <div class="card-header"><h2>Riwayat Pembayaran ke Vendor</h2></div>
    <table>
        <thead><tr><th>Tanggal</th><th>Metode</th><th>Referensi</th><th>Bendahara</th><th class="num">Jumlah</th></tr></thead>
        <tbody>
        <?php $ada = false; foreach ($bayar as $b): $ada = true; ?>
            <tr>
                <td><?= tanggal_indo($b['tanggal_bayar']) ?></td>
                <td><?= e(ucfirst((string) $b['metode_pembayaran'])) ?></td>
                <td><?= e($b['no_referensi']) ?></td>
                <td><?= e($b['nama_pengguna']) ?></td>
                <td class="num"><?= rupiah($b['jumlah_bayar']) ?></td>
            </tr>
        <?php endforeach; ?>
        <?php if (!$ada): ?><tr><td colspan="5" class="hint">Belum ada pembayaran.</td></tr><?php endif; ?>
        </tbody>
    </table>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
