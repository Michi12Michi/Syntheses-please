class Materiale {
    constructor(nome, contenitore, appena_scoperto) {
        // costruisce un materiale con nome nel contenitore HTML specificato
        this.nome = nome;
        this.contenitore = contenitore;
        this.HTMLelement = this.creaMateriale(); // ritorna qualcosa come <div class="item" draggable="true" data-nome="nome"><span>nome</span></div>
        this.initDrag();
        if (appena_scoperto)
            this.onDiscover();
    }

    creaMateriale() {
        const item = document.createElement('div');
        item.classList.add("item");
        item.setAttribute("draggable", "true");
        item.setAttribute("data-nome", this.nome);
        const span = document.createElement("span");
        span.innerHTML = this.nome;
        item.appendChild(span);
        this.contenitore.appendChild(item);
        return item;
    }

    initDrag() {
        this.HTMLelement.addEventListener('dragstart', (e) => {
            console.log("started drag and drop");
            console.log(e);
            e.dataTransfer.setData('nome', this.nome);
        });
    }

    onDiscover() {
        // Presenta una animazione carina
        console.log("Sto cazzo");
    }

    remove() {
        this.HTMLelement.remove();
        // this = null; ---> speravo che funzionasse l'autoeliminazione dell'oggetto e invece no
    }
}

class Categoria {
    constructor(nome) {
        this.nome = nome;
        this.HTMLelement = this.creaCategoria();
        // Per la renderizzazione dei materiali corrispondenti nella sezione materiali:
        this.HTMLelement.addEventListener("click", function() {console.log("Porco dio")});
        this.items = []; // --> array di Materiale
    }

    creaCategoria() {
        const container = document.querySelector("div#categorie");
        const item = document.createElement('div');
        item.classList.add("item");
        item.innerHTML = this.nome;
        container.appendChild(item);
        return item;
    }
}

// Nella classe Gameobject vorrei che venissero salvati i progressi di tutto il gioco (livello, esperienza, soldi, reazioni fatte)
class GameObject {
    constructor() {

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