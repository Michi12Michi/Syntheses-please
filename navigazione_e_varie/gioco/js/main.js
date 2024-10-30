var signal = 0;

document.addEventListener("init", function(event) {
    // recupero un fun fact dal db e renderizzo
    if (event.target.id === "loading") {
        // window.sqlitePlugin.openDatabase({name: "chimgio.db", location: "default" }, (db) => {
        //     const fun_fact_query = `SELECT * FROM fun_facts ORDER BY RANDOM() LIMIT 1;`
        //     db.executeSql(fun_fact_query, [], (res) => {
        //         if (res.rows.length > 0) {
        //             document.querySelector("#funfact").innerHTML(res);
        //         }
        //     });
        // });
        // TODO: si dovrebbe istanziare il game object
        // simulo un grossolano caricamento
        setTimeout(() => {
            // a resetPage va allegato un segnale globale (dati esistenti/non esistenti) affinché siano renderizzati i giusti buttons
            document.querySelector("#navigator").resetToPage("menu.html", {data: {continue: true}});
        }, 10000); 
    } else if (event.target.id === "menu") {
        // recupero il segnale
        signal = event.target.data.continue
        if (signal == true) {
            // crea ed appende un pulsante "riprendi gioco" con la sua logica
            var continue_btn = document.createElement("ons-button");
            var div_to_append = document.querySelector("#menu .menu-div");
            continue_btn.setAttribute("modifier", "cta");
            continue_btn.textContent = "Riprendi";
            // TODO: appendere event listener per chiamare al click la ripresa del gioco
            div_to_append.insertAfter(continue_btn, div_to_append.firstChild);
            // TODO: appendere pulsante per resettare i dati salvati e iniziare da capo
            // la logica del pulsante nuovo gioco deve cambiare
        }
    }
});

function initGame() {
    document.querySelector("#navigator").pushPage("main.html");
}

function readCredits() {
    document.querySelector("#navigator").pushPage("credits.html");
}

// function backToMenu() {
//     document.querySelector("#navigator").popPage("menu.html", {data: {continue: signal}});
// }