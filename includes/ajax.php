<?php
/**
 * Dukungan pencarian AJAX.
 *
 * Halaman daftar memanggil kirim_ajax_jika_diminta() dengan fungsi render baris.
 * Jika request berasal dari fetch() (parameter ajax=1), halaman hanya mengirim
 * JSON berisi potongan HTML <tbody> dan jumlah data, lalu berhenti.
 */

declare(strict_types=1);

function permintaan_ajax(): bool
{
    return ($_GET['ajax'] ?? '') === '1';
}

/**
 * @param array    $data   hasil query
 * @param callable $render fungsi yang menerima $data dan mencetak baris <tr>
 */
function kirim_ajax_jika_diminta(array $data, callable $render): void
{
    if (!permintaan_ajax()) {
        return;
    }
    ob_start();
    $render($data);
    $html = ob_get_clean();

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['total' => count($data), 'html' => $html], JSON_UNESCAPED_UNICODE);
    exit;
}

/**
 * Elemen input pencarian langsung (live search) yang dibaca oleh assets/js/app.js.
 */
function kotak_cari(string $q, string $placeholder): string
{
    return '<input type="search" name="q" class="live-search" data-target="#hasil" value="' . e($q)
        . '" placeholder="' . e($placeholder) . '" autocomplete="off">';
}
