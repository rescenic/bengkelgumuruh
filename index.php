<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();

$ringkasan = $pdo->query(
    "SELECT
        (SELECT COALESCE(SUM(total_bayar), 0) FROM transaksi_penjualan WHERE status_pembayaran = 'paid') AS pendapatan,
        (SELECT COUNT(*) FROM transaksi_penjualan) AS jumlah_transaksi,
        (SELECT COUNT(*) FROM customer WHERE status_customer = 1) AS jumlah_customer,
        (SELECT COUNT(*) FROM suku_cadang WHERE status_produk = 1 AND stok_saat_ini <= stok_minimum) AS stok_menipis"
)->fetch();

$terbaru = $pdo->query(
    'SELECT tp.id_transaksi_penjualan, tp.no_invoice, tp.tanggal_transaksi, tp.jenis_service,
            tp.total_bayar, tp.status_pembayaran, c.nama_customer
       FROM transaksi_penjualan tp
       JOIN customer c ON c.id_customer = tp.id_customer
      ORDER BY tp.tanggal_transaksi DESC, tp.id_transaksi_penjualan DESC
      LIMIT 7'
)->fetchAll();

$menipis = $pdo->query(
    'SELECT kode_suku_cadang, nama_suku_cadang, stok_saat_ini, stok_minimum
       FROM suku_cadang
      WHERE status_produk = 1
      ORDER BY (stok_saat_ini - stok_minimum) ASC
      LIMIT 7'
)->fetchAll();

$judul = 'Dashboard';
require __DIR__ . '/includes/header.php';
?>
<section class="stats">
    <div class="stat success"><span>Pendapatan (lunas)</span><strong><?= rupiah($ringkasan['pendapatan']) ?></strong></div>
    <div class="stat"><span>Transaksi Penjualan</span><strong><?= number_format($ringkasan['jumlah_transaksi']) ?></strong></div>
    <div class="stat warning"><span>Customer Aktif</span><strong><?= number_format($ringkasan['jumlah_customer']) ?></strong></div>
    <div class="stat danger"><span>Stok di Bawah Minimum</span><strong><?= number_format($ringkasan['stok_menipis']) ?> item</strong></div>
</section>

<div class="grid-2">
    <div class="card">
        <div class="card-header">
            <h2>Transaksi Terbaru</h2>
            <a class="btn btn-sm" href="penjualan_tambah.php">+ Transaksi Baru</a>
        </div>
        <div class="table-wrap">
            <table>
                <thead><tr><th>Invoice</th><th>Tanggal</th><th>Customer</th><th class="num">Total</th><th>Status</th></tr></thead>
                <tbody>
                <?php foreach ($terbaru as $t): ?>
                    <tr>
                        <td><a href="penjualan_detail.php?id=<?= $t['id_transaksi_penjualan'] ?>"><?= e($t['no_invoice']) ?></a></td>
                        <td><?= tanggal_indo($t['tanggal_transaksi']) ?></td>
                        <td><?= e($t['nama_customer']) ?></td>
                        <td class="num"><?= rupiah($t['total_bayar']) ?></td>
                        <td><?= badge($t['status_pembayaran']) ?></td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card">
        <div class="card-header"><h2>Stok Perlu Perhatian</h2><a href="suku_cadang.php?stok=rendah">Lihat semua</a></div>
        <div class="table-wrap">
            <table>
                <thead><tr><th>Suku Cadang</th><th class="num">Stok</th><th class="num">Min.</th></tr></thead>
                <tbody>
                <?php foreach ($menipis as $m): ?>
                    <tr>
                        <td><?= e($m['nama_suku_cadang']) ?><br><small class="hint"><?= e($m['kode_suku_cadang']) ?></small></td>
                        <td class="num">
                            <?php if ($m['stok_saat_ini'] <= $m['stok_minimum']): ?>
                                <span class="badge badge-danger"><?= (int) $m['stok_saat_ini'] ?></span>
                            <?php else: ?>
                                <?= (int) $m['stok_saat_ini'] ?>
                            <?php endif; ?>
                        </td>
                        <td class="num"><?= (int) $m['stok_minimum'] ?></td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
