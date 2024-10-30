// PLUGIN CORDOVA
// https://github.com/storesafe/cordova-sqlite-storage?tab=readme-ov-file

// CONST
const max_items_per_combination = 5;
const max_unuseful_combinations = 3;

// La classe Gameobject dovrebbe contenere i progressi di tutto il gioco (livello, esperienza, soldi, reazioni fatte (id e quante volte in Map), 
// sostanze scoperte (le relative categorie sono istanziate dinamicamente all'avvio del gioco).
class GameObject {
    constructor() {
        const savedData = localStorage.getItem("gameData");
        if (savedData) {
            const parsedData = JSON.parse(savedData);
            this.level = parsedData.level;
            this.like = parsedData.like;
            this.experience = parsedData.experience;
            this.credit = parsedData.credit;
            this.combination_done_list = new Map(parsedData.combination_done_list); 
            this.unuseful_combinations = parsedData.unuseful_combinations;
            this.quest_done_list = new Map(parsedData.quest_done_list);
            this.quest_active_list = parsedData.quest_active_list;
            this.material_discovered_list = parsedData.material_discovered_list;
            this.material_to_combine_list = [];
        } else {
            this.level = 0;
            this.like = 0;
            this.experience = 0;
            this.credit = 0;
            this.combination_done_list = new Map(); // salva id e numero di volte di una data combinazione con set(), recupera con get()
            this.unuseful_combinations = 0;
            this.quest_done_list = new Map(); // salva id quest e booleano (o int 0/1)
            this.quest_active_list = [];
            this.material_discovered_list = [];
            this.material_to_combine_list = [];
        }
    }

    gameOver(material_name) { // il nome comune del materiale rappresenta il tipo di finale
        switch (material_name) {
            case "esplosione":
                alert("BOOM!");
                break;
        
            default:
                alert("GAME OVER!");
                break;
        }
    }

