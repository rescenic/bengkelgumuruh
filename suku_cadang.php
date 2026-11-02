<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['aksi'] ?? '') === 'status') {
    cek_csrf();
    $pdo->prepare('UPDATE suku_cadang SET status_produk = 1 - status_produk, updated_by = ? WHERE id_suku_cadang = ?')
        ->execute([pengguna()['id'], (int) $_POST['id']]);
    flash('success', 'Status suku cadang diperbarui.');
    redirect('suku_cadang.php');
}

$q        = trim($_GET['q'] ?? '');
$kategori = $_GET['kategori'] ?? '';
$stok     = $_GET['stok'] ?? '';

$sql = 'SELECT s.*, v.nama_vendor
          FROM suku_cadang s
          LEFT JOIN vendor v ON v.id_vendor = s.id_vendor
         WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (s.kode_suku_cadang LIKE ? OR s.nama_suku_cadang LIKE ? OR s.kategori LIKE ? OR s.merk_kendaraan LIKE ? OR s.model_kendaraan LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%", "%$q%", "%$q%");
}
if ($kategori !== '') {
    $sql .= ' AND s.kategori = ?';
    $param[] = $kategori;
}
if ($stok === 'rendah') {
    $sql .= ' AND s.stok_saat_ini <= s.stok_minimum';
}
$sql .= ' ORDER BY s.kode_suku_cadang';

$stmt = $pdo->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $s): ?>
        <tr>
            <td><strong><?= e($s['kode_suku_cadang']) ?></strong></td>
            <td><?= e($s['nama_suku_cadang']) ?><br><small class="hint"><?= e(trim("{$s['merk_kendaraan']} {$s['model_kendaraan']} {$s['tahun_kendaraan']}")) ?></small></td>
            <td><?= e($s['kategori']) ?></td>
            <td><?= e($s['nama_vendor']) ?></td>
            <td class="num"><?= rupiah($s['harga_beli']) ?></td>
            <td class="num"><?= rupiah($s['harga_jual']) ?></td>
            <td class="num">
                <?php if ($s['stok_saat_ini'] <= $s['stok_minimum']): ?>
                    <span class="badge badge-danger"><?= (int) $s['stok_saat_ini'] ?></span>
                <?php else: ?>
                    <?= (int) $s['stok_saat_ini'] ?>
                <?php endif; ?>
                <small class="hint">/ min <?= (int) $s['stok_minimum'] ?></small>
            </td>
            <td><?= $s['status_produk'] ? badge('aktif') : badge('nonaktif') ?></td>
            <td><div class="actions">
                <a class="btn btn-light btn-sm" href="suku_cadang_form.php?id=<?= $s['id_suku_cadang'] ?>">Ubah</a>
                <form method="post">
                    <?= csrf_field() ?>
                    <input type="hidden" name="aksi" value="status">
                    <input type="hidden" name="id" value="<?= $s['id_suku_cadang'] ?>">
                    <button class="btn btn-light btn-sm" type="submit"><?= $s['status_produk'] ? 'Nonaktifkan' : 'Aktifkan' ?></button>
                </form>
            </div></td>
        </tr>
    <?php endforeach;
    if (!$data): ?>
        <tr><td colspan="9" class="hint">Suku cadang tidak ditemukan.</td></tr>
    <?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$daftarKategori = $pdo->query('SELECT DISTINCT kategori FROM suku_cadang WHERE kategori IS NOT NULL ORDER BY kategori')->fetchAll(PDO::FETCH_COLUMN);

$judul = 'Suku Cadang';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari kode, nama, kategori, merk/model…') ?>
            <select name="kategori">
                <option value="">Semua kategori</option>
                <?php foreach ($daftarKategori as $k): ?>
                    <option<?= $kategori === $k ? ' selected' : '' ?>><?= e($k) ?></option>
                <?php endforeach; ?>
            </select>
            <select name="stok">
                <option value="">Semua stok</option>
                <option value="rendah"<?= $stok === 'rendah' ? ' selected' : '' ?>>Stok ≤ minimum</option>
            </select>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
        <a class="btn" href="suku_cadang_form.php">+ Suku Cadang</a>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Kode</th><th>Nama / Kendaraan</th><th>Kategori</th><th>Vendor</th><th class="num">Harga Beli</th><th class="num">Harga Jual</th><th class="num">Stok</th><th>Status</th><th></th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
