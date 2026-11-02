-- 1. INSERT DATA KE SETIAP TABEL
INSERT INTO bengkel (
    nama_bengkel, alamat_bengkel, email_bengkel, no_telepon, 
    npwp_bengkel, nama_pemilik, tanggal_berdiri, status_operasional
) VALUES (
    'Bengkel Gumuruh', 
    'Jl. Gumuruh No. 52, Bandung, Jawa Barat', 
    'info@bengkelgumuruh.rf.gd', 
    '081394483625', 
    '12.345.678.9-012.000', 
    'Muhammad Ridwan Hakim', 
    '2015-03-15', 
    1
);

INSERT INTO pengguna (
    nama_pengguna, nik_pengguna, email_pengguna, password, jabatan, role, 
    no_telepon, alamat, tanggal_lahir, id_bengkel
) VALUES 
('Ahmad Fauzi', '3201234567890001', 'ahmad.fauzi@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Super Admin', 1, '081234567890', 'Jl. Sudirman No. 10', '1985-05-15', 1),
('Siti Nurhaliza', '3201234567890002', 'siti.nurhaliza@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bendahara', 2, '081234567891', 'Jl. Merdeka No. 20', '1987-08-22', 1),
('Budi Setiawan', '3201234567890003', 'budi.setiawan@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567892', 'Jl. Pahlawan No. 30', '1990-12-10', 1),
('Dewi Sartika', '3201234567890004', 'dewi.sartika@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567893', 'Jl. Kartini No. 40', '1992-03-08', 1),
('Andi Wijaya', '3201234567890005', 'andi.wijaya@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567894', 'Jl. Diponegoro No. 50', '1988-11-25', 1),
('Maya Sari', '3201234567890006', 'maya.sari@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567895', 'Jl. Gatot Subroto No. 60', '1991-07-14', 1),
('Rudi Hartono', '3201234567890007', 'rudi.hartono@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bendahara', 3, '081234567896', 'Jl. Ahmad Yani No. 70', '1989-04-18', 1),
('Lina Marlina', '3201234567890008', 'lina.marlina@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 2, '081234567897', 'Jl. Veteran No. 80', '1986-09-30', 1),
('Agus Salim', '3201234567890009', 'agus.salim@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567898', 'Jl. Pemuda No. 90', '1993-01-12', 1),
('Rina Susanti', '3201234567890010', 'rina.susanti@bengkelgumuruh.rf.gd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kasir', 3, '081234567899', 'Jl. Proklamasi No. 100', '1994-06-05', 1);

INSERT INTO mekanik (
    nama_mekanik, nik_mekanik, no_telepon, alamat, tanggal_lahir, 
    spesialisasi, pengalaman_tahun, gaji_pokok, tanggal_masuk, id_bengkel
) VALUES 
('Agung Nugroho', '3201234567890101', '081234560001', 'Jl. Mekanik No. 1', '1985-01-15', 'Mesin', 10, 4500000.00, '2020-01-15', 1),
('Bambang Sutrisno', '3201234567890102', '081234560002', 'Jl. Mekanik No. 2', '1987-03-20', 'Transmisi', 8, 4200000.00, '2020-02-01', 1),
('Cahyo Prabowo', '3201234567890103', '081234560003', 'Jl. Mekanik No. 3', '1990-05-10', 'AC', 6, 3800000.00, '2020-03-15', 1),
('Darmawan Jaya', '3201234567890104', '081234560004', 'Jl. Mekanik No. 4', '1988-07-25', 'Rem', 7, 4000000.00, '2020-04-01', 1),
('Eko Prasetyo', '3201234567890105', '081234560005', 'Jl. Mekanik No. 5', '1992-09-12', 'Suspensi', 5, 3600000.00, '2020-05-15', 1),
('Fajar Sidik', '3201234567890106', '081234560006', 'Jl. Mekanik No. 6', '1986-11-08', 'Kelistrikan', 9, 4300000.00, '2020-06-01', 1),
('Gunawan Adi', '3201234567890107', '081234560007', 'Jl. Mekanik No. 7', '1989-02-14', 'Body Repair', 7, 4100000.00, '2020-07-15', 1),
('Hadi Susanto', '3201234567890108', '081234560008', 'Jl. Mekanik No. 8', '1991-04-22', 'Mesin', 6, 3900000.00, '2020-08-01', 1),
('Irwan Setiawan', '3201234567890109', '081234560009', 'Jl. Mekanik No. 9', '1984-06-30', 'Transmisi', 11, 4600000.00, '2020-09-15', 1),
('Joko Santoso', '3201234567890110', '081234560010', 'Jl. Mekanik No. 10', '1993-08-18', 'AC', 4, 3500000.00, '2020-10-01', 1),
('Kurniawan Adi', '3201234567890111', '081234560011', 'Jl. Mekanik No. 11', '1987-10-05', 'Rem', 8, 4200000.00, '2020-11-15', 1),
('Lukman Sardi', '3201234567890112', '081234560012', 'Jl. Mekanik No. 12', '1990-12-28', 'Suspensi', 6, 3800000.00, '2020-12-01', 1),
('Mulyadi Joko', '3201234567890113', '081234560013', 'Jl. Mekanik No. 13', '1988-01-16', 'Kelistrikan', 7, 4000000.00, '2021-01-15', 1),
('Nugroho Adi', '3201234567890114', '081234560014', 'Jl. Mekanik No. 14', '1992-03-11', 'Body Repair', 5, 3700000.00, '2021-02-01', 1),
('Oki Prasetyo', '3201234567890115', '081234560015', 'Jl. Mekanik No. 15', '1985-05-07', 'Mesin', 10, 4500000.00, '2021-03-15', 1),
('Purnomo Adi', '3201234567890116', '081234560016', 'Jl. Mekanik No. 16', '1989-07-24', 'Transmisi', 7, 4100000.00, '2021-04-01', 1),
('Qomar Sidik', '3201234567890117', '081234560017', 'Jl. Mekanik No. 17', '1991-09-19', 'AC', 6, 3900000.00, '2021-05-15', 1),
('Rahmat Hidayat', '3201234567890118', '081234560018', 'Jl. Mekanik No. 18', '1986-11-13', 'Rem', 9, 4300000.00, '2021-06-01', 1),
('Sugeng Riyadi', '3201234567890119', '081234560019', 'Jl. Mekanik No. 19', '1993-01-26', 'Suspensi', 4, 3600000.00, '2021-07-15', 1),
('Tono Sukirman', '3201234567890120', '081234560020', 'Jl. Mekanik No. 20', '1987-03-09', 'Kelistrikan', 8, 4200000.00, '2021-08-01', 1),
('Usman Hakim', '3201234567890121', '081234560021', 'Jl. Mekanik No. 21', '1990-05-17', 'Body Repair', 6, 3800000.00, '2021-09-15', 1);

INSERT INTO vendor (
    nama_vendor, nama_perusahaan, alamat_vendor, no_telepon_vendor, 
    email_vendor, npwp_vendor, contact_person, no_telepon_contact, 
    jenis_suku_cadang, rating_vendor, term_pembayaran, 
    bank_nama, bank_rekening, bank_atas_nama
) VALUES 
('PT Suku Cadang Utama', 'PT Suku Cadang Utama', 'Jl. Industri No. 1, Jakarta', '021-1234567', 'info@sukucadangutama.com', '01.234.567.8-901.000', 'Andi Wijaya', '081234567001', 'Filter, Oli, Kampas Rem', 4.5, 30, 'BCA', '1234567890', 'PT Suku Cadang Utama'),
('CV Maju Jaya Motor', 'CV Maju Jaya Motor', 'Jl. Otomotif No. 2, Bandung', '022-2345678', 'sales@majujayamotor.com', '02.345.678.9-012.000', 'Budi Santoso', '081234567002', 'Spare Part Mesin', 4.2, 45, 'Mandiri', '2345678901', 'CV Maju Jaya Motor'),
('UD Berkah Motor', 'UD Berkah Motor', 'Jl. Perdagangan No. 3, Surabaya', '031-3456789', 'berkah@berkahmotor.com', '03.456.789.0-123.000', 'Citra Dewi', '081234567003', 'Aki, Lampu, Klakson', 4.0, 30, 'BRI', '3456789012', 'UD Berkah Motor'),
('PT Auto Parts Indonesia', 'PT Auto Parts Indonesia', 'Jl. Komponen No. 4, Medan', '061-4567890', 'contact@autopartsindonesia.com', '04.567.890.1-234.000', 'Dedi Kurniawan', '081234567004', 'Suspensi, Shock Absorber', 4.7, 60, 'BNI', '4567890123', 'PT Auto Parts Indonesia'),
('CV Sinar Terang', 'CV Sinar Terang', 'Jl. Cahaya No. 5, Semarang', '024-5678901', 'info@sinarterang.com', '05.678.901.2-345.000', 'Eka Putri', '081234567005', 'Lampu, Reflektor', 3.8, 30, 'BCA', '5678901234', 'CV Sinar Terang'),
('UD Rejeki Motor', 'UD Rejeki Motor', 'Jl. Keberuntungan No. 6, Yogyakarta', '0274-6789012', 'rejeki@rejekimotor.com', '06.789.012.3-456.000', 'Fajar Sidik', '081234567006', 'Ban, Velg', 4.3, 45, 'Mandiri', '6789012345', 'UD Rejeki Motor'),
('PT Karya Mandiri', 'PT Karya Mandiri', 'Jl. Mandiri No. 7, Makassar', '0411-7890123', 'karya@karyamandiri.com', '07.890.123.4-567.000', 'Gita Sari', '081234567007', 'Radiator, Thermostat', 4.1, 30, 'BRI', '7890123456', 'PT Karya Mandiri'),
('CV Harapan Jaya', 'CV Harapan Jaya', 'Jl. Harapan No. 8, Palembang', '0711-8901234', 'harapan@harapanjaya.com', '08.901.234.5-678.000', 'Hadi Susanto', '081234567008', 'Timing Belt, V-Belt', 3.9, 45, 'BNI', '8901234567', 'CV Harapan Jaya'),
('UD Sukses Motor', 'UD Sukses Motor', 'Jl. Sukses No. 9, Denpasar', '0361-9012345', 'sukses@suksesmotor.com', '09.012.345.6-789.000', 'Indah Permata', '081234567009', 'Kopling, Kampas Kopling', 4.4, 30, 'BCA', '9012345678', 'UD Sukses Motor'),
('PT Global Auto', 'PT Global Auto', 'Jl. Global No. 10, Balikpapan', '0542-0123456', 'global@globalauto.com', '10.123.456.7-890.000', 'Joko Widodo', '081234567010', 'Fuel Pump, Injector', 4.6, 60, 'Mandiri', '0123456789', 'PT Global Auto'),
('CV Mitra Sejati', 'CV Mitra Sejati', 'Jl. Mitra No. 11, Pontianak', '0561-1234567', 'mitra@mitrasejati.com', '11.234.567.8-901.000', 'Kartika Sari', '081234567011', 'Wiper, Kaca Spion', 3.7, 30, 'BRI', '1234567890', 'CV Mitra Sejati'),
('UD Cahaya Motor', 'UD Cahaya Motor', 'Jl. Terang No. 12, Jambi', '0741-2345678', 'cahaya@cahayamotor.com', '12.345.678.9-012.000', 'Lukman Hakim', '081234567012', 'Headlamp, Taillight', 4.0, 45, 'BNI', '2345678901', 'UD Cahaya Motor'),
('PT Nusantara Parts', 'PT Nusantara Parts', 'Jl. Nusantara No. 13, Pekanbaru', '0761-3456789', 'nusantara@nusantaraparts.com', '13.456.789.0-123.000', 'Mega Wati', '081234567013', 'Gasket, Seal', 4.2, 30, 'BCA', '3456789012', 'PT Nusantara Parts'),
('CV Bintang Motor', 'CV Bintang Motor', 'Jl. Bintang No. 14, Padang', '0751-4567890', 'bintang@bintangmotor.com', '14.567.890.1-234.000', 'Nanda Pratama', '081234567014', 'Alternator, Starter', 3.8, 45, 'Mandiri', '4567890123', 'CV Bintang Motor'),
('UD Jaya Abadi', 'UD Jaya Abadi', 'Jl. Abadi No. 15, Banjarmasin', '0511-5678901', 'jaya@jayaabadi.com', '15.678.901.2-345.000', 'Oki Setiawan', '081234567015', 'Power Steering, Rack Steer', 4.5, 30, 'BRI', '5678901234', 'UD Jaya Abadi'),
('PT Prima Motor', 'PT Prima Motor', 'Jl. Prima No. 16, Manado', '0431-6789012', 'prima@primamotor.com', '16.789.012.3-456.000', 'Putri Ayu', '081234567016', 'Exhaust System, Muffler', 4.1, 60, 'BNI', '6789012345', 'PT Prima Motor'),
('CV Sentosa Jaya', 'CV Sentosa Jaya', 'Jl. Sentosa No. 17, Samarinda', '0541-7890123', 'sentosa@sentosajaya.com', '17.890.123.4-567.000', 'Qori Ramadhan', '081234567017', 'Air Filter, Fuel Filter', 3.9, 30, 'BCA', '7890123456', 'CV Sentosa Jaya'),
('UD Makmur Motor', 'UD Makmur Motor', 'Jl. Makmur No. 18, Kendari', '0401-8901234', 'makmur@makmurmotor.com', '18.901.234.5-678.000', 'Rina Agustina', '081234567018', 'Brake Pad, Brake Disc', 4.3, 45, 'Mandiri', '8901234567', 'UD Makmur Motor'),
('PT Sejahtera Auto', 'PT Sejahtera Auto', 'Jl. Sejahtera No. 19, Mataram', '0370-9012345', 'sejahtera@sejahteraauto.com', '19.012.345.6-789.000', 'Sandi Permana', '081234567019', 'Clutch, Flywheel', 4.0, 30, 'BRI', '9012345678', 'PT Sejahtera Auto'),
('CV Bahagia Motor', 'CV Bahagia Motor', 'Jl. Bahagia No. 20, Kupang', '0380-0123456', 'bahagia@bahagiamotor.com', '20.123.456.7-890.000', 'Tari Melati', '081234567020', 'Suspension Spring, Strut', 3.6, 45, 'BNI', '0123456789', 'CV Bahagia Motor'),
('UD Gemilang Parts', 'UD Gemilang Parts', 'Jl. Gemilang No. 21, Ambon', '0911-1234567', 'gemilang@gemilangparts.com', '21.234.567.8-901.000', 'Udin Sedunia', '081234567021', 'CV Joint, Ball Joint', 4.4, 30, 'BCA', '1234567890', 'UD Gemilang Parts'),
('PT Mandiri Auto', 'PT Mandiri Auto', 'Jl. Mandiri No. 22, Jayapura', '0967-2345678', 'mandiri@mandiriauto.com', '22.345.678.9-012.000', 'Vina Cantika', '081234567022', 'Tie Rod, Stabilizer', 4.2, 60, 'Mandiri', '2345678901', 'PT Mandiri Auto'),
('CV Berkah Jaya', 'CV Berkah Jaya', 'Jl. Berkah No. 23, Ternate', '0921-3456789', 'berkah@berkahjaya.com', '23.456.789.0-123.000', 'Wawan Kurniawan', '081234567023', 'Engine Mount, Transmission Mount', 3.8, 30, 'BRI', '3456789012', 'CV Berkah Jaya'),
('UD Rezeki Nomplok', 'UD Rezeki Nomplok', 'Jl. Rezeki No. 24, Sorong', '0951-4567890', 'rezeki@rezekinomplok.com', '24.567.890.1-234.000', 'Xenia Putri', '081234567024', 'Radiator Hose, Heater Hose', 4.1, 45, 'BNI', '4567890123', 'UD Rezeki Nomplok'),
('PT Sukses Mandiri', 'PT Sukses Mandiri', 'Jl. Sukses No. 25, Gorontalo', '0435-5678901', 'sukses@suksesmandiri.com', '25.678.901.2-345.000', 'Yudi Pratama', '081234567025', 'Water Pump, Oil Pump', 4.5, 30, 'BCA', '5678901234', 'PT Sukses Mandiri'),
('CV Jaya Motor', 'CV Jaya Motor', 'Jl. Jaya No. 26, Palu', '0451-6789012', 'jaya@jayamotor.com', '26.789.012.3-456.000', 'Zaenal Abidin', '081234567026', 'Spark Plug, Ignition Coil', 3.9, 45, 'Mandiri', '6789012345', 'CV Jaya Motor'),
('UD Maju Terus', 'UD Maju Terus', 'Jl. Maju No. 27, Mamuju', '0426-7890123', 'maju@majuterus.com', '27.890.123.4-567.000', 'Andi Setiawan', '081234567027', 'Oxygen Sensor, MAP Sensor', 4.0, 30, 'BRI', '7890123456', 'UD Maju Terus'),
('PT Cahaya Terang', 'PT Cahaya Terang', 'Jl. Cahaya No. 28, Kendari', '0402-8901234', 'cahaya@cahayaterang.com', '28.901.234.5-678.000', 'Budi Santoso', '081234567028', 'Throttle Body, Idle Control', 4.3, 60, 'BNI', '8901234567', 'PT Cahaya Terang'),
('CV Harapan Baru', 'CV Harapan Baru', 'Jl. Harapan No. 29, Baubau', '0403-9012345', 'harapan@harapanbaru.com', '29.012.345.6-789.000', 'Candra Kirana', '081234567029', 'EGR Valve, PCV Valve', 3.7, 30, 'BCA', '9012345678', 'CV Harapan Baru'),
('UD Sejahtera Motor', 'UD Sejahtera Motor', 'Jl. Sejahtera No. 30, Kolaka', '0405-0123456', 'sejahtera@sejahteramotor.com', '30.123.456.7-890.000', 'Dedi Mulyadi', '081234567030', 'Turbocharger, Intercooler', 4.6, 45, 'Mandiri', '0123456789', 'UD Sejahtera Motor');

INSERT INTO suku_cadang (
    kode_suku_cadang, nama_suku_cadang, merk_kendaraan, model_kendaraan, 
    tahun_kendaraan, kategori, sub_kategori, satuan, harga_beli, harga_jual, 
    margin_keuntungan, stok_minimum, stok_maksimum, stok_saat_ini, 
    lokasi_penyimpanan, berat, dimensi, deskripsi, garansi_bulan, id_vendor
) VALUES 
('SC001', 'Filter Oli Mesin', 'Toyota', 'Avanza', '2015-2020', 'Mesin', 'Filter', 'pcs', 25000.00, 35000.00, 40.00, 10, 100, 50, 'Rak A1', 200.00, '10x8x5 cm', 'Filter oli untuk mesin Toyota Avanza', 6, 1),
('SC002', 'Kampas Rem Depan', 'Honda', 'Jazz', '2014-2019', 'Rem', 'Kampas Rem', 'set', 150000.00, 200000.00, 33.33, 5, 50, 25, 'Rak B1', 800.00, '25x15x2 cm', 'Kampas rem depan Honda Jazz', 12, 2),
('SC003', 'Aki Mobil 12V 45Ah', 'Universal', 'All Model', '2010-2023', 'Kelistrikan', 'Aki', 'pcs', 450000.00, 600000.00, 33.33, 3, 20, 10, 'Rak C1', 15000.00, '24x17x19 cm', 'Aki kering maintenance free', 12, 3),
('SC004', 'Shock Absorber Depan', 'Suzuki', 'Ertiga', '2012-2018', 'Suspensi', 'Shock Absorber', 'pcs', 300000.00, 420000.00, 40.00, 4, 30, 15, 'Rak D1', 2500.00, '50x10x10 cm', 'Shock absorber depan Suzuki Ertiga', 24, 4),
('SC005', 'Lampu Halogen H4', 'Universal', 'All Model', '2000-2023', 'Kelistrikan', 'Lampu', 'pcs', 35000.00, 50000.00, 42.86, 15, 80, 40, 'Rak E1', 100.00, '12x8x8 cm', 'Lampu halogen H4 12V 60/55W', 6, 5),
('SC006', 'Ban Radial 185/65R15', 'Bridgestone', 'All Model', '2010-2023', 'Roda', 'Ban', 'pcs', 650000.00, 850000.00, 30.77, 2, 20, 8, 'Rak F1', 8000.00, '65x18x18 cm', 'Ban radial tubeless', 60, 6),
('SC007', 'Radiator Assy', 'Toyota', 'Kijang Innova', '2016-2021', 'Pendingin', 'Radiator', 'pcs', 800000.00, 1100000.00, 37.50, 2, 15, 6, 'Rak G1', 5000.00, '60x40x5 cm', 'Radiator lengkap dengan kipas', 12, 7),
('SC008', 'Timing Belt', 'Honda', 'Civic', '2016-2020', 'Mesin', 'Belt', 'pcs', 180000.00, 250000.00, 38.89, 8, 40, 20, 'Rak H1', 300.00, '120x3x1 cm', 'Timing belt Honda Civic', 12, 8),
('SC009', 'Kampas Kopling Set', 'Mitsubishi', 'Pajero Sport', '2015-2020', 'Transmisi', 'Kopling', 'set', 550000.00, 750000.00, 36.36, 3, 20, 10, 'Rak I1', 3000.00, '25x25x5 cm', 'Set kampas kopling lengkap', 18, 9),
('SC010', 'Fuel Pump Electric', 'Nissan', 'Grand Livina', '2013-2019', 'Bahan Bakar', 'Fuel Pump', 'pcs', 400000.00, 550000.00, 37.50, 4, 25, 12, 'Rak J1', 1200.00, '20x15x10 cm', 'Pompa bensin elektrik', 12, 10),
('SC011', 'Wiper Blade 24 inch', 'Universal', 'All Model', '2010-2023', 'Aksesoris', 'Wiper', 'pcs', 45000.00, 65000.00, 44.44, 12, 60, 30, 'Rak K1', 200.00, '60x5x2 cm', 'Wiper karet silicon', 12, 11),
('SC012', 'Headlamp LED', 'Toyota', 'Fortuner', '2016-2021', 'Kelistrikan', 'Lampu', 'pcs', 1200000.00, 1600000.00, 33.33, 2, 10, 5, 'Rak L1', 2000.00, '30x20x15 cm', 'Headlamp LED original', 24, 12),
('SC013', 'Gasket Head', 'Honda', 'CR-V', '2017-2022', 'Mesin', 'Gasket', 'set', 350000.00, 480000.00, 37.14, 5, 25, 12, 'Rak M1', 500.00, '30x25x2 cm', 'Gasket kepala silinder', 12, 13),
('SC014', 'Alternator 12V 80A', 'Suzuki', 'Swift', '2014-2019', 'Kelistrikan', 'Alternator', 'pcs', 850000.00, 1150000.00, 35.29, 2, 15, 7, 'Rak N1', 4000.00, '25x20x15 cm', 'Alternator 12V 80 Ampere', 18, 14),
('SC015', 'Power Steering Pump', 'Toyota', 'Camry', '2015-2020', 'Kemudi', 'Power Steering', 'pcs', 950000.00, 1300000.00, 36.84, 2, 12, 5, 'Rak O1', 3500.00, '20x15x15 cm', 'Pompa power steering', 12, 15),
('SC016', 'Muffler Assy', 'Honda', 'Brio', '2012-2018', 'Exhaust', 'Muffler', 'pcs', 280000.00, 380000.00, 35.71, 3, 20, 10, 'Rak P1', 6000.00, '50x20x15 cm', 'Knalpot lengkap dengan pipa', 12, 16),
('SC017', 'Air Filter Engine', 'Mitsubishi', 'Xpander', '2017-2022', 'Mesin', 'Filter', 'pcs', 65000.00, 90000.00, 38.46, 10, 50, 25, 'Rak Q1', 300.00, '25x20x5 cm', 'Filter udara mesin', 6, 17),
('SC018', 'Brake Disc Rotor', 'Nissan', 'X-Trail', '2014-2019', 'Rem', 'Disc Brake', 'pcs', 320000.00, 450000.00, 40.63, 4, 25, 12, 'Rak R1', 4500.00, '30x30x3 cm', 'Piringan rem cakram', 24, 18),
('SC019', 'Clutch Master Cylinder', 'Toyota', 'Hilux', '2016-2021', 'Transmisi', 'Master Cylinder', 'pcs', 420000.00, 580000.00, 38.10, 3, 18, 8, 'Rak S1', 800.00, '15x10x8 cm', 'Master silinder kopling', 12, 19),
('SC020', 'Suspension Spring', 'Honda', 'HR-V', '2015-2020', 'Suspensi', 'Per', 'pcs', 380000.00, 520000.00, 36.84, 4, 24, 12, 'Rak T1', 2800.00, '35x15x15 cm', 'Per suspensi belakang', 18, 20),
('SC021', 'CV Joint Outer', 'Suzuki', 'Baleno', '2016-2021', 'Transmisi', 'CV Joint', 'pcs', 290000.00, 400000.00, 37.93, 5, 30, 15, 'Rak U1', 1500.00, '20x15x10 cm', 'CV joint luar roda depan', 12, 21),
('SC022', 'Tie Rod End', 'Toyota', 'Vios', '2013-2018', 'Kemudi', 'Tie Rod', 'pcs', 120000.00, 170000.00, 41.67, 8, 40, 20, 'Rak V1', 600.00, '25x8x8 cm', 'Ujung tie rod kemudi', 12, 22),
('SC023', 'Engine Mount', 'Honda', 'City', '2014-2019', 'Mesin', 'Engine Mount', 'pcs', 180000.00, 250000.00, 38.89, 6, 35, 18, 'Rak W1', 1200.00, '15x12x10 cm', 'Dudukan mesin karet', 12, 23),
('SC024', 'Radiator Hose Upper', 'Mitsubishi', 'Outlander', '2015-2020', 'Pendingin', 'Selang', 'pcs', 85000.00, 120000.00, 41.18, 10, 45, 22, 'Rak X1', 400.00, '60x5x5 cm', 'Selang radiator atas', 6, 24),
('SC025', 'Water Pump', 'Nissan', 'Serena', '2013-2018', 'Pendingin', 'Water Pump', 'pcs', 320000.00, 450000.00, 40.63, 4, 25, 12, 'Rak Y1', 2200.00, '20x15x12 cm', 'Pompa air pendingin', 12, 25),
('SC026', 'Spark Plug Iridium', 'Universal', 'All Model', '2010-2023', 'Kelistrikan', 'Busi', 'pcs', 85000.00, 120000.00, 41.18, 15, 80, 40, 'Rak Z1', 100.00, '10x3x3 cm', 'Busi iridium tahan lama', 24, 26),
('SC027', 'Oxygen Sensor', 'Toyota', 'Alphard', '2016-2021', 'Bahan Bakar', 'Sensor', 'pcs', 650000.00, 900000.00, 38.46, 3, 18, 9, 'Rak AA1', 300.00, '15x8x5 cm', 'Sensor oksigen lambda', 12, 27),
('SC028', 'Throttle Body', 'Honda', 'Accord', '2015-2020', 'Bahan Bakar', 'Throttle Body', 'pcs', 1100000.00, 1500000.00, 36.36, 2, 12, 6, 'Rak BB1', 1800.00, '20x15x10 cm', 'Throttle body elektronik', 18, 28),
('SC029', 'EGR Valve', 'Mitsubishi', 'Triton', '2016-2021', 'Exhaust', 'EGR Valve', 'pcs', 480000.00, 670000.00, 39.58, 3, 20, 10, 'Rak CC1', 800.00, '15x12x8 cm', 'Katup EGR exhaust gas', 12, 29),
('SC030', 'Turbocharger', 'Nissan', 'Navara', '2017-2022', 'Mesin', 'Turbocharger', 'pcs', 3500000.00, 4800000.00, 37.14, 1, 8, 3, 'Rak DD1', 12000.00, '40x30x25 cm', 'Turbocharger lengkap', 24, 30);

INSERT INTO customer (
    nama_customer, nik_customer, no_telepon_customer, email_customer, 
    alamat_customer, jenis_kelamin, tanggal_lahir, pekerjaan, 
    kendaraan_merk, kendaraan_model, kendaraan_tahun, no_polisi, 
    no_rangka, no_mesin, warna_kendaraan, km_kendaraan, 
    customer_type, tanggal_registrasi
) VALUES 
('Ahmad Rizki', '3201234567890201', '081234568001', 'ahmad.rizki@email.com', 'Jl. Merdeka No. 101, Bandung', 'L', '1985-03-15', 'Pegawai Swasta', 'Toyota', 'Avanza', 2018, 'D 1234 AB', 'MHKA1BA1XJK123456', 'K3VE1234567', 'Silver', 45000, 'reguler', '2023-01-15'),
('Siti Aminah', '3201234567890202', '081234568002', 'siti.aminah@email.com', 'Jl. Sudirman No. 102, Bandung', 'P', '1990-07-22', 'Guru', 'Honda', 'Jazz', 2019, 'D 5678 CD', 'MHGGE5H19KH123456', 'L15A1234567', 'Putih', 32000, 'premium', '2023-01-20'),
('Budi Hartono', '3201234567890203', '081234568003', 'budi.hartono@email.com', 'Jl. Asia Afrika No. 103, Bandung', 'L', '1982-11-10', 'Wiraswasta', 'Suzuki', 'Ertiga', 2020, 'D 9012 EF', 'JSAFJB22S00123456', 'K15B1234567', 'Hitam', 28000, 'vip', '2023-02-01'),
('Dewi Sartika', '3201234567890204', '081234568004', 'dewi.sartika@email.com', 'Jl. Braga No. 104, Bandung', 'P', '1988-05-18', 'Dokter', 'Toyota', 'Innova', 2017, 'D 3456 GH', 'MHKA1BA1XHK123456', '2KD1234567', 'Abu-abu', 55000, 'premium', '2023-02-10'),
('Eko Prasetyo', '3201234567890205', '081234568005', 'eko.prasetyo@email.com', 'Jl. Dago No. 105, Bandung', 'L', '1992-09-25', 'Engineer', 'Honda', 'CR-V', 2021, 'D 7890 IJ', 'MHGRE5H21MH123456', 'R20A1234567', 'Merah', 15000, 'vip', '2023-02-15'),
('Fitri Handayani', '3201234567890206', '081234568006', 'fitri.handayani@email.com', 'Jl. Setiabudhi No. 106, Bandung', 'P', '1987-12-08', 'Pegawai Bank', 'Mitsubishi', 'Xpander', 2022, 'D 2345 KL', 'MMBJNKN15NH123456', '4A911234567', 'Biru', 8000, 'reguler', '2023-03-01'),
('Gunawan Adi', '3201234567890207', '081234568007', 'gunawan.adi@email.com', 'Jl. Pasteur No. 107, Bandung', 'L', '1984-04-12', 'Arsitek', 'Nissan', 'Grand Livina', 2016, 'D 6789 MN', 'SJNFAAJ10U0123456', 'HR15DE1234567', 'Coklat', 62000, 'premium', '2023-03-10'),
('Hani Rahmawati', '3201234567890208', '081234568008', 'hani.rahmawati@email.com', 'Jl. Cihampelas No. 108, Bandung', 'P', '1991-08-30', 'Desainer', 'Toyota', 'Yaris', 2019, 'D 0123 OP', 'MHKA1BA1XKK123456', '2NR1234567', 'Kuning', 35000, 'reguler', '2023-03-20'),
('Indra Gunawan', '3201234567890209', '081234568009', 'indra.gunawan@email.com', 'Jl. Riau No. 109, Bandung', 'L', '1986-01-14', 'Manager', 'Honda', 'Civic', 2020, 'D 4567 QR', 'MHGFC5F20LH123456', 'L15B1234567', 'Putih', 25000, 'vip', '2023-04-01'),
('Jihan Aulia', '3201234567890210', '081234568010', 'jihan.aulia@email.com', 'Jl. Buah Batu No. 110, Bandung', 'P', '1993-06-05', 'Farmasis', 'Suzuki', 'Swift', 2018, 'D 8901 ST', 'JSAFJZ85S00123456', 'K12M1234567', 'Silver', 42000, 'reguler', '2023-04-10'),
('Kurniawan Adi', '3201234567890211', '081234568011', 'kurniawan.adi@email.com', 'Jl. Soekarno Hatta No. 111, Bandung', 'L', '1989-10-20', 'Programmer', 'Toyota', 'Fortuner', 2021, 'D 2468 UV', 'MHKA1BA1XMK123456', '2GD1234567', 'Hitam', 18000, 'premium', '2023-04-20'),
('Lina Marlina', '3201234567890212', '081234568012', 'lina.marlina@email.com', 'Jl. Dipatiukur No. 112, Bandung', 'P', '1985-02-28', 'Akuntan', 'Honda', 'Brio', 2017, 'D 1357 WX', 'MHGDD5F17HH123456', 'L12B1234567', 'Merah', 48000, 'reguler', '2023-05-01'),
('Muhammad Ali', '3201234567890213', '081234568013', 'muhammad.ali@email.com', 'Jl. Gatot Subroto No. 113, Bandung', 'L', '1990-11-15', 'Sales', 'Mitsubishi', 'Pajero Sport', 2019, 'D 9753 YZ', 'MMBJSKD29KH123456', '4D561234567', 'Putih', 38000, 'vip', '2023-05-10'),
('Nurul Hidayah', '3201234567890214', '081234568014', 'nurul.hidayah@email.com', 'Jl. Ahmad Yani No. 114, Bandung', 'P', '1988-07-03', 'Perawat', 'Nissan', 'X-Trail', 2020, 'D 8642 AA', 'SJNFAAJ10L0123456', 'QR25DE1234567', 'Abu-abu', 22000, 'premium', '2023-05-20'),
('Oki Setiawan', '3201234567890215', '081234568015', 'oki.setiawan@email.com', 'Jl. Veteran No. 115, Bandung', 'L', '1987-12-18', 'Teknisi', 'Toyota', 'Camry', 2018, 'D 7531 BB', 'MHKA1BA1XJK123456', '2AR1234567', 'Biru', 52000, 'reguler', '2023-06-01'),
('Putri Ayu', '3201234567890216', '081234568016', 'putri.ayu@email.com', 'Jl. Pemuda No. 116, Bandung', 'P', '1992-04-09', 'Marketing', 'Honda', 'HR-V', 2021, 'D 6420 CC', 'MHGRU6H21MH123456', 'L15B1234567', 'Putih', 12000, 'vip', '2023-06-10'),
('Qori Ramadhan', '3201234567890217', '081234568017', 'qori.ramadhan@email.com', 'Jl. Proklamasi No. 117, Bandung', 'L', '1984-09-22', 'Konsultan', 'Suzuki', 'Baleno', 2019, 'D 5319 DD', 'JSAFJB22S00123456', 'K15B1234567', 'Silver', 33000, 'premium', '2023-06-20'),
('Rina Susanti', '3201234567890218', '081234568018', 'rina.susanti@email.com', 'Jl. Kemerdekaan No. 118, Bandung', 'P', '1991-01-11', 'HR Manager', 'Toyota', 'Vios', 2016, 'D 4208 EE', 'MHKA1BA1XGK123456', '2NZ1234567', 'Hitam', 65000, 'reguler', '2023-07-01'),
('Sandi Permana', '3201234567890219', '081234568019', 'sandi.permana@email.com', 'Jl. Pancasila No. 119, Bandung', 'L', '1986-05-26', 'Pilot', 'Honda', 'City', 2020, 'D 3107 FF', 'MHGGE5H20KH123456', 'L15A1234567', 'Coklat', 28000, 'vip', '2023-07-10'),
('Tari Melati', '3201234567890220', '081234568020', 'tari.melati@email.com', 'Jl. Garuda No. 120, Bandung', 'P', '1989-08-14', 'Psikolog', 'Mitsubishi', 'Outlander', 2018, 'D 2096 GG', 'MMBJWKD29JH123456', '4J121234567', 'Merah', 45000, 'premium', '2023-07-20'),
('Udin Sedunia', '3201234567890221', '081234568021', 'udin.sedunia@email.com', 'Jl. Elang No. 121, Bandung', 'L', '1993-03-07', 'Fotografer', 'Nissan', 'Serena', 2017, 'D 1985 HH', 'SJNFCNJ10H0123456', 'MR20DD1234567', 'Putih', 58000, 'reguler', '2023-08-01'),
('Vina Cantika', '3201234567890222', '081234568022', 'vina.cantika@email.com', 'Jl. Rajawali No. 122, Bandung', 'P', '1987-10-19', 'Chef', 'Toyota', 'Alphard', 2019, 'D 0874 II', 'MHKA1BA1XKK123456', '2GR1234567', 'Hitam', 35000, 'vip', '2023-08-10'),
('Wawan Kurniawan', '3201234567890223', '081234568023', 'wawan.kurniawan@email.com', 'Jl. Merak No. 123, Bandung', 'L', '1990-12-02', 'Lawyer', 'Honda', 'Accord', 2020, 'D 9763 JJ', 'MHGCV3F20LH123456', 'K24W1234567', 'Abu-abu', 25000, 'premium', '2023-08-20'),
('Xenia Putri', '3201234567890224', '081234568024', 'xenia.putri@email.com', 'Jl. Cendrawasih No. 124, Bandung', 'P', '1988-06-16', 'Dentist', 'Mitsubishi', 'Triton', 2021, 'D 8652 KK', 'MMBJSKD29MH123456', '4N151234567', 'Biru', 15000, 'reguler', '2023-09-01'),
('Yudi Pratama', '3201234567890225', '081234568025', 'yudi.pratama@email.com', 'Jl. Nuri No. 125, Bandung', 'L', '1985-11-23', 'Architect', 'Nissan', 'Navara', 2019, 'D 7541 LL', 'SJNFDAJ10K0123456', 'YD25DDTi1234567', 'Coklat', 42000, 'vip', '2023-09-10'),
('Zahra Amelia', '3201234567890226', '081234568026', 'zahra.amelia@email.com', 'Jl. Kenari No. 126, Bandung', 'P', '1992-02-08', 'Journalist', 'Toyota', 'Rush', 2018, 'D 6430 MM', 'MHKA1BA1XJK123456', '3SZ1234567', 'Silver', 48000, 'premium', '2023-09-20'),
('Andi Wijaya', '3201234567890227', '081234568027', 'andi.wijaya@email.com', 'Jl. Kutilang No. 127, Bandung', 'L', '1989-04-21', 'Mechanic', 'Honda', 'Mobilio', 2016, 'D 5329 NN', 'MHGGE6H16HH123456', 'L15A1234567', 'Putih', 62000, 'reguler', '2023-10-01'),
('Bella Sari', '3201234567890228', '081234568028', 'bella.sari@email.com', 'Jl. Pipit No. 128, Bandung', 'P', '1986-08-13', 'Teacher', 'Suzuki', 'Ignis', 2020, 'D 4218 OO', 'JSAFJZ85S00123456', 'K12C1234567', 'Kuning', 28000, 'vip', '2023-10-10'),
('Candra Kirana', '3201234567890229', '081234568029', 'candra.kirana@email.com', 'Jl. Gereja No. 129, Bandung', 'P', '1991-07-06', 'Pharmacist', 'Toyota', 'Sienta', 2019, 'D 3107 PP', 'MHKA1BA1XKK123456', '2NR1234567', 'Merah', 38000, 'premium', '2023-10-20'),
('Dedi Mulyadi', '3201234567890230', '081234568030', 'dedi.mulyadi@email.com', 'Jl. Masjid No. 130, Bandung', 'L', '1984-12-29', 'Police Officer', 'Honda', 'Freed', 2017, 'D 2096 QQ', 'MHGGE3H17HH123456', 'L15A1234567', 'Hitam', 55000, 'reguler', '2023-11-01');

INSERT INTO transaksi_pengadaan (
    no_po, tanggal_po, tanggal_kedatangan, no_invoice_vendor, 
    total_item, subtotal, pajak, total_bayar, status_pengadaan, 
    status_pembayaran, metode_pembayaran, catatan, id_vendor, id_pengguna
) VALUES 
('PO/2024/001', '2024-01-15', '2024-01-18', 'INV-001/2024', 5, 2500000.00, 275000.00, 2775000.00, 'completed', 'paid', 'transfer', 'Pengadaan rutin bulan Januari', 1, 1),
('PO/2024/002', '2024-01-20', '2024-01-23', 'INV-002/2024', 3, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', 'transfer', 'Stok kampas rem menipis', 2, 2),
('PO/2024/003', '2024-01-25', '2024-01-28', 'INV-003/2024', 2, 1200000.00, 132000.00, 1332000.00, 'completed', 'paid', 'cash', 'Aki untuk stok emergency', 3, 1),
('PO/2024/004', '2024-02-01', '2024-02-05', 'INV-004/2024', 4, 3200000.00, 352000.00, 3552000.00, 'completed', 'paid', 'transfer', 'Shock absorber untuk berbagai merk', 4, 2),
('PO/2024/005', '2024-02-10', '2024-02-13', 'INV-005/2024', 8, 800000.00, 88000.00, 888000.00, 'completed', 'paid', 'transfer', 'Lampu halogen stok habis', 5, 1),
('PO/2024/006', '2024-02-15', '2024-02-18', 'INV-006/2024', 3, 2400000.00, 264000.00, 2664000.00, 'completed', 'paid', 'transfer', 'Ban untuk customer premium', 6, 2),
('PO/2024/007', '2024-02-20', '2024-02-23', 'INV-007/2024', 2, 2200000.00, 242000.00, 2442000.00, 'completed', 'paid', 'giro', 'Radiator untuk Toyota Innova', 7, 1),
('PO/2024/008', '2024-03-01', '2024-03-05', 'INV-008/2024', 6, 1500000.00, 165000.00, 1665000.00, 'completed', 'paid', 'transfer', 'Timing belt berbagai merk', 8, 2),
('PO/2024/009', '2024-03-10', '2024-03-13', 'INV-009/2024', 4, 3000000.00, 330000.00, 3330000.00, 'completed', 'paid', 'transfer', 'Kampas kopling untuk truck', 9, 1),
('PO/2024/010', '2024-03-15', '2024-03-18', 'INV-010/2024', 5, 2750000.00, 302500.00, 3052500.00, 'completed', 'paid', 'transfer', 'Fuel pump electric', 10, 2),
('PO/2024/011', '2024-03-20', '2024-03-23', 'INV-011/2024', 10, 650000.00, 71500.00, 721500.00, 'completed', 'paid', 'cash', 'Wiper blade untuk musim hujan', 11, 1),
('PO/2024/012', '2024-04-01', '2024-04-05', 'INV-012/2024', 3, 4800000.00, 528000.00, 5328000.00, 'completed', 'paid', 'transfer', 'Headlamp LED premium', 12, 2),
('PO/2024/013', '2024-04-10', '2024-04-13', 'INV-013/2024', 4, 1920000.00, 211200.00, 2131200.00, 'completed', 'paid', 'transfer', 'Gasket head untuk overhaul', 13, 1),
('PO/2024/014', '2024-04-15', '2024-04-18', 'INV-014/2024', 3, 3450000.00, 379500.00, 3829500.00, 'completed', 'paid', 'giro', 'Alternator untuk bengkel', 14, 2),
('PO/2024/015', '2024-04-20', '2024-04-23', 'INV-015/2024', 2, 2600000.00, 286000.00, 2886000.00, 'completed', 'paid', 'transfer', 'Power steering pump', 15, 1),
('PO/2024/016', '2024-05-01', '2024-05-05', 'INV-016/2024', 4, 1520000.00, 167200.00, 1687200.00, 'completed', 'paid', 'transfer', 'Muffler untuk berbagai mobil', 16, 2),
('PO/2024/017', '2024-05-10', '2024-05-13', 'INV-017/2024', 8, 720000.00, 79200.00, 799200.00, 'completed', 'paid', 'cash', 'Air filter engine', 17, 1),
('PO/2024/018', '2024-05-15', '2024-05-18', 'INV-018/2024', 4, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', 'transfer', 'Brake disc rotor', 18, 2),
('PO/2024/019', '2024-05-20', '2024-05-23', 'INV-019/2024', 3, 1740000.00, 191400.00, 1931400.00, 'completed', 'paid', 'transfer', 'Clutch master cylinder', 19, 1),
('PO/2024/020', '2024-06-01', '2024-06-05', 'INV-020/2024', 4, 2080000.00, 228800.00, 2308800.00, 'completed', 'paid', 'transfer', 'Suspension spring', 20, 2),
('PO/2024/021', '2024-06-10', '2024-06-13', 'INV-021/2024', 6, 2400000.00, 264000.00, 2664000.00, 'completed', 'paid', 'giro', 'CV joint outer', 21, 1),
('PO/2024/022', '2024-06-15', '2024-06-18', 'INV-022/2024', 8, 1360000.00, 149600.00, 1509600.00, 'completed', 'paid', 'transfer', 'Tie rod end', 22, 2),
('PO/2024/023', '2024-06-20', '2024-06-23', 'INV-023/2024', 6, 1500000.00, 165000.00, 1665000.00, 'completed', 'paid', 'transfer', 'Engine mount', 23, 1),
('PO/2024/024', '2024-07-01', '2024-07-05', 'INV-024/2024', 10, 1200000.00, 132000.00, 1332000.00, 'completed', 'paid', 'cash', 'Radiator hose', 24, 2),
('PO/2024/025', '2024-07-10', '2024-07-13', 'INV-025/2024', 4, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', 'transfer', 'Water pump', 25, 1),
('PO/2024/026', '2024-07-15', '2024-07-18', 'INV-026/2024', 15, 1800000.00, 198000.00, 1998000.00, 'completed', 'paid', 'transfer', 'Spark plug iridium', 26, 7),
('PO/2024/027', '2024-07-20', '2024-07-23', 'INV-027/2024', 3, 2700000.00, 297000.00, 2997000.00, 'completed', 'paid', 'transfer', 'Oxygen sensor', 27, 7),
('PO/2024/028', '2024-08-01', '2024-08-05', 'INV-028/2024', 2, 3000000.00, 330000.00, 3330000.00, 'completed', 'paid', 'giro', 'Throttle body', 28, 7),
('PO/2024/029', '2024-08-10', '2024-08-13', 'INV-029/2024', 3, 2010000.00, 221100.00, 2231100.00, 'completed', 'paid', 'transfer', 'EGR valve', 29, 7),
('PO/2024/030', '2024-08-15', '2024-08-18', 'INV-030/2024', 1, 4800000.00, 528000.00, 5328000.00, 'completed', 'paid', 'transfer', 'Turbocharger', 30, 7);

INSERT INTO transaksi_penjualan (
    no_invoice, tanggal_transaksi, jam_masuk, jam_selesai, jenis_service, 
    keluhan, diagnosis, pekerjaan_dilakukan, km_kendaraan, 
    total_item_suku_cadang, subtotal_suku_cadang, biaya_jasa, 
    diskon, pajak, total_bayar, status_service, status_pembayaran, 
    metode_pembayaran, catatan, id_customer, id_mekanik, id_kasir
) VALUES 
('INV/2024/001', '2024-01-15', '08:00:00', '10:30:00', 'Ganti Oli', 'Oli sudah hitam', 'Oli perlu diganti', 'Ganti oli mesin dan filter oli', 45000, 2, 60000.00, 50000.00, 0.00, 11000.00, 121000.00, 'diambil', 'paid', 'cash', 'Service rutin', 1, 1, 3),
('INV/2024/002', '2024-01-18', '09:00:00', '12:00:00', 'Ganti Kampas Rem', 'Rem blong', 'Kampas rem habis', 'Ganti kampas rem depan', 32000, 1, 200000.00, 100000.00, 0.00, 30000.00, 330000.00, 'diambil', 'paid', 'transfer', 'Kampas rem habis total', 2, 2, 4),
('INV/2024/003', '2024-01-20', '10:00:00', '11:00:00', 'Ganti Aki', 'Mobil susah starter', 'Aki soak', 'Ganti aki baru', 28000, 1, 600000.00, 25000.00, 0.00, 62500.00, 687500.00, 'diambil', 'paid', 'cash', 'Aki sudah lemah', 3, 3, 5),
('INV/2024/004', '2024-01-22', '08:30:00', '14:00:00', 'Ganti Shock', 'Mobil goyang', 'Shock absorber rusak', 'Ganti shock absorber depan', 55000, 2, 840000.00, 150000.00, 0.00, 99000.00, 1089000.00, 'diambil', 'paid', 'transfer', 'Shock sudah bocor', 4, 4, 6),
('INV/2024/005', '2024-01-25', '09:30:00', '10:30:00', 'Ganti Lampu', 'Lampu mati', 'Lampu putus', 'Ganti lampu halogen H4', 15000, 2, 100000.00, 30000.00, 0.00, 13000.00, 143000.00, 'diambil', 'paid', 'cash', 'Lampu depan mati', 5, 5, 8),
('INV/2024/006', '2024-01-28', '07:00:00', '17:00:00', 'Ganti Ban', 'Ban gundul', 'Ban sudah tipis', 'Ganti 4 ban radial', 62000, 4, 3400000.00, 200000.00, 100000.00, 350000.00, 3850000.00, 'diambil', 'paid', 'transfer', 'Ban sudah tidak layak pakai', 6, 6, 8),
('INV/2024/007', '2024-02-01', '08:00:00', '16:00:00', 'Overhaul Radiator', 'Mesin overheat', 'Radiator bocor', 'Ganti radiator dan thermostat', 58000, 1, 1100000.00, 300000.00, 0.00, 140000.00, 1540000.00, 'diambil', 'paid', 'transfer', 'Radiator bocor parah', 7, 7, 9),
('INV/2024/008', '2024-02-05', '09:00:00', '11:00:00', 'Ganti Timing Belt', 'Suara kasar dari mesin', 'Timing belt kendor', 'Ganti timing belt', 35000, 1, 250000.00, 150000.00, 0.00, 40000.00, 440000.00, 'diambil', 'paid', 'cash', 'Timing belt sudah kendor', 8, 8, 10),
('INV/2024/009', '2024-02-08', '08:30:00', '15:30:00', 'Service Kopling', 'Kopling selip', 'Kampas kopling habis', 'Ganti set kampas kopling', 45000, 1, 750000.00, 250000.00, 0.00, 100000.00, 1100000.00, 'diambil', 'paid', 'transfer', 'Kopling sudah selip', 9, 9, 3),
('INV/2024/010', '2024-02-10', '10:00:00', '12:00:00', 'Ganti Fuel Pump', 'Mobil brebet', 'Fuel pump lemah', 'Ganti fuel pump electric', 25000, 1, 550000.00, 100000.00, 0.00, 65000.00, 715000.00, 'diambil', 'paid', 'cash', 'Fuel pump sudah lemah', 10, 10, 4),
('INV/2024/011', '2024-02-12', '09:00:00', '10:00:00', 'Ganti Wiper', 'Wiper tidak bersih', 'Karet wiper keras', 'Ganti wiper blade', 22000, 2, 130000.00, 25000.00, 0.00, 15500.00, 170500.00, 'diambil', 'paid', 'cash', 'Wiper sudah keras', 11, 11, 3),
('INV/2024/012', '2024-02-15', '08:00:00', '17:00:00', 'Upgrade Headlamp', 'Lampu kurang terang', 'Ingin upgrade LED', 'Pasang headlamp LED', 35000, 2, 3200000.00, 200000.00, 0.00, 340000.00, 3740000.00, 'diambil', 'paid', 'transfer', 'Upgrade ke LED', 12, 12, 4),
('INV/2024/013', '2024-02-18', '09:30:00', '14:30:00', 'Overhaul Mesin', 'Mesin ngebul', 'Gasket head bocor', 'Ganti gasket head set', 52000, 1, 480000.00, 400000.00, 0.00, 88000.00, 968000.00, 'diambil', 'paid', 'transfer', 'Overhaul ringan', 13, 13, 5),
('INV/2024/014', '2024-02-20', '08:30:00', '16:00:00', 'Service Alternator', 'Aki tekor terus', 'Alternator rusak', 'Ganti alternator', 42000, 1, 1150000.00, 150000.00, 0.00, 130000.00, 1430000.00, 'diambil', 'paid', 'transfer', 'Alternator tidak charge', 14, 14, 6),
('INV/2024/015', '2024-02-22', '10:00:00', '15:00:00', 'Service Power Steering', 'Setir berat', 'Pompa power steering rusak', 'Ganti power steering pump', 18000, 1, 1300000.00, 200000.00, 0.00, 150000.00, 1650000.00, 'diambil', 'paid', 'transfer', 'Power steering bocor', 15, 15, 6),
('INV/2024/016', '2024-02-25', '09:00:00', '12:00:00', 'Ganti Knalpot', 'Knalpot bocor', 'Muffler berlubang', 'Ganti muffler assy', 48000, 1, 380000.00, 100000.00, 0.00, 48000.00, 528000.00, 'diambil', 'paid', 'cash', 'Knalpot bocor', 16, 16, 8),
('INV/2024/017', '2024-02-28', '08:00:00', '09:00:00', 'Ganti Filter Udara', 'Mesin kurang bertenaga', 'Filter udara kotor', 'Ganti air filter engine', 38000, 1, 90000.00, 25000.00, 0.00, 11500.00, 126500.00, 'diambil', 'paid', 'cash', 'Filter udara sangat kotor', 17, 17, 9),
('INV/2024/018', '2024-03-01', '09:30:00', '13:30:00', 'Service Rem', 'Rem kurang pakem', 'Disc brake aus', 'Ganti brake disc rotor', 22000, 2, 900000.00, 150000.00, 0.00, 105000.00, 1155000.00, 'diambil', 'paid', 'transfer', 'Disc brake sudah tipis', 18, 18, 10),
('INV/2024/019', '2024-03-05', '08:30:00', '12:30:00', 'Service Kopling', 'Kopling berat', 'Master cylinder bocor', 'Ganti clutch master cylinder', 15000, 1, 580000.00, 100000.00, 0.00, 68000.00, 748000.00, 'diambil', 'paid', 'cash', 'Master kopling bocor', 19, 19, 2),
('INV/2024/020', '2024-03-08', '10:00:00', '15:00:00', 'Ganti Per', 'Mobil ceper sebelah', 'Per patah', 'Ganti suspension spring', 12000, 2, 1040000.00, 150000.00, 0.00, 119000.00, 1309000.00, 'diambil', 'paid', 'transfer', 'Per belakang patah', 20, 11, 2),
('INV/2024/021', '2024-03-10', '09:00:00', '13:00:00', 'Service CV Joint', 'Bunyi tek-tek saat belok', 'CV joint aus', 'Ganti CV joint outer', 33000, 1, 400000.00, 120000.00, 0.00, 52000.00, 572000.00, 'diambil', 'paid', 'cash', 'CV joint sudah aus', 21, 12, 3),
('INV/2024/022', '2024-03-12', '08:30:00', '11:30:00', 'Service Kemudi', 'Setir goyang', 'Tie rod end longgar', 'Ganti tie rod end', 42000, 2, 340000.00, 80000.00, 0.00, 42000.00, 462000.00, 'diambil', 'paid', 'transfer', 'Tie rod sudah longgar', 22, 13, 4),
('INV/2024/023', '2024-03-15', '10:00:00', '12:00:00', 'Ganti Engine Mount', 'Mesin getar', 'Engine mount rusak', 'Ganti engine mount', 18000, 2, 500000.00, 100000.00, 0.00, 60000.00, 660000.00, 'diambil', 'paid', 'cash', 'Engine mount pecah', 23, 14, 5),
('INV/2024/024', '2024-03-18', '09:30:00', '11:00:00', 'Ganti Selang Radiator', 'Radiator bocor', 'Selang radiator retak', 'Ganti radiator hose upper', 58000, 1, 120000.00, 50000.00, 0.00, 17000.00, 187000.00, 'diambil', 'paid', 'cash', 'Selang radiator retak', 24, 15, 6),
('INV/2024/025', '2024-03-20', '08:00:00', '12:00:00', 'Service Water Pump', 'Mesin overheat', 'Water pump bocor', 'Ganti water pump', 22000, 1, 450000.00, 150000.00, 0.00, 60000.00, 660000.00, 'diambil', 'paid', 'transfer', 'Water pump bocor', 25, 16, 8),
('INV/2024/026', '2024-03-22', '09:00:00', '10:00:00', 'Ganti Busi', 'Mesin brebet', 'Busi sudah aus', 'Ganti spark plug iridium', 38000, 4, 480000.00, 50000.00, 0.00, 53000.00, 583000.00, 'diambil', 'paid', 'cash', 'Busi sudah hitam', 26, 17, 8),
('INV/2024/027', '2024-03-25', '08:30:00', '14:30:00', 'Service Sensor', 'Check engine menyala', 'Oxygen sensor rusak', 'Ganti oxygen sensor', 35000, 1, 900000.00, 100000.00, 0.00, 100000.00, 1100000.00, 'diambil', 'paid', 'transfer', 'Sensor oksigen rusak', 27, 18, 9),
('INV/2024/028', '2024-03-28', '09:00:00', '16:00:00', 'Service Throttle Body', 'RPM tidak stabil', 'Throttle body kotor', 'Ganti throttle body', 25000, 1, 1500000.00, 200000.00, 0.00, 170000.00, 1870000.00, 'diambil', 'paid', 'transfer', 'Throttle body rusak', 28, 19, 10),
('INV/2024/029', '2024-04-01', '10:00:00', '15:00:00', 'Service EGR', 'Asap hitam', 'EGR valve macet', 'Ganti EGR valve', 42000, 1, 670000.00, 150000.00, 0.00, 82000.00, 902000.00, 'diambil', 'paid', 'cash', 'EGR valve macet', 29, 20, 3),
('INV/2024/030', '2024-04-05', '07:00:00', '18:00:00', 'Overhaul Turbo', 'Tenaga kurang', 'Turbocharger rusak', 'Ganti turbocharger', 15000, 1, 4800000.00, 500000.00, 200000.00, 510000.00, 5610000.00, 'diambil', 'paid', 'transfer', 'Turbo sudah rusak total', 30, 21, 4);

INSERT INTO detail_transaksi_pengadaan (
    id_transaksi_pengadaan, id_suku_cadang, qty_order, qty_diterima, 
    harga_beli_satuan, subtotal, kondisi_barang, catatan
) VALUES 
(1, 1, 100, 100, 25000.00, 2500000.00, 'baik', 'Filter oli untuk stok'),
(2, 2, 12, 12, 150000.00, 1800000.00, 'baik', 'Kampas rem Honda Jazz'),
(3, 3, 10, 10, 450000.00, 4500000.00, 'baik', 'Aki 12V untuk berbagai mobil'),
(4, 4, 8, 8, 300000.00, 2400000.00, 'baik', 'Shock absorber Suzuki'),
(4, 4, 10, 10, 300000.00, 3000000.00, 'baik', 'Shock absorber tambahan'),
(5, 5, 80, 80, 35000.00, 2800000.00, 'baik', 'Lampu halogen H4'),
(6, 6, 8, 8, 650000.00, 5200000.00, 'baik', 'Ban radial 185/65R15'),
(7, 7, 6, 6, 800000.00, 4800000.00, 'baik', 'Radiator Toyota Innova'),
(8, 8, 20, 20, 180000.00, 3600000.00, 'baik', 'Timing belt Honda'),
(9, 9, 10, 10, 550000.00, 5500000.00, 'baik', 'Kampas kopling set'),
(10, 10, 12, 12, 400000.00, 4800000.00, 'baik', 'Fuel pump electric'),
(11, 11, 60, 60, 45000.00, 2700000.00, 'baik', 'Wiper blade 24 inch'),
(12, 12, 5, 5, 1200000.00, 6000000.00, 'baik', 'Headlamp LED Toyota'),
(13, 13, 12, 12, 350000.00, 4200000.00, 'baik', 'Gasket head Honda'),
(14, 14, 7, 7, 850000.00, 5950000.00, 'baik', 'Alternator Suzuki'),
(15, 15, 5, 5, 950000.00, 4750000.00, 'baik', 'Power steering pump'),
(16, 16, 10, 10, 280000.00, 2800000.00, 'baik', 'Muffler Honda Brio'),
(17, 17, 25, 25, 65000.00, 1625000.00, 'baik', 'Air filter engine'),
(18, 18, 12, 12, 320000.00, 3840000.00, 'baik', 'Brake disc rotor'),
(19, 19, 8, 8, 420000.00, 3360000.00, 'baik', 'Clutch master cylinder');

INSERT INTO detail_transaksi_penjualan (
    id_transaksi_penjualan, id_suku_cadang, qty, harga_jual_satuan, 
    subtotal, diskon_item, garansi_mulai, garansi_selesai, 
    status_garansi, catatan
) VALUES 
(1, 1, 1, 35000.00, 35000.00, 0.00, '2024-01-15', '2024-07-15', 'aktif', 'Filter oli Toyota Avanza'),
(1, 5, 1, 25000.00, 25000.00, 0.00, '2024-01-15', '2024-07-15', 'aktif', 'Oli mesin 4 liter'),
(2, 2, 1, 200000.00, 200000.00, 0.00, '2024-01-18', '2025-01-18', 'aktif', 'Kampas rem depan Honda Jazz'),
(3, 3, 1, 600000.00, 600000.00, 0.00, '2024-01-20', '2025-01-20', 'aktif', 'Aki 12V 45Ah'),
(4, 4, 2, 420000.00, 840000.00, 0.00, '2024-01-22', '2026-01-22', 'aktif', 'Shock absorber depan'),
(5, 5, 2, 50000.00, 100000.00, 0.00, '2024-01-25', '2024-07-25', 'aktif', 'Lampu halogen H4'),
(6, 6, 4, 850000.00, 3400000.00, 100000.00, '2024-01-28', '2029-01-28', 'aktif', 'Ban radial 185/65R15'),
(7, 7, 1, 1100000.00, 1100000.00, 0.00, '2024-02-01', '2025-02-01', 'aktif', 'Radiator Toyota Innova'),
(8, 8, 1, 250000.00, 250000.00, 0.00, '2024-02-05', '2025-02-05', 'aktif', 'Timing belt Honda Civic'),
(9, 9, 1, 750000.00, 750000.00, 0.00, '2024-02-08', '2025-08-08', 'aktif', 'Kampas kopling set'),
(10, 10, 1, 550000.00, 550000.00, 0.00, '2024-02-10', '2025-02-10', 'aktif', 'Fuel pump electric'),
(11, 11, 2, 65000.00, 130000.00, 0.00, '2024-02-12', '2025-02-12', 'aktif', 'Wiper blade 24 inch'),
(12, 12, 2, 1600000.00, 3200000.00, 0.00, '2024-02-15', '2026-02-15', 'aktif', 'Headlamp LED Toyota'),
(13, 13, 1, 480000.00, 480000.00, 0.00, '2024-02-18', '2025-02-18', 'aktif', 'Gasket head Honda CR-V'),
(14, 14, 1, 1150000.00, 1150000.00, 0.00, '2024-02-20', '2025-08-20', 'aktif', 'Alternator Suzuki Swift'),
(15, 15, 1, 1300000.00, 1300000.00, 0.00, '2024-02-22', '2025-02-22', 'aktif', 'Power steering pump'),
(16, 16, 1, 380000.00, 380000.00, 0.00, '2024-02-25', '2025-02-25', 'aktif', 'Muffler Honda Brio'),
(17, 17, 1, 90000.00, 90000.00, 0.00, '2024-02-28', '2024-08-28', 'aktif', 'Air filter engine'),
(18, 18, 2, 450000.00, 900000.00, 0.00, '2024-03-01', '2026-03-01', 'aktif', 'Brake disc rotor'),
(19, 19, 1, 580000.00, 580000.00, 0.00, '2024-03-05', '2025-03-05', 'aktif', 'Clutch master cylinder'),
(20, 20, 2, 520000.00, 1040000.00, 0.00, '2024-03-08', '2025-09-08', 'aktif', 'Suspension spring'),
(21, 21, 1, 400000.00, 400000.00, 0.00, '2024-03-10', '2025-03-10', 'aktif', 'CV joint outer'),
(22, 22, 2, 170000.00, 340000.00, 0.00, '2024-03-12', '2025-03-12', 'aktif', 'Tie rod end'),
(23, 23, 2, 250000.00, 500000.00, 0.00, '2024-03-15', '2025-03-15', 'aktif', 'Engine mount'),
(24, 24, 1, 120000.00, 120000.00, 0.00, '2024-03-18', '2024-09-18', 'aktif', 'Radiator hose upper'),
(25, 25, 1, 450000.00, 450000.00, 0.00, '2024-03-20', '2025-03-20', 'aktif', 'Water pump'),
(26, 26, 4, 120000.00, 480000.00, 0.00, '2024-03-22', '2026-03-22', 'aktif', 'Spark plug iridium'),
(27, 27, 1, 900000.00, 900000.00, 0.00, '2024-03-25', '2025-03-25', 'aktif', 'Oxygen sensor'),
(28, 28, 1, 1500000.00, 1500000.00, 0.00, '2024-03-28', '2025-09-28', 'aktif', 'Throttle body'),
(29, 29, 1, 670000.00, 670000.00, 0.00, '2024-04-01', '2025-04-01', 'aktif', 'EGR valve'),
(30, 30, 1, 4800000.00, 4800000.00, 200000.00, '2024-04-05', '2026-04-05', 'aktif', 'Turbocharger');

INSERT INTO stok_movement (
    id_suku_cadang, jenis_movement, qty_before, qty_change, qty_after, 
    referensi_type, referensi_id, keterangan, id_pengguna
) VALUES 
(1, 'masuk', 0, 100, 100, 'pengadaan', 1, 'Pengadaan filter oli', 1),
(1, 'keluar', 100, -1, 99, 'penjualan', 1, 'Penjualan filter oli', 3),
(2, 'masuk', 0, 12, 12, 'pengadaan', 2, 'Pengadaan kampas rem', 2),
(2, 'keluar', 12, -1, 11, 'penjualan', 2, 'Penjualan kampas rem', 4),
(3, 'masuk', 0, 10, 10, 'pengadaan', 3, 'Pengadaan aki', 1),
(3, 'keluar', 10, -1, 9, 'penjualan', 3, 'Penjualan aki', 5),
(4, 'masuk', 0, 18, 18, 'pengadaan', 4, 'Pengadaan shock absorber', 2),
(4, 'keluar', 18, -2, 16, 'penjualan', 4, 'Penjualan shock absorber', 6),
(5, 'masuk', 0, 80, 80, 'pengadaan', 5, 'Pengadaan lampu halogen', 1),
(5, 'keluar', 80, -2, 78, 'penjualan', 5, 'Penjualan lampu halogen', 3),
(6, 'masuk', 0, 8, 8, 'pengadaan', 6, 'Pengadaan ban radial', 2),
(6, 'keluar', 8, -4, 4, 'penjualan', 6, 'Penjualan ban radial', 8),
(7, 'masuk', 0, 6, 6, 'pengadaan', 7, 'Pengadaan radiator', 1),
(7, 'keluar', 6, -1, 5, 'penjualan', 7, 'Penjualan radiator', 9),
(8, 'masuk', 0, 20, 20, 'pengadaan', 8, 'Pengadaan timing belt', 2),
(8, 'keluar', 20, -1, 19, 'penjualan', 8, 'Penjualan timing belt', 10),
(9, 'masuk', 0, 10, 10, 'pengadaan', 9, 'Pengadaan kampas kopling', 1),
(9, 'keluar', 10, -1, 9, 'penjualan', 9, 'Penjualan kampas kopling', 3),
(10, 'masuk', 0, 12, 12, 'pengadaan', 10, 'Pengadaan fuel pump', 2),
(10, 'keluar', 12, -1, 11, 'penjualan', 10, 'Penjualan fuel pump', 4);

INSERT INTO pembayaran_pengadaan (
    id_transaksi_pengadaan, tanggal_bayar, jumlah_bayar, 
    metode_pembayaran, no_referensi, bank_pengirim, bank_penerima, 
    catatan, id_pengguna
) VALUES 
(1, '2024-01-20', 2775000.00, 'transfer', 'TRF240120001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/001', 2),
(2, '2024-01-25', 1998000.00, 'transfer', 'TRF240125001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/002', 2),
(3, '2024-01-30', 1332000.00, 'cash', 'CASH240130001', '', '', 'Pembayaran tunai PO/2024/003', 2),
(4, '2024-02-07', 3552000.00, 'transfer', 'TRF240207001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/004', 2),
(5, '2024-02-15', 888000.00, 'transfer', 'TRF240215001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/005', 2),
(6, '2024-02-20', 2664000.00, 'transfer', 'TRF240220001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/006', 2),
(7, '2024-02-25', 2442000.00, 'giro', 'GIRO240225001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran giro PO/2024/007', 2),
(8, '2024-03-07', 1665000.00, 'transfer', 'TRF240307001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/008', 2),
(9, '2024-03-15', 3330000.00, 'transfer', 'TRF240315001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/009', 2),
(10, '2024-03-20', 3052500.00, 'transfer', 'TRF240320001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/010', 2),
(11, '2024-03-25', 721500.00, 'cash', 'CASH240325001', '', '', 'Pembayaran tunai PO/2024/011', 2),
(12, '2024-04-07', 5328000.00, 'transfer', 'TRF240407001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/012', 2),
(13, '2024-04-15', 2131200.00, 'transfer', 'TRF240415001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/013', 2),
(14, '2024-04-20', 3829500.00, 'giro', 'GIRO240420001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran giro PO/2024/014', 2),
(15, '2024-04-25', 2886000.00, 'transfer', 'TRF240425001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/015', 2),
(16, '2024-05-07', 1687200.00, 'transfer', 'TRF240507001', 'BCA Bengkel', 'BNI Vendor', 'Pembayaran PO/2024/016', 2),
(17, '2024-05-15', 799200.00, 'cash', 'CASH240515001', '', '', 'Pembayaran tunai PO/2024/017', 2),
(18, '2024-05-20', 1998000.00, 'transfer', 'TRF240520001', 'BCA Bengkel', 'BCA Vendor', 'Pembayaran PO/2024/018', 2),
(19, '2024-05-25', 1931400.00, 'transfer', 'TRF240525001', 'BCA Bengkel', 'Mandiri Vendor', 'Pembayaran PO/2024/019', 2),
(20, '2024-06-07', 2308800.00, 'transfer', 'TRF240607001', 'BCA Bengkel', 'BRI Vendor', 'Pembayaran PO/2024/020', 2);

-- 2. QUERY SELECT - MEMILIH DAN MENYORTIR DATA
-- 2.1 Query dengan Fungsi Agregat
-- Total penjualan per bulan
SELECT 
    YEAR(tanggal_transaksi) AS tahun,
    MONTH(tanggal_transaksi) AS bulan,
    COUNT(*) AS jumlah_transaksi,
    SUM(total_bayar) AS total_penjualan,
    AVG(total_bayar) AS rata_rata_penjualan,
    MAX(total_bayar) AS penjualan_tertinggi,
    MIN(total_bayar) AS penjualan_terendah
FROM transaksi_penjualan 
GROUP BY YEAR(tanggal_transaksi), MONTH(tanggal_transaksi)
ORDER BY tahun DESC, bulan DESC;

-- Statistik stok suku cadang
SELECT 
    kategori,
    COUNT(*) AS jumlah_item,
    SUM(stok_saat_ini) AS total_stok,
    AVG(harga_jual) AS rata_rata_harga,
    MAX(harga_jual) AS harga_tertinggi,
    MIN(harga_jual) AS harga_terendah
FROM suku_cadang 
WHERE status_produk = 1
GROUP BY kategori
ORDER BY total_stok DESC;

-- 2.2 Query dengan Operator Perbandingan dan Logika
-- Suku cadang dengan stok rendah (< 10)
SELECT 
    kode_suku_cadang,
    nama_suku_cadang,
    kategori,
    stok_saat_ini,
    CASE 
        WHEN stok_saat_ini = 0 THEN 'Habis'
        WHEN stok_saat_ini BETWEEN 1 AND 5 THEN 'Kritis'
        WHEN stok_saat_ini BETWEEN 6 AND 10 THEN 'Rendah'
        ELSE 'Aman'
    END AS status_stok
FROM suku_cadang 
WHERE stok_saat_ini < 10 AND status_produk = 1
ORDER BY stok_saat_ini ASC;

-- Transaksi penjualan dengan nilai tinggi
SELECT 
    no_invoice,
    tanggal_transaksi,
    subtotal_suku_cadang + biaya_jasa AS total_sebelum_diskon,
    diskon,
    total_bayar,
    CASE 
        WHEN total_bayar > 2000000 THEN 'Premium'
        WHEN total_bayar BETWEEN 1000000 AND 2000000 THEN 'Menengah'
        ELSE 'Standar'
    END AS kategori_transaksi
FROM transaksi_penjualan 
WHERE total_bayar > 500000
ORDER BY total_bayar DESC;

-- 2.3 Query dengan String Functions
-- Pencarian suku cadang berdasarkan nama
SELECT 
    kode_suku_cadang,
    UPPER(nama_suku_cadang) AS nama_upper,
    LOWER(kategori) AS kategori_lower,
    CONCAT(kode_suku_cadang, ' - ', nama_suku_cadang) AS kode_nama,
    LENGTH(nama_suku_cadang) AS panjang_nama,
    SUBSTRING(kode_suku_cadang, 1, 3) AS prefix_kode
FROM suku_cadang 
WHERE nama_suku_cadang LIKE '%filter%' 
   OR nama_suku_cadang LIKE '%oli%'
   OR nama_suku_cadang LIKE '%rem%'
ORDER BY nama_suku_cadang;

-- Customer dengan format nama dan alamat
SELECT 
    nik_customer,
    CONCAT(UPPER(LEFT(nama_customer, 1)), LOWER(SUBSTRING(nama_customer, 2))) AS nama_formatted,
    REPLACE(alamat_customer, 'Jl.', 'Jalan') AS alamat_lengkap,
    CONCAT('+62', SUBSTRING(no_telepon_customer, 2)) AS telepon_international
FROM customer 
WHERE nama_customer IS NOT NULL
ORDER BY nama_customer;

-- 2.4 Query dengan Date Functions
-- Analisis transaksi berdasarkan waktu
SELECT 
    no_invoice,
    tanggal_transaksi,
    DAYNAME(tanggal_transaksi) AS hari,
    MONTHNAME(tanggal_transaksi) AS bulan,
    QUARTER(tanggal_transaksi) AS kuartal,
    DATEDIFF(CURDATE(), tanggal_transaksi) AS hari_berlalu,
    DATE_ADD(tanggal_transaksi, INTERVAL 1 YEAR) AS garansi_berakhir
FROM transaksi_penjualan 
WHERE tanggal_transaksi >= '2024-01-01'
ORDER BY tanggal_transaksi DESC;

-- Umur data pengadaan
SELECT 
    no_po,
    tanggal_po,
    tanggal_kedatangan,
    DATEDIFF(tanggal_kedatangan, tanggal_po) AS lama_pengadaan_hari,
    CASE 
        WHEN DATEDIFF(tanggal_kedatangan, tanggal_po) <= 7 THEN 'Cepat'
        WHEN DATEDIFF(tanggal_kedatangan, tanggal_po) BETWEEN 8 AND 14 THEN 'Normal'
        ELSE 'Lambat'
    END AS kategori_pengadaan
FROM transaksi_pengadaan 
WHERE tanggal_kedatangan IS NOT NULL
ORDER BY lama_pengadaan_hari DESC;

-- 3. QUERY JOIN - MENGAKSES DATA DARI MULTIPLE TABEL
-- 3.1 Inner Join - Data Transaksi Lengkap
-- Detail transaksi penjualan dengan informasi customer dan suku cadang
SELECT 
    tp.no_invoice,
    tp.tanggal_transaksi,
    c.nama_customer,
    c.no_telepon_customer,
    sc.nama_suku_cadang,
    sc.kategori,
    dtp.qty,
    dtp.harga_jual_satuan,
    dtp.subtotal,
    tp.total_bayar
FROM transaksi_penjualan tp
INNER JOIN customer c ON tp.id_customer = c.id_customer
INNER JOIN detail_transaksi_penjualan dtp ON tp.id_transaksi_penjualan = dtp.id_transaksi_penjualan
INNER JOIN suku_cadang sc ON dtp.id_suku_cadang = sc.id_suku_cadang
WHERE tp.tanggal_transaksi >= '2024-01-01'
ORDER BY tp.tanggal_transaksi DESC, tp.no_invoice;

-- Laporan pengadaan dengan vendor dan pembayaran
SELECT 
    tpg.no_po,
    tpg.tanggal_po,
    v.nama_vendor,
    v.contact_person,
    tpg.total_bayar,
    pp.tanggal_bayar,
    pp.metode_pembayaran,
    pp.jumlah_bayar,
    CASE 
        WHEN pp.jumlah_bayar >= tpg.total_bayar THEN 'Lunas'
        WHEN pp.jumlah_bayar > 0 THEN 'Sebagian'
        ELSE 'Belum Bayar'
    END AS status_pembayaran
FROM transaksi_pengadaan tpg
INNER JOIN vendor v ON tpg.id_vendor = v.id_vendor
LEFT JOIN pembayaran_pengadaan pp ON tpg.id_transaksi_pengadaan = pp.id_transaksi_pengadaan
ORDER BY tpg.tanggal_po DESC;

-- 3.2 Left Join - Analisis Stok dan Movement
-- Analisis pergerakan stok per suku cadang
SELECT 
    sc.kode_suku_cadang,
    sc.nama_suku_cadang,
    sc.stok_saat_ini,
    COUNT(sm.id_movement) AS jumlah_movement,
    SUM(CASE WHEN sm.jenis_movement = 'masuk' THEN sm.qty_change ELSE 0 END) AS total_masuk,
    SUM(CASE WHEN sm.jenis_movement = 'keluar' THEN ABS(sm.qty_change) ELSE 0 END) AS total_keluar,
    MAX(sm.created_at) AS movement_terakhir
FROM suku_cadang sc
LEFT JOIN stok_movement sm ON sc.id_suku_cadang = sm.id_suku_cadang
GROUP BY sc.id_suku_cadang, sc.kode_suku_cadang, sc.nama_suku_cadang, sc.stok_saat_ini
ORDER BY total_keluar DESC;

-- Customer dan transaksi terakhir
SELECT 
    c.nik_customer,
    c.nama_customer,
    c.alamat_customer,
    COUNT(tp.id_transaksi_penjualan) AS jumlah_transaksi,
    MAX(tp.tanggal_transaksi) AS transaksi_terakhir,
    SUM(tp.total_bayar) AS total_pembelian,
    DATEDIFF(CURDATE(), MAX(tp.tanggal_transaksi)) AS hari_tidak_transaksi
FROM customer c
LEFT JOIN transaksi_penjualan tp ON c.id_customer = tp.id_customer
GROUP BY c.id_customer, c.nik_customer, c.nama_customer, c.alamat_customer
ORDER BY total_pembelian DESC;

-- 3.3 Subquery dan Exists
-- Suku cadang yang paling laris (penjualan terbanyak)
SELECT 
    sc.kode_suku_cadang,
    sc.nama_suku_cadang,
    sc.kategori,
    sc.harga_jual,
    (
        SELECT SUM(dtp.qty) 
        FROM detail_transaksi_penjualan dtp 
        WHERE dtp.id_suku_cadang = sc.id_suku_cadang
    ) AS total_terjual
FROM suku_cadang sc
WHERE EXISTS (
    SELECT 1 
    FROM detail_transaksi_penjualan dtp 
    WHERE dtp.id_suku_cadang = sc.id_suku_cadang
)
ORDER BY total_terjual DESC
LIMIT 10;

-- Vendor dengan pengadaan terbanyak
SELECT 
    v.npwp_vendor,
    v.nama_vendor,
    v.alamat_vendor,
    (
        SELECT COUNT(*) 
        FROM transaksi_pengadaan tpg 
        WHERE tpg.id_vendor = v.id_vendor
    ) AS jumlah_po,
    (
        SELECT SUM(tpg.total_bayar) 
        FROM transaksi_pengadaan tpg 
        WHERE tpg.id_vendor = v.id_vendor
    ) AS total_nilai_po
FROM vendor v
WHERE EXISTS (
    SELECT 1 
    FROM transaksi_pengadaan tpg 
    WHERE tpg.id_vendor = v.id_vendor
)
ORDER BY total_nilai_po DESC;

-- 4. UPDATE DAN DELETE DATA
-- 4.1 Update Data
-- Tampilkan suku cadang yang harganya belum diupdate
SELECT 
    id_suku_cadang,
    nama_suku_cadang,
    kategori,
    harga_jual,
    updated_at
FROM suku_cadang 
WHERE kategori IN ('filter', 'oli', 'rem') 
  AND status_produk = 1
ORDER BY kategori, nama_suku_cadang;

-- Update harga jual suku cadang berdasarkan kategori (naik 5%)
UPDATE suku_cadang 
SET harga_jual = harga_jual * 1.05,
    updated_at = NOW()
WHERE kategori IN ('filter', 'oli', 'rem') 
  AND status_produk = 1;

-- Tampilkan suku cadang yang harganya telah diupdate
SELECT 
    id_suku_cadang,
    nama_suku_cadang,
    kategori,
    harga_jual,
    updated_at
FROM suku_cadang 
WHERE kategori IN ('filter', 'oli', 'rem') 
  AND status_produk = 1
ORDER BY kategori, nama_suku_cadang;

-- Update status customer menjadi VIP jika total pembelian > 5 juta
UPDATE customer c
SET customer_type = 'vip',
    updated_at = NOW()
WHERE (
    SELECT SUM(tp.total_bayar) 
    FROM transaksi_penjualan tp 
    WHERE tp.id_customer = c.id_customer
) > 5000000;

-- Tampilkan customer VIP dengan total pembeliannya
SELECT 
    c.id_customer,
    c.nama_customer,
    c.customer_type,
    c.updated_at,
    (
        SELECT SUM(tp.total_bayar) 
        FROM transaksi_penjualan tp 
        WHERE tp.id_customer = c.id_customer
    ) AS total_pembelian
FROM customer c
WHERE c.customer_type = 'vip'
ORDER BY total_pembelian DESC;

-- Tampilkan stok suku cadang yang belum diupdate
SELECT 
    sc.id_suku_cadang,
    sc.nama_suku_cadang,
    sc.kategori,
    COALESCE(sc.stok_saat_ini, 0) AS stok_saat_ini,
    sc.stok_minimum,
    CASE 
        WHEN COALESCE(sc.stok_saat_ini, 0) <= sc.stok_minimum THEN 'Stok Rendah'
        WHEN COALESCE(sc.stok_saat_ini, 0) <= sc.stok_minimum * 2 THEN 'Perlu Restock'
        ELSE 'Stok Aman'
    END AS status_stok,
    sc.updated_at
FROM suku_cadang sc
WHERE sc.status_produk = 1
ORDER BY COALESCE(sc.stok_saat_ini, 0) ASC, sc.kategori;

-- Update stok suku cadang berdasarkan movement terakhir
UPDATE suku_cadang sc
SET stok_saat_ini = (
    SELECT COALESCE(sm.qty_after, 0)
    FROM stok_movement sm
    WHERE sm.id_suku_cadang = sc.id_suku_cadang
    ORDER BY sm.created_at DESC
    LIMIT 1
),
updated_at = NOW()
WHERE sc.status_produk = 1;

-- Tampilkan stok suku cadang yang telah diupdate
SELECT 
    sc.id_suku_cadang,
    sc.nama_suku_cadang,
    sc.kategori,
    COALESCE(sc.stok_saat_ini, 0) AS stok_saat_ini,
    sc.stok_minimum,
    CASE 
        WHEN COALESCE(sc.stok_saat_ini, 0) <= sc.stok_minimum THEN 'Stok Kritis, Urgent Restock'
        WHEN COALESCE(sc.stok_saat_ini, 0) <= sc.stok_minimum * 2 THEN 'Perlu Restock'
        ELSE 'Stok Aman'
    END AS status_stok,
    sc.updated_at
FROM suku_cadang sc
WHERE sc.status_produk = 1
ORDER BY COALESCE(sc.stok_saat_ini, 0) ASC, sc.kategori;

-- 4.2 Delete Data
-- Hapus detail transaksi yang qty-nya 0
DELETE FROM detail_transaksi_penjualan 
WHERE qty = 0 OR subtotal = 0;

-- Hapus stok movement yang sudah lebih dari 2 tahun
DELETE FROM stok_movement 
WHERE created_at < DATE_SUB(NOW(), INTERVAL 2 YEAR);

-- Hapus customer yang tidak pernah bertransaksi dalam 3 tahun terakhir
DELETE c FROM customer c
WHERE NOT EXISTS (
    SELECT 1 
    FROM transaksi_penjualan tp 
    WHERE tp.id_customer = c.id_customer 
      AND tp.tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 3 YEAR)
)
AND c.created_at < DATE_SUB(NOW(), INTERVAL 3 YEAR);
