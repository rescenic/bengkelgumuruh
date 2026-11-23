<?php
/**
 * Bootstrap aplikasi: session, koneksi PDO, helper, dan fungsi bisnis.
 */

declare(strict_types=1);

date_default_timezone_set('Asia/Jakarta');

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

define('APP_NAME', 'Bengkel Gumuruh');
define('BASE_PATH', dirname(__DIR__));

require_once BASE_PATH . '/includes/helpers.php';
require_once BASE_PATH . '/includes/ajax.php';
require_once BASE_PATH . '/functions/penjualan.php';

/**
 * Mengembalikan satu instance PDO yang dipakai di seluruh aplikasi.
 */
function db(): PDO
{
    static $pdo = null;

    if ($pdo === null) {
        $cfg = require BASE_PATH . '/config/database.php';
        $dsn = sprintf(
            'mysql:host=%s;port=%s;dbname=%s;charset=%s',
            $cfg['host'],
            $cfg['port'],
            $cfg['database'],
            $cfg['charset']
        );

        $pdo = new PDO($dsn, $cfg['username'], $cfg['password'], [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);
    }

    return $pdo;
}

/**
 * Konfigurasi mode demo (lihat config/demo.php).
 */
function demo_konfigurasi(): array
{
    static $cfg = null;

    if ($cfg === null) {
        $file = BASE_PATH . '/config/demo.php';
        $cfg = is_file($file) ? (array) require $file : [];
    }

    return $cfg;
}

/**
 * True bila mode demo aktif: aplikasi terbuka tanpa login.
 */
function demo_aktif(): bool
{
    return !empty(demo_konfigurasi()['aktif']);
}

/**
 * Mengisi sesi sebagai pengguna demo (Super Admin mridwanh) sehingga
 * wajib_login() dan wajib_role() tetap berjalan normal.
 */
function demo_login_otomatis(): void
{
    if (!demo_aktif() || !empty($_SESSION['pengguna'])) {
        return;
    }

    $email = demo_konfigurasi()['email'] ?? 'mridwanh@bengkelgumuruh.rf.gd';

    try {
        $stmt = db()->prepare(
            'SELECT id, nama_pengguna, email_pengguna, jabatan, role, status
               FROM pengguna WHERE email_pengguna = ? LIMIT 1'
        );
        $stmt->execute([$email]);
        $akun = $stmt->fetch();
    } catch (Throwable $e) {
        // Basis data belum siap — biarkan halaman menampilkan error koneksi.
        return;
    }

    if ($akun && (int) $akun['status'] === 1) {
        $_SESSION['pengguna'] = $akun;
    }
}

demo_login_otomatis();
