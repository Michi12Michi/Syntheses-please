// ---------- UTILS ----------
const max_items_per_combination = 5;

// -> implementa la modalità schermo intero su più piattaforme
var screen = document.documentElement;

function openFullscreen() {
    if (screen.requestFullscreen) {
    screen.requestFullscreen();
    } else if (screen.webkitRequestFullscreen) { /* Safari */
    screen.webkitRequestFullscreen();
    } else if (screen.msRequestFullscreen) { /* IE11 */
    screen.msRequestFullscreen();
    }
}

// ROUTER
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

// -> verifica il tipo di dispositivo e istanzia eventi generici (per il drag and drop)
let deviceType = "unknown";

const isTouchDevice = () => {
    return ('ontouchstart' in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0);
};

// Funzione per rilevare il tipo di dispositivo (mobile o desktop)
const detectDeviceType = () => {
    if (isTouchDevice()) {
        deviceType = "mobile";
    } else {
        deviceType = "desktop";
    }
    console.log(deviceType);
    return deviceType;
};

detectDeviceType();

var events = {
    desktop: {
        down: "mousedown",
        up: "mouseup",
        move: "mousemove",
    }, 
    mobile: {
        down: "touchstart",
        up: "touchend",
        move: "touchmove",
    }
};

// -> definizione di classi di gioco

// class Materiale {
//     constructor(nome, contenitore, appena_scoperto) {
//         // costruisce un materiale con nome nel contenitore HTML specificato
//         this.nome = nome;
//         this.contenitore = contenitore;
//         this.HTMLelement = this.creaMateriale(); // ritorna qualcosa come <div class="item" draggable="true" data-nome="nome"><span>nome</span></div>
//         this.initDrag();
//         if (appena_scoperto)
//             this.onDiscover();
//     }

//     creaMateriale() {
//         const item = document.createElement('div');
//         item.classList.add("item");
//         item.setAttribute("draggable", "true");
//         item.setAttribute("data-nome", this.nome);
//         const span = document.createElement("span");
//         span.innerHTML = this.nome;
//         item.appendChild(span);
//         this.contenitore.appendChild(item);
//         return item;
//     }

//     initDrag() {
//         this.HTMLelement.addEventListener('dragstart', (e) => {
//             e.dataTransfer.setData('nome', this.nome);
//         });
//     }

//     onDiscover() {
//         // Presenta una animazione carina
//         console.log("Sto cazzo");
//     }

//     remove() {
//         this.HTMLelement.remove();
//         // this = null; ---> speravo che funzionasse l'autoeliminazione dell'oggetto e invece no
//     }
// }

class Categoria {
    constructor(nome) {
        this.nome = nome;
        this.HTMLelement = this.renderizzaCategoria();
        // Per la renderizzazione dei materiali corrispondenti nella sezione materiali:
        this.HTMLelement.addEventListener("click", this.mostraMateriali);
    }

    renderizzaCategoria() {
        let item = document.createElement('div');
        item.classList.add("categoria");
        item.innerHTML = this.nome;
        divCategorie.appendChild(item);
        return item;
    }

    mostraMateriali() {
        // svuoto eventuali materiali
        divMateriali.innerHTML = "";
        // si rende necessario interrogare il DB, congiuntamente all'oggetto GameObject, per renderizzare i materiali appropriati
    }
}

class Combination {
    constructor() {
        // l'elemento fondamentale è una lista di ID corrispondenti alle sostanze nel DB
        this.elements_list = [];
    }

    add_material(material) {
        if (this.elements_list.length < max_items_per_combination && this.elements_list.length > 1) {
            this.elements_list.push(material);
            // ci può stare una certa animazione (ad esempio un pop up che mostra che è stato aggiunto qualcosa)
            this.check();
        }
    }

    check() {
        // la funzione deve controllare con una query se gli elementi, senza ordine alcuno, creano un nuovo composto
        var query = 0;
        if (query) {
            // in caso positivo, verifica se il nuovo composto l'ho già scoperto (animazione se nuovo, via instanza)
            // ...
            // aggiorna il punteggio, l'esperienza o quello che è, nell'oggetto GameObject (verificando se la reazione è nuova)
            // ...
            // peraltro, i $ dovrebbero diminuire se la stessa reazione viene ripetuta
            this.empty();
        } else {
            if (this.elements_list.length == max_items_per_combination)
                this.empty();
        }
    }

    empty() {
        this.elements_list = [];
    }
}


// La classe Gameobject dovrebbe contenere i progressi di tutto il gioco (livello, esperienza, soldi, reazioni fatte, 
// sostanze scoperte (le relative categorie sono istanziate dinamicamente all'avvio del gioco).
class GameObject {
    constructor() {
        this.level = 0;
        this.experience = 0;
        this.credit = 0;
        this.reaction_list = new Map(); // salva id e numero di volte con set()
        this.elements_list = [];
    }


}