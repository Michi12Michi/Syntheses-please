document.addEventListener("init", function(event) {
    // TODO: si dovrebbe istanziare il game object --> forse devo mettere a livello globale la sua definizione di classe
    if (event.target.id === "loading") {
        // simulo un grossolano caricamento
        setTimeout(() => {
            // TODO: a resetPage va allegato un segnale (dati esistenti/non esistenti) affinché siano renderizzati i giusti buttons
            document.querySelector("#navigator").resetToPage("menu.html", {continue: null});
        }, 2000); 
    }
});

function initGame() {
    document.querySelector("#navigator").pushPage("main.html");
}

function readCredits() {
    document.querySelector("#navigator").pushPage("credits.html");
}

function backToMenu() {
    document.querySelector("#navigator").popPage("menu.html");
}