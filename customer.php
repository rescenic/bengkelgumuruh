<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$q    = trim($_GET['q'] ?? '');
$tipe = $_GET['tipe'] ?? '';

$sql = 'SELECT * FROM customer WHERE status_customer = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (nama_customer LIKE ? OR no_polisi LIKE ? OR no_telepon_customer LIKE ? OR kendaraan_model LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%", "%$q%");
}
if (in_array($tipe, ['reguler', 'premium', 'vip'], true)) {
    $sql .= ' AND customer_type = ?';
    $param[] = $tipe;
}
$sql .= ' ORDER BY nama_customer';

$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $c): ?>
        <tr>
            <td><strong><?= e($c['nama_customer']) ?></strong><br><small class="hint"><?= e($c['email_customer']) ?></small></td>
            <td><?= e($c['no_telepon_customer']) ?></td>
            <td><?= e(trim("{$c['kendaraan_merk']} {$c['kendaraan_model']} {$c['kendaraan_tahun']}")) ?></td>
            <td><strong><?= e($c['no_polisi']) ?></strong></td>
            <td><?= badge($c['customer_type']) ?></td>
            <td class="num"><?= (int) $c['total_transaksi'] ?>×</td>
            <td class="num"><?= rupiah($c['total_nilai_transaksi']) ?></td>
            <td><a class="btn btn-light btn-sm" href="customer_form.php?id=<?= $c['id_customer'] ?>">Ubah</a></td>
        </tr>
    <?php endforeach;
    if (!$data): ?>
        <tr><td colspan="8" class="hint">Customer tidak ditemukan.</td></tr>
    <?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Customer';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari nama, nopol, telepon, model…') ?>
            <select name="tipe">
                <option value="">Semua tipe</option>
                <?php foreach (['reguler', 'premium', 'vip'] as $t): ?>
                    <option value="<?= $t ?>"<?= $tipe === $t ? ' selected' : '' ?>><?= ucfirst($t) ?></option>
                <?php endforeach; ?>
            </select>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
        <a class="btn" href="customer_form.php">+ Customer</a>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Nama</th><th>Telepon</th><th>Kendaraan</th><th>No. Polisi</th><th>Tipe</th><th class="num">Transaksi</th><th class="num">Total Belanja</th><th></th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
