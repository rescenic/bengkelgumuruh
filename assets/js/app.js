// =====================================================================
// 1. Pencarian AJAX (live search) untuk semua halaman daftar
//    Form dengan class .live-form dikirim lewat fetch() setiap kali input
//    berubah (debounce 300 ms). Server membalas JSON {total, html} lalu
//    isi <tbody> diganti tanpa memuat ulang halaman.
// =====================================================================
(function () {
    document.querySelectorAll('form.live-form').forEach((form) => {
        const input = form.querySelector('.live-search');
        const target = document.querySelector(input.dataset.target);
        const counter = form.querySelector('.live-count');
        let timer = null;
        let controller = null;

        async function cari() {
            const params = new URLSearchParams(new FormData(form));
            const url = window.location.pathname + '?' + params.toString();
            params.set('ajax', '1');

            if (controller) controller.abort(); // batalkan request sebelumnya
            controller = new AbortController();
            target.classList.add('loading');

            try {
                const res = await fetch(window.location.pathname + '?' + params.toString(), {
                    headers: { 'X-Requested-With': 'XMLHttpRequest' },
                    signal: controller.signal,
                });
                if (res.status === 401) { window.location = 'login.php'; return; }
                const json = await res.json();
                target.innerHTML = json.html;
                if (counter) counter.textContent = json.total + ' data';
                history.replaceState(null, '', url); // simpan kata kunci di URL
            } catch (err) {
                if (err.name !== 'AbortError') console.error(err);
            } finally {
                target.classList.remove('loading');
            }
        }

        const tunda = () => { clearTimeout(timer); timer = setTimeout(cari, 300); };
        form.addEventListener('input', tunda);
        form.addEventListener('change', tunda);
        form.addEventListener('submit', (e) => { e.preventDefault(); cari(); });
    });
})();

// =====================================================================
// 2. Formulir transaksi penjualan: tambah/hapus item & hitung total
// =====================================================================
(function () {
    const form = document.getElementById('form-penjualan');
    if (!form) return;

    const PPN = 0.10;
    const body = document.getElementById('item-body');
    const template = document.getElementById('item-template');
    const rupiah = (n) => 'Rp ' + Math.round(n).toLocaleString('id-ID');
    const angka = (el) => parseFloat(el.value) || 0;

    function hitung() {
        let subtotalPart = 0;
        body.querySelectorAll('tr').forEach((tr) => {
            const opt = tr.querySelector('.part').selectedOptions[0];
            const harga = opt ? parseFloat(opt.dataset.harga || 0) : 0;
            const stok = opt && opt.dataset.stok ? parseInt(opt.dataset.stok, 10) : null;
            const qtyInput = tr.querySelector('.qty');
            if (stok !== null) qtyInput.max = stok;
            const sub = harga * angka(qtyInput);
            subtotalPart += sub;
            tr.querySelector('.harga').textContent = rupiah(harga);
            tr.querySelector('.stok').textContent = stok === null ? '-' : stok;
            tr.querySelector('.subtotal').textContent = rupiah(sub);
        });

        const jasa = angka(document.getElementById('jasa'));
        const diskon = angka(document.getElementById('diskon'));
        const dpp = Math.max(0, subtotalPart + jasa - diskon);
        const pajak = dpp * PPN;

        document.getElementById('sum-part').textContent = rupiah(subtotalPart);
        document.getElementById('sum-jasa').textContent = rupiah(jasa);
        document.getElementById('sum-diskon').textContent = '- ' + rupiah(diskon);
        document.getElementById('sum-pajak').textContent = rupiah(pajak);
        document.getElementById('sum-total').textContent = rupiah(dpp + pajak);
    }

    function tambahItem() {
        body.appendChild(template.content.cloneNode(true));
        hitung();
    }

    document.getElementById('tambah-item').addEventListener('click', tambahItem);
    body.addEventListener('click', (e) => {
        if (e.target.classList.contains('hapus') && body.children.length > 1) {
            e.target.closest('tr').remove();
            hitung();
        }
    });
    form.addEventListener('input', hitung);
    form.addEventListener('change', hitung);

    tambahItem();
})();
