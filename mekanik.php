<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$q = trim($_GET['q'] ?? '');

$sql = 'SELECT m.*, COUNT(tp.id_transaksi_penjualan) AS jumlah_servis
          FROM mekanik m
          LEFT JOIN transaksi_penjualan tp ON tp.id_mekanik = m.id
         WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (m.nama_mekanik LIKE ? OR m.spesialisasi LIKE ?)';
    array_push($param, "%$q%", "%$q%");
}
$sql .= ' GROUP BY m.id ORDER BY m.nama_mekanik';
$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $m): ?>
        <tr>
            <td><strong><?= e($m['nama_mekanik']) ?></strong></td>
            <td><?= e($m['spesialisasi']) ?></td>
            <td class="num"><?= (int) $m['pengalaman_tahun'] ?> th</td>
            <td><?= e($m['no_telepon']) ?></td>
            <td><?= tanggal_indo($m['tanggal_masuk']) ?></td>
            <td class="num"><?= (int) $m['jumlah_servis'] ?></td>
            <td><?= $m['status'] ? badge('aktif') : badge('nonaktif') ?></td>
        </tr>
    <?php endforeach;
    if (!$data): ?><tr><td colspan="7" class="hint">Mekanik tidak ditemukan.</td></tr><?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Mekanik';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari nama atau spesialisasi…') ?>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Nama</th><th>Spesialisasi</th><th class="num">Pengalaman</th><th>Telepon</th><th>Tanggal Masuk</th><th class="num">Jumlah Servis</th><th>Status</th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
