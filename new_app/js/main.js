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

// La classe Gameobject dovrebbe contenere i progressi di tutto il gioco (livello, esperienza, soldi, reazioni fatte (id e quante volte in Map), 
// sostanze scoperte (le relative categorie sono istanziate dinamicamente all'avvio del gioco).
class GameObject {
    constructor() {
        this.level = 0;
        this.experience = 0;
        this.credit = 0;
        this.karma = 0;
        this.combination_done_list = new Map(); // salva id e numero di volte di una data combinazione con set(), recupera con get()
        this.material_discovered_list = [];
        this.material_to_combine_list = [];
    }

    addMaterialToReactor(material) {
        if (this.material_to_combine_list.length < max_items_per_combination && this.material_to_combine_list.length > 1) {
            this.material_to_combine_list.push(material);
            // ci può stare una certa animazione (ad esempio un pop up che mostra che è stato aggiunto qualcosa)
            this.checkReactor();
        }
    }

    emptyReactor() {
        this.material_to_combine_list = [];
    }

    checkReactor() {
        // la funzione deve controllare con una query se gli elementi, senza ordine alcuno, creano un nuovo composto
        // suppongo che la query sia sempre la stessa
        // ----------------------
        // SERVE VERIFICARE SE ABBIAMO UN LIVELLO IDONEO?
        // ----------------------
        // NECESSITA INTERVENTO DI COMBY
        // la query sottostante dovrebbe essere una sottoquery e raggruppa per id le combinazioni che hanno la lista reagenti giusta
        // SELECT combination_id FROM combination_material WHERE material_id in (lista) AND product = 0 GROUP BY combination_id HAVING COUNT(material_id) = (lista)
        var query = 0;
        if (query) {
            // supponendo di aver reperito id, price ed experience del prodotto e id della combinazione
            let id_materiale = 1, price_materiale = 12, experience_materiale = 50, id_combinazione = 999;
            // in caso la COMBINAZIONE RISULTI POSITIVA, verifica se ho già fatto questa reazione
            // non ho bisogno di aggiornare la lista materiali nè l'esperienza, ma solo i soldi e la mappa reazioni
            // non ho bisogno di triggerare altro
            if (combination_done_list.has(id_combinazione)) {
                // sarà stata fatta un certo numero di volte, per cui aggiorno i soldi e la Map
                let times_reaction = this.combination_done_list.get(id_combinazione);
                // guadagno originale(4-volte)/(2+volte^2) ----> come suggeriva alessandro
                this.credit = this.credit + price_materiale*((4 - times_reaction)/(2 + Math.pow(times_reaction, 2)));
                this.combination_done_list.set(id_combinazione, times_reaction + 1);
                // dal momento che la tabella combinations ha un campo event_id, dovrei forse gestire la possibilità di un evento
                // domanda seria: ma questo accade ogni volta che viene condotta la stessa reazione? è giusto come comportamento?
            } else {
                // se non ho mai fatto la reazione aggiorno tutti i parametri
                // a) aggiorno lista reazioni fatte
                this.combination_done_list.set(id_combinazione, 1);
                // b) aggiorno soldi ed esperienza
                this.credit = this.credit + price_materiale;
                this.experience = this.experience + experience_materiale;
                // c) verificare se il composto non ce l'ho nella lista
                // non dovrei preoccuparmi del fatto che ce l'ho, perché ce l'ho già salvato
                if (!(this.material_discovered_list.has(id_materiale))) {
                    // QUI ENTRO SOLO SE IL COMPOSTO è STATO FATTO PER LA PRIMA VOLTA
                    this.material_discovered_list.push(id_materiale);
                    // dovrebbe partire una animazione standard di scopertauaochefigo e devo passare immagine e descrizione del materiale
                    // e dovrei anche verificare se appartiene ad una categoria che già ho sbloccato, no?
                    // faccio una query su material_category?
                    // in caso la categoria ce l'ho, sti cazzi, altrimenti devo chiamare Categoria(id_cat) per il rendering

                    // qui dovrei capire se questo composto triggera un evento in particolare, quindi devo fare una 
                    // query su materials per ottenere trigger_event
                }
            }
           
            // finalmente svuoto il reattore
            this.empty();
        } else {
            if (this.material_to_combine_list.length == max_items_per_combination)
                this.empty();
        }
    }
}