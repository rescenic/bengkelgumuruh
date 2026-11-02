<?php
require __DIR__ . '/includes/bootstrap.php';

if (pengguna()) {
    redirect('index.php');
}

$error = null;
$email = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    cek_csrf();
    $email    = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    $stmt = db()->prepare(
        'SELECT id, nama_pengguna, email_pengguna, password, jabatan, role, status
           FROM pengguna WHERE email_pengguna = ? LIMIT 1'
    );
    $stmt->execute([$email]);
    $akun = $stmt->fetch();

    if (!$akun || !password_verify($password, $akun['password'])) {
        $error = 'Email atau password salah.';
    } elseif ((int) $akun['status'] !== 1) {
        $error = 'Akun Anda dinonaktifkan. Hubungi Super Admin.';
    } else {
        session_regenerate_id(true);
        unset($akun['password']);
        $_SESSION['pengguna'] = $akun;
        db()->prepare('UPDATE pengguna SET last_login = NOW() WHERE id = ?')->execute([$akun['id']]);
        flash('success', 'Selamat datang, ' . $akun['nama_pengguna'] . '!');
        redirect('index.php');
    }
}
?>
<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login · <?= APP_NAME ?></title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="login-page">
<form class="login-card" method="post">
    <div class="brand">
        <span class="brand-mark">BG</span>
        <div>
            <strong><?= APP_NAME ?></strong>
            <small>Sistem Informasi Penjualan Suku Cadang</small>
        </div>
    </div>
    <?php foreach (ambil_flash() as $f): ?>
        <div class="alert alert-<?= e($f['type']) ?>"><?= e($f['message']) ?></div>
    <?php endforeach; ?>
    <?php if ($error): ?>
        <div class="alert alert-danger"><?= e($error) ?></div>
    <?php endif; ?>
    <?= csrf_field() ?>
    <div class="field">
        <label for="email">Email</label>
        <input id="email" type="email" name="email" value="<?= e($email) ?>" placeholder="nama@bengkelgumuruh.com" required autofocus>
    </div>
    <div class="field">
        <label for="password">Password</label>
        <input id="password" type="password" name="password" placeholder="••••••••" required>
    </div>
    <button class="btn" type="submit">Masuk</button>
    <p class="hint" style="margin-top:14px">Akun utama: mridwanh@bengkelgumuruh.netlify.app</p>
</form>
</body>
</html>
