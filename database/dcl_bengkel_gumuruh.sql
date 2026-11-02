-- 5. MANAJEMEN USER DAN HAK AKSES
-- 5.1 Membuat User Baru dengan Hak Akses SELECT
-- Membuat user baru dengan nama 'bengkel_reader'
CREATE USER 'bengkel_reader'@'localhost' IDENTIFIED BY 'ReadOnly123!';

-- Memberikan hak akses SELECT pada database bengkel_gumuruh
GRANT SELECT ON bengkel_gumuruh.* TO 'bengkel_reader'@'localhost';

-- Memberikan hak akses SELECT pada tabel-tabel spesifik (alternatif)
GRANT SELECT ON bengkel_gumuruh.bengkel TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.pengguna TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.mekanik TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.vendor TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.suku_cadang TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.customer TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.transaksi_pengadaan TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.transaksi_penjualan TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.detail_transaksi_pengadaan TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.detail_transaksi_penjualan TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.stok_movement TO 'bengkel_reader'@'localhost';
GRANT SELECT ON bengkel_gumuruh.pembayaran_pengadaan TO 'bengkel_reader'@'localhost';

-- Refresh privileges
FLUSH PRIVILEGES;

-- Verifikasi user yang telah dibuat
SELECT User, Host FROM mysql.user WHERE User = 'bengkel_reader';

-- Verifikasi hak akses user
SHOW GRANTS FOR 'bengkel_reader'@'localhost';

-- 5.2 Mengubah Password User
-- Mengubah password user bengkel_reader
ALTER USER 'bengkel_reader'@'localhost' IDENTIFIED BY 'NewPassword456!';

-- Alternatif menggunakan SET PASSWORD (untuk MySQL versi lama)
-- SET PASSWORD FOR 'bengkel_reader'@'localhost' = PASSWORD('NewPassword456!');

-- Refresh privileges setelah mengubah password
FLUSH PRIVILEGES;

-- Verifikasi perubahan dengan mencoba login (dilakukan di terminal/command line)
-- mysql -u bengkel_reader -p -h localhost

-- 5.3 Contoh Penggunaan User dengan Hak Akses Terbatas
-- Query yang DAPAT dijalankan oleh user bengkel_reader
SELECT * FROM suku_cadang WHERE status_produk = 1;
SELECT COUNT(*) FROM transaksi_penjualan WHERE tanggal_transaksi >= '2024-01-01';
SELECT nama_customer, SUM(total_bayar) as total FROM transaksi_penjualan tp 
JOIN customer c ON tp.id_customer = c.id_customer GROUP BY c.id_customer;

-- Query yang TIDAK DAPAT dijalankan oleh user bengkel_reader (akan error)
-- INSERT INTO suku_cadang (nama_suku_cadang) VALUES ('Test Item');
-- UPDATE suku_cadang SET harga_jual = 100000 WHERE id_suku_cadang = 1;
-- DELETE FROM customer WHERE id_customer = 1;
-- CREATE TABLE test_table (id INT);
-- DROP TABLE suku_cadang;

-- 5.4 Manajemen User Tambahan
-- Membuat user untuk aplikasi dengan hak akses penuh
CREATE USER 'bengkel_app'@'localhost' IDENTIFIED BY 'AppUser789!';
GRANT SELECT, INSERT, UPDATE, DELETE ON bengkel_gumuruh.* TO 'bengkel_app'@'localhost';

-- Membuat user untuk backup dengan hak akses SELECT dan LOCK TABLES
CREATE USER 'bengkel_backup'@'localhost' IDENTIFIED BY 'BackupUser321!';
GRANT SELECT, LOCK TABLES ON bengkel_gumuruh.* TO 'bengkel_backup'@'localhost';

-- Membuat user untuk reporting dengan hak akses SELECT saja
CREATE USER 'bengkel_report'@'%' IDENTIFIED BY 'ReportUser654!';
GRANT SELECT ON bengkel_gumuruh.* TO 'bengkel_report'@'%';

-- Refresh privileges
FLUSH PRIVILEGES;

-- Melihat semua user yang ada
SELECT User, Host, account_locked, password_expired FROM mysql.user 
WHERE User LIKE 'bengkel_%';

-- 5.5 Menghapus User (Jika Diperlukan)
-- Menghapus user jika tidak diperlukan lagi
DROP USER 'bengkel_reader'@'localhost';
DROP USER 'bengkel_app'@'localhost';
DROP USER 'bengkel_backup'@'localhost';
DROP USER 'bengkel_report'@'%';

-- Refresh privileges setelah menghapus user
FLUSH PRIVILEGES;
