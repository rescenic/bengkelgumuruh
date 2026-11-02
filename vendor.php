<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$q = trim($_GET['q'] ?? '');

$sql = 'SELECT v.*, (SELECT COUNT(*) FROM suku_cadang s WHERE s.id_vendor = v.id_vendor) AS jumlah_produk
          FROM vendor v WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (v.nama_vendor LIKE ? OR v.nama_perusahaan LIKE ? OR v.jenis_suku_cadang LIKE ? OR v.contact_person LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%", "%$q%");
}
$sql .= ' ORDER BY v.nama_vendor';
$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $v): ?>
        <tr>
            <td><strong><?= e($v['nama_vendor']) ?></strong><br><small class="hint"><?= e($v['nama_perusahaan']) ?></small></td>
            <td><?= e($v['contact_person']) ?><br><small class="hint"><?= e($v['no_telepon_vendor']) ?></small></td>
            <td><?= e($v['jenis_suku_cadang']) ?></td>
            <td class="num"><?= number_format((float) $v['rating_vendor'], 1) ?> ★</td>
            <td class="num"><?= $v['term_pembayaran'] ? (int) $v['term_pembayaran'] . ' hari' : '-' ?></td>
            <td class="num"><?= (int) $v['jumlah_produk'] ?></td>
            <td><?= $v['status_kerjasama'] ? badge('aktif') : badge('nonaktif') ?></td>
        </tr>
    <?php endforeach;
    if (!$data): ?><tr><td colspan="7" class="hint">Vendor tidak ditemukan.</td></tr><?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Vendor';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari vendor, perusahaan, spesialisasi…') ?>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Vendor</th><th>Kontak</th><th>Spesialisasi</th><th class="num">Rating</th><th class="num">Termin</th><th class="num">Produk</th><th>Status</th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
