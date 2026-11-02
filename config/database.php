<?php
/**
 * Konfigurasi koneksi database Sistem Informasi Bengkel Gumuruh.
 *
 * Urutan prioritas:
 *   1. config/database.local.php (jika ada) — dipakai di hosting, mis. InfinityFree.
 *      Salin dari config/database.local.example.php. Berkas ini tidak ikut di-commit.
 *   2. Environment variable DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASS.
 *   3. Default Laragon (user root tanpa password).
 *
 * Untuk server sendiri, gunakan user `bengkel_app` dari skrip DCL
 * (database/dcl_bengkel_gumuruh.sql) yang hanya memiliki hak
 * SELECT, INSERT, UPDATE, DELETE.
 */

$config = [
    'host'     => getenv('DB_HOST') ?: '127.0.0.1',
    'port'     => getenv('DB_PORT') ?: '3306',
    'database' => getenv('DB_NAME') ?: 'bengkel_gumuruh',
    'username' => getenv('DB_USER') ?: 'root',
    'password' => getenv('DB_PASS') !== false ? getenv('DB_PASS') : '',
    'charset'  => 'utf8mb4',
];

$lokal = __DIR__ . '/database.local.php';
if (is_file($lokal)) {
    $config = array_merge($config, require $lokal);
}

return $config;
