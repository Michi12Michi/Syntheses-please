// console.log("Porco dio")

const lavoro = document.body.querySelector("div#lavoro");
const materiali = document.body.querySelector("div#materiali");

lavoro.addEventListener('dragover', (e) => {
    e.preventDefault();
});

materiali.addEventListener("dragover", (e) => {
    e.preventDefault();
});

lavoro.addEventListener('drop', (e) => {
    e.preventDefault();
    const droppedElementNome = e.dataTransfer.getData('nome');
    const droppedElement = materiali.querySelector(`[data-nome='${droppedElementNome}']`)
    if (droppedElement) {
        const newElement = new Materiale(droppedElementNome, lavoro, false);
        newElement.HTMLelement.style.position = 'absolute';
        newElement.HTMLelement.style.left = `${e.offsetX - 50}px`;
        newElement.HTMLelement.style.top = `${e.offsetY - 50}px`;
    }
    
});


// DEBUG DI OGGETTI
let a = new Materiale("tua mamma", materiali, true);
let b = new Categoria("Puttana");