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

            // Rimuove file CSS e JS specifici
            const existingScript = document.querySelector('script[data-page]');
            if (existingScript) 
                existingScript.remove();
            const existingCSS = document.querySelector("link[data-page]");
            if (existingCSS && (existingCSS.data !== page)) {
                console.log("Sto facendo la rimozione di un css");
                existingCSS.remove();
            }
        })
        .catch(error => {
            console.error(`Errore nel caricamento della pagina: ${error}`);
            document.getElementById('app').innerHTML = '<h1>Errore: pagina non trovata</h1>';
        });
}