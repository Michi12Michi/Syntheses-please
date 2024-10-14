// console.log("Porco dio")

const lavoro = document.body.querySelector("div#lavoro");
const materiali = document.body.querySelector("div#materiali");
const categorie = document.body.querySelector("div#categorie");

[materiali, lavoro, categorie].forEach((element) => {
    element.addEventListener("dragover", (e) => {
        e.preventDefault();
    })
});

[materiali, categorie].forEach((element) => {
    element.addEventListener("drop", (e) => {
        e.preventDefault();
        console.log("Ho droppato in materiali o categorie");
        console.log(e);
    })
});

lavoro.addEventListener('drop', (e) => {
    e.preventDefault();
    const droppedElementNome = e.dataTransfer.getData('nome');
    const droppedElement = materiali.querySelector(`[data-nome='${droppedElementNome}']`)
    const alreadyPresentElement = lavoro.querySelector(`[data-nome='${droppedElementNome}']`);
    if (droppedElement && ! alreadyPresentElement) {
        const newElement = new Materiale(droppedElementNome, lavoro, false);
        newElement.HTMLelement.style.position = 'absolute';
        newElement.HTMLelement.style.left = `${e.offsetX - 50}px`;
        newElement.HTMLelement.style.top = `${e.offsetY - 50}px`;
    }
    
});


// DEBUG DI OGGETTI
let b = new Categoria("Puttana");