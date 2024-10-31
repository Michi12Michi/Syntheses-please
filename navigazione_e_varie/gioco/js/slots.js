const div_container = document.querySelector("#slots .slots-div");

// renderizzo solo gli slot occupati
for (let i = 0; i < occupied_slots; i++) {
    alert(i);
    renderSlot(i);
}

// renderizza una card con le proprietà salienti del salvataggio (se ci sono dati)
function renderSlot(a) {
    let card = document.createElement("ons-card");
    let title = document.createElement("div .title");
    title.innerText = "Ciao";
    div_container.appendChild(card);
}

function backToMenu() {
    document.querySelector("#navigator").resetToPage("main.html");
}


/* <ons-fab>
<i class="fa fa-trash" aria-hidden="true"></i>
</ons-fab>
<ons-fab>
<i class="fa fa-play"></i>
</ons-fab> */