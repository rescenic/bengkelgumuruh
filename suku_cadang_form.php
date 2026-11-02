<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();
$id  = (int) ($_GET['id'] ?? 0);

$kolom = ['kode_suku_cadang', 'nama_suku_cadang', 'merk_kendaraan', 'model_kendaraan', 'tahun_kendaraan',
          'kategori', 'sub_kategori', 'satuan', 'harga_beli', 'harga_jual', 'stok_minimum', 'stok_maksimum',
          'stok_saat_ini', 'lokasi_penyimpanan', 'garansi_bulan', 'deskripsi', 'id_vendor'];

$s = array_fill_keys($kolom, '');
$s['satuan'] = 'pcs';
$s['stok_minimum'] = 5;
$s['stok_maksimum'] = 100;
$s['stok_saat_ini'] = 0;

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM suku_cadang WHERE id_suku_cadang = ?');
    $stmt->execute([$id]);
    $s = $stmt->fetch() ?: redirect('suku_cadang.php');
}

$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    cek_csrf();
    foreach ($kolom as $k) {
        $s[$k] = trim((string) ($_POST[$k] ?? ''));
    }

    if ($s['kode_suku_cadang'] === '' || $s['nama_suku_cadang'] === '') {
        $error = 'Kode dan nama suku cadang wajib diisi.';
    } elseif ((float) $s['harga_jual'] < (float) $s['harga_beli']) {
        $error = 'Harga jual tidak boleh lebih kecil dari harga beli.';
    } else {
        $nilai = array_map(fn ($v) => $v === '' ? null : $v, array_intersect_key($s, array_flip($kolom)));
        $nilai['margin_keuntungan'] = (float) $s['harga_beli'] > 0
            ? round(((float) $s['harga_jual'] - (float) $s['harga_beli']) / (float) $s['harga_beli'] * 100, 2)
            : null;

        try {
            if ($id) {
                // stok tidak diubah langsung dari form edit; perubahan stok lewat transaksi
                unset($nilai['stok_saat_ini']);
                $set = implode(', ', array_map(fn ($k) => "$k = :$k", array_keys($nilai)));
                $nilai['updated_by'] = pengguna()['id'];
                $nilai['id'] = $id;
                $pdo->prepare("UPDATE suku_cadang SET $set, updated_by = :updated_by WHERE id_suku_cadang = :id")->execute($nilai);
                flash('success', 'Data suku cadang berhasil diperbarui.');
            } else {
                $nilai['created_by'] = pengguna()['id'];
                $cols = implode(', ', array_keys($nilai));
                $ph   = ':' . implode(', :', array_keys($nilai));
                $pdo->prepare("INSERT INTO suku_cadang ($cols) VALUES ($ph)")->execute($nilai);
                flash('success', 'Suku cadang baru berhasil ditambahkan.');
            }
            redirect('suku_cadang.php');
        } catch (PDOException $e) {
            $error = $e->getCode() === '23000' ? 'Kode suku cadang sudah digunakan.' : 'Gagal menyimpan data.';
        }
    }
}

$vendor = $pdo->query('SELECT id_vendor, nama_vendor FROM vendor WHERE status_kerjasama = 1 ORDER BY nama_vendor')->fetchAll();

$judul = $id ? 'Ubah Suku Cadang' : 'Tambah Suku Cadang';
require __DIR__ . '/includes/header.php';

$field = function (string $name, string $label, string $type = 'text', string $extra = '') use ($s) {
    printf('<div><label for="%1$s">%2$s</label><input id="%1$s" type="%3$s" name="%1$s" value="%4$s" %5$s></div>',
        $name, e($label), $type, e((string) $s[$name]), $extra);
};
?>
<?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
<form method="post" class="card">
    <?= csrf_field() ?>
    <div class="card-header"><h2>Informasi Suku Cadang</h2></div>
    <div class="card-body form-grid">
        <?php $field('kode_suku_cadang', 'Kode', 'text', 'required maxlength="50"'); ?>
        <div class="span-2"><label for="nama_suku_cadang">Nama Suku Cadang</label><input id="nama_suku_cadang" name="nama_suku_cadang" value="<?= e($s['nama_suku_cadang']) ?>" required maxlength="100"></div>
        <?php $field('kategori', 'Kategori', 'text', 'placeholder="Mesin, Rem, AC…"'); ?>
        <?php $field('sub_kategori', 'Sub Kategori'); ?>
        <?php $field('satuan', 'Satuan', 'text', 'placeholder="pcs, set, liter"'); ?>
        <?php $field('merk_kendaraan', 'Merk Kendaraan'); ?>
        <?php $field('model_kendaraan', 'Model Kendaraan'); ?>
        <?php $field('tahun_kendaraan', 'Tahun Kendaraan', 'text', 'placeholder="2015-2020"'); ?>
        <?php $field('harga_beli', 'Harga Beli (Rp)', 'number', 'min="0" step="100" required'); ?>
        <?php $field('harga_jual', 'Harga Jual (Rp)', 'number', 'min="0" step="100" required'); ?>
        <?php $field('garansi_bulan', 'Garansi (bulan)', 'number', 'min="0"'); ?>
        <?php $field('stok_minimum', 'Stok Minimum', 'number', 'min="0"'); ?>
        <?php $field('stok_maksimum', 'Stok Maksimum', 'number', 'min="0"'); ?>
        <?php $field('stok_saat_ini', 'Stok Awal', 'number', 'min="0"' . ($id ? ' disabled title="Stok berubah melalui transaksi"' : '')); ?>
        <?php $field('lokasi_penyimpanan', 'Lokasi Rak'); ?>
        <div class="span-2">
            <label for="id_vendor">Vendor Pemasok</label>
            <select id="id_vendor" name="id_vendor">
                <option value="">— Pilih vendor —</option>
                <?php foreach ($vendor as $v): ?>
                    <option value="<?= $v['id_vendor'] ?>"<?= (string) $s['id_vendor'] === (string) $v['id_vendor'] ? ' selected' : '' ?>><?= e($v['nama_vendor']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="span-3"><label for="deskripsi">Deskripsi</label><textarea id="deskripsi" name="deskripsi"><?= e($s['deskripsi']) ?></textarea></div>
    </div>
    <div class="card-body form-footer">
        <a class="btn btn-light" href="suku_cadang.php">Batal</a>
        <button class="btn" type="submit">Simpan</button>
    </div>
</form>
<?php require __DIR__ . '/includes/footer.php'; ?>
