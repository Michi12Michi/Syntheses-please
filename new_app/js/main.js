function loadPage(page) {
    fetch(`./${page}.html`)
        .then(response => {
            // Controlla se la risposta è OK
            if (!response.ok) {
                throw new Error(`Errore: ${response.statusText}`);
            }
            return response.text();
        })
        .then(html => {
            // Aggiorna il contenuto di #app
            document.getElementById('app').innerHTML = html;
            console.log("Caricamento della pagina:", page);

            // Rimuove e carica il file JS specifico
            const existingScript = document.querySelector('script[data-page]');
            if (existingScript) existingScript.remove();

            const script = document.createElement('script');
            script.src = `./js/src/${page}.js`; 
            script.setAttribute('data-page', page);
            document.body.appendChild(script);
        })
        .catch(error => {
            console.error(`Errore nel caricamento della pagina: ${error}`);
            document.getElementById('app').innerHTML = '<h1>Errore: pagina non trovata</h1>';
        });
}

document.addEventListener('DOMContentLoaded', function() {
    const startGameButton = document.getElementById('start-game');
    const creditsButton = document.getElementById('credits');

    if (startGameButton) {
        startGameButton.addEventListener('click', function() {
            loadPage('game'); 
        });
    }

    if (creditsButton) {
        creditsButton.addEventListener('click', function() {
            loadPage('credits'); 
        });
    }
});
