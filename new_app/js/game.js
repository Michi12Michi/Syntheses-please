// console.log("Porco dio")

const lavoro = document.body.querySelector("div#lavoro");
const materiali = document.body.querySelector("div#materiali");

lavoro.addEventListener('dragover', (e) => {
    e.preventDefault();
    console.log("sono su div#lavoro");
});

lavoro.addEventListener('drop', (e) => {
    e.preventDefault();
    console.log("ho droppato in lavoro");
    const droppedElementID = e.dataTransfer.getData('id');
    const droppedElementNome = e.dataTransfer.getData('nome');
    const droppedElement = materiali.querySelector(`[data-nome='${droppedElementNome}']`)
    if (droppedElement) {
        console.log("sono qui <------")
        const newElement = new Materiale(droppedElementID, droppedElementNome, lavoro, false);
        newElement.HTMLelement.style.position = 'fixed';
        newElement.HTMLelement.style.left = `${e.offsetX - 50}px`;
        newElement.HTMLelement.style.top = `${e.offsetY - 50}px`;
    }
    
});

let a = new Materiale(2, "tua mamma", materiali, true);