<?php
require __DIR__ . '/includes/bootstrap.php';
wajib_login();

$pdo = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    cek_csrf();
    $items = [];
    foreach ($_POST['id_suku_cadang'] ?? [] as $i => $idPart) {
        $items[] = ['id_suku_cadang' => (int) $idPart, 'qty' => (int) ($_POST['qty'][$i] ?? 0)];
    }

    try {
        $id = simpanTransaksiPenjualan($pdo, $_POST, $items, (int) pengguna()['id']);
        flash('success', 'Transaksi berhasil disimpan dan stok suku cadang telah diperbarui.');
        redirect('penjualan_detail.php?id=' . $id);
    } catch (InvalidArgumentException $e) {
        flash('danger', $e->getMessage());
    }
}

$customer = $pdo->query(
    "SELECT id_customer, nama_customer, no_polisi, kendaraan_merk, kendaraan_model
       FROM customer WHERE status_customer = 1 ORDER BY nama_customer"
)->fetchAll();
$mekanik = $pdo->query('SELECT id, nama_mekanik, spesialisasi FROM mekanik WHERE status = 1 ORDER BY nama_mekanik')->fetchAll();
$parts = $pdo->query(
    'SELECT id_suku_cadang, kode_suku_cadang, nama_suku_cadang, harga_jual, stok_saat_ini
       FROM suku_cadang WHERE status_produk = 1 AND stok_saat_ini > 0 ORDER BY nama_suku_cadang'
)->fetchAll();
$jenisServis = ['Service Rutin', 'Ganti Oli', 'Ganti Kampas Rem', 'Ganti Aki', 'Tune Up', 'Perbaikan', 'Servis AC'];
$nomorBaru = buatNomorInvoice($pdo, date('Y-m-d'));

$judul = 'Transaksi Penjualan Baru';
require __DIR__ . '/includes/header.php';
?>
<form method="post" id="form-penjualan">
    <?= csrf_field() ?>
    <div class="card">
        <div class="card-header">
            <h2>Data Servis</h2>
            <span class="hint">No. Invoice: <strong><?= e($nomorBaru) ?></strong> (otomatis)</span>
        </div>
        <div class="card-body form-grid">
            <div>
                <label for="tanggal">Tanggal Transaksi</label>
                <input id="tanggal" type="date" name="tanggal_transaksi" value="<?= date('Y-m-d') ?>" required>
            </div>
            <div class="span-2">
                <label for="customer">Customer / Kendaraan</label>
                <select id="customer" name="id_customer" required>
                    <option value="">— Pilih customer —</option>
                    <?php foreach ($customer as $c): ?>
                        <option value="<?= $c['id_customer'] ?>"><?= e("{$c['nama_customer']} · {$c['no_polisi']} · {$c['kendaraan_merk']} {$c['kendaraan_model']}") ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label for="jenis">Jenis Servis</label>
                <select id="jenis" name="jenis_service" required>
                    <?php foreach ($jenisServis as $j): ?>
                        <option><?= e($j) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label for="mekanik">Mekanik</label>
                <select id="mekanik" name="id_mekanik" required>
                    <option value="">— Pilih mekanik —</option>
                    <?php foreach ($mekanik as $m): ?>
                        <option value="<?= $m['id'] ?>"><?= e("{$m['nama_mekanik']} ({$m['spesialisasi']})") ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label for="km">Kilometer Kendaraan</label>
                <input id="km" type="number" name="km_kendaraan" min="0" placeholder="cth. 45000">
            </div>
            <div class="span-3">
                <label for="keluhan">Keluhan Customer</label>
                <textarea id="keluhan" name="keluhan" placeholder="Tuliskan keluhan kendaraan"></textarea>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h2>Suku Cadang yang Diganti</h2>
            <button class="btn btn-light btn-sm" type="button" id="tambah-item">+ Tambah Item</button>
        </div>
        <div class="table-wrap">
            <table class="items">
                <thead><tr><th style="width:46%">Suku Cadang</th><th class="num">Harga</th><th class="num">Stok</th><th style="width:90px">Qty</th><th class="num">Subtotal</th><th></th></tr></thead>
                <tbody id="item-body"></tbody>
            </table>
        </div>
        <template id="item-template">
            <tr>
                <td>
                    <select name="id_suku_cadang[]" class="part" required>
                        <option value="">— Pilih suku cadang —</option>
                        <?php foreach ($parts as $p): ?>
                            <option value="<?= $p['id_suku_cadang'] ?>" data-harga="<?= (float) $p['harga_jual'] ?>" data-stok="<?= (int) $p['stok_saat_ini'] ?>"><?= e("{$p['kode_suku_cadang']} — {$p['nama_suku_cadang']}") ?></option>
                        <?php endforeach; ?>
                    </select>
                </td>
                <td class="num harga">Rp 0</td>
                <td class="num stok">-</td>
                <td><input type="number" name="qty[]" class="qty" min="1" value="1" required></td>
                <td class="num subtotal">Rp 0</td>
                <td><button type="button" class="btn btn-light btn-sm hapus" title="Hapus item">✕</button></td>
            </tr>
        </template>
    </div>

    <div class="card">
        <div class="card-header"><h2>Pembayaran</h2></div>
        <div class="card-body" style="display:flex; gap:28px; align-items:flex-start">
            <div class="form-grid" style="flex:1; grid-template-columns: repeat(2, 1fr)">
                <div>
                    <label for="jasa">Biaya Jasa</label>
                    <input id="jasa" type="number" name="biaya_jasa" min="0" step="500" value="50000">
                </div>
                <div>
                    <label for="diskon">Diskon</label>
                    <input id="diskon" type="number" name="diskon" min="0" step="500" value="0">
                </div>
                <div>
                    <label for="metode">Metode Pembayaran</label>
                    <select id="metode" name="metode_pembayaran">
                        <option value="cash">Tunai</option>
                        <option value="transfer">Transfer</option>
                        <option value="debit">Kartu Debit</option>
                        <option value="credit">Kartu Kredit</option>
                    </select>
                </div>
                <div>
                    <label for="status">Status Pembayaran</label>
                    <select id="status" name="status_pembayaran">
                        <option value="paid">Lunas</option>
                        <option value="unpaid">Belum Bayar</option>
                    </select>
                </div>
                <div class="span-2">
                    <label for="catatan">Catatan</label>
                    <input id="catatan" type="text" name="catatan" placeholder="Opsional">
                </div>
            </div>
            <table class="summary">
                <tr><td>Subtotal Suku Cadang</td><td class="num" id="sum-part">Rp 0</td></tr>
                <tr><td>Biaya Jasa</td><td class="num" id="sum-jasa">Rp 0</td></tr>
                <tr><td>Diskon</td><td class="num" id="sum-diskon">- Rp 0</td></tr>
                <tr><td>PPN 10%</td><td class="num" id="sum-pajak">Rp 0</td></tr>
                <tr class="total"><td>Total Bayar</td><td class="num" id="sum-total">Rp 0</td></tr>
            </table>
        </div>
    </div>

    <div class="form-footer">
        <a class="btn btn-light" href="penjualan.php">Batal</a>
        <button class="btn btn-success" type="submit">Simpan Transaksi</button>
    </div>
</form>
<?php require __DIR__ . '/includes/footer.php'; ?>
