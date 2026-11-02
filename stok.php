<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$q     = trim($_GET['q'] ?? '');
$jenis = $_GET['jenis'] ?? '';

$sql = 'SELECT sm.*, s.kode_suku_cadang, s.nama_suku_cadang, p.nama_pengguna
          FROM stok_movement sm
          JOIN suku_cadang s ON s.id_suku_cadang = sm.id_suku_cadang
          LEFT JOIN pengguna p ON p.id = sm.id_pengguna
         WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (s.kode_suku_cadang LIKE ? OR s.nama_suku_cadang LIKE ? OR sm.keterangan LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%");
}
if (in_array($jenis, ['masuk', 'keluar', 'adjustment', 'retur'], true)) {
    $sql .= ' AND sm.jenis_movement = ?';
    $param[] = $jenis;
}
$sql .= ' ORDER BY sm.created_at DESC, sm.id_movement DESC LIMIT 200';
$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $m): ?>
        <tr>
            <td><?= e(date('d/m/Y H:i', strtotime($m['created_at']))) ?></td>
            <td><strong><?= e($m['kode_suku_cadang']) ?></strong> <?= e($m['nama_suku_cadang']) ?></td>
            <td><?= badge((string) $m['jenis_movement']) ?></td>
            <td class="num"><?= (int) $m['qty_before'] ?></td>
            <td class="num"><?= $m['qty_change'] > 0 ? '+' : '' ?><?= (int) $m['qty_change'] ?></td>
            <td class="num"><strong><?= (int) $m['qty_after'] ?></strong></td>
            <td><?= e($m['keterangan']) ?></td>
            <td><?= e($m['nama_pengguna']) ?></td>
        </tr>
    <?php endforeach;
    if (!$data): ?><tr><td colspan="8" class="hint">Belum ada pergerakan stok.</td></tr><?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Riwayat Pergerakan Stok';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari kode, nama suku cadang, keterangan…') ?>
            <select name="jenis">
                <option value="">Semua jenis</option>
                <?php foreach (['masuk', 'keluar', 'adjustment', 'retur'] as $j): ?>
                    <option value="<?= $j ?>"<?= $jenis === $j ? ' selected' : '' ?>><?= ucfirst($j) ?></option>
                <?php endforeach; ?>
            </select>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>Waktu</th><th>Suku Cadang</th><th>Jenis</th><th class="num">Sebelum</th><th class="num">Perubahan</th><th class="num">Sesudah</th><th>Keterangan</th><th>Petugas</th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
