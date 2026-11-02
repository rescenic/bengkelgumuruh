-- Membuat Database
CREATE DATABASE bengkel_gumuruh
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE bengkel_gumuruh;

-- 1. Tabel BENGKEL
CREATE TABLE bengkel (
    id_bengkel INT AUTO_INCREMENT PRIMARY KEY,
    nama_bengkel VARCHAR(100) NOT NULL,
    alamat_bengkel TEXT NOT NULL,
    email_bengkel VARCHAR(50) UNIQUE,
    no_telepon VARCHAR(15) NOT NULL,
    npwp_bengkel VARCHAR(20) UNIQUE,
    nama_pemilik VARCHAR(100) NOT NULL,
    tanggal_berdiri DATE,
    status_operasional TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE bengkel;

-- 2. Tabel PENGGUNA
CREATE TABLE pengguna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_pengguna VARCHAR(100) NOT NULL,
    nik_pengguna VARCHAR(16) UNIQUE NOT NULL,
    email_pengguna VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    role TINYINT COMMENT '1=Super Admin, 2=Bendahara, 3=Kasir',
    status TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    no_telepon VARCHAR(15),
    alamat TEXT,
    tanggal_lahir DATE,
    foto_profil LONGTEXT,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_bengkel INT,
    FOREIGN KEY (id_bengkel) REFERENCES bengkel(id_bengkel),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE pengguna;

-- 3. Tabel MEKANIK
CREATE TABLE mekanik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_mekanik VARCHAR(100) NOT NULL,
    nik_mekanik VARCHAR(16) UNIQUE NOT NULL,
    status TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    no_telepon VARCHAR(15),
    alamat TEXT,
    tanggal_lahir DATE,
    spesialisasi VARCHAR(100) COMMENT 'Mesin, Transmisi, AC, dll',
    pengalaman_tahun INT,
    gaji_pokok DECIMAL(12,2),
    foto_profil LONGTEXT,
    tanggal_masuk DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_bengkel INT,
    FOREIGN KEY (id_bengkel) REFERENCES bengkel(id_bengkel),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE mekanik;

-- 4. Tabel VENDOR
CREATE TABLE vendor (
    id_vendor INT AUTO_INCREMENT PRIMARY KEY,
    nama_vendor VARCHAR(100) NOT NULL,
    nama_perusahaan VARCHAR(100),
    alamat_vendor TEXT NOT NULL,
    no_telepon_vendor VARCHAR(15) NOT NULL,
    email_vendor VARCHAR(50),
    npwp_vendor VARCHAR(20),
    contact_person VARCHAR(100),
    no_telepon_contact VARCHAR(15),
    jenis_suku_cadang TEXT COMMENT 'Spesialisasi vendor',
    rating_vendor DECIMAL(2,1) DEFAULT 0.0 COMMENT 'Rating 0.0 - 5.0',
    status_kerjasama TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    term_pembayaran INT COMMENT 'Dalam hari',
    bank_nama VARCHAR(50),
    bank_rekening VARCHAR(30),
    bank_atas_nama VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE vendor;

-- 5. Tabel SUKU_CADANG
CREATE TABLE suku_cadang (
    id_suku_cadang INT AUTO_INCREMENT PRIMARY KEY,
    kode_suku_cadang VARCHAR(50) UNIQUE NOT NULL,
    nama_suku_cadang VARCHAR(100) NOT NULL,
    merk_kendaraan VARCHAR(50) COMMENT 'Toyota, Honda, Suzuki, dll',
    model_kendaraan VARCHAR(50) COMMENT 'Avanza, Jazz, Ertiga, dll',
    tahun_kendaraan VARCHAR(20) COMMENT '2015-2020',
    kategori VARCHAR(50) COMMENT 'Mesin, Transmisi, AC, Rem, dll',
    sub_kategori VARCHAR(50) COMMENT 'Filter oli, kampas rem, dll',
    satuan VARCHAR(20) COMMENT 'pcs, set, liter, dll',
    harga_beli DECIMAL(12,2) NOT NULL,
    harga_jual DECIMAL(12,2) NOT NULL,
    margin_keuntungan DECIMAL(5,2) COMMENT 'Dalam persen',
    stok_minimum INT DEFAULT 5,
    stok_maksimum INT DEFAULT 100,
    stok_saat_ini INT DEFAULT 0,
    lokasi_penyimpanan VARCHAR(50),
    berat DECIMAL(8,2) COMMENT 'Dalam gram',
    dimensi VARCHAR(50) COMMENT 'PxLxT dalam cm',
    deskripsi TEXT,
    foto_suku_cadang LONGTEXT,
    garansi_bulan INT,
    status_produk TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_vendor INT,
    FOREIGN KEY (id_vendor) REFERENCES vendor(id_vendor),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE suku_cadang;

-- 6. Tabel CUSTOMER
CREATE TABLE customer (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    nama_customer VARCHAR(100) NOT NULL,
    nik_customer VARCHAR(16),
    no_telepon_customer VARCHAR(15) NOT NULL,
    email_customer VARCHAR(50),
    alamat_customer TEXT,
    jenis_kelamin ENUM('L', 'P'),
    tanggal_lahir DATE,
    pekerjaan VARCHAR(50),
    kendaraan_merk VARCHAR(50),
    kendaraan_model VARCHAR(50),
    kendaraan_tahun YEAR,
    no_polisi VARCHAR(15),
    no_rangka VARCHAR(30),
    no_mesin VARCHAR(30),
    warna_kendaraan VARCHAR(30),
    km_kendaraan INT,
    customer_type ENUM('reguler', 'premium', 'vip') DEFAULT 'reguler',
    total_transaksi INT DEFAULT 0,
    total_nilai_transaksi DECIMAL(15,2) DEFAULT 0.00,
    tanggal_registrasi DATE,
    status_customer TINYINT DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE customer;

-- 7. Tabel TRANSAKSI_PENGADAAN
CREATE TABLE transaksi_pengadaan (
    id_transaksi_pengadaan INT AUTO_INCREMENT PRIMARY KEY,
    no_po VARCHAR(30) UNIQUE NOT NULL,
    tanggal_po DATE NOT NULL,
    tanggal_kedatangan DATE,
    no_invoice_vendor VARCHAR(50),
    total_item INT DEFAULT 0,
    subtotal DECIMAL(15,2) DEFAULT 0.00,
    pajak DECIMAL(15,2) DEFAULT 0.00,
    total_bayar DECIMAL(15,2) DEFAULT 0.00,
    status_pengadaan ENUM('draft', 'ordered', 'delivered', 'completed', 'cancelled') DEFAULT 'draft',
    status_pembayaran ENUM('unpaid', 'partial', 'paid') DEFAULT 'unpaid',
    tanggal_pembayaran DATE,
    metode_pembayaran ENUM('cash', 'transfer', 'giro'),
    no_referensi_bayar VARCHAR(50),
    catatan TEXT,
    nama_salesman VARCHAR(100),
    no_telepon_salesman VARCHAR(15),
    nama_driver VARCHAR(100),
    no_polisi_truck VARCHAR(15),
    foto_bukti_terima LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_vendor INT,
    id_pengguna INT COMMENT 'Yang membuat PO',
    FOREIGN KEY (id_vendor) REFERENCES vendor(id_vendor),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna(id),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE transaksi_pengadaan;

-- 8. Tabel TRANSAKSI_PENJUALAN
CREATE TABLE transaksi_penjualan (
    id_transaksi_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    no_invoice VARCHAR(30) UNIQUE NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    jam_masuk TIME,
    jam_selesai TIME,
    jenis_service VARCHAR(50) COMMENT 'Service Rutin, Ganti Oli, Perbaikan',
    keluhan TEXT,
    diagnosis TEXT,
    pekerjaan_dilakukan TEXT,
    km_kendaraan INT,
    total_item_suku_cadang INT DEFAULT 0,
    subtotal_suku_cadang DECIMAL(12,2) DEFAULT 0.00,
    biaya_jasa DECIMAL(12,2) DEFAULT 0.00,
    diskon DECIMAL(12,2) DEFAULT 0.00,
    pajak DECIMAL(12,2) DEFAULT 0.00,
    total_bayar DECIMAL(12,2) DEFAULT 0.00,
    status_service ENUM('antri', 'dikerjakan', 'selesai', 'diambil') DEFAULT 'antri',
    status_pembayaran ENUM('unpaid', 'paid') DEFAULT 'unpaid',
    metode_pembayaran ENUM('cash', 'transfer', 'debit', 'credit'),
    tanggal_pembayaran DATETIME,
    uang_muka DECIMAL(12,2) DEFAULT 0.00,
    sisa_bayar DECIMAL(12,2) DEFAULT 0.00,
    catatan TEXT,
    foto_kendaraan_masuk LONGTEXT,
    foto_kendaraan_keluar LONGTEXT,
    rating_service TINYINT COMMENT '1-5',
    feedback_customer TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_customer INT,
    id_mekanik INT,
    id_kasir INT COMMENT 'Yang melayani pembayaran',
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_mekanik) REFERENCES mekanik(id),
    FOREIGN KEY (id_kasir) REFERENCES pengguna(id),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE transaksi_penjualan;

-- 9. Tabel DETAIL_TRANSAKSI_PENGADAAN
CREATE TABLE detail_transaksi_pengadaan (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi_pengadaan INT,
    id_suku_cadang INT,
    qty_order INT NOT NULL,
    qty_diterima INT DEFAULT 0,
    harga_beli_satuan DECIMAL(12,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    tanggal_expired DATE,
    no_batch VARCHAR(30),
    kondisi_barang ENUM('baik', 'rusak', 'cacat'),
    catatan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    FOREIGN KEY (id_transaksi_pengadaan) REFERENCES transaksi_pengadaan(id_transaksi_pengadaan),
    FOREIGN KEY (id_suku_cadang) REFERENCES suku_cadang(id_suku_cadang),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE detail_transaksi_pengadaan;

-- 10. Tabel DETAIL_TRANSAKSI_PENJUALAN
CREATE TABLE detail_transaksi_penjualan (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi_penjualan INT,
    id_suku_cadang INT,
    qty INT NOT NULL,
    harga_jual_satuan DECIMAL(12,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    diskon_item DECIMAL(12,2) DEFAULT 0.00,
    garansi_mulai DATE,
    garansi_selesai DATE,
    status_garansi ENUM('aktif', 'kadaluarsa', 'digunakan'),
    catatan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    FOREIGN KEY (id_transaksi_penjualan) REFERENCES transaksi_penjualan(id_transaksi_penjualan),
    FOREIGN KEY (id_suku_cadang) REFERENCES suku_cadang(id_suku_cadang),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE detail_transaksi_penjualan;

-- 11. Tabel STOK_MOVEMENT
CREATE TABLE stok_movement (
    id_movement INT AUTO_INCREMENT PRIMARY KEY,
    id_suku_cadang INT,
    jenis_movement ENUM('masuk', 'keluar', 'adjustment', 'retur'),
    qty_before INT NOT NULL,
    qty_change INT NOT NULL,
    qty_after INT NOT NULL,
    referensi_type ENUM('pengadaan', 'penjualan', 'adjustment', 'retur'),
    referensi_id INT COMMENT 'ID dari tabel referensi_type',
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_pengguna INT,
    FOREIGN KEY (id_suku_cadang) REFERENCES suku_cadang(id_suku_cadang),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna(id),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE stok_movement;

-- 12. Tabel PEMBAYARAN_PENGADAAN
CREATE TABLE pembayaran_pengadaan (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi_pengadaan INT,
    tanggal_bayar DATE NOT NULL,
    jumlah_bayar DECIMAL(15,2) NOT NULL,
    metode_pembayaran ENUM('cash', 'transfer', 'giro'),
    no_referensi VARCHAR(50),
    bank_pengirim VARCHAR(50),
    bank_penerima VARCHAR(50),
    catatan TEXT,
    bukti_bayar LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by INT,
    id_pengguna INT COMMENT 'Bendahara yang bayar',
    FOREIGN KEY (id_transaksi_pengadaan) REFERENCES transaksi_pengadaan(id_transaksi_pengadaan),
    FOREIGN KEY (id_pengguna) REFERENCES pengguna(id),
    FOREIGN KEY (created_by) REFERENCES pengguna(id),
    FOREIGN KEY (updated_by) REFERENCES pengguna(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DESCRIBE pembayaran_pengadaan;

-- Tambahan Foreign Key untuk bengkel
ALTER TABLE bengkel 
ADD FOREIGN KEY (created_by) REFERENCES pengguna(id),
ADD FOREIGN KEY (updated_by) REFERENCES pengguna(id);

DESCRIBE bengkel;

-- Indexes untuk Optimasi
CREATE INDEX idx_suku_cadang_kode ON suku_cadang(kode_suku_cadang);
CREATE INDEX idx_suku_cadang_nama ON suku_cadang(nama_suku_cadang);
CREATE INDEX idx_customer_telepon ON customer(no_telepon_customer);
CREATE INDEX idx_customer_polisi ON customer(no_polisi);
CREATE INDEX idx_transaksi_penjualan_tanggal ON transaksi_penjualan(tanggal_transaksi);
CREATE INDEX idx_transaksi_pengadaan_tanggal ON transaksi_pengadaan(tanggal_po);
CREATE INDEX idx_stok_movement_tanggal ON stok_movement(created_at);
CREATE INDEX idx_pengguna_email ON pengguna(email_pengguna);
CREATE INDEX idx_pengguna_nik ON pengguna(nik_pengguna);
CREATE INDEX idx_mekanik_nik ON mekanik(nik_mekanik);
CREATE INDEX idx_vendor_nama ON vendor(nama_vendor);