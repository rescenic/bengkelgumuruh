<?php
/** @var string $judul */
$user = pengguna();
?>
<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= e($judul ?? 'Dashboard') ?> · <?= APP_NAME ?></title>
    <link rel="stylesheet" href="assets/css/style.css">
<?php require __DIR__ . '/pwa_head.php'; ?>
</head>
<body>
<div class="layout">
    <aside class="sidebar">
        <div class="brand">
            <img class="brand-logo" src="assets/img/logo.svg" alt="Logo Bengkel Gumuruh" width="40" height="40">
            <div>
                <strong><?= APP_NAME ?></strong>
                <small>Suku Cadang &amp; Servis</small>
            </div>
        </div>
        <nav>
            <p class="nav-label">Utama</p>
            <a href="index.php"<?= aktif('index') ?>>Dashboard</a>
            <p class="nav-label">Transaksi</p>
            <a href="penjualan.php"<?= aktif('penjualan') ?>>Penjualan &amp; Servis</a>
            <?php if (in_array((int) $user['role'], [ROLE_SUPER_ADMIN, ROLE_BENDAHARA], true)): ?>
                <a href="pengadaan.php"<?= aktif('pengadaan') ?>>Pengadaan (PO)</a>
            <?php endif; ?>
            <a href="stok.php"<?= aktif('stok') ?>>Riwayat Stok</a>
            <p class="nav-label">Master Data</p>
            <a href="suku_cadang.php"<?= aktif('suku_cadang') ?>>Suku Cadang</a>
            <a href="customer.php"<?= aktif('customer') ?>>Customer</a>
            <a href="vendor.php"<?= aktif('vendor') ?>>Vendor</a>
            <a href="mekanik.php"<?= aktif('mekanik') ?>>Mekanik</a>
        </nav>
    </aside>
    <div class="main">
        <header class="topbar">
            <h1><?= e($judul ?? 'Dashboard') ?></h1>
            <div class="user">
                <span class="avatar"><?= e(mb_substr($user['nama_pengguna'], 0, 1)) ?></span>
                <div>
                    <strong><?= e($user['nama_pengguna']) ?></strong>
                    <small><?= e(nama_role((int) $user['role'])) ?></small>
                </div>
                <button class="btn btn-light btn-sm" type="button" id="btn-install" hidden>Pasang Aplikasi</button>
                <a class="btn btn-light btn-sm" href="logout.php">Keluar</a>
            </div>
        </header>
        <main class="content">
            <?php foreach (ambil_flash() as $f): ?>
                <div class="alert alert-<?= e($f['type']) ?>"><?= e($f['message']) ?></div>
            <?php endforeach; ?>
