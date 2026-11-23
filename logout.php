<?php
require __DIR__ . '/includes/bootstrap.php';

if (demo_aktif()) {
    flash('info', 'Mode demo aktif — keluar dinonaktifkan, akses penuh tanpa login.');
    redirect('index.php');
}

$_SESSION = [];
session_destroy();
session_start();
flash('success', 'Anda telah keluar dari sistem.');
redirect('login.php');
