/*
 Navicat Premium Dump SQL

 Source Server         : mysql9@laragon
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3306
 Source Schema         : bengkel_gumuruh

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 16/06/2025 17:02:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bengkel
-- ----------------------------
DROP TABLE IF EXISTS `bengkel`;
CREATE TABLE `bengkel`  (
  `id_bengkel` int NOT NULL AUTO_INCREMENT,
  `nama_bengkel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_bengkel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_bengkel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_telepon` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `npwp_bengkel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama_pemilik` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_berdiri` date NULL DEFAULT NULL,
  `status_operasional` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_bengkel`) USING BTREE,
  UNIQUE INDEX `email_bengkel`(`email_bengkel` ASC) USING BTREE,
  UNIQUE INDEX `npwp_bengkel`(`npwp_bengkel` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  CONSTRAINT `bengkel_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bengkel_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bengkel
-- ----------------------------
INSERT INTO `bengkel` VALUES (1, 'Bengkel Gumuruh', 'Jl. Gumuruh No. 52, Bandung, Jawa Barat', 'info@bengkelgumuruh.com', '081394483625', '12.345.678.9-012.000', 'Muhammad Ridwan Hakim', '2015-03-15', 1, '2025-06-16 11:58:38', NULL, '2025-06-16 11:58:38', NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `nama_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik_customer` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_telepon_customer` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alamat_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `pekerjaan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kendaraan_merk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kendaraan_model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kendaraan_tahun` year NULL DEFAULT NULL,
  `no_polisi` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_rangka` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_mesin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `warna_kendaraan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `km_kendaraan` int NULL DEFAULT NULL,
  `customer_type` enum('reguler','premium','vip') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'reguler',
  `total_transaksi` int NULL DEFAULT 0,
  `total_nilai_transaksi` decimal(15, 2) NULL DEFAULT 0.00,
  `tanggal_registrasi` date NULL DEFAULT NULL,
  `status_customer` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_customer_telepon`(`no_telepon_customer` ASC) USING BTREE,
  INDEX `idx_customer_polisi`(`no_polisi` ASC) USING BTREE,
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Ahmad Rizki', '3201234567890201', '081234568001', 'ahmad.rizki@email.com', 'Jl. Merdeka No. 101, Bandung', 'L', '1985-03-15', 'Pegawai Swasta', 'Toyota', 'Avanza', 2018, 'D 1234 AB', 'MHKA1BA1XJK123456', 'K3VE1234567', 'Silver', 45000, 'reguler', 0, 0.00, '2023-01-15', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (2, 'Siti Aminah', '3201234567890202', '081234568002', 'siti.aminah@email.com', 'Jl. Sudirman No. 102, Bandung', 'P', '1990-07-22', 'Guru', 'Honda', 'Jazz', 2019, 'D 5678 CD', 'MHGGE5H19KH123456', 'L15A1234567', 'Putih', 32000, 'premium', 0, 0.00, '2023-01-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (3, 'Budi Hartono', '3201234567890203', '081234568003', 'budi.hartono@email.com', 'Jl. Asia Afrika No. 103, Bandung', 'L', '1982-11-10', 'Wiraswasta', 'Suzuki', 'Ertiga', 2020, 'D 9012 EF', 'JSAFJB22S00123456', 'K15B1234567', 'Hitam', 28000, 'vip', 0, 0.00, '2023-02-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (4, 'Dewi Sartika', '3201234567890204', '081234568004', 'dewi.sartika@email.com', 'Jl. Braga No. 104, Bandung', 'P', '1988-05-18', 'Dokter', 'Toyota', 'Innova', 2017, 'D 3456 GH', 'MHKA1BA1XHK123456', '2KD1234567', 'Abu-abu', 55000, 'premium', 0, 0.00, '2023-02-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (5, 'Eko Prasetyo', '3201234567890205', '081234568005', 'eko.prasetyo@email.com', 'Jl. Dago No. 105, Bandung', 'L', '1992-09-25', 'Engineer', 'Honda', 'CR-V', 2021, 'D 7890 IJ', 'MHGRE5H21MH123456', 'R20A1234567', 'Merah', 15000, 'vip', 0, 0.00, '2023-02-15', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (6, 'Fitri Handayani', '3201234567890206', '081234568006', 'fitri.handayani@email.com', 'Jl. Setiabudhi No. 106, Bandung', 'P', '1987-12-08', 'Pegawai Bank', 'Mitsubishi', 'Xpander', 2022, 'D 2345 KL', 'MMBJNKN15NH123456', '4A911234567', 'Biru', 8000, 'reguler', 0, 0.00, '2023-03-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (7, 'Gunawan Adi', '3201234567890207', '081234568007', 'gunawan.adi@email.com', 'Jl. Pasteur No. 107, Bandung', 'L', '1984-04-12', 'Arsitek', 'Nissan', 'Grand Livina', 2016, 'D 6789 MN', 'SJNFAAJ10U0123456', 'HR15DE1234567', 'Coklat', 62000, 'premium', 0, 0.00, '2023-03-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (8, 'Hani Rahmawati', '3201234567890208', '081234568008', 'hani.rahmawati@email.com', 'Jl. Cihampelas No. 108, Bandung', 'P', '1991-08-30', 'Desainer', 'Toyota', 'Yaris', 2019, 'D 0123 OP', 'MHKA1BA1XKK123456', '2NR1234567', 'Kuning', 35000, 'reguler', 0, 0.00, '2023-03-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (9, 'Indra Gunawan', '3201234567890209', '081234568009', 'indra.gunawan@email.com', 'Jl. Riau No. 109, Bandung', 'L', '1986-01-14', 'Manager', 'Honda', 'Civic', 2020, 'D 4567 QR', 'MHGFC5F20LH123456', 'L15B1234567', 'Putih', 25000, 'vip', 0, 0.00, '2023-04-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (10, 'Jihan Aulia', '3201234567890210', '081234568010', 'jihan.aulia@email.com', 'Jl. Buah Batu No. 110, Bandung', 'P', '1993-06-05', 'Farmasis', 'Suzuki', 'Swift', 2018, 'D 8901 ST', 'JSAFJZ85S00123456', 'K12M1234567', 'Silver', 42000, 'reguler', 0, 0.00, '2023-04-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (11, 'Kurniawan Adi', '3201234567890211', '081234568011', 'kurniawan.adi@email.com', 'Jl. Soekarno Hatta No. 111, Bandung', 'L', '1989-10-20', 'Programmer', 'Toyota', 'Fortuner', 2021, 'D 2468 UV', 'MHKA1BA1XMK123456', '2GD1234567', 'Hitam', 18000, 'premium', 0, 0.00, '2023-04-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (12, 'Lina Marlina', '3201234567890212', '081234568012', 'lina.marlina@email.com', 'Jl. Dipatiukur No. 112, Bandung', 'P', '1985-02-28', 'Akuntan', 'Honda', 'Brio', 2017, 'D 1357 WX', 'MHGDD5F17HH123456', 'L12B1234567', 'Merah', 48000, 'reguler', 0, 0.00, '2023-05-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (13, 'Muhammad Ali', '3201234567890213', '081234568013', 'muhammad.ali@email.com', 'Jl. Gatot Subroto No. 113, Bandung', 'L', '1990-11-15', 'Sales', 'Mitsubishi', 'Pajero Sport', 2019, 'D 9753 YZ', 'MMBJSKD29KH123456', '4D561234567', 'Putih', 38000, 'vip', 0, 0.00, '2023-05-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (14, 'Nurul Hidayah', '3201234567890214', '081234568014', 'nurul.hidayah@email.com', 'Jl. Ahmad Yani No. 114, Bandung', 'P', '1988-07-03', 'Perawat', 'Nissan', 'X-Trail', 2020, 'D 8642 AA', 'SJNFAAJ10L0123456', 'QR25DE1234567', 'Abu-abu', 22000, 'premium', 0, 0.00, '2023-05-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (15, 'Oki Setiawan', '3201234567890215', '081234568015', 'oki.setiawan@email.com', 'Jl. Veteran No. 115, Bandung', 'L', '1987-12-18', 'Teknisi', 'Toyota', 'Camry', 2018, 'D 7531 BB', 'MHKA1BA1XJK123456', '2AR1234567', 'Biru', 52000, 'reguler', 0, 0.00, '2023-06-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (16, 'Putri Ayu', '3201234567890216', '081234568016', 'putri.ayu@email.com', 'Jl. Pemuda No. 116, Bandung', 'P', '1992-04-09', 'Marketing', 'Honda', 'HR-V', 2021, 'D 6420 CC', 'MHGRU6H21MH123456', 'L15B1234567', 'Putih', 12000, 'vip', 0, 0.00, '2023-06-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (17, 'Qori Ramadhan', '3201234567890217', '081234568017', 'qori.ramadhan@email.com', 'Jl. Proklamasi No. 117, Bandung', 'L', '1984-09-22', 'Konsultan', 'Suzuki', 'Baleno', 2019, 'D 5319 DD', 'JSAFJB22S00123456', 'K15B1234567', 'Silver', 33000, 'premium', 0, 0.00, '2023-06-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (18, 'Rina Susanti', '3201234567890218', '081234568018', 'rina.susanti@email.com', 'Jl. Kemerdekaan No. 118, Bandung', 'P', '1991-01-11', 'HR Manager', 'Toyota', 'Vios', 2016, 'D 4208 EE', 'MHKA1BA1XGK123456', '2NZ1234567', 'Hitam', 65000, 'reguler', 0, 0.00, '2023-07-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (19, 'Sandi Permana', '3201234567890219', '081234568019', 'sandi.permana@email.com', 'Jl. Pancasila No. 119, Bandung', 'L', '1986-05-26', 'Pilot', 'Honda', 'City', 2020, 'D 3107 FF', 'MHGGE5H20KH123456', 'L15A1234567', 'Coklat', 28000, 'vip', 0, 0.00, '2023-07-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (20, 'Tari Melati', '3201234567890220', '081234568020', 'tari.melati@email.com', 'Jl. Garuda No. 120, Bandung', 'P', '1989-08-14', 'Psikolog', 'Mitsubishi', 'Outlander', 2018, 'D 2096 GG', 'MMBJWKD29JH123456', '4J121234567', 'Merah', 45000, 'premium', 0, 0.00, '2023-07-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (21, 'Udin Sedunia', '3201234567890221', '081234568021', 'udin.sedunia@email.com', 'Jl. Elang No. 121, Bandung', 'L', '1993-03-07', 'Fotografer', 'Nissan', 'Serena', 2017, 'D 1985 HH', 'SJNFCNJ10H0123456', 'MR20DD1234567', 'Putih', 58000, 'reguler', 0, 0.00, '2023-08-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (22, 'Vina Cantika', '3201234567890222', '081234568022', 'vina.cantika@email.com', 'Jl. Rajawali No. 122, Bandung', 'P', '1987-10-19', 'Chef', 'Toyota', 'Alphard', 2019, 'D 0874 II', 'MHKA1BA1XKK123456', '2GR1234567', 'Hitam', 35000, 'vip', 0, 0.00, '2023-08-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (23, 'Wawan Kurniawan', '3201234567890223', '081234568023', 'wawan.kurniawan@email.com', 'Jl. Merak No. 123, Bandung', 'L', '1990-12-02', 'Lawyer', 'Honda', 'Accord', 2020, 'D 9763 JJ', 'MHGCV3F20LH123456', 'K24W1234567', 'Abu-abu', 25000, 'premium', 0, 0.00, '2023-08-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (24, 'Xenia Putri', '3201234567890224', '081234568024', 'xenia.putri@email.com', 'Jl. Cendrawasih No. 124, Bandung', 'P', '1988-06-16', 'Dentist', 'Mitsubishi', 'Triton', 2021, 'D 8652 KK', 'MMBJSKD29MH123456', '4N151234567', 'Biru', 15000, 'reguler', 0, 0.00, '2023-09-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (25, 'Yudi Pratama', '3201234567890225', '081234568025', 'yudi.pratama@email.com', 'Jl. Nuri No. 125, Bandung', 'L', '1985-11-23', 'Architect', 'Nissan', 'Navara', 2019, 'D 7541 LL', 'SJNFDAJ10K0123456', 'YD25DDTi1234567', 'Coklat', 42000, 'vip', 0, 0.00, '2023-09-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (26, 'Zahra Amelia', '3201234567890226', '081234568026', 'zahra.amelia@email.com', 'Jl. Kenari No. 126, Bandung', 'P', '1992-02-08', 'Journalist', 'Toyota', 'Rush', 2018, 'D 6430 MM', 'MHKA1BA1XJK123456', '3SZ1234567', 'Silver', 48000, 'premium', 0, 0.00, '2023-09-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (27, 'Andi Wijaya', '3201234567890227', '081234568027', 'andi.wijaya@email.com', 'Jl. Kutilang No. 127, Bandung', 'L', '1989-04-21', 'Mechanic', 'Honda', 'Mobilio', 2016, 'D 5329 NN', 'MHGGE6H16HH123456', 'L15A1234567', 'Putih', 62000, 'reguler', 0, 0.00, '2023-10-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (28, 'Bella Sari', '3201234567890228', '081234568028', 'bella.sari@email.com', 'Jl. Pipit No. 128, Bandung', 'P', '1986-08-13', 'Teacher', 'Suzuki', 'Ignis', 2020, 'D 4218 OO', 'JSAFJZ85S00123456', 'K12C1234567', 'Kuning', 28000, 'vip', 0, 0.00, '2023-10-10', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (29, 'Candra Kirana', '3201234567890229', '081234568029', 'candra.kirana@email.com', 'Jl. Gereja No. 129, Bandung', 'P', '1991-07-06', 'Pharmacist', 'Toyota', 'Sienta', 2019, 'D 3107 PP', 'MHKA1BA1XKK123456', '2NR1234567', 'Merah', 38000, 'premium', 0, 0.00, '2023-10-20', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 14:57:45', NULL);
INSERT INTO `customer` VALUES (30, 'Dedi Mulyadi', '3201234567890230', '081234568030', 'dedi.mulyadi@email.com', 'Jl. Masjid No. 130, Bandung', 'L', '1984-12-29', 'Police Officer', 'Honda', 'Freed', 2017, 'D 2096 QQ', 'MHGGE3H17HH123456', 'L15A1234567', 'Hitam', 55000, 'vip', 0, 0.00, '2023-11-01', 1, '2025-06-16 14:57:45', NULL, '2025-06-16 16:32:27', NULL);

-- ----------------------------
-- Table structure for detail_transaksi_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_pengadaan`;
CREATE TABLE `detail_transaksi_pengadaan`  (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_transaksi_pengadaan` int NULL DEFAULT NULL,
  `id_suku_cadang` int NULL DEFAULT NULL,
  `qty_order` int NOT NULL,
  `qty_diterima` int NULL DEFAULT 0,
  `harga_beli_satuan` decimal(12, 2) NOT NULL,
  `subtotal` decimal(12, 2) NOT NULL,
  `tanggal_expired` date NULL DEFAULT NULL,
  `no_batch` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kondisi_barang` enum('baik','rusak','cacat') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE,
  INDEX `id_transaksi_pengadaan`(`id_transaksi_pengadaan` ASC) USING BTREE,
  INDEX `id_suku_cadang`(`id_suku_cadang` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  CONSTRAINT `detail_transaksi_pengadaan_ibfk_1` FOREIGN KEY (`id_transaksi_pengadaan`) REFERENCES `transaksi_pengadaan` (`id_transaksi_pengadaan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_pengadaan_ibfk_2` FOREIGN KEY (`id_suku_cadang`) REFERENCES `suku_cadang` (`id_suku_cadang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_pengadaan_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_pengadaan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_transaksi_pengadaan
-- ----------------------------
INSERT INTO `detail_transaksi_pengadaan` VALUES (1, 1, 1, 100, 100, 25000.00, 2500000.00, NULL, NULL, 'baik', 'Filter oli untuk stok', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (2, 2, 2, 12, 12, 150000.00, 1800000.00, NULL, NULL, 'baik', 'Kampas rem Honda Jazz', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (3, 3, 3, 10, 10, 450000.00, 4500000.00, NULL, NULL, 'baik', 'Aki 12V untuk berbagai mobil', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (4, 4, 4, 8, 8, 300000.00, 2400000.00, NULL, NULL, 'baik', 'Shock absorber Suzuki', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (5, 4, 4, 10, 10, 300000.00, 3000000.00, NULL, NULL, 'baik', 'Shock absorber tambahan', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (6, 5, 5, 80, 80, 35000.00, 2800000.00, NULL, NULL, 'baik', 'Lampu halogen H4', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (7, 6, 6, 8, 8, 650000.00, 5200000.00, NULL, NULL, 'baik', 'Ban radial 185/65R15', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (8, 7, 7, 6, 6, 800000.00, 4800000.00, NULL, NULL, 'baik', 'Radiator Toyota Innova', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (9, 8, 8, 20, 20, 180000.00, 3600000.00, NULL, NULL, 'baik', 'Timing belt Honda', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (10, 9, 9, 10, 10, 550000.00, 5500000.00, NULL, NULL, 'baik', 'Kampas kopling set', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (11, 10, 10, 12, 12, 400000.00, 4800000.00, NULL, NULL, 'baik', 'Fuel pump electric', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (12, 11, 11, 60, 60, 45000.00, 2700000.00, NULL, NULL, 'baik', 'Wiper blade 24 inch', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (13, 12, 12, 5, 5, 1200000.00, 6000000.00, NULL, NULL, 'baik', 'Headlamp LED Toyota', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (14, 13, 13, 12, 12, 350000.00, 4200000.00, NULL, NULL, 'baik', 'Gasket head Honda', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (15, 14, 14, 7, 7, 850000.00, 5950000.00, NULL, NULL, 'baik', 'Alternator Suzuki', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (16, 15, 15, 5, 5, 950000.00, 4750000.00, NULL, NULL, 'baik', 'Power steering pump', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (17, 16, 16, 10, 10, 280000.00, 2800000.00, NULL, NULL, 'baik', 'Muffler Honda Brio', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (18, 17, 17, 25, 25, 65000.00, 1625000.00, NULL, NULL, 'baik', 'Air filter engine', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (19, 18, 18, 12, 12, 320000.00, 3840000.00, NULL, NULL, 'baik', 'Brake disc rotor', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);
INSERT INTO `detail_transaksi_pengadaan` VALUES (20, 19, 19, 8, 8, 420000.00, 3360000.00, NULL, NULL, 'baik', 'Clutch master cylinder', '2025-06-16 15:08:35', NULL, '2025-06-16 15:08:35', NULL);

-- ----------------------------
-- Table structure for detail_transaksi_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_penjualan`;
CREATE TABLE `detail_transaksi_penjualan`  (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_transaksi_penjualan` int NULL DEFAULT NULL,
  `id_suku_cadang` int NULL DEFAULT NULL,
  `qty` int NOT NULL,
  `harga_jual_satuan` decimal(12, 2) NOT NULL,
  `subtotal` decimal(12, 2) NOT NULL,
  `diskon_item` decimal(12, 2) NULL DEFAULT 0.00,
  `garansi_mulai` date NULL DEFAULT NULL,
  `garansi_selesai` date NULL DEFAULT NULL,
  `status_garansi` enum('aktif','kadaluarsa','digunakan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE,
  INDEX `id_transaksi_penjualan`(`id_transaksi_penjualan` ASC) USING BTREE,
  INDEX `id_suku_cadang`(`id_suku_cadang` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  CONSTRAINT `detail_transaksi_penjualan_ibfk_1` FOREIGN KEY (`id_transaksi_penjualan`) REFERENCES `transaksi_penjualan` (`id_transaksi_penjualan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_penjualan_ibfk_2` FOREIGN KEY (`id_suku_cadang`) REFERENCES `suku_cadang` (`id_suku_cadang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_penjualan_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_penjualan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_transaksi_penjualan
-- ----------------------------
INSERT INTO `detail_transaksi_penjualan` VALUES (22, 1, 1, 1, 35000.00, 35000.00, 0.00, '2024-01-15', '2024-07-15', 'aktif', 'Filter oli Toyota Avanza', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (23, 1, 5, 1, 25000.00, 25000.00, 0.00, '2024-01-15', '2024-07-15', 'aktif', 'Oli mesin 4 liter', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (24, 2, 2, 1, 200000.00, 200000.00, 0.00, '2024-01-18', '2025-01-18', 'aktif', 'Kampas rem depan Honda Jazz', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (25, 3, 3, 1, 600000.00, 600000.00, 0.00, '2024-01-20', '2025-01-20', 'aktif', 'Aki 12V 45Ah', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (26, 4, 4, 2, 420000.00, 840000.00, 0.00, '2024-01-22', '2026-01-22', 'aktif', 'Shock absorber depan', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (27, 5, 5, 2, 50000.00, 100000.00, 0.00, '2024-01-25', '2024-07-25', 'aktif', 'Lampu halogen H4', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (28, 6, 6, 4, 850000.00, 3400000.00, 100000.00, '2024-01-28', '2029-01-28', 'aktif', 'Ban radial 185/65R15', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (29, 7, 7, 1, 1100000.00, 1100000.00, 0.00, '2024-02-01', '2025-02-01', 'aktif', 'Radiator Toyota Innova', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (30, 8, 8, 1, 250000.00, 250000.00, 0.00, '2024-02-05', '2025-02-05', 'aktif', 'Timing belt Honda Civic', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (31, 9, 9, 1, 750000.00, 750000.00, 0.00, '2024-02-08', '2025-08-08', 'aktif', 'Kampas kopling set', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (32, 10, 10, 1, 550000.00, 550000.00, 0.00, '2024-02-10', '2025-02-10', 'aktif', 'Fuel pump electric', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (33, 11, 11, 2, 65000.00, 130000.00, 0.00, '2024-02-12', '2025-02-12', 'aktif', 'Wiper blade 24 inch', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (34, 12, 12, 2, 1600000.00, 3200000.00, 0.00, '2024-02-15', '2026-02-15', 'aktif', 'Headlamp LED Toyota', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (35, 13, 13, 1, 480000.00, 480000.00, 0.00, '2024-02-18', '2025-02-18', 'aktif', 'Gasket head Honda CR-V', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (36, 14, 14, 1, 1150000.00, 1150000.00, 0.00, '2024-02-20', '2025-08-20', 'aktif', 'Alternator Suzuki Swift', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (37, 15, 15, 1, 1300000.00, 1300000.00, 0.00, '2024-02-22', '2025-02-22', 'aktif', 'Power steering pump', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (38, 16, 16, 1, 380000.00, 380000.00, 0.00, '2024-02-25', '2025-02-25', 'aktif', 'Muffler Honda Brio', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (39, 17, 17, 1, 90000.00, 90000.00, 0.00, '2024-02-28', '2024-08-28', 'aktif', 'Air filter engine', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (40, 18, 18, 2, 450000.00, 900000.00, 0.00, '2024-03-01', '2026-03-01', 'aktif', 'Brake disc rotor', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (41, 19, 19, 1, 580000.00, 580000.00, 0.00, '2024-03-05', '2025-03-05', 'aktif', 'Clutch master cylinder', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (42, 20, 20, 2, 520000.00, 1040000.00, 0.00, '2024-03-08', '2025-09-08', 'aktif', 'Suspension spring', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (43, 21, 21, 1, 400000.00, 400000.00, 0.00, '2024-03-10', '2025-03-10', 'aktif', 'CV joint outer', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (44, 22, 22, 2, 170000.00, 340000.00, 0.00, '2024-03-12', '2025-03-12', 'aktif', 'Tie rod end', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (45, 23, 23, 2, 250000.00, 500000.00, 0.00, '2024-03-15', '2025-03-15', 'aktif', 'Engine mount', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (46, 24, 24, 1, 120000.00, 120000.00, 0.00, '2024-03-18', '2024-09-18', 'aktif', 'Radiator hose upper', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (47, 25, 25, 1, 450000.00, 450000.00, 0.00, '2024-03-20', '2025-03-20', 'aktif', 'Water pump', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (48, 26, 26, 4, 120000.00, 480000.00, 0.00, '2024-03-22', '2026-03-22', 'aktif', 'Spark plug iridium', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (49, 27, 27, 1, 900000.00, 900000.00, 0.00, '2024-03-25', '2025-03-25', 'aktif', 'Oxygen sensor', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (50, 28, 28, 1, 1500000.00, 1500000.00, 0.00, '2024-03-28', '2025-09-28', 'aktif', 'Throttle body', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (51, 29, 29, 1, 670000.00, 670000.00, 0.00, '2024-04-01', '2025-04-01', 'aktif', 'EGR valve', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);
INSERT INTO `detail_transaksi_penjualan` VALUES (52, 30, 30, 1, 4800000.00, 4800000.00, 200000.00, '2024-04-05', '2026-04-05', 'aktif', 'Turbocharger', '2025-06-16 15:26:56', NULL, '2025-06-16 15:26:56', NULL);

-- ----------------------------
-- Table structure for mekanik
-- ----------------------------
DROP TABLE IF EXISTS `mekanik`;
CREATE TABLE `mekanik`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_mekanik` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik_mekanik` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `no_telepon` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `spesialisasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Mesin, Transmisi, AC, dll',
  `pengalaman_tahun` int NULL DEFAULT NULL,
  `gaji_pokok` decimal(12, 2) NULL DEFAULT NULL,
  `foto_profil` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tanggal_masuk` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_bengkel` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nik_mekanik`(`nik_mekanik` ASC) USING BTREE,
  INDEX `id_bengkel`(`id_bengkel` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_mekanik_nik`(`nik_mekanik` ASC) USING BTREE,
  CONSTRAINT `mekanik_ibfk_1` FOREIGN KEY (`id_bengkel`) REFERENCES `bengkel` (`id_bengkel`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mekanik_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mekanik_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mekanik
-- ----------------------------
INSERT INTO `mekanik` VALUES (1, 'Agung Nugroho', '3201234567890101', 1, '081234560001', 'Jl. Mekanik No. 1', '1985-01-15', 'Mesin', 10, 4500000.00, NULL, '2020-01-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (2, 'Bambang Sutrisno', '3201234567890102', 1, '081234560002', 'Jl. Mekanik No. 2', '1987-03-20', 'Transmisi', 8, 4200000.00, NULL, '2020-02-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (3, 'Cahyo Prabowo', '3201234567890103', 1, '081234560003', 'Jl. Mekanik No. 3', '1990-05-10', 'AC', 6, 3800000.00, NULL, '2020-03-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (4, 'Darmawan Jaya', '3201234567890104', 1, '081234560004', 'Jl. Mekanik No. 4', '1988-07-25', 'Rem', 7, 4000000.00, NULL, '2020-04-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (5, 'Eko Prasetyo', '3201234567890105', 1, '081234560005', 'Jl. Mekanik No. 5', '1992-09-12', 'Suspensi', 5, 3600000.00, NULL, '2020-05-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (6, 'Fajar Sidik', '3201234567890106', 1, '081234560006', 'Jl. Mekanik No. 6', '1986-11-08', 'Kelistrikan', 9, 4300000.00, NULL, '2020-06-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (7, 'Gunawan Adi', '3201234567890107', 1, '081234560007', 'Jl. Mekanik No. 7', '1989-02-14', 'Body Repair', 7, 4100000.00, NULL, '2020-07-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (8, 'Hadi Susanto', '3201234567890108', 1, '081234560008', 'Jl. Mekanik No. 8', '1991-04-22', 'Mesin', 6, 3900000.00, NULL, '2020-08-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (9, 'Irwan Setiawan', '3201234567890109', 1, '081234560009', 'Jl. Mekanik No. 9', '1984-06-30', 'Transmisi', 11, 4600000.00, NULL, '2020-09-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (10, 'Joko Santoso', '3201234567890110', 1, '081234560010', 'Jl. Mekanik No. 10', '1993-08-18', 'AC', 4, 3500000.00, NULL, '2020-10-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (11, 'Kurniawan Adi', '3201234567890111', 1, '081234560011', 'Jl. Mekanik No. 11', '1987-10-05', 'Rem', 8, 4200000.00, NULL, '2020-11-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (12, 'Lukman Sardi', '3201234567890112', 1, '081234560012', 'Jl. Mekanik No. 12', '1990-12-28', 'Suspensi', 6, 3800000.00, NULL, '2020-12-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (13, 'Mulyadi Joko', '3201234567890113', 1, '081234560013', 'Jl. Mekanik No. 13', '1988-01-16', 'Kelistrikan', 7, 4000000.00, NULL, '2021-01-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (14, 'Nugroho Adi', '3201234567890114', 1, '081234560014', 'Jl. Mekanik No. 14', '1992-03-11', 'Body Repair', 5, 3700000.00, NULL, '2021-02-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (15, 'Oki Prasetyo', '3201234567890115', 1, '081234560015', 'Jl. Mekanik No. 15', '1985-05-07', 'Mesin', 10, 4500000.00, NULL, '2021-03-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (16, 'Purnomo Adi', '3201234567890116', 1, '081234560016', 'Jl. Mekanik No. 16', '1989-07-24', 'Transmisi', 7, 4100000.00, NULL, '2021-04-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (17, 'Qomar Sidik', '3201234567890117', 1, '081234560017', 'Jl. Mekanik No. 17', '1991-09-19', 'AC', 6, 3900000.00, NULL, '2021-05-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (18, 'Rahmat Hidayat', '3201234567890118', 1, '081234560018', 'Jl. Mekanik No. 18', '1986-11-13', 'Rem', 9, 4300000.00, NULL, '2021-06-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (19, 'Sugeng Riyadi', '3201234567890119', 1, '081234560019', 'Jl. Mekanik No. 19', '1993-01-26', 'Suspensi', 4, 3600000.00, NULL, '2021-07-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (20, 'Tono Sukirman', '3201234567890120', 1, '081234560020', 'Jl. Mekanik No. 20', '1987-03-09', 'Kelistrikan', 8, 4200000.00, NULL, '2021-08-01', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);
INSERT INTO `mekanik` VALUES (21, 'Usman Hakim', '3201234567890121', 1, '081234560021', 'Jl. Mekanik No. 21', '1990-05-17', 'Body Repair', 6, 3800000.00, NULL, '2021-09-15', '2025-06-16 14:47:23', NULL, '2025-06-16 14:47:23', NULL, 1);

-- ----------------------------
-- Table structure for pembayaran_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_pengadaan`;
CREATE TABLE `pembayaran_pengadaan`  (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_transaksi_pengadaan` int NULL DEFAULT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` decimal(15, 2) NOT NULL,
  `metode_pembayaran` enum('cash','transfer','giro') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_referensi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_pengirim` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_penerima` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bukti_bayar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL COMMENT 'Bendahara yang bayar',
  PRIMARY KEY (`id_pembayaran`) USING BTREE,
  INDEX `id_transaksi_pengadaan`(`id_transaksi_pengadaan` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  CONSTRAINT `pembayaran_pengadaan_ibfk_1` FOREIGN KEY (`id_transaksi_pengadaan`) REFERENCES `transaksi_pengadaan` (`id_transaksi_pengadaan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pembayaran_pengadaan_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pembayaran_pengadaan_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pembayaran_pengadaan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pembayaran_pengadaan
-- ----------------------------
INSERT INTO `pembayaran_pengadaan` VALUES (1, 1, '2024-01-20', 2775000.00, 'transfer', 'TRF240120001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/001', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (2, 2, '2024-01-25', 1998000.00, 'transfer', 'TRF240125001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/002', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (3, 3, '2024-01-30', 1332000.00, 'cash', 'CASH240130001', '', '', 'Pembayaran tunai PO/2024/003', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (4, 4, '2024-02-07', 3552000.00, 'transfer', 'TRF240207001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/004', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (5, 5, '2024-02-15', 888000.00, 'transfer', 'TRF240215001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/005', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (6, 6, '2024-02-20', 2664000.00, 'transfer', 'TRF240220001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/006', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (7, 7, '2024-02-25', 2442000.00, 'giro', 'GIRO240225001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran giro PO/2024/007', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (8, 8, '2024-03-07', 1665000.00, 'transfer', 'TRF240307001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/008', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (9, 9, '2024-03-15', 3330000.00, 'transfer', 'TRF240315001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/009', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (10, 10, '2024-03-20', 3052500.00, 'transfer', 'TRF240320001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/010', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (11, 11, '2024-03-25', 721500.00, 'cash', 'CASH240325001', '', '', 'Pembayaran tunai PO/2024/011', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (12, 12, '2024-04-07', 5328000.00, 'transfer', 'TRF240407001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/012', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (13, 13, '2024-04-15', 2131200.00, 'transfer', 'TRF240415001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/013', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (14, 14, '2024-04-20', 3829500.00, 'giro', 'GIRO240420001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran giro PO/2024/014', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (15, 15, '2024-04-25', 2886000.00, 'transfer', 'TRF240425001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/015', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (16, 16, '2024-05-07', 1687200.00, 'transfer', 'TRF240507001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/016', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (17, 17, '2024-05-15', 799200.00, 'cash', 'CASH240515001', '', '', 'Pembayaran tunai PO/2024/017', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (18, 18, '2024-05-20', 1998000.00, 'transfer', 'TRF240520001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/018', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (19, 19, '2024-05-25', 1931400.00, 'transfer', 'TRF240525001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/019', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);
INSERT INTO `pembayaran_pengadaan` VALUES (20, 20, '2024-06-07', 2308800.00, 'transfer', 'TRF240607001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/020', NULL, '2025-06-16 15:30:15', NULL, '2025-06-16 15:30:15', NULL, 2);

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik_pengguna` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pengguna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint NULL DEFAULT NULL COMMENT '1=Super Admin, 2=Bendahara, 3=Kasir',
  `status` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `no_telepon` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `foto_profil` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_bengkel` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nik_pengguna`(`nik_pengguna` ASC) USING BTREE,
  UNIQUE INDEX `email_pengguna`(`email_pengguna` ASC) USING BTREE,
  INDEX `id_bengkel`(`id_bengkel` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_pengguna_email`(`email_pengguna` ASC) USING BTREE,
  INDEX `idx_pengguna_nik`(`nik_pengguna` ASC) USING BTREE,
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_bengkel`) REFERENCES `bengkel` (`id_bengkel`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pengguna_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pengguna_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (1, 'Ahmad Fauzi', '3201234567890001', 'ahmad.fauzi@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Super Admin', 1, 1, '081234567890', 'Jl. Sudirman No. 10', '1985-05-15', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (2, 'Siti Nurhaliza', '3201234567890002', 'siti.nurhaliza@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bendahara', 2, 1, '081234567891', 'Jl. Merdeka No. 20', '1987-08-22', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (3, 'Budi Setiawan', '3201234567890003', 'budi.setiawan@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567892', 'Jl. Pahlawan No. 30', '1990-12-10', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (4, 'Dewi Sartika', '3201234567890004', 'dewi.sartika@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567893', 'Jl. Kartini No. 40', '1992-03-08', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (5, 'Andi Wijaya', '3201234567890005', 'andi.wijaya@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567894', 'Jl. Diponegoro No. 50', '1988-11-25', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (6, 'Maya Sari', '3201234567890006', 'maya.sari@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567895', 'Jl. Gatot Subroto No. 60', '1991-07-14', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (7, 'Rudi Hartono', '3201234567890007', 'rudi.hartono@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bendahara', 3, 1, '081234567896', 'Jl. Ahmad Yani No. 70', '1989-04-18', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (8, 'Lina Marlina', '3201234567890008', 'lina.marlina@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 2, 1, '081234567897', 'Jl. Veteran No. 80', '1986-09-30', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (9, 'Agus Salim', '3201234567890009', 'agus.salim@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567898', 'Jl. Pemuda No. 90', '1993-01-12', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (10, 'Rina Susanti', '3201234567890010', 'rina.susanti@bengkelgumuruh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, 1, '081234567899', 'Jl. Proklamasi No. 100', '1994-06-05', NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);
INSERT INTO `pengguna` VALUES (11, 'Muhammad Ridwan Hakim', '3201234567890011', 'mridwanh@bengkelgumuruh.netlify.app', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Pemilik', 1, 1, '081394483625', 'Jl. Gumuruh No. 52, Bandung, Jawa Barat', NULL, NULL, NULL, '2025-06-16 14:45:14', NULL, '2025-06-16 14:45:14', NULL, 1);

-- ----------------------------
-- Table structure for stok_movement
-- ----------------------------
DROP TABLE IF EXISTS `stok_movement`;
CREATE TABLE `stok_movement`  (
  `id_movement` int NOT NULL AUTO_INCREMENT,
  `id_suku_cadang` int NULL DEFAULT NULL,
  `jenis_movement` enum('masuk','keluar','adjustment','retur') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty_before` int NOT NULL,
  `qty_change` int NOT NULL,
  `qty_after` int NOT NULL,
  `referensi_type` enum('pengadaan','penjualan','adjustment','retur') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `referensi_id` int NULL DEFAULT NULL COMMENT 'ID dari tabel referensi_type',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_movement`) USING BTREE,
  INDEX `id_suku_cadang`(`id_suku_cadang` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_stok_movement_tanggal`(`created_at` ASC) USING BTREE,
  CONSTRAINT `stok_movement_ibfk_1` FOREIGN KEY (`id_suku_cadang`) REFERENCES `suku_cadang` (`id_suku_cadang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stok_movement_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stok_movement_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stok_movement_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stok_movement
-- ----------------------------
INSERT INTO `stok_movement` VALUES (1, 1, 'masuk', 0, 100, 100, 'pengadaan', 1, 'Pengadaan filter oli', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 1);
INSERT INTO `stok_movement` VALUES (2, 1, 'keluar', 100, -1, 99, 'penjualan', 1, 'Penjualan filter oli', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 3);
INSERT INTO `stok_movement` VALUES (3, 2, 'masuk', 0, 12, 12, 'pengadaan', 2, 'Pengadaan kampas rem', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 2);
INSERT INTO `stok_movement` VALUES (4, 2, 'keluar', 12, -1, 11, 'penjualan', 2, 'Penjualan kampas rem', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 4);
INSERT INTO `stok_movement` VALUES (5, 3, 'masuk', 0, 10, 10, 'pengadaan', 3, 'Pengadaan aki', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 1);
INSERT INTO `stok_movement` VALUES (6, 3, 'keluar', 10, -1, 9, 'penjualan', 3, 'Penjualan aki', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 5);
INSERT INTO `stok_movement` VALUES (7, 4, 'masuk', 0, 18, 18, 'pengadaan', 4, 'Pengadaan shock absorber', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 2);
INSERT INTO `stok_movement` VALUES (8, 4, 'keluar', 18, -2, 16, 'penjualan', 4, 'Penjualan shock absorber', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 6);
INSERT INTO `stok_movement` VALUES (9, 5, 'masuk', 0, 80, 80, 'pengadaan', 5, 'Pengadaan lampu halogen', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 1);
INSERT INTO `stok_movement` VALUES (10, 5, 'keluar', 80, -2, 78, 'penjualan', 5, 'Penjualan lampu halogen', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 3);
INSERT INTO `stok_movement` VALUES (11, 6, 'masuk', 0, 8, 8, 'pengadaan', 6, 'Pengadaan ban radial', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 2);
INSERT INTO `stok_movement` VALUES (12, 6, 'keluar', 8, -4, 4, 'penjualan', 6, 'Penjualan ban radial', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 8);
INSERT INTO `stok_movement` VALUES (13, 7, 'masuk', 0, 6, 6, 'pengadaan', 7, 'Pengadaan radiator', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 1);
INSERT INTO `stok_movement` VALUES (14, 7, 'keluar', 6, -1, 5, 'penjualan', 7, 'Penjualan radiator', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 9);
INSERT INTO `stok_movement` VALUES (15, 8, 'masuk', 0, 20, 20, 'pengadaan', 8, 'Pengadaan timing belt', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 2);
INSERT INTO `stok_movement` VALUES (16, 8, 'keluar', 20, -1, 19, 'penjualan', 8, 'Penjualan timing belt', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 10);
INSERT INTO `stok_movement` VALUES (17, 9, 'masuk', 0, 10, 10, 'pengadaan', 9, 'Pengadaan kampas kopling', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 1);
INSERT INTO `stok_movement` VALUES (18, 9, 'keluar', 10, -1, 9, 'penjualan', 9, 'Penjualan kampas kopling', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 3);
INSERT INTO `stok_movement` VALUES (19, 10, 'masuk', 0, 12, 12, 'pengadaan', 10, 'Pengadaan fuel pump', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 2);
INSERT INTO `stok_movement` VALUES (20, 10, 'keluar', 12, -1, 11, 'penjualan', 10, 'Penjualan fuel pump', '2025-06-16 15:28:42', NULL, '2025-06-16 15:28:42', NULL, 4);

-- ----------------------------
-- Table structure for suku_cadang
-- ----------------------------
DROP TABLE IF EXISTS `suku_cadang`;
CREATE TABLE `suku_cadang`  (
  `id_suku_cadang` int NOT NULL AUTO_INCREMENT,
  `kode_suku_cadang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_suku_cadang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk_kendaraan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Toyota, Honda, Suzuki, dll',
  `model_kendaraan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Avanza, Jazz, Ertiga, dll',
  `tahun_kendaraan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '2015-2020',
  `kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Mesin, Transmisi, AC, Rem, dll',
  `sub_kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Filter oli, kampas rem, dll',
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'pcs, set, liter, dll',
  `harga_beli` decimal(12, 2) NOT NULL,
  `harga_jual` decimal(12, 2) NOT NULL,
  `margin_keuntungan` decimal(5, 2) NULL DEFAULT NULL COMMENT 'Dalam persen',
  `stok_minimum` int NULL DEFAULT 5,
  `stok_maksimum` int NULL DEFAULT 100,
  `stok_saat_ini` int NULL DEFAULT 0,
  `lokasi_penyimpanan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `berat` decimal(8, 2) NULL DEFAULT NULL COMMENT 'Dalam gram',
  `dimensi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'PxLxT dalam cm',
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `foto_suku_cadang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `garansi_bulan` int NULL DEFAULT NULL,
  `status_produk` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_vendor` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_suku_cadang`) USING BTREE,
  UNIQUE INDEX `kode_suku_cadang`(`kode_suku_cadang` ASC) USING BTREE,
  INDEX `id_vendor`(`id_vendor` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_suku_cadang_kode`(`kode_suku_cadang` ASC) USING BTREE,
  INDEX `idx_suku_cadang_nama`(`nama_suku_cadang` ASC) USING BTREE,
  CONSTRAINT `suku_cadang_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `suku_cadang_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `suku_cadang_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suku_cadang
-- ----------------------------
INSERT INTO `suku_cadang` VALUES (1, 'SC001', 'Filter Oli Mesin', 'Toyota', 'Avanza', '2015-2020', 'Mesin', 'Filter', 'pcs', 25000.00, 35000.00, 40.00, 10, 100, 99, 'Rak A1', 200.00, '10x8x5 cm', 'Filter oli untuk mesin Toyota Avanza', NULL, 6, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 1);
INSERT INTO `suku_cadang` VALUES (2, 'SC002', 'Kampas Rem Depan', 'Honda', 'Jazz', '2014-2019', 'Rem', 'Kampas Rem', 'set', 150000.00, 210000.00, 33.33, 5, 50, 11, 'Rak B1', 800.00, '25x15x2 cm', 'Kampas rem depan Honda Jazz', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 2);
INSERT INTO `suku_cadang` VALUES (3, 'SC003', 'Aki Mobil 12V 45Ah', 'Universal', 'All Model', '2010-2023', 'Kelistrikan', 'Aki', 'pcs', 450000.00, 600000.00, 33.33, 3, 20, 9, 'Rak C1', 15000.00, '24x17x19 cm', 'Aki kering maintenance free', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 3);
INSERT INTO `suku_cadang` VALUES (4, 'SC004', 'Shock Absorber Depan', 'Suzuki', 'Ertiga', '2012-2018', 'Suspensi', 'Shock Absorber', 'pcs', 300000.00, 420000.00, 40.00, 4, 30, 16, 'Rak D1', 2500.00, '50x10x10 cm', 'Shock absorber depan Suzuki Ertiga', NULL, 24, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 4);
INSERT INTO `suku_cadang` VALUES (5, 'SC005', 'Lampu Halogen H4', 'Universal', 'All Model', '2000-2023', 'Kelistrikan', 'Lampu', 'pcs', 35000.00, 50000.00, 42.86, 15, 80, 78, 'Rak E1', 100.00, '12x8x8 cm', 'Lampu halogen H4 12V 60/55W', NULL, 6, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 5);
INSERT INTO `suku_cadang` VALUES (6, 'SC006', 'Ban Radial 185/65R15', 'Bridgestone', 'All Model', '2010-2023', 'Roda', 'Ban', 'pcs', 650000.00, 850000.00, 30.77, 2, 20, 4, 'Rak F1', 8000.00, '65x18x18 cm', 'Ban radial tubeless', NULL, 60, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 6);
INSERT INTO `suku_cadang` VALUES (7, 'SC007', 'Radiator Assy', 'Toyota', 'Kijang Innova', '2016-2021', 'Pendingin', 'Radiator', 'pcs', 800000.00, 1100000.00, 37.50, 2, 15, 5, 'Rak G1', 5000.00, '60x40x5 cm', 'Radiator lengkap dengan kipas', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 7);
INSERT INTO `suku_cadang` VALUES (8, 'SC008', 'Timing Belt', 'Honda', 'Civic', '2016-2020', 'Mesin', 'Belt', 'pcs', 180000.00, 250000.00, 38.89, 8, 40, 19, 'Rak H1', 300.00, '120x3x1 cm', 'Timing belt Honda Civic', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 8);
INSERT INTO `suku_cadang` VALUES (9, 'SC009', 'Kampas Kopling Set', 'Mitsubishi', 'Pajero Sport', '2015-2020', 'Transmisi', 'Kopling', 'set', 550000.00, 750000.00, 36.36, 3, 20, 9, 'Rak I1', 3000.00, '25x25x5 cm', 'Set kampas kopling lengkap', NULL, 18, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 9);
INSERT INTO `suku_cadang` VALUES (10, 'SC010', 'Fuel Pump Electric', 'Nissan', 'Grand Livina', '2013-2019', 'Bahan Bakar', 'Fuel Pump', 'pcs', 400000.00, 550000.00, 37.50, 4, 25, 11, 'Rak J1', 1200.00, '20x15x10 cm', 'Pompa bensin elektrik', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 10);
INSERT INTO `suku_cadang` VALUES (11, 'SC011', 'Wiper Blade 24 inch', 'Universal', 'All Model', '2010-2023', 'Aksesoris', 'Wiper', 'pcs', 45000.00, 65000.00, 44.44, 12, 60, NULL, 'Rak K1', 200.00, '60x5x2 cm', 'Wiper karet silicon', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 11);
INSERT INTO `suku_cadang` VALUES (12, 'SC012', 'Headlamp LED', 'Toyota', 'Fortuner', '2016-2021', 'Kelistrikan', 'Lampu', 'pcs', 1200000.00, 1600000.00, 33.33, 2, 10, NULL, 'Rak L1', 2000.00, '30x20x15 cm', 'Headlamp LED original', NULL, 24, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 12);
INSERT INTO `suku_cadang` VALUES (13, 'SC013', 'Gasket Head', 'Honda', 'CR-V', '2017-2022', 'Mesin', 'Gasket', 'set', 350000.00, 480000.00, 37.14, 5, 25, NULL, 'Rak M1', 500.00, '30x25x2 cm', 'Gasket kepala silinder', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 13);
INSERT INTO `suku_cadang` VALUES (14, 'SC014', 'Alternator 12V 80A', 'Suzuki', 'Swift', '2014-2019', 'Kelistrikan', 'Alternator', 'pcs', 850000.00, 1150000.00, 35.29, 2, 15, NULL, 'Rak N1', 4000.00, '25x20x15 cm', 'Alternator 12V 80 Ampere', NULL, 18, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 14);
INSERT INTO `suku_cadang` VALUES (15, 'SC015', 'Power Steering Pump', 'Toyota', 'Camry', '2015-2020', 'Kemudi', 'Power Steering', 'pcs', 950000.00, 1300000.00, 36.84, 2, 12, NULL, 'Rak O1', 3500.00, '20x15x15 cm', 'Pompa power steering', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 15);
INSERT INTO `suku_cadang` VALUES (16, 'SC016', 'Muffler Assy', 'Honda', 'Brio', '2012-2018', 'Exhaust', 'Muffler', 'pcs', 280000.00, 380000.00, 35.71, 3, 20, NULL, 'Rak P1', 6000.00, '50x20x15 cm', 'Knalpot lengkap dengan pipa', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 16);
INSERT INTO `suku_cadang` VALUES (17, 'SC017', 'Air Filter Engine', 'Mitsubishi', 'Xpander', '2017-2022', 'Mesin', 'Filter', 'pcs', 65000.00, 90000.00, 38.46, 10, 50, NULL, 'Rak Q1', 300.00, '25x20x5 cm', 'Filter udara mesin', NULL, 6, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 17);
INSERT INTO `suku_cadang` VALUES (18, 'SC018', 'Brake Disc Rotor', 'Nissan', 'X-Trail', '2014-2019', 'Rem', 'Disc Brake', 'pcs', 320000.00, 472500.00, 40.63, 4, 25, NULL, 'Rak R1', 4500.00, '30x30x3 cm', 'Piringan rem cakram', NULL, 24, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 18);
INSERT INTO `suku_cadang` VALUES (19, 'SC019', 'Clutch Master Cylinder', 'Toyota', 'Hilux', '2016-2021', 'Transmisi', 'Master Cylinder', 'pcs', 420000.00, 580000.00, 38.10, 3, 18, NULL, 'Rak S1', 800.00, '15x10x8 cm', 'Master silinder kopling', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 19);
INSERT INTO `suku_cadang` VALUES (20, 'SC020', 'Suspension Spring', 'Honda', 'HR-V', '2015-2020', 'Suspensi', 'Per', 'pcs', 380000.00, 520000.00, 36.84, 4, 24, NULL, 'Rak T1', 2800.00, '35x15x15 cm', 'Per suspensi belakang', NULL, 18, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 20);
INSERT INTO `suku_cadang` VALUES (21, 'SC021', 'CV Joint Outer', 'Suzuki', 'Baleno', '2016-2021', 'Transmisi', 'CV Joint', 'pcs', 290000.00, 400000.00, 37.93, 5, 30, NULL, 'Rak U1', 1500.00, '20x15x10 cm', 'CV joint luar roda depan', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 21);
INSERT INTO `suku_cadang` VALUES (22, 'SC022', 'Tie Rod End', 'Toyota', 'Vios', '2013-2018', 'Kemudi', 'Tie Rod', 'pcs', 120000.00, 170000.00, 41.67, 8, 40, NULL, 'Rak V1', 600.00, '25x8x8 cm', 'Ujung tie rod kemudi', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 22);
INSERT INTO `suku_cadang` VALUES (23, 'SC023', 'Engine Mount', 'Honda', 'City', '2014-2019', 'Mesin', 'Engine Mount', 'pcs', 180000.00, 250000.00, 38.89, 6, 35, NULL, 'Rak W1', 1200.00, '15x12x10 cm', 'Dudukan mesin karet', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 23);
INSERT INTO `suku_cadang` VALUES (24, 'SC024', 'Radiator Hose Upper', 'Mitsubishi', 'Outlander', '2015-2020', 'Pendingin', 'Selang', 'pcs', 85000.00, 120000.00, 41.18, 10, 45, NULL, 'Rak X1', 400.00, '60x5x5 cm', 'Selang radiator atas', NULL, 6, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 24);
INSERT INTO `suku_cadang` VALUES (25, 'SC025', 'Water Pump', 'Nissan', 'Serena', '2013-2018', 'Pendingin', 'Water Pump', 'pcs', 320000.00, 450000.00, 40.63, 4, 25, NULL, 'Rak Y1', 2200.00, '20x15x12 cm', 'Pompa air pendingin', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 25);
INSERT INTO `suku_cadang` VALUES (26, 'SC026', 'Spark Plug Iridium', 'Universal', 'All Model', '2010-2023', 'Kelistrikan', 'Busi', 'pcs', 85000.00, 120000.00, 41.18, 15, 80, NULL, 'Rak Z1', 100.00, '10x3x3 cm', 'Busi iridium tahan lama', NULL, 24, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 26);
INSERT INTO `suku_cadang` VALUES (27, 'SC027', 'Oxygen Sensor', 'Toyota', 'Alphard', '2016-2021', 'Bahan Bakar', 'Sensor', 'pcs', 650000.00, 900000.00, 38.46, 3, 18, NULL, 'Rak AA1', 300.00, '15x8x5 cm', 'Sensor oksigen lambda', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 27);
INSERT INTO `suku_cadang` VALUES (28, 'SC028', 'Throttle Body', 'Honda', 'Accord', '2015-2020', 'Bahan Bakar', 'Throttle Body', 'pcs', 1100000.00, 1500000.00, 36.36, 2, 12, NULL, 'Rak BB1', 1800.00, '20x15x10 cm', 'Throttle body elektronik', NULL, 18, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 28);
INSERT INTO `suku_cadang` VALUES (29, 'SC029', 'EGR Valve', 'Mitsubishi', 'Triton', '2016-2021', 'Exhaust', 'EGR Valve', 'pcs', 480000.00, 670000.00, 39.58, 3, 20, NULL, 'Rak CC1', 800.00, '15x12x8 cm', 'Katup EGR exhaust gas', NULL, 12, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 29);
INSERT INTO `suku_cadang` VALUES (30, 'SC030', 'Turbocharger', 'Nissan', 'Navara', '2017-2022', 'Mesin', 'Turbocharger', 'pcs', 3500000.00, 4800000.00, 37.14, 1, 8, NULL, 'Rak DD1', 12000.00, '40x30x25 cm', 'Turbocharger lengkap', NULL, 24, 1, '2025-06-16 14:51:12', NULL, '2025-06-16 16:37:32', NULL, 30);

-- ----------------------------
-- Table structure for transaksi_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_pengadaan`;
CREATE TABLE `transaksi_pengadaan`  (
  `id_transaksi_pengadaan` int NOT NULL AUTO_INCREMENT,
  `no_po` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_po` date NOT NULL,
  `tanggal_kedatangan` date NULL DEFAULT NULL,
  `no_invoice_vendor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_item` int NULL DEFAULT 0,
  `subtotal` decimal(15, 2) NULL DEFAULT 0.00,
  `pajak` decimal(15, 2) NULL DEFAULT 0.00,
  `total_bayar` decimal(15, 2) NULL DEFAULT 0.00,
  `status_pengadaan` enum('draft','ordered','delivered','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'draft',
  `status_pembayaran` enum('unpaid','partial','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'unpaid',
  `tanggal_pembayaran` date NULL DEFAULT NULL,
  `metode_pembayaran` enum('cash','transfer','giro') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_referensi_bayar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `nama_salesman` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_telepon_salesman` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_polisi_truck` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `foto_bukti_terima` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_vendor` int NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL COMMENT 'Yang membuat PO',
  PRIMARY KEY (`id_transaksi_pengadaan`) USING BTREE,
  UNIQUE INDEX `no_po`(`no_po` ASC) USING BTREE,
  INDEX `id_vendor`(`id_vendor` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_transaksi_pengadaan_tanggal`(`tanggal_po` ASC) USING BTREE,
  CONSTRAINT `transaksi_pengadaan_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_pengadaan_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_pengadaan_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_pengadaan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_pengadaan
-- ----------------------------
INSERT INTO `transaksi_pengadaan` VALUES (1, 'PO/2024/001', '2024-01-15', '2024-01-18', 'INV-001/2024', 5, 2500000.00, 275000.00, 2775000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Pengadaan rutin bulan Januari', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 1, 1);
INSERT INTO `transaksi_pengadaan` VALUES (2, 'PO/2024/002', '2024-01-20', '2024-01-23', 'INV-002/2024', 3, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Stok kampas rem menipis', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 2, 2);
INSERT INTO `transaksi_pengadaan` VALUES (3, 'PO/2024/003', '2024-01-25', '2024-01-28', 'INV-003/2024', 2, 1200000.00, 132000.00, 1332000.00, 'completed', 'paid', NULL, 'cash', NULL, 'Aki untuk stok emergency', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 3, 1);
INSERT INTO `transaksi_pengadaan` VALUES (4, 'PO/2024/004', '2024-02-01', '2024-02-05', 'INV-004/2024', 4, 3200000.00, 352000.00, 3552000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Shock absorber untuk berbagai merk', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 4, 2);
INSERT INTO `transaksi_pengadaan` VALUES (5, 'PO/2024/005', '2024-02-10', '2024-02-13', 'INV-005/2024', 8, 800000.00, 88000.00, 888000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Lampu halogen stok habis', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 5, 1);
INSERT INTO `transaksi_pengadaan` VALUES (6, 'PO/2024/006', '2024-02-15', '2024-02-18', 'INV-006/2024', 3, 2400000.00, 264000.00, 2664000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Ban untuk customer premium', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 6, 2);
INSERT INTO `transaksi_pengadaan` VALUES (7, 'PO/2024/007', '2024-02-20', '2024-02-23', 'INV-007/2024', 2, 2200000.00, 242000.00, 2442000.00, 'completed', 'paid', NULL, 'giro', NULL, 'Radiator untuk Toyota Innova', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 7, 1);
INSERT INTO `transaksi_pengadaan` VALUES (8, 'PO/2024/008', '2024-03-01', '2024-03-05', 'INV-008/2024', 6, 1500000.00, 165000.00, 1665000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Timing belt berbagai merk', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 8, 2);
INSERT INTO `transaksi_pengadaan` VALUES (9, 'PO/2024/009', '2024-03-10', '2024-03-13', 'INV-009/2024', 4, 3000000.00, 330000.00, 3330000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Kampas kopling untuk truck', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 9, 1);
INSERT INTO `transaksi_pengadaan` VALUES (10, 'PO/2024/010', '2024-03-15', '2024-03-18', 'INV-010/2024', 5, 2750000.00, 302500.00, 3052500.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Fuel pump electric', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 10, 2);
INSERT INTO `transaksi_pengadaan` VALUES (11, 'PO/2024/011', '2024-03-20', '2024-03-23', 'INV-011/2024', 10, 650000.00, 71500.00, 721500.00, 'completed', 'paid', NULL, 'cash', NULL, 'Wiper blade untuk musim hujan', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 11, 1);
INSERT INTO `transaksi_pengadaan` VALUES (12, 'PO/2024/012', '2024-04-01', '2024-04-05', 'INV-012/2024', 3, 4800000.00, 528000.00, 5328000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Headlamp LED premium', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 12, 2);
INSERT INTO `transaksi_pengadaan` VALUES (13, 'PO/2024/013', '2024-04-10', '2024-04-13', 'INV-013/2024', 4, 1920000.00, 211200.00, 2131200.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Gasket head untuk overhaul', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 13, 1);
INSERT INTO `transaksi_pengadaan` VALUES (14, 'PO/2024/014', '2024-04-15', '2024-04-18', 'INV-014/2024', 3, 3450000.00, 379500.00, 3829500.00, 'completed', 'paid', NULL, 'giro', NULL, 'Alternator untuk bengkel', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 14, 2);
INSERT INTO `transaksi_pengadaan` VALUES (15, 'PO/2024/015', '2024-04-20', '2024-04-23', 'INV-015/2024', 2, 2600000.00, 286000.00, 2886000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Power steering pump', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 15, 1);
INSERT INTO `transaksi_pengadaan` VALUES (16, 'PO/2024/016', '2024-05-01', '2024-05-05', 'INV-016/2024', 4, 1520000.00, 167200.00, 1687200.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Muffler untuk berbagai mobil', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 16, 2);
INSERT INTO `transaksi_pengadaan` VALUES (17, 'PO/2024/017', '2024-05-10', '2024-05-13', 'INV-017/2024', 8, 720000.00, 79200.00, 799200.00, 'completed', 'paid', NULL, 'cash', NULL, 'Air filter engine', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 17, 1);
INSERT INTO `transaksi_pengadaan` VALUES (18, 'PO/2024/018', '2024-05-15', '2024-05-18', 'INV-018/2024', 4, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Brake disc rotor', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 18, 2);
INSERT INTO `transaksi_pengadaan` VALUES (19, 'PO/2024/019', '2024-05-20', '2024-05-23', 'INV-019/2024', 3, 1740000.00, 191400.00, 1931400.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Clutch master cylinder', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 19, 1);
INSERT INTO `transaksi_pengadaan` VALUES (20, 'PO/2024/020', '2024-06-01', '2024-06-05', 'INV-020/2024', 4, 2080000.00, 228800.00, 2308800.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Suspension spring', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 20, 2);
INSERT INTO `transaksi_pengadaan` VALUES (21, 'PO/2024/021', '2024-06-10', '2024-06-13', 'INV-021/2024', 6, 2400000.00, 264000.00, 2664000.00, 'completed', 'paid', NULL, 'giro', NULL, 'CV joint outer', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 21, 1);
INSERT INTO `transaksi_pengadaan` VALUES (22, 'PO/2024/022', '2024-06-15', '2024-06-18', 'INV-022/2024', 8, 1360000.00, 149600.00, 1509600.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Tie rod end', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 22, 2);
INSERT INTO `transaksi_pengadaan` VALUES (23, 'PO/2024/023', '2024-06-20', '2024-06-23', 'INV-023/2024', 6, 1500000.00, 165000.00, 1665000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Engine mount', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 23, 1);
INSERT INTO `transaksi_pengadaan` VALUES (24, 'PO/2024/024', '2024-07-01', '2024-07-05', 'INV-024/2024', 10, 1200000.00, 132000.00, 1332000.00, 'completed', 'paid', NULL, 'cash', NULL, 'Radiator hose', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 24, 2);
INSERT INTO `transaksi_pengadaan` VALUES (25, 'PO/2024/025', '2024-07-10', '2024-07-13', 'INV-025/2024', 4, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Water pump', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 25, 1);
INSERT INTO `transaksi_pengadaan` VALUES (26, 'PO/2024/026', '2024-07-15', '2024-07-18', 'INV-026/2024', 15, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Spark plug iridium', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 26, 7);
INSERT INTO `transaksi_pengadaan` VALUES (27, 'PO/2024/027', '2024-07-20', '2024-07-23', 'INV-027/2024', 3, 2700000.00, 297000.00, 2997000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Oxygen sensor', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 27, 7);
INSERT INTO `transaksi_pengadaan` VALUES (28, 'PO/2024/028', '2024-08-01', '2024-08-05', 'INV-028/2024', 2, 3000000.00, 330000.00, 3330000.00, 'completed', 'paid', NULL, 'giro', NULL, 'Throttle body', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 28, 7);
INSERT INTO `transaksi_pengadaan` VALUES (29, 'PO/2024/029', '2024-08-10', '2024-08-13', 'INV-029/2024', 3, 2010000.00, 221100.00, 2231100.00, 'completed', 'paid', NULL, 'transfer', NULL, 'EGR valve', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 29, 7);
INSERT INTO `transaksi_pengadaan` VALUES (30, 'PO/2024/030', '2024-08-15', '2024-08-18', 'INV-030/2024', 1, 4800000.00, 528000.00, 5328000.00, 'completed', 'paid', NULL, 'transfer', NULL, 'Turbocharger', NULL, NULL, NULL, NULL, NULL, '2025-06-16 15:02:40', NULL, '2025-06-16 15:02:40', NULL, 30, 7);

-- ----------------------------
-- Table structure for transaksi_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_penjualan`;
CREATE TABLE `transaksi_penjualan`  (
  `id_transaksi_penjualan` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jam_masuk` time NULL DEFAULT NULL,
  `jam_selesai` time NULL DEFAULT NULL,
  `jenis_service` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Service Rutin, Ganti Oli, Perbaikan',
  `keluhan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `diagnosis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pekerjaan_dilakukan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `km_kendaraan` int NULL DEFAULT NULL,
  `total_item_suku_cadang` int NULL DEFAULT 0,
  `subtotal_suku_cadang` decimal(12, 2) NULL DEFAULT 0.00,
  `biaya_jasa` decimal(12, 2) NULL DEFAULT 0.00,
  `diskon` decimal(12, 2) NULL DEFAULT 0.00,
  `pajak` decimal(12, 2) NULL DEFAULT 0.00,
  `total_bayar` decimal(12, 2) NULL DEFAULT 0.00,
  `status_service` enum('antri','dikerjakan','selesai','diambil') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'antri',
  `status_pembayaran` enum('unpaid','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'unpaid',
  `metode_pembayaran` enum('cash','transfer','debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tanggal_pembayaran` datetime NULL DEFAULT NULL,
  `uang_muka` decimal(12, 2) NULL DEFAULT 0.00,
  `sisa_bayar` decimal(12, 2) NULL DEFAULT 0.00,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `foto_kendaraan_masuk` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `foto_kendaraan_keluar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rating_service` tinyint NULL DEFAULT NULL COMMENT '1-5',
  `feedback_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `id_customer` int NULL DEFAULT NULL,
  `id_mekanik` int NULL DEFAULT NULL,
  `id_kasir` int NULL DEFAULT NULL COMMENT 'Yang melayani pembayaran',
  PRIMARY KEY (`id_transaksi_penjualan`) USING BTREE,
  UNIQUE INDEX `no_invoice`(`no_invoice` ASC) USING BTREE,
  INDEX `id_customer`(`id_customer` ASC) USING BTREE,
  INDEX `id_mekanik`(`id_mekanik` ASC) USING BTREE,
  INDEX `id_kasir`(`id_kasir` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_transaksi_penjualan_tanggal`(`tanggal_transaksi` ASC) USING BTREE,
  CONSTRAINT `transaksi_penjualan_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_penjualan_ibfk_2` FOREIGN KEY (`id_mekanik`) REFERENCES `mekanik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_penjualan_ibfk_3` FOREIGN KEY (`id_kasir`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_penjualan_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_penjualan_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_penjualan
-- ----------------------------
INSERT INTO `transaksi_penjualan` VALUES (1, 'INV/2024/001', '2024-01-15', '08:00:00', '10:30:00', 'Ganti Oli', 'Oli sudah hitam', 'Oli perlu diganti', 'Ganti oli mesin dan filter oli', 45000, 2, 60000.00, 50000.00, 0.00, 11000.00, 121000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Service rutin', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 1, 1, 3);
INSERT INTO `transaksi_penjualan` VALUES (2, 'INV/2024/002', '2024-01-18', '09:00:00', '12:00:00', 'Ganti Kampas Rem', 'Rem blong', 'Kampas rem habis', 'Ganti kampas rem depan', 32000, 1, 200000.00, 100000.00, 0.00, 30000.00, 330000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Kampas rem habis total', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 2, 2, 4);
INSERT INTO `transaksi_penjualan` VALUES (3, 'INV/2024/003', '2024-01-20', '10:00:00', '11:00:00', 'Ganti Aki', 'Mobil susah starter', 'Aki soak', 'Ganti aki baru', 28000, 1, 600000.00, 25000.00, 0.00, 62500.00, 687500.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Aki sudah lemah', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 3, 3, 5);
INSERT INTO `transaksi_penjualan` VALUES (4, 'INV/2024/004', '2024-01-22', '08:30:00', '14:00:00', 'Ganti Shock', 'Mobil goyang', 'Shock absorber rusak', 'Ganti shock absorber depan', 55000, 2, 840000.00, 150000.00, 0.00, 99000.00, 1089000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Shock sudah bocor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 4, 4, 6);
INSERT INTO `transaksi_penjualan` VALUES (5, 'INV/2024/005', '2024-01-25', '09:30:00', '10:30:00', 'Ganti Lampu', 'Lampu mati', 'Lampu putus', 'Ganti lampu halogen H4', 15000, 2, 100000.00, 30000.00, 0.00, 13000.00, 143000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Lampu depan mati', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 5, 5, 8);
INSERT INTO `transaksi_penjualan` VALUES (6, 'INV/2024/006', '2024-01-28', '07:00:00', '17:00:00', 'Ganti Ban', 'Ban gundul', 'Ban sudah tipis', 'Ganti 4 ban radial', 62000, 4, 3400000.00, 200000.00, 100000.00, 350000.00, 3850000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Ban sudah tidak layak pakai', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 6, 6, 8);
INSERT INTO `transaksi_penjualan` VALUES (7, 'INV/2024/007', '2024-02-01', '08:00:00', '16:00:00', 'Overhaul Radiator', 'Mesin overheat', 'Radiator bocor', 'Ganti radiator dan thermostat', 58000, 1, 1100000.00, 300000.00, 0.00, 140000.00, 1540000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Radiator bocor parah', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 7, 7, 9);
INSERT INTO `transaksi_penjualan` VALUES (8, 'INV/2024/008', '2024-02-05', '09:00:00', '11:00:00', 'Ganti Timing Belt', 'Suara kasar dari mesin', 'Timing belt kendor', 'Ganti timing belt', 35000, 1, 250000.00, 150000.00, 0.00, 40000.00, 440000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Timing belt sudah kendor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 8, 8, 10);
INSERT INTO `transaksi_penjualan` VALUES (9, 'INV/2024/009', '2024-02-08', '08:30:00', '15:30:00', 'Service Kopling', 'Kopling selip', 'Kampas kopling habis', 'Ganti set kampas kopling', 45000, 1, 750000.00, 250000.00, 0.00, 100000.00, 1100000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Kopling sudah selip', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 9, 9, 3);
INSERT INTO `transaksi_penjualan` VALUES (10, 'INV/2024/010', '2024-02-10', '10:00:00', '12:00:00', 'Ganti Fuel Pump', 'Mobil brebet', 'Fuel pump lemah', 'Ganti fuel pump electric', 25000, 1, 550000.00, 100000.00, 0.00, 65000.00, 715000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Fuel pump sudah lemah', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 10, 10, 4);
INSERT INTO `transaksi_penjualan` VALUES (11, 'INV/2024/011', '2024-02-12', '09:00:00', '10:00:00', 'Ganti Wiper', 'Wiper tidak bersih', 'Karet wiper keras', 'Ganti wiper blade', 22000, 2, 130000.00, 25000.00, 0.00, 15500.00, 170500.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Wiper sudah keras', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 11, 11, 3);
INSERT INTO `transaksi_penjualan` VALUES (12, 'INV/2024/012', '2024-02-15', '08:00:00', '17:00:00', 'Upgrade Headlamp', 'Lampu kurang terang', 'Ingin upgrade LED', 'Pasang headlamp LED', 35000, 2, 3200000.00, 200000.00, 0.00, 340000.00, 3740000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Upgrade ke LED', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 12, 12, 4);
INSERT INTO `transaksi_penjualan` VALUES (13, 'INV/2024/013', '2024-02-18', '09:30:00', '14:30:00', 'Overhaul Mesin', 'Mesin ngebul', 'Gasket head bocor', 'Ganti gasket head set', 52000, 1, 480000.00, 400000.00, 0.00, 88000.00, 968000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Overhaul ringan', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 13, 13, 5);
INSERT INTO `transaksi_penjualan` VALUES (14, 'INV/2024/014', '2024-02-20', '08:30:00', '16:00:00', 'Service Alternator', 'Aki tekor terus', 'Alternator rusak', 'Ganti alternator', 42000, 1, 1150000.00, 150000.00, 0.00, 130000.00, 1430000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Alternator tidak charge', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 14, 14, 6);
INSERT INTO `transaksi_penjualan` VALUES (15, 'INV/2024/015', '2024-02-22', '10:00:00', '15:00:00', 'Service Power Steering', 'Setir berat', 'Pompa power steering rusak', 'Ganti power steering pump', 18000, 1, 1300000.00, 200000.00, 0.00, 150000.00, 1650000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Power steering bocor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 15, 15, 6);
INSERT INTO `transaksi_penjualan` VALUES (16, 'INV/2024/016', '2024-02-25', '09:00:00', '12:00:00', 'Ganti Knalpot', 'Knalpot bocor', 'Muffler berlubang', 'Ganti muffler assy', 48000, 1, 380000.00, 100000.00, 0.00, 48000.00, 528000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Knalpot bocor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 16, 16, 8);
INSERT INTO `transaksi_penjualan` VALUES (17, 'INV/2024/017', '2024-02-28', '08:00:00', '09:00:00', 'Ganti Filter Udara', 'Mesin kurang bertenaga', 'Filter udara kotor', 'Ganti air filter engine', 38000, 1, 90000.00, 25000.00, 0.00, 11500.00, 126500.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Filter udara sangat kotor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 17, 17, 9);
INSERT INTO `transaksi_penjualan` VALUES (18, 'INV/2024/018', '2024-03-01', '09:30:00', '13:30:00', 'Service Rem', 'Rem kurang pakem', 'Disc brake aus', 'Ganti brake disc rotor', 22000, 2, 900000.00, 150000.00, 0.00, 105000.00, 1155000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Disc brake sudah tipis', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 18, 18, 10);
INSERT INTO `transaksi_penjualan` VALUES (19, 'INV/2024/019', '2024-03-05', '08:30:00', '12:30:00', 'Service Kopling', 'Kopling berat', 'Master cylinder bocor', 'Ganti clutch master cylinder', 15000, 1, 580000.00, 100000.00, 0.00, 68000.00, 748000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Master kopling bocor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 19, 19, 2);
INSERT INTO `transaksi_penjualan` VALUES (20, 'INV/2024/020', '2024-03-08', '10:00:00', '15:00:00', 'Ganti Per', 'Mobil ceper sebelah', 'Per patah', 'Ganti suspension spring', 12000, 2, 1040000.00, 150000.00, 0.00, 119000.00, 1309000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Per belakang patah', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 20, 11, 2);
INSERT INTO `transaksi_penjualan` VALUES (21, 'INV/2024/021', '2024-03-10', '09:00:00', '13:00:00', 'Service CV Joint', 'Bunyi tek-tek saat belok', 'CV joint aus', 'Ganti CV joint outer', 33000, 1, 400000.00, 120000.00, 0.00, 52000.00, 572000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'CV joint sudah aus', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 21, 12, 3);
INSERT INTO `transaksi_penjualan` VALUES (22, 'INV/2024/022', '2024-03-12', '08:30:00', '11:30:00', 'Service Kemudi', 'Setir goyang', 'Tie rod end longgar', 'Ganti tie rod end', 42000, 2, 340000.00, 80000.00, 0.00, 42000.00, 462000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Tie rod sudah longgar', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 22, 13, 4);
INSERT INTO `transaksi_penjualan` VALUES (23, 'INV/2024/023', '2024-03-15', '10:00:00', '12:00:00', 'Ganti Engine Mount', 'Mesin getar', 'Engine mount rusak', 'Ganti engine mount', 18000, 2, 500000.00, 100000.00, 0.00, 60000.00, 660000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Engine mount pecah', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 23, 14, 5);
INSERT INTO `transaksi_penjualan` VALUES (24, 'INV/2024/024', '2024-03-18', '09:30:00', '11:00:00', 'Ganti Selang Radiator', 'Radiator bocor', 'Selang radiator retak', 'Ganti radiator hose upper', 58000, 1, 120000.00, 50000.00, 0.00, 17000.00, 187000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Selang radiator retak', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 24, 15, 6);
INSERT INTO `transaksi_penjualan` VALUES (25, 'INV/2024/025', '2024-03-20', '08:00:00', '12:00:00', 'Service Water Pump', 'Mesin overheat', 'Water pump bocor', 'Ganti water pump', 22000, 1, 450000.00, 150000.00, 0.00, 60000.00, 660000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Water pump bocor', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 25, 16, 8);
INSERT INTO `transaksi_penjualan` VALUES (26, 'INV/2024/026', '2024-03-22', '09:00:00', '10:00:00', 'Ganti Busi', 'Mesin brebet', 'Busi sudah aus', 'Ganti spark plug iridium', 38000, 4, 480000.00, 50000.00, 0.00, 53000.00, 583000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'Busi sudah hitam', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 26, 17, 8);
INSERT INTO `transaksi_penjualan` VALUES (27, 'INV/2024/027', '2024-03-25', '08:30:00', '14:30:00', 'Service Sensor', 'Check engine menyala', 'Oxygen sensor rusak', 'Ganti oxygen sensor', 35000, 1, 900000.00, 100000.00, 0.00, 100000.00, 1100000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Sensor oksigen rusak', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 27, 18, 9);
INSERT INTO `transaksi_penjualan` VALUES (28, 'INV/2024/028', '2024-03-28', '09:00:00', '16:00:00', 'Service Throttle Body', 'RPM tidak stabil', 'Throttle body kotor', 'Ganti throttle body', 25000, 1, 1500000.00, 200000.00, 0.00, 170000.00, 1870000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Throttle body rusak', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 28, 19, 10);
INSERT INTO `transaksi_penjualan` VALUES (29, 'INV/2024/029', '2024-04-01', '10:00:00', '15:00:00', 'Service EGR', 'Asap hitam', 'EGR valve macet', 'Ganti EGR valve', 42000, 1, 670000.00, 150000.00, 0.00, 82000.00, 902000.00, 'diambil', 'paid', 'cash', NULL, 0.00, 0.00, 'EGR valve macet', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 29, 20, 3);
INSERT INTO `transaksi_penjualan` VALUES (30, 'INV/2024/030', '2024-04-05', '07:00:00', '18:00:00', 'Overhaul Turbo', 'Tenaga kurang', 'Turbocharger rusak', 'Ganti turbocharger', 15000, 1, 4800000.00, 500000.00, 200000.00, 510000.00, 5610000.00, 'diambil', 'paid', 'transfer', NULL, 0.00, 0.00, 'Turbo sudah rusak total', NULL, NULL, NULL, NULL, '2025-06-16 15:25:30', NULL, '2025-06-16 15:25:30', NULL, 30, 21, 4);

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor`  (
  `id_vendor` int NOT NULL AUTO_INCREMENT,
  `nama_vendor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_perusahaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alamat_vendor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon_vendor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_vendor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `npwp_vendor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_telepon_contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jenis_suku_cadang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'Spesialisasi vendor',
  `rating_vendor` decimal(2, 1) NULL DEFAULT 0.0 COMMENT 'Rating 0.0 - 5.0',
  `status_kerjasama` tinyint NULL DEFAULT 1 COMMENT '1=aktif, 0=nonaktif',
  `term_pembayaran` int NULL DEFAULT NULL COMMENT 'Dalam hari',
  `bank_nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_rekening` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_atas_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_vendor`) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  INDEX `updated_by`(`updated_by` ASC) USING BTREE,
  INDEX `idx_vendor_nama`(`nama_vendor` ASC) USING BTREE,
  CONSTRAINT `vendor_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vendor_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES (1, 'PT Suku Cadang Utama', 'PT Suku Cadang Utama', 'Jl. Industri No. 1, Jakarta', '021-1234567', 'info@sukucadangutama.com', '01.234.567.8-901.000', 'Andi Wijaya', '081234567001', 'Filter, Oli, Kampas Rem', 4.5, 1, 30, 'BCA', '1234567890', 'PT Suku Cadang Utama', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (2, 'CV Maju Jaya Motor', 'CV Maju Jaya Motor', 'Jl. Otomotif No. 2, Bandung', '022-2345678', 'sales@majujayamotor.com', '02.345.678.9-012.000', 'Budi Santoso', '081234567002', 'Spare Part Mesin', 4.2, 1, 45, 'Mandiri', '2345678901', 'CV Maju Jaya Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (3, 'UD Berkah Motor', 'UD Berkah Motor', 'Jl. Perdagangan No. 3, Surabaya', '031-3456789', 'berkah@berkahmotor.com', '03.456.789.0-123.000', 'Citra Dewi', '081234567003', 'Aki, Lampu, Klakson', 4.0, 1, 30, 'BRI', '3456789012', 'UD Berkah Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (4, 'PT Auto Parts Indonesia', 'PT Auto Parts Indonesia', 'Jl. Komponen No. 4, Medan', '061-4567890', 'contact@autopartsindonesia.com', '04.567.890.1-234.000', 'Dedi Kurniawan', '081234567004', 'Suspensi, Shock Absorber', 4.7, 1, 60, 'BNI', '4567890123', 'PT Auto Parts Indonesia', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (5, 'CV Sinar Terang', 'CV Sinar Terang', 'Jl. Cahaya No. 5, Semarang', '024-5678901', 'info@sinarterang.com', '05.678.901.2-345.000', 'Eka Putri', '081234567005', 'Lampu, Reflektor', 3.8, 1, 30, 'BCA', '5678901234', 'CV Sinar Terang', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (6, 'UD Rejeki Motor', 'UD Rejeki Motor', 'Jl. Keberuntungan No. 6, Yogyakarta', '0274-6789012', 'rejeki@rejekimotor.com', '06.789.012.3-456.000', 'Fajar Sidik', '081234567006', 'Ban, Velg', 4.3, 1, 45, 'Mandiri', '6789012345', 'UD Rejeki Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (7, 'PT Karya Mandiri', 'PT Karya Mandiri', 'Jl. Mandiri No. 7, Makassar', '0411-7890123', 'karya@karyamandiri.com', '07.890.123.4-567.000', 'Gita Sari', '081234567007', 'Radiator, Thermostat', 4.1, 1, 30, 'BRI', '7890123456', 'PT Karya Mandiri', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (8, 'CV Harapan Jaya', 'CV Harapan Jaya', 'Jl. Harapan No. 8, Palembang', '0711-8901234', 'harapan@harapanjaya.com', '08.901.234.5-678.000', 'Hadi Susanto', '081234567008', 'Timing Belt, V-Belt', 3.9, 1, 45, 'BNI', '8901234567', 'CV Harapan Jaya', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (9, 'UD Sukses Motor', 'UD Sukses Motor', 'Jl. Sukses No. 9, Denpasar', '0361-9012345', 'sukses@suksesmotor.com', '09.012.345.6-789.000', 'Indah Permata', '081234567009', 'Kopling, Kampas Kopling', 4.4, 1, 30, 'BCA', '9012345678', 'UD Sukses Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (10, 'PT Global Auto', 'PT Global Auto', 'Jl. Global No. 10, Balikpapan', '0542-0123456', 'global@globalauto.com', '10.123.456.7-890.000', 'Joko Widodo', '081234567010', 'Fuel Pump, Injector', 4.6, 1, 60, 'Mandiri', '0123456789', 'PT Global Auto', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (11, 'CV Mitra Sejati', 'CV Mitra Sejati', 'Jl. Mitra No. 11, Pontianak', '0561-1234567', 'mitra@mitrasejati.com', '11.234.567.8-901.000', 'Kartika Sari', '081234567011', 'Wiper, Kaca Spion', 3.7, 1, 30, 'BRI', '1234567890', 'CV Mitra Sejati', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (12, 'UD Cahaya Motor', 'UD Cahaya Motor', 'Jl. Terang No. 12, Jambi', '0741-2345678', 'cahaya@cahayamotor.com', '12.345.678.9-012.000', 'Lukman Hakim', '081234567012', 'Headlamp, Taillight', 4.0, 1, 45, 'BNI', '2345678901', 'UD Cahaya Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (13, 'PT Nusantara Parts', 'PT Nusantara Parts', 'Jl. Nusantara No. 13, Pekanbaru', '0761-3456789', 'nusantara@nusantaraparts.com', '13.456.789.0-123.000', 'Mega Wati', '081234567013', 'Gasket, Seal', 4.2, 1, 30, 'BCA', '3456789012', 'PT Nusantara Parts', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (14, 'CV Bintang Motor', 'CV Bintang Motor', 'Jl. Bintang No. 14, Padang', '0751-4567890', 'bintang@bintangmotor.com', '14.567.890.1-234.000', 'Nanda Pratama', '081234567014', 'Alternator, Starter', 3.8, 1, 45, 'Mandiri', '4567890123', 'CV Bintang Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (15, 'UD Jaya Abadi', 'UD Jaya Abadi', 'Jl. Abadi No. 15, Banjarmasin', '0511-5678901', 'jaya@jayaabadi.com', '15.678.901.2-345.000', 'Oki Setiawan', '081234567015', 'Power Steering, Rack Steer', 4.5, 1, 30, 'BRI', '5678901234', 'UD Jaya Abadi', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (16, 'PT Prima Motor', 'PT Prima Motor', 'Jl. Prima No. 16, Manado', '0431-6789012', 'prima@primamotor.com', '16.789.012.3-456.000', 'Putri Ayu', '081234567016', 'Exhaust System, Muffler', 4.1, 1, 60, 'BNI', '6789012345', 'PT Prima Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (17, 'CV Sentosa Jaya', 'CV Sentosa Jaya', 'Jl. Sentosa No. 17, Samarinda', '0541-7890123', 'sentosa@sentosajaya.com', '17.890.123.4-567.000', 'Qori Ramadhan', '081234567017', 'Air Filter, Fuel Filter', 3.9, 1, 30, 'BCA', '7890123456', 'CV Sentosa Jaya', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (18, 'UD Makmur Motor', 'UD Makmur Motor', 'Jl. Makmur No. 18, Kendari', '0401-8901234', 'makmur@makmurmotor.com', '18.901.234.5-678.000', 'Rina Agustina', '081234567018', 'Brake Pad, Brake Disc', 4.3, 1, 45, 'Mandiri', '8901234567', 'UD Makmur Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (19, 'PT Sejahtera Auto', 'PT Sejahtera Auto', 'Jl. Sejahtera No. 19, Mataram', '0370-9012345', 'sejahtera@sejahteraauto.com', '19.012.345.6-789.000', 'Sandi Permana', '081234567019', 'Clutch, Flywheel', 4.0, 1, 30, 'BRI', '9012345678', 'PT Sejahtera Auto', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (20, 'CV Bahagia Motor', 'CV Bahagia Motor', 'Jl. Bahagia No. 20, Kupang', '0380-0123456', 'bahagia@bahagiamotor.com', '20.123.456.7-890.000', 'Tari Melati', '081234567020', 'Suspension Spring, Strut', 3.6, 1, 45, 'BNI', '0123456789', 'CV Bahagia Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (21, 'UD Gemilang Parts', 'UD Gemilang Parts', 'Jl. Gemilang No. 21, Ambon', '0911-1234567', 'gemilang@gemilangparts.com', '21.234.567.8-901.000', 'Udin Sedunia', '081234567021', 'CV Joint, Ball Joint', 4.4, 1, 30, 'BCA', '1234567890', 'UD Gemilang Parts', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (22, 'PT Mandiri Auto', 'PT Mandiri Auto', 'Jl. Mandiri No. 22, Jayapura', '0967-2345678', 'mandiri@mandiriauto.com', '22.345.678.9-012.000', 'Vina Cantika', '081234567022', 'Tie Rod, Stabilizer', 4.2, 1, 60, 'Mandiri', '2345678901', 'PT Mandiri Auto', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (23, 'CV Berkah Jaya', 'CV Berkah Jaya', 'Jl. Berkah No. 23, Ternate', '0921-3456789', 'berkah@berkahjaya.com', '23.456.789.0-123.000', 'Wawan Kurniawan', '081234567023', 'Engine Mount, Transmission Mount', 3.8, 1, 30, 'BRI', '3456789012', 'CV Berkah Jaya', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (24, 'UD Rezeki Nomplok', 'UD Rezeki Nomplok', 'Jl. Rezeki No. 24, Sorong', '0951-4567890', 'rezeki@rezekinomplok.com', '24.567.890.1-234.000', 'Xenia Putri', '081234567024', 'Radiator Hose, Heater Hose', 4.1, 1, 45, 'BNI', '4567890123', 'UD Rezeki Nomplok', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (25, 'PT Sukses Mandiri', 'PT Sukses Mandiri', 'Jl. Sukses No. 25, Gorontalo', '0435-5678901', 'sukses@suksesmandiri.com', '25.678.901.2-345.000', 'Yudi Pratama', '081234567025', 'Water Pump, Oil Pump', 4.5, 1, 30, 'BCA', '5678901234', 'PT Sukses Mandiri', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (26, 'CV Jaya Motor', 'CV Jaya Motor', 'Jl. Jaya No. 26, Palu', '0451-6789012', 'jaya@jayamotor.com', '26.789.012.3-456.000', 'Zaenal Abidin', '081234567026', 'Spark Plug, Ignition Coil', 3.9, 1, 45, 'Mandiri', '6789012345', 'CV Jaya Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (27, 'UD Maju Terus', 'UD Maju Terus', 'Jl. Maju No. 27, Mamuju', '0426-7890123', 'maju@majuterus.com', '27.890.123.4-567.000', 'Andi Setiawan', '081234567027', 'Oxygen Sensor, MAP Sensor', 4.0, 1, 30, 'BRI', '7890123456', 'UD Maju Terus', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (28, 'PT Cahaya Terang', 'PT Cahaya Terang', 'Jl. Cahaya No. 28, Kendari', '0402-8901234', 'cahaya@cahayaterang.com', '28.901.234.5-678.000', 'Budi Santoso', '081234567028', 'Throttle Body, Idle Control', 4.3, 1, 60, 'BNI', '8901234567', 'PT Cahaya Terang', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (29, 'CV Harapan Baru', 'CV Harapan Baru', 'Jl. Harapan No. 29, Baubau', '0403-9012345', 'harapan@harapanbaru.com', '29.012.345.6-789.000', 'Candra Kirana', '081234567029', 'EGR Valve, PCV Valve', 3.7, 1, 30, 'BCA', '9012345678', 'CV Harapan Baru', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);
INSERT INTO `vendor` VALUES (30, 'UD Sejahtera Motor', 'UD Sejahtera Motor', 'Jl. Sejahtera No. 30, Kolaka', '0405-0123456', 'sejahtera@sejahteramotor.com', '30.123.456.7-890.000', 'Dedi Mulyadi', '081234567030', 'Turbocharger, Intercooler', 4.6, 1, 45, 'Mandiri', '0123456789', 'UD Sejahtera Motor', '2025-06-16 14:49:19', NULL, '2025-06-16 14:49:19', NULL);

SET FOREIGN_KEY_CHECKS = 1;
