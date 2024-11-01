const max_available_slots = 3;
var occupied_slots = 2; // TODO: in realtà è localStorage.length; almeno non finché non finisce il test
// DIO PORCO

document.addEventListener("init", function(event) {
    // recupero un fun fact dal db e renderizzo
    if (event.target.id === "menu") {
        // window.sqlitePlugin.openDatabase({name: "chimgio.db", location: "default" }, (db) => {
        //     const fun_fact_query = `SELECT * FROM fun_facts ORDER BY RANDOM() LIMIT 1;`
        //     db.executeSql(fun_fact_query, [], (res) => {
        //         if (res.rows.length > 0) {
        //             document.querySelector("#funfact").innerHTML(res);
        //         }
        //     });
        // });
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
                start_btn.addEventListener("click", function() {initGame(occupied_slots+1);});
                div_to_append_to.insertBefore(start_btn, credits_btn);
            }
        } else {
            var start_btn = document.createElement("ons-button");
            start_btn.setAttribute("modifier", "cta");
            start_btn.textContent = "Nuova partita";
            start_btn.addEventListener("click", function() {initGame(1);});
            div_to_append_to.insertBefore(start_btn, credits_btn);
        }  
    } else if (event.target.id === "slots") {
        renderSlots(occupied_slots);
    } else if (event.target.id === "credits") {
        // TODO: renderizza e stilizza la sezione crediti
        // window.sqlitePlugin.openDatabase({name: "chimgio.db", location: "default" }, (db) => {
        //     const credits_query = `SELECT * FROM credits;`
        //     db.executeSql(credits_query, [], (res) => {
        //         if (res.rows.length > 0) {
        //             
        //         }
        //     });
        // });
    }
});

// inizia il gioco 
function initGame(slot) {
    // TODO: inizializza il GO passando lo slot (stringa da appendere alla dicitura Slot quando instanzio il GO)
    // var player = new GameObject(slot)
    document.querySelector("#navigator").pushPage("main.html");
}

function selectSlot() {
    document.querySelector("#navigator").pushPage("slots.html");
}

function readCredits() {
    document.querySelector("#navigator").pushPage("credits.html");
}

function renderSlots(slots) {
    // TODO: leggere i dati degli slots: nome livello, crediti, esperienza, etc
    // TODO: si potrebbe anche usare dei modal di conferma cancellazione dello slot (aggiunti via eventlistener sul fab)
    if (slots) {
        document.querySelector("#slots .slots-div").innerHTML = "";
        for (let j = 0; j < slots; j++) {
            let card = document.createElement("ons-card");
            let title = document.createElement("div");
            title.classList.add("title");
            title.innerHTML = j+1;
            let content = document.createElement("div");
            content.classList.add("content");
            let continue_button = document.createElement("ons-fab");
            continue_button.innerHTML = `<i class="fa fa-play"></i>`;
            continue_button.addEventListener("click", function() {
                initGame(j+1);
            });
            let delete_button = document.createElement("ons-fab");
            delete_button.innerHTML = `<i class="fa fa-trash"></i>`;
            delete_button.addEventListener("click", function() {
                // TODO: cancellare il relativo oggetto in localstorage
                --occupied_slots;
                renderSlots(occupied_slots);
            });
            content.appendChild(continue_button);
            content.appendChild(delete_button);
            
            card.appendChild(title);
            card.appendChild(content);
            document.querySelector("#slots .slots-div").appendChild(card);
        }
    } else {
        backToMenu();
    }
    
}

function backToMenu() {
    document.querySelector("#navigator").resetToPage("menu.html");
}