    afterPlayerInteraction() { // istruzioni in ./afterPlayerInteraction.txt
        // controlla l'esistenza di materiali che portano al game over
        const query_game_over = `
            SELECT *
            FROM materials
            WHERE iupac_name LIKE '%gameover%'
        `;

        window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
            db.executeSql(query_game_over, [], (rs) => {
                if (rs.rows.length > 0) {
                    rs.rows.forEach((row) => {
                        // controlla se l'ID del materiale è in `material_discovered_list`
                        if (this.material_discovered_list.has(row.id)) {
                            gameOver(row.common_name);
                            return;
                        }
                    });
                }
            });
        });

        // carica tutte le quest del livello dal DB, cioè tutte le righe nella tabella quest in cui level_when_active == this.level. Salva solo gli id delle righe ottenute in this.quest_active_list (prima svuota l'array)
        const query_quests_for_level = `
            SELECT id
            FROM quest
            WHERE level_when_active = ?
        `;

        window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
            db.executeSql(query_quests_for_level, [this.level], (rs) => {
                // svuota l'array prima di aggiungere le nuove quest
                this.quest_active_list = [];

                // aggiunge gli ID delle quest al livello attuale in `quest_active_list`
                for (let i = 0; i < rs.rows.length; i++) {
                    const questId = rs.rows.item(i).id;
                    this.quest_active_list.push(questId);
                }
            });
        });

        // salva lo stato attuale del gioco (combinazioni e materiali scoperti, quest terminate)
        let temp_combination_done_list = this.combination_done_list, temp_quest_done_list = this.quest_done_list, temp_material_discovered_list = this.material_discovered_list;
    
        const query_quest_conditions = `
            SELECT *
            FROM quests
            WHERE id = ?
        `;

        // tra le quest accettate, chiudi positivamente quelle le cui condizioni sono raggiunte; le condizioni per chiuderle negativamente sono direttamente conseguenti attività dell'utente, come il passaggio di livello e il rifiuto. Verranno trattate separatamente
        this.quest_active_list.forEach((questId) => {        
            // apertura del database e recupero delle informazioni per ogni quest attiva
            window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
                db.executeSql(query_quest_conditions, [questId], (rs) => {
                    if (rs.rows.length > 0) {
                        const quest = rs.rows.item(0);
        
                        // verifica delle condizioni di riuscita della quest
                        const isMaterialDiscovered = this.material_discovered_list.includes(quest.objective_material);
                        const isCreditInRange = this.credit >= quest.minimum_money_required && this.credit <= quest.maximum_money_required;
                        const isLikeInRange = this.like >= quest.minimum_like_required && this.like <= quest.maximum_like_required;
        
                        if (isMaterialDiscovered && isCreditInRange && isLikeInRange) { // qui si accede se le condizioni sono raggiunte
                            // aggiornamento delle proprietà in base al successo della quest
                            this.like += quest.like_added_success;
                            this.credit += quest.money_added_success;
                            this.experience += quest.experience_added;
        
                            // recupera i nuovi materiali scoperti con join tra 'quest_material' e 'materials'
                            const query_new_materials = `
                                SELECT m.id
                                FROM quest_material qm
                                JOIN materials m ON qm.material_id = m.id
                                WHERE qm.quest_id = ? AND qm.success = 1
                            `;
        
                            db.executeSql(query_new_materials, [questId], (rsMaterials) => {
                                for (let i = 0; i < rsMaterials.rows.length; i++) {
                                    const materialId = rsMaterials.rows.item(i).id;
                                    
                                    // aggiungi il materiale scoperto solo se non è già presente nella lista
                                    if (!this.material_discovered_list.includes(materialId)) {
                                        this.material_discovered_list.push(materialId);
                                    }
                                }
                            });
                        }
                    }
                });
            });
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
                    SELECT qm.material_id, q.money_added_failure, q.like_added_failure 
                    FROM quest_material qm 
                    JOIN quests q ON qm.quest_id = q.id 
                    WHERE qm.quest_id = ? AND qm.success = 0
                `;
                
                db.executeSql(query_quest_material, [questId], (res) => {
                    if (res.rows.length > 0) {
                        // aggiorna i crediti in base alle penalità della quest fallita
                        this.credit += res.rows.item(0).money_added_failure;
                        this.like += res.rows.item(0).like_added_failure;
    
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
            like: this.like,
            experience: this.experience,
            credit: this.credit,
            combination_done_list: Array.from(this.combination_done_list),
            unuseful_combinations: this.unuseful_combinations,
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
            // TODO: Alessandro suggeriva la renderizzazione di una reazione
            this.checkReactor();
        }
    }

    emptyReactor() {
        this.material_to_combine_list = [];
    }

    checkReactor() {
        // Controlla se gli elementi, senza ordine, creano un nuovo composto
        // creo placeholder
        const material_query = new Array(this.material_to_combine_list.length).fill("?").join(", ");
        // ottengo id combinazione e id materiale prodotto
        const query_existing_combination = `SELECT cm2.material_id, cm2.combination_id
                                            FROM combination_material cm2
                                            WHERE cm2.product = 1
                                            AND cm2.combination_id IN (
                                                SELECT cm1.combination_id
                                                FROM combination_material cm1
                                                WHERE cm1.product = 0
                                                AND cm1.material_id IN (${material_query})
                                                GROUP BY cm1.combination_id
                                                HAVING COUNT(*) = ?);`;
        
        window.sqlitePlugin.openDatabase({ name: "chimgio.db", location: "default" }, (db) => {
            db.executeSql(query_existing_combination, [this.material_to_combine_list, this.material_to_combine_list.length], (res) => {
                // megablocco risultato positivo con eventuali più elementi
                if (res.rows.length > 0) {
                    const successful_combination_id = res.rows.item(0).combination_id;
                    // recupero blog_id e level_id dalla combinazione
                    const query_combination_properties = `SELECT blog_id, level_id FROM combinations c WHERE c.id = ?;`
                    db.executeSql(query_combination_properties, [successful_combination_id], (combPropsRes) => {
                        const level_required_for_combination = combPropsRes.rows.item(0).level_id;
                        const which_blog_id = combPropsRes.rows.item(0).blog_id;
                        // TODO: a che serve ottenere il blog_id? Per puntare alla pagina di diario che descrive quella tipologia di reazioni
                        // 
                        // CONTROLLO LIVELLO RICHIESTO PER LA COMBINAZIONE (CHE RISULTA VALIDA, IN OGNI CASO)
                        //
                        if (level_required_for_combination <= this.level) {
                            // PROCEDO A RECUPERARE LE INFORMAZIONI SUI MATERIALI PRODOTTI
                            const placeholder = new Array(res.rows.length).fill("?").join(", ");
                            var produced_materials_id = new Array();
                            for (let i = 0; i < res.rows.length; i++) {
                                produced_materials_id.push(res.rows.item(i).material_id)
                            }
                            const query_product_properties = `SELECT * FROM materials WHERE id IN (${produced_materials_id});`;
                            // SELEZIONO LE PROPRIETà DEI PRODOTTI OTTENUTI E MI REGOLO SUGLI EFFETTI
                            db.executeSql(query_product_properties, [], (prodPropsRes) => {
                                // verifica se ho già fatto questa reazione
                                // non ho bisogno di aggiornare la lista materiali nè l'esperienza, ma solo i soldi e la mappa reazioni
                                // non ho bisogno di triggerare altro
                                // calcolo il guadagno totale e l'esperienza totale
                                var total_earn_from_combination = 0, total_experience = 0;
                                for (let j = 0; j < prodPropsRes.rows.length; j++) {
                                    total_earn_from_combination += prodPropsRes.rows.item(i).price;
                                    total_experience += prodPropsRes.rows.item(i).experience;
                                }
                                if (this.combination_done_list.has(successful_combination_id)) {
                                    // sarà stata fatta un certo numero di volte, per cui aggiorno i soldi e la Map
                                    let times_reaction = this.combination_done_list.get(successful_combination_id);
                                    // aggiorno il credito
                                    this.credit = this.credit + (total_earn_from_combination/prodPropsRes.rows.length)*((4 - times_reaction)/(2 + Math.pow(times_reaction, 2)));
                                    this.combination_done_list.set(successful_combination_id, times_reaction + 1);
                                } else {
                                    // se non ho mai fatto la reazione aggiorno tutti i parametri*
                                    // a) aggiorno lista reazioni fatte
                                    this.combination_done_list.set(successful_combination_id, 1);
                                    // b) aggiorno soldi ed esperienza (sommo solo il totale)
                                    this.credit = this.credit + total_earn_from_combination;
                                    this.experience = this.experience + total_experience;
                                    // c) verificare se i composti non sono nella lista this.material_discovered_list
                                    // se ci sono non me ne preoccupo
                                    // per oguno dei composti scoperti
                                    produced_materials_id.forEach(material => {
                                        if (!(this.material_discovered_list.has(material))) {
                                            // QUI ENTRO SOLO SE IL COMPOSTO è STATO FATTO PER LA PRIMA VOLTA 
                                            this.material_discovered_list.push(material);
                                            // dovrebbe partire una animazione standard di scopertauaochefigo e devo passare immagine e descrizione del materiale
                                            // TODO: funzione discoverMaterial() -> si potrebbero passare tutte le proprietà, oppure solo l'id per recuperare con 
                                            // una query tutto il necessario*
                                            // e dovrei anche verificare se appartiene ad una categoria che già ho sbloccato, no?
                                            // faccio una query su material_category?
                                            // in caso la categoria ce l'ho, sti cazzi, altrimenti devo chiamare Categoria(id_cat) per il rendering
                                        }
                                    });
                                }
                            });
                            
                        } else {
                            // NON VIENE SODDISFATTA LA CONDIZIONE DI LIVELLO RICHIESTA PER LA COMBINAZIONE
                            alert("Non hai le palle esatte");
                        }
                        // finalmente svuoto il reattore -> la combinazione è valida, anche in caso in cui non ci sia il livello.
                        this.empty();
                        this.unuseful_combinations = 0;
                        afterPlayerInteraction(); // controlla a cosa porteranno questi cambiamenti nello stato del gioco
                    });
                } else {
                    // la combinazione non ha portato a frutti
                    if (this.material_to_combine_list.length == max_items_per_combination)
                        this.unuseful_combinations++;
                        
                        if (this.unuseful_combinations >= max_unuseful_combinations) {
                            // TODO: GESTIRE IL CASO IN CUI CI SIANO STATE TOT COMBINAZIONI INFRUTTUOSE
                        }
                        this.empty();
                }
            });
        });
    }
}