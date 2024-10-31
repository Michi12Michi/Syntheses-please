const max_available_slots = 3;
const occupied_slots = 2;
// localStorage.length;

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
            continue_btn.addEventListener("click", function() {selectSlot(occupied_slots);});
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
    }
});

// inizia il gioco passando lo slot
function initGame(slot) {
    // TODO: inizializza il GO
    
    document.querySelector("#navigator").pushPage("main.html");
}

function selectSlot() {
    document.querySelector("#navigator").pushPage("slots.html");
}

function readCredits() {
    document.querySelector("#navigator").pushPage("credits.html");
}