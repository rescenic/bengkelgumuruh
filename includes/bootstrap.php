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
