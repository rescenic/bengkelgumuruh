<?php
/**
 * Konfigurasi koneksi database Sistem Informasi Bengkel Gumuruh.
 *
 * Default mengikuti instalasi Laragon (user root tanpa password).
 * Untuk produksi, gunakan user `bengkel_app` dari skrip DCL
 * (database/dcl_bengkel_gumuruh.sql) yang hanya memiliki hak
 * SELECT, INSERT, UPDATE, DELETE. Nilai dapat ditimpa melalui
 * environment variable DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASS.
 */

return [
    'host'     => getenv('DB_HOST') ?: '127.0.0.1',
    'port'     => getenv('DB_PORT') ?: '3306',
    'database' => getenv('DB_NAME') ?: 'bengkel_gumuruh',
    'username' => getenv('DB_USER') ?: 'root',
    'password' => getenv('DB_PASS') !== false ? getenv('DB_PASS') : '',
    'charset'  => 'utf8mb4',
];
