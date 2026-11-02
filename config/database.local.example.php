<?php
/**
 * Contoh konfigurasi hosting (InfinityFree — https://bengkelgumuruh.rf.gd).
 *
 * 1. Salin berkas ini menjadi config/database.local.php di server.
 * 2. Isi nilainya dari Control Panel InfinityFree › MySQL Databases.
 * 3. Jangan commit database.local.php (sudah tercantum di .gitignore).
 */

return [
    'host'     => 'sqlXXX.infinityfree.com',          // MySQL Hostname
    'port'     => '3306',
    'database' => 'if0_XXXXXXXX_bengkel_gumuruh',     // MySQL Database Name
    'username' => 'if0_XXXXXXXX',                     // MySQL Username
    'password' => 'password-akun-hosting',            // MySQL Password (vPanel)
];
