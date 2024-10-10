class Materiale {
    constructor(id, nome, contenitore) {
        // costruisce un materiale con id e nome nel contenitore HTML specificato
        this.id = id;
        this.nome = nome;
        this.contenitore = contenitore;
        this.HTMLelement = this.createElement();
        this.initDrag();
    }

    createElement() {
        const container = document.body.querySelector(this.contenitore);
        const item = document.createElement('div');
        item.classList.add("item");
        item.setAttribute("draggable", "true");
        item.setAttribute("data-nome", this.nome);
        const span = document.createElement("span");
        span.innerHTML = this.nome;
        item.appendChild(span);
        container.appendChild(item);
        return item;
    }

    initDrag() {
        this.HTMLelement.addEventListener('dragstart', (e) => {
            e.dataTransfer.setData('element', this.nome);
        });

        // Aggiungi un listener per l'evento dragend
        this.HTMLelement.addEventListener('dragend', (e) => {
            // Controlla se l'elemento è stato rilasciato fuori dall'area lavoro
            const lavoroArea = document.getElementById('lavoro');
            const isOutside = !lavoroArea.contains(e.target);

            if (isOutside) {
                this.remove(); // Rimuovi l'elemento dal DOM
            }
        });
    }

    onDiscover() {
        // Presenta una animazione carina
        console.log("Sto cazzo");
    }

    remove() {
        this.HTMLelement.remove();
        delete this;
    }
}

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
            if (page === "menu") {
                const existingScript = document.querySelector('script[data-page]');
                if (existingScript) 
                    existingScript.remove();
                const existingCSS = document.querySelector("link[data-page]");
                if (existingCSS)
                    existingCSS.remove();
            }
            else {
                const newScript = document.createElement("script");
                const newCSS = document.createElement("link");
                newScript.setAttribute("src", `./js/${page}.js`);
                newScript.setAttribute("data-page", page);
                newCSS.href = `./css/${page}.css`;
                newCSS.rel = "stylesheet";
                newCSS.setAttribute("data-page", page);
                document.head.appendChild(newCSS);
                document.body.appendChild(newScript);
            }
        })
        .catch(error => {
            console.error(`Errore nel caricamento della pagina: ${error}`);
            document.getElementById('app').innerHTML = '<h1>Errore: pagina non trovata</h1>';
        });
}