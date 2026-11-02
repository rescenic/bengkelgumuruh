// Pendaftaran service worker dan tombol "Pasang Aplikasi" (PWA).
(function () {
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('sw.js').catch((err) => console.warn('Service worker gagal didaftarkan:', err));
        });
    }

    let promptPasang = null;
    const tombol = document.getElementById('btn-install');

    window.addEventListener('beforeinstallprompt', (e) => {
        e.preventDefault();            // tampilkan tombol sendiri, bukan banner bawaan
        promptPasang = e;
        if (tombol) tombol.hidden = false;
    });

    if (tombol) {
        tombol.addEventListener('click', async () => {
            if (!promptPasang) return;
            promptPasang.prompt();
            await promptPasang.userChoice;
            promptPasang = null;
            tombol.hidden = true;
        });
    }

    window.addEventListener('appinstalled', () => {
        if (tombol) tombol.hidden = true;
    });
})();
