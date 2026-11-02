<?php
/**
 * Fungsi-fungsi bantu (escape, format, session, CSRF, otorisasi).
 */

declare(strict_types=1);

const ROLE_SUPER_ADMIN = 1;
const ROLE_BENDAHARA   = 2;
const ROLE_KASIR       = 3;

function e(?string $value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

function rupiah($angka): string
{
    return 'Rp ' . number_format((float) $angka, 0, ',', '.');
}

function tanggal_indo(?string $tanggal): string
{
    if (!$tanggal) {
        return '-';
    }
    $bulan = [1 => 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
    $ts = strtotime($tanggal);
    return date('d', $ts) . ' ' . $bulan[(int) date('n', $ts)] . ' ' . date('Y', $ts);
}

function redirect(string $url): never
{
    header('Location: ' . $url);
    exit;
}

function flash(string $type, string $message): void
{
    $_SESSION['flash'][] = ['type' => $type, 'message' => $message];
}

function ambil_flash(): array
{
    $pesan = $_SESSION['flash'] ?? [];
    unset($_SESSION['flash']);
    return $pesan;
}

function pengguna(): ?array
{
    return $_SESSION['pengguna'] ?? null;
}

function wajib_login(): void
{
    if (!pengguna()) {
        if (($_GET['ajax'] ?? '') === '1') {
            http_response_code(401);
            exit(json_encode(['error' => 'Sesi berakhir, silakan login ulang.']));
        }
        flash('warning', 'Silakan login terlebih dahulu.');
        redirect('login.php');
    }
}

function wajib_role(array $roles): void
{
    wajib_login();
    if (!in_array((int) pengguna()['role'], $roles, true)) {
        flash('danger', 'Anda tidak memiliki hak akses ke halaman tersebut.');
        redirect('index.php');
    }
}

function nama_role(int $role): string
{
    return [
        ROLE_SUPER_ADMIN => 'Super Admin',
        ROLE_BENDAHARA   => 'Bendahara',
        ROLE_KASIR       => 'Kasir',
    ][$role] ?? 'Pengguna';
}

function csrf_token(): string
{
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(16));
    }
    return $_SESSION['csrf'];
}

function csrf_field(): string
{
    return '<input type="hidden" name="csrf" value="' . csrf_token() . '">';
}

function cek_csrf(): void
{
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) {
        http_response_code(419);
        exit('Token formulir tidak valid. Muat ulang halaman lalu coba lagi.');
    }
}

function badge(string $status): string
{
    $warna = [
        'paid' => 'success', 'selesai' => 'success', 'diambil' => 'muted', 'completed' => 'success',
        'aktif' => 'success', 'masuk' => 'success',
        'unpaid' => 'danger', 'cancelled' => 'danger', 'keluar' => 'danger',
        'partial' => 'warning', 'antri' => 'warning', 'ordered' => 'warning', 'draft' => 'muted',
        'dikerjakan' => 'info', 'delivered' => 'info', 'adjustment' => 'info', 'retur' => 'warning',
        'vip' => 'warning', 'premium' => 'info', 'reguler' => 'muted',
    ][$status] ?? 'muted';

    $label = [
        'paid' => 'Lunas', 'unpaid' => 'Belum Bayar', 'partial' => 'Sebagian',
    ][$status] ?? ucfirst($status);

    return '<span class="badge badge-' . $warna . '">' . e($label) . '</span>';
}

function aktif(string $halaman): string
{
    $sekarang = basename($_SERVER['SCRIPT_NAME'], '.php');
    return str_starts_with($sekarang, $halaman) ? ' class="active"' : '';
}
