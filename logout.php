<?php
require __DIR__ . '/includes/bootstrap.php';

$_SESSION = [];
session_destroy();
session_start();
flash('success', 'Anda telah keluar dari sistem.');
redirect('login.php');
