const max_available_slots = 3;
var occupied_slots = 2; // TODO: in realtà è localStorage.length; almeno non finché non finisce il test
var db = null;
// DIO PORCO

document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() { // TODO: perché non facciamo questo controllo nel gameobject? Perché forse può servire già prima il DB (crediti, funfact)
    const platform = cordova.platformId;
    
    if (platform === "browser") {
        // crea il database in memoria
        db = window.sqlitePlugin.openDatabase({
            name: 'chimgio.db',
            location: "default"
        });
        initializeDatabase(db); // inizializza tabelle e dati
    } else if (platform === "android" || platform === "ios") {
        // apre il database dagli assets
        db = window.sqlitePlugin.openDatabase({
            name: 'chimgio.db',
            location: "default",
            createFromLocation: 1
        });
    }
}

document.addEventListener("init", function(event) {
    // recupero un fun fact dal db... 
    // window.sqlitePlugin.openDatabase({name: "chimgio.db", location: 1, createFromLocation: 1 }, (db) => {
        //     const fun_fact_query = `SELECT * FROM fun_facts ORDER BY RANDOM() LIMIT 1;`
        //     db.executeSql(fun_fact_query, [], (res) => {
        //         if (res.rows.length > 0) {
        //             const fun_fact = res.rows.item(0).?;
        //         }
        //     });
        // });
    if (event.target.id === "menu") {
        // ... e renderizzo sempre lo stesso
        // document.querySelector("#funfact").innerHTML(fun_fact);
        // inizializzo i pulsanti sulla base di eventuali dati salvati
        const div_to_append_to = document.querySelector("#menu .menu-div ons-button").parentNode;
        const credits_btn = document.querySelector("#menu .menu-div ons-button");
        if (occupied_slots) {
            var continue_btn = document.createElement("ons-button");
            continue_btn.setAttribute("modifier", "cta");
            continue_btn.textContent = "Riprendi partita";
            continue_btn.addEventListener("click", function() {selectSlot();});
            div_to_append_to.insertBefore(continue_btn, credits_btn);
            if (occupied_slots < max_available_slots) {
                var start_btn = document.createElement("ons-button");
                start_btn.setAttribute("modifier", "cta");
                start_btn.textContent = "Nuova partita";
                start_btn.addEventListener("click", function() {initGame(occupied_slots+1, db);});
                div_to_append_to.insertBefore(start_btn, credits_btn);
            }
        } else {
            var start_btn = document.createElement("ons-button");
            start_btn.setAttribute("modifier", "cta");
            start_btn.textContent = "Nuova partita";
            start_btn.addEventListener("click", function() {initGame(1, db);});
            div_to_append_to.insertBefore(start_btn, credits_btn);
        }  
    } else if (event.target.id === "slots") {
        renderSlots(occupied_slots);
    } else if (event.target.id === "credits") {
        // TODO: renderizza e stilizza la sezione crediti
        // window.sqlitePlugin.openDatabase({name: "chimgio.db", location: 1, createFromLocation: 1 }, (db) => {
        //     const credits_query = `SELECT * FROM credits;`
        //     db.executeSql(credits_query, [], (res) => {
        //         if (res.rows.length > 0) {
        //             for (let j = 0; j < res.rows.length; j++) {
        //                  document.querySelector(".credits-div").innerHTML += `<p>res.rows.item(j)</p>`;
        //              }
        //         }
        //     });
        // });
    }
});

// inizia il gioco 
function initGame(slot, db) {
    // inizializza il GO passando lo slot (stringa 1, 2, 3 da appendere alla dicitura Slot quando instanzio il GO)
    var g_obj = new GameObject(slot, db);

    document.querySelector("#navigator").pushPage("main.html");

    g_obj.afterPlayerInteraction();
}

function selectSlot() {
    document.querySelector("#navigator").pushPage("slots.html");
}

function readCredits() {
    document.querySelector("#navigator").pushPage("credits.html");
}

function renderSlots(slots) {
    // renderizza info salienti per ciascuno slot pieno
    if (slots) {
        document.querySelector("#slots .slots-div").innerHTML = "";
        for (let j = 0; j < slots; j++) {
            // const parsedSlotData = JSON.parse(localStorage.get(`Slot${j+1}`));
            // const slot_level = parsedSlotData.level;
            // const slot_exp = parsedSlotData.experience;
            // const slot_credit = parsedSlotData.credit;
            let card = document.createElement("ons-card");
            card.innerHTML = `
            <div class="title">Slot #${j+1}</div>
            <div class="content">
                <ons-fab onclick="initGame(${j+1})">
                    <i class="fa fa-play"></i>
                </ons-fab>
                <ons-fab onclick="deleteConfirm(${j+1})">
                    <i class="fa fa-trash"></i>
                </ons-fab>
            </div>`;
            document.querySelector("#slots .slots-div").appendChild(card);
        }
    } else {
        backToMenu();
    }
    
}

function backToMenu() {
    document.querySelector("#navigator").resetToPage("menu.html");
}

const deleteConfirm = function(to_delete) {
    ons.notification.confirm('Sei sicuro?', {buttonLabels: ["no", "sine"], title: "Comba"}).then(function(index) {
        // 0 annulla, 1 cancella
        if (index) {
            --occupied_slots;
            localStorage.setItem(`Slot${to_delete}`) = null;
        }
        renderSlots(occupied_slots);
    })
};