# Sistem Informasi Bengkel Gumuruh

Aplikasi web penjualan suku cadang kendaraan dan jasa servis untuk **Bengkel Gumuruh**, dibangun di atas
basis data `bengkel_gumuruh` (MySQL). Proyek akhir mata kuliah **Pengembangan Aplikasi Basis Data** —
PJJ Informatika, Universitas Siber Muhammadiyah.

**Penyusun:** Muhammad Ridwan Hakim, S.T. — NIM 20250100219

## Fitur

| Modul | Keterangan |
|---|---|
| Login & hak akses | Autentikasi dari tabel `pengguna` (bcrypt), role Super Admin / Bendahara / Kasir |
| Dashboard | Ringkasan pendapatan, jumlah transaksi, customer aktif, stok di bawah minimum |
| Penjualan & Servis | Transaksi baru multi-item, hitung PPN otomatis, nomor invoice otomatis, invoice siap cetak, pelunasan |
| Pengadaan (PO) | Daftar & detail purchase order beserta riwayat pembayaran vendor (Super Admin & Bendahara) |
| Riwayat Stok | Jejak `stok_movement` setiap barang masuk/keluar |
| Master data | Suku cadang (tambah/ubah/nonaktifkan), customer (tambah/ubah), vendor, mekanik |
| **Pencarian AJAX** | Semua halaman daftar mencari secara langsung saat mengetik (fetch + debounce 300 ms, tanpa reload) |

Penyimpanan transaksi penjualan (`functions/penjualan.php` → `simpanTransaksiPenjualan()`) berjalan dalam satu
transaksi database: mengunci stok (`SELECT … FOR UPDATE`), menyimpan header & detail, mengurangi stok,
mencatat `stok_movement`, memperbarui akumulasi customer, lalu `COMMIT` — atau `ROLLBACK` jika ada yang gagal.

## Teknologi

- PHP 8.1+ (native, PDO, tanpa framework)
- MySQL 8/9 atau MariaDB 10.6+
- HTML, CSS, JavaScript (Fetch API) — tanpa dependensi eksternal

## Instalasi (Laragon)

1. Salin/symlink folder ini ke `D:\laragon\www\lab_basdat`.
2. Buka HeidiSQL / terminal MySQL Laragon, buat database lalu impor data:
   ```sql
   CREATE DATABASE bengkel_gumuruh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
   ```bash
   mysql -u root bengkel_gumuruh < database/bengkel_gumuruh.sql
   ```
3. Atur koneksi di `config/database.php` bila perlu (default Laragon: `root` tanpa password).
   Untuk produksi gunakan user `bengkel_app` dari `database/dcl_bengkel_gumuruh.sql`.
4. Buka `http://localhost/lab_basdat` (atau `http://lab_basdat.test`).

### Akun demo

Semua akun memakai password awal `password` — segera ganti setelah login pertama di lingkungan produksi.

| Email | Role |
|---|---|
| **mridwanh@bengkelgumuruh.netlify.app** | Super Admin (akun utama — pemilik) |
| ahmad.fauzi@bengkelgumuruh.com | Super Admin |
| siti.nurhaliza@bengkelgumuruh.com | Bendahara |
| budi.setiawan@bengkelgumuruh.com | Kasir |

## Struktur Folder

```
├── assets/            CSS & JavaScript (live search AJAX, kalkulasi form)
├── config/            Konfigurasi koneksi database
├── database/          Dump lengkap + skrip DDL, DML, DCL
├── functions/         Logika bisnis (transaksi penjualan)
├── includes/          Bootstrap, helper, layout, dukungan AJAX
├── index.php          Dashboard
├── login.php / logout.php
├── penjualan*.php     Daftar, tambah, detail transaksi penjualan
├── pengadaan*.php     Daftar & detail purchase order
├── suku_cadang*.php   Master suku cadang
├── customer*.php      Master customer
├── vendor.php, mekanik.php, stok.php
```

## Berkas Basis Data

| File | Isi |
|---|---|
| `database/bengkel_gumuruh.sql` | Dump lengkap struktur + data (siap impor) |
| `database/ddl_bengkel_gumuruh.sql` | Data Definition Language (CREATE TABLE, INDEX) |
| `database/dml_bengkel_gumuruh.sql` | Data Manipulation Language (INSERT, SELECT, JOIN, UPDATE, DELETE) |
| `database/dcl_bengkel_gumuruh.sql` | Data Control Language (CREATE USER, GRANT, REVOKE) |
