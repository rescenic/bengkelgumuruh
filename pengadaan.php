<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_role([ROLE_SUPER_ADMIN, ROLE_BENDAHARA]);

$q      = trim($_GET['q'] ?? '');
$status = $_GET['status'] ?? '';

$sql = 'SELECT tp.*, v.nama_vendor,
               COALESCE((SELECT SUM(jumlah_bayar) FROM pembayaran_pengadaan pp
                          WHERE pp.id_transaksi_pengadaan = tp.id_transaksi_pengadaan), 0) AS sudah_dibayar
          FROM transaksi_pengadaan tp
          LEFT JOIN vendor v ON v.id_vendor = tp.id_vendor
         WHERE 1 = 1';
$param = [];
if ($q !== '') {
    $sql .= ' AND (tp.no_po LIKE ? OR tp.no_invoice_vendor LIKE ? OR v.nama_vendor LIKE ?)';
    array_push($param, "%$q%", "%$q%", "%$q%");
}
if (in_array($status, ['unpaid', 'partial', 'paid'], true)) {
    $sql .= ' AND tp.status_pembayaran = ?';
    $param[] = $status;
}
$sql .= ' ORDER BY tp.tanggal_po DESC, tp.id_transaksi_pengadaan DESC';
$stmt = db()->prepare($sql);
$stmt->execute($param);
$data = $stmt->fetchAll();

$renderBaris = function (array $data): void {
    foreach ($data as $p): ?>
        <tr>
            <td><strong><?= e($p['no_po']) ?></strong><br><small class="hint"><?= e($p['no_invoice_vendor']) ?></small></td>
            <td><?= tanggal_indo($p['tanggal_po']) ?></td>
            <td><?= e($p['nama_vendor']) ?></td>
            <td class="num"><?= (int) $p['total_item'] ?></td>
            <td class="num"><?= rupiah($p['total_bayar']) ?></td>
            <td class="num"><?= rupiah($p['sudah_dibayar']) ?></td>
            <td><?= badge($p['status_pengadaan']) ?></td>
            <td><?= badge($p['status_pembayaran']) ?></td>
            <td><a class="btn btn-light btn-sm" href="pengadaan_detail.php?id=<?= $p['id_transaksi_pengadaan'] ?>">Detail</a></td>
        </tr>
    <?php endforeach;
    if (!$data): ?><tr><td colspan="9" class="hint">Data pengadaan tidak ditemukan.</td></tr><?php endif;
};
kirim_ajax_jika_diminta($data, $renderBaris);

$judul = 'Pengadaan Suku Cadang (PO)';
require __DIR__ . '/includes/header.php';
?>
<div class="card">
    <div class="card-header">
        <form class="filters live-form" method="get">
            <?= kotak_cari($q, 'Cari no. PO, invoice vendor, vendor…') ?>
            <select name="status">
                <option value="">Semua status bayar</option>
                <option value="unpaid"<?= $status === 'unpaid' ? ' selected' : '' ?>>Belum Bayar</option>
                <option value="partial"<?= $status === 'partial' ? ' selected' : '' ?>>Sebagian</option>
                <option value="paid"<?= $status === 'paid' ? ' selected' : '' ?>>Lunas</option>
            </select>
            <span class="hint live-count"><?= count($data) ?> data</span>
        </form>
    </div>
    <div class="table-wrap">
        <table>
            <thead><tr><th>No. PO</th><th>Tanggal</th><th>Vendor</th><th class="num">Item</th><th class="num">Total</th><th class="num">Dibayar</th><th>Pengadaan</th><th>Bayar</th><th></th></tr></thead>
            <tbody id="hasil"><?php $renderBaris($data); ?></tbody>
        </table>
    </div>
</div>
<?php require __DIR__ . '/includes/footer.php'; ?>
