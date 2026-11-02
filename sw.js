/*
 * Service worker Bengkel Gumuruh.
 *
 * - Aset statis (CSS, JS, ikon) disimpan di cache dan diperbarui di latar belakang.
 * - Halaman PHP TIDAK disimpan di cache karena berisi data transaksi dan sesi login.
 *   Bila jaringan putus saat membuka halaman, ditampilkan offline.html.
 * - Permintaan POST dan pencarian AJAX (?ajax=1) selalu langsung ke server.
 *
 * Naikkan VERSI setiap kali aset statis berubah agar cache lama dibersihkan.
 */
const VERSI = 'bengkel-gumuruh-v1';
const ASET = [
  'offline.html',
  'manifest.json',
  'assets/css/style.css',
  'assets/js/app.js',
  'assets/js/pwa.js',
  'assets/img/logo.svg',
  'assets/img/icon-192.png',
  'assets/img/icon-512.png',
  'assets/img/favicon-32.png',
];

self.addEventListener('install', (event) => {
  event.waitUntil(caches.open(VERSI).then((cache) => cache.addAll(ASET)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(keys.filter((k) => k !== VERSI).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const req = event.request;
  const url = new URL(req.url);

  if (req.method !== 'GET' || url.origin !== self.location.origin) return;
  if (url.searchParams.get('ajax') === '1') return;

  // Navigasi halaman: selalu dari jaringan, cadangan halaman offline.
  if (req.mode === 'navigate') {
    event.respondWith(fetch(req).catch(() => caches.match('offline.html')));
    return;
  }

  // Aset statis: stale-while-revalidate.
  if (/\.(css|js|png|jpg|svg|ico|json|webp|woff2?)$/i.test(url.pathname)) {
    event.respondWith(
      caches.open(VERSI).then(async (cache) => {
        const cached = await cache.match(req);
        const network = fetch(req)
          .then((res) => {
            if (res.ok && res.type === 'basic') cache.put(req, res.clone());
            return res;
          })
          .catch(() => cached);
        return cached || network;
      })
    );
  }
});
