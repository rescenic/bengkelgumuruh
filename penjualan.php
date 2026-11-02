<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$q      = trim($_GET['q'] ?? '');
$status = $_GET['status'] ?? '';

$sql = 'SELECT tp.id_transaksi_penjualan, tp.no_invoice, tp.tanggal_transaksi, tp.jenis_service,
               tp.total_bayar, tp.status_service, tp.status_pembayaran,
               c.nama_customer, c.no_polisi, c.kendaraan_model, m.nama_mekanik
          FROM transaksi_penjualan tp
          JOIN customer c ON c.id_customer = tp.id_customer
          LEFT JOIN mekanik m ON m.id = tp.id_mekanik
         WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (tp.no_invoice LIKE ? OR c.nama_customer LIKE ? OR c.no_polisi LIKE ?
                   OR c.kendaraan_model LIKE ? OR tp.jenis_service LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%", "%$q%", "%$q%");
}
if (in_array($status, ['paid', 'unpaid'], true)) {
    $sql .= ' AND tp.status_pembayaran = ?';
    $param[] = $status;
}
$sql .= ' ORDER BY tp.tanggal_transaksi DESC, tp.id_transaksi_penjualan DESC';

$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $t): ?>
        <tr>
            <td><strong><?= e($t['no_invoice']) ?></strong></td>
            <td><?= tanggal_indo($t['tanggal_transaksi']) ?></td>
            <td><?= e($t['nama_customer']) ?><br><small class="hint"><?= e("{$t['no_polisi']} · {$t['kendaraan_model']}") ?></small></td>
            <td><?= e($t['jenis_service']) ?></td>
            <td><?= e($t['nama_mekanik']) ?></td>
            <td class="num"><?= rupiah($t['total_bayar']) ?></td>
            <td><?= badge($t['status_service']) ?></td>
            <td><?= badge($t['status_pembayaran']) ?></td>
            <td><a class="btn btn-light btn-sm" href="penjualan_detail.php?id=<?= $t['id_transaksi_penjualan'] ?>">Detail</a></td>
        </tr>
    <?php endforeach;
    if (!$data): ?>
        <tr><td colspan="9" class="hint">Tidak ada transaksi yang cocok.</td></tr>
    <?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Penjualan & Servis';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari invoice, customer, nopol, kendaraan, servis…') ?>
            <select name="status">
                <option value="">Semua status bayar</option>
                <option value="paid"<?= $status === 'paid' ? ' selected' : '' ?>>Lunas</option>
                <option value="unpaid"<?= $status === 'unpaid' ? ' selected' : '' ?>>Belum Bayar</option>
            </select>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
        <a class="btn" href="penjualan_tambah.php">+ Transaksi Baru</a>
    </div>
    <div class="table-wrap">
        <table>
            <thead>
            <tr><th>Invoice</th><th>Tanggal</th><th>Customer</th><th>Jenis Servis</th><th>Mekanik</th><th class="num">Total Bayar</th><th>Servis</th><th>Bayar</th><th></th></tr>
            </thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
