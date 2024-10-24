// ---------- UTILS ----------
const max_items_per_combination = 5;

/* TODO: 
Esistono solo 4 eventi che scandiscono il passare del tempo nel gioco, tutti determinati 
dall'interazione dell'utente col loop principale: 

1 - combinazione riuscita (prima volta o ennesima, nessuna differenza in questo contesto);
2 - acquisto nel negozio;
3 - quest accettata;
4 - passaggio al livello successivo (l'utente, quando ha i requisiti, può scegliere di farlo).

Ogni volta che avviene una delle quattro cose scritte sopra, direi di far girare la stessa identica
funzione OMNIFUNZIONE, così scriviamo il codice impegnativo una sola volta ed è molto più facile per test 
e debug. Inoltre, evitiamo ripetizioni.

Che dovrebbe fare questo codice nella OMNIFUNZIONE?

In ordine: 
1 - Gestire le quest (sempre nel game object, che salverà i dati JSON sul dispositivo), 
quindi visualizzare le nuove disponibili e concludere quelle riuscite o fallite (si tratta di 
controllare le condizioni di tutte le quest che abbiano come requisito il livello attuale del giocatore).
Segue sblocco di materiali, aggiornamento exp e $.
2 - Gestire il rendering degli acquistabili (1), dei materiali (2) e delle categorie (3) e in generale 
delle statistiche a schermo (sempre exp, $, livello).

Vorrei rimuovere completamente gli eventi, perché sono ridondanti per com'è organizzata ora la struttura
delle quest. Sempre nella OMNIFUNZIONE, ci mettiamo il riconoscimento per quest speciali tipo GAME OVER
che avranno una logica diversa da tutte le altre, ma saranno rarissime.

Per quanto riguarda GameObject.checkReactor(), direi che va benissimo. Inoltre, se seguiamo il 
ragionamento della OMNIFUNZIONE, checkReactor() è praticamente già pronta per funzionare. La query sql
dovrebbe funzionare alla grande.
*/

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
        const savedData = localStorage.getItem("gameData");
        if (savedData) {
            const parsedData = JSON.parse(savedData);
            this.level = parsedData.level;
            this.experience = parsedData.experience;
            this.credit = parsedData.credit;
            this.combination_done_list = new Map(parsedData.combination_done_list); 
            this.quest_done_list = new Map(parsedData.quest_done_list);
            this.quest_active_list = parsedData.quest_active_list;
            this.material_discovered_list = parsedData.material_discovered_list;
            this.material_to_combine_list = [];
        } else {
            this.level = 0;
            this.experience = 0;
            this.credit = 0;
            this.combination_done_list = new Map(); // salva id e numero di volte di una data combinazione con set(), recupera con get()
            this.quest_done_list = new Map(); // salva id quest e booleano (o int 0/1)
            this.quest_active_list = [];
            this.material_discovered_list = [];
            this.material_to_combine_list = [];
        }
    }

    saveGameData() {
        const dataToSave = {
            level: this.level,
            experience: this.experience,
            credit: this.credit,
            combination_done_list: Array.from(this.combination_done_list),
            quest_done_list: Array.from(this.quest_done_list),
            quest_active_list: this.quest_active_list,
            material_discovered_list: this.material_discovered_list,
        };
        localStorage.setItem("gameData", JSON.stringify(dataToSave));
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
        // Controlla se gli elementi, senza ordine, creano un nuovo composto
        const query_material_ids = this.material_to_combine_list.join(", ");
        const query_material_length = String(this.material_to_combine_list.length);
        // ottengo id combinazione e id materiale prodotto
        var query_existing_combination = `SELECT cm1.combination_id, cm2.material_id AS material_id_with_product_1
        FROM combination_material cm1
        JOIN combination_material cm2 ON cm1.combination_id = cm2.combination_id
        WHERE cm1.product = 0 AND cm1.material_id IN ${query_material_ids}
        AND cm2.product = 1
        /GROUP BY cm1.combination_id
        HAVING COUNT(DISTINCT cm1.material_id) = ${query_material_length};`
        if (query_existing_combination) {
            // recupero blog_id e level_id dalla combinazione
            let query_combination_properties = `SELECT blog_id, level_id FROM combinations c WHERE c.id = ...;` // TODO: INSERIRE ID COMBINAZIONE
            // il controllo vero e proprio sugli esiti della combinazione parte dal valutare il livello attuale
            if (0 <= this.level) { // TODO: INSERIRE IL LIVELLO DERIVANTE DALLA QUERY
                // recupero tutte le proprietà del prodotto
                let query_product_properties = `SELECT * FROM materials WHERE id = ...;`; // TODO: inserire id materiale prodotto
                let id_materiale = 1, price_materiale = 12, experience_materiale = 50, id_combinazione = 999;
                // verifica se ho già fatto questa reazione
                // non ho bisogno di aggiornare la lista materiali nè l'esperienza, ma solo i soldi e la mappa reazioni
                // non ho bisogno di triggerare altro
                if (combination_done_list.has(id_combinazione)) {
                    // sarà stata fatta un certo numero di volte, per cui aggiorno i soldi e la Map
                    let times_reaction = this.combination_done_list.get(id_combinazione);
                    // guadagno originale(4-volte)/(2+volte^2) ----> come suggeriva alessandro 
                    this.credit = this.credit + price_materiale*((4 - times_reaction)/(2 + Math.pow(times_reaction, 2)));
                    this.combination_done_list.set(id_combinazione, times_reaction + 1);
                } else {
                    // se non ho mai fatto la reazione aggiorno tutti i parametri* // TODO: qui vedo gli eventi della combinazione
                    // a) aggiorno lista reazioni fatte
                    this.combination_done_list.set(id_combinazione, 1);
                    // b) aggiorno soldi ed esperienza
                    this.credit = this.credit + price_materiale;
                    this.experience = this.experience + experience_materiale;
                    // c) verificare se il composto non ce l'ho nella lista
                    // non dovrei preoccuparmi del fatto che ce l'ho, perché ce l'ho già salvato
                    if (!(this.material_discovered_list.has(id_materiale))) {
                        // QUI ENTRO SOLO SE IL COMPOSTO è STATO FATTO PER LA PRIMA VOLTA // TODO: qui vedo gli eventi del nuovo materiale
                        this.material_discovered_list.push(id_materiale);
                        // dovrebbe partire una animazione standard di scopertauaochefigo e devo passare immagine e descrizione del materiale
                        // TODO: funzione discoverMaterial() -> si potrebbero passare tutte le proprietà, oppure solo l'id per recuperare con 
                        // una query tutto il necessario*
                        // e dovrei anche verificare se appartiene ad una categoria che già ho sbloccato, no?
                        // faccio una query su material_category?
                        // in caso la categoria ce l'ho, sti cazzi, altrimenti devo chiamare Categoria(id_cat) per il rendering
                    }
                }
            } else {
                console.log("Non hai livello coglioncello");
            }
            // finalmente svuoto il reattore -> la combinazione è valida, anche in caso in cui non ci sia il livello.
            this.empty();
        } else {
            // la combinazione non ha portato a frutti
            if (this.material_to_combine_list.length == max_items_per_combination)
                this.empty();
        }
    }
}