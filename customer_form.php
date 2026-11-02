<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();
$id  = (int) ($_GET['id'] ?? 0);

$kolom = ['nama_customer', 'nik_customer', 'no_telepon_customer', 'email_customer', 'alamat_customer',
          'jenis_kelamin', 'pekerjaan', 'kendaraan_merk', 'kendaraan_model', 'kendaraan_tahun',
          'no_polisi', 'warna_kendaraan', 'km_kendaraan', 'customer_type'];

$c = array_fill_keys($kolom, '');
$c['customer_type'] = 'reguler';

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM customer WHERE id_customer = ?');
    $stmt->execute([$id]);
    $c = $stmt->fetch() ?: redirect('customer.php');
}

$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    cek_csrf();
    foreach ($kolom as $k) {
        $c[$k] = trim((string) ($_POST[$k] ?? ''));
    }
    if ($c['nama_customer'] === '' || $c['no_telepon_customer'] === '') {
        $error = 'Nama dan nomor telepon wajib diisi.';
    } elseif ($c['nik_customer'] !== '' && !preg_match('/^\d{16}$/', $c['nik_customer'])) {
        $error = 'NIK harus 16 digit angka.';
    } else {
        $nilai = array_map(fn ($v) => $v === '' ? null : $v, array_intersect_key($c, array_flip($kolom)));
        $nilai['no_polisi'] = $nilai['no_polisi'] ? strtoupper($nilai['no_polisi']) : null;
        if ($id) {
            $set = implode(', ', array_map(fn ($k) => "$k = :$k", array_keys($nilai)));
            $nilai += ['updated_by' => pengguna()['id'], 'id' => $id];
            $pdo->prepare("UPDATE customer SET $set, updated_by = :updated_by WHERE id_customer = :id")->execute($nilai);
            flash('success', 'Data customer berhasil diperbarui.');
        } else {
            $nilai += ['tanggal_registrasi' => date('Y-m-d'), 'created_by' => pengguna()['id']];
            $cols = implode(', ', array_keys($nilai));
            $pdo->prepare("INSERT INTO customer ($cols) VALUES (:" . implode(', :', array_keys($nilai)) . ')')->execute($nilai);
            flash('success', 'Customer baru berhasil ditambahkan.');
        }
        redirect('customer.php');
    }
}

$judul = $id ? 'Ubah Customer' : 'Tambah Customer';
require __DIR__ . '/includes/header.php';

$field = function (string $name, string $label, string $type = 'text', string $extra = '') use ($c) {
    printf('<div><label for="%1$s">%2$s</label><input id="%1$s" type="%3$s" name="%1$s" value="%4$s" %5$s></div>',
        $name, e($label), $type, e((string) $c[$name]), $extra);
};
?>
<?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
<form method="post" class="card">
    <?= csrf_field() ?>
    <div class="card-header"><h2>Data Pribadi</h2></div>
    <div class="card-body form-grid">
        <?php $field('nama_customer', 'Nama Lengkap', 'text', 'required maxlength="100"'); ?>
        <?php $field('nik_customer', 'NIK', 'text', 'maxlength="16" inputmode="numeric"'); ?>
        <?php $field('no_telepon_customer', 'No. Telepon', 'tel', 'required maxlength="15"'); ?>
        <?php $field('email_customer', 'Email', 'email', 'maxlength="50"'); ?>
        <div>
            <label for="jenis_kelamin">Jenis Kelamin</label>
            <select id="jenis_kelamin" name="jenis_kelamin">
                <option value="">—</option>
                <option value="L"<?= $c['jenis_kelamin'] === 'L' ? ' selected' : '' ?>>Laki-laki</option>
                <option value="P"<?= $c['jenis_kelamin'] === 'P' ? ' selected' : '' ?>>Perempuan</option>
            </select>
        </div>
        <?php $field('pekerjaan', 'Pekerjaan'); ?>
        <div class="span-3"><label for="alamat_customer">Alamat</label><textarea id="alamat_customer" name="alamat_customer"><?= e($c['alamat_customer']) ?></textarea></div>
    </div>
    <div class="card-header"><h2>Data Kendaraan</h2></div>
    <div class="card-body form-grid">
        <?php $field('kendaraan_merk', 'Merk'); ?>
        <?php $field('kendaraan_model', 'Model'); ?>
        <?php $field('kendaraan_tahun', 'Tahun', 'number', 'min="1950" max="2100"'); ?>
        <?php $field('no_polisi', 'No. Polisi', 'text', 'maxlength="15"'); ?>
        <?php $field('warna_kendaraan', 'Warna'); ?>
        <?php $field('km_kendaraan', 'Kilometer', 'number', 'min="0"'); ?>
        <div>
            <label for="customer_type">Tipe Customer</label>
            <select id="customer_type" name="customer_type">
                <?php foreach (['reguler', 'premium', 'vip'] as $t): ?>
                    <option value="<?= $t ?>"<?= $c['customer_type'] === $t ? ' selected' : '' ?>><?= ucfirst($t) ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="card-body form-footer">
        <a class="btn btn-light" href="customer.php">Batal</a>
        <button class="btn" type="submit">Simpan</button>
    </div>
</form>
<?php require __DIR__ . '/includes/footer.php'; ?>
