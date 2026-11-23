<?php
/**
 * Mode demo — akses penuh tanpa login.
 *
 * Saat 'aktif' => true, aplikasi langsung membuka sesi sebagai pengguna demo
 * (default: akun Super Admin mridwanh@bengkelgumuruh.rf.gd) sehingga seluruh
 * halaman & fitur dapat diakses tanpa login.
 *
 * Untuk mengembalikan login normal, ubah 'aktif' => false.
 */

return [
    'aktif' => true,
    'email' => 'mridwanh@bengkelgumuruh.rf.gd',
    'label' => 'Mode Demo',
];
