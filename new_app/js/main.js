// PLUGIN CORDOVA
// https://github.com/storesafe/cordova-sqlite-storage?tab=readme-ov-file

// CONST
const max_items_per_combination = 5;

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

    afterPlayerInteraction() { // istruzioni in ./afterPlayerInteraction.txt

        // TODO: carica tutte le quest del livello dal DB
        // `SELECT `;

        // TODO: controlla se c'è qualche materiale tra quelli scoperti che porta al game over o eccezioni varie
        
        // salva lo stato attuale del gioco (combinazioni e materiali scoperti, quest terminate)
        let temp_combination_done_list = this.combination_done_list, temp_quest_done_list = this.quest_done_list, temp_material_discovered_list = this.material_discovered_list;
    
        // tra le quest accettate, chiudi positivamente quelle le cui condizioni sono raggiunte; le condizioni per chiuderle negativamente sono direttamente conseguenti attività dell'utente, come il passaggio di livello e il rifiuto. Verranno trattate separatamente
        this.quest_active_list.forEach(element => {
            // TODO: per ogni quest accettata controlla le condizioni di riuscita sul DB
            // query = `SELECT * FROM quests WHERE id = element;`
            // if (this.material_discovered_list.includes(query.objective_material)) {
                // TODO: gestisci le conseguenze delle quest terminate positivamente (aggiorna $, materiali, exp)
                // this.credit += ;
                // this.experience += ;
            //}
        });

        if (this.combination_done_list == temp_combination_done_list && this.quest_done_list == temp_quest_done_list  && this.material_discovered_list == temp_material_discovered_list) {
            // quando terminano i cambiamenti, salva lo stato del gioco come JSON
            this.saveGameData(); 

            // TODO: gestisci tutti i rendering: dei dialoghi delle quest completate positivamente, delle quest attivabili o attive, dei materiali, delle categorie, degli acquistabili, di exp e $

            this.checkNextLevel(); // TODO: esegue il rendering del tasto per il passaggio (true) - o lo rimuove se presente (false)
        } else { 
            // se lo stato del gioco è cambiato, riesegui questa funzione
            this.afterPlayerInteraction();
        }
    }

    checkNextLevel() {  // controlla l'esistenza nel DB delle condizioni per passare al livello successivo, se esiste (quest, materiali, esperienza) e restituisce un booleano
        const query_next_level = `
            SELECT l.*, lm.material_id 
            FROM levels l 
            LEFT JOIN level_material lm ON l.number = lm.level_id 
            WHERE l.number = ?
        `;
        const next_level = this.level + 1;

        return new Promise((resolve) => {
            window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
                db.executeSql(query_next_level, [next_level], (rs) => {
                    if (rs.rows.length > 0) {
                        const level_info = rs.rows.item(0);
                        
                        // controlla se esperienza e quest sono sufficienti
                        if (this.experience >= level_info.required_experience && this.quest_done_list.has(level_info.quest_required)) {
    
                            // controlla se tutti i materiali richiesti sono stati scoperti
                            const required_materials = [];
                            for (let i = 0; i < rs.rows.length; i++) {
                                const materialId = rs.rows.item(i).material_id;
                                if (materialId) required_materials.push(materialId);
                            }
    
                            // verifica che ogni materiale richiesto sia nella lista dei materiali scoperti
                            const all_materials_discovered = required_materials.every(materialId =>
                                this.material_discovered_list.includes(materialId)
                            );
    
                            if (all_materials_discovered) {
                                resolve(true);
                                return;
                            }
                        }
                    }
                    resolve(false);
                });
            });
        });
    }

    goToNextLevel() { // corrisponde al giocatore che clicca per decidere di avanzare di livello: fallisce tutte le quest attive e gestisce le conseguenze dirette (materiali aggiunti, modifica exp e $)
        window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
        
            // svuota la lista delle quest attive e registra le quest fallite in `quest_done_list`
            this.quest_active_list.forEach((questId) => {
                this.quest_done_list.set(questId, 0); // 0 indica fallimento della quest
                
                // query per ottenere materiali legati alla quest fallita e il credito da aggiungere
                const query_quest_material = `
                    SELECT qm.material_id, q.money_added_failure 
                    FROM quest_material qm 
                    JOIN quests q ON qm.quest_id = q.id 
                    WHERE qm.quest_id = ? AND qm.success = 0
                `;
                
                db.executeSql(query_quest_material, [questId], (res) => {
                    if (res.rows.length > 0) {
                        // aggiorna i crediti in base alle penalità della quest fallita
                        this.credit += res.rows.item(0).money_added_failure;
    
                        // aggiungi i materiali ottenuti dalle quest fallite alla lista material_discovered_list
                        for (let i = 0; i < res.rows.length; i++) {
                            const material_id = res.rows.item(i).material_id;
                            if (!this.material_discovered_list.includes(material_id)) {
                                this.material_discovered_list.push(material_id);
                            }
                        }
                    }
                });
            });
        });
        
        // passa al livello successivo
        this.level++;

        // controllo degli avvenimenti successivi
        this.afterPlayerInteraction();
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
                    // se non ho mai fatto la reazione aggiorno tutti i parametri*
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
            afterPlayerInteraction(); // controlla a cosa porteranno questi cambiamenti nello stato del gioco
        } else {
            // la combinazione non ha portato a frutti
            if (this.material_to_combine_list.length == max_items_per_combination)
                this.empty();
        }
    }
}