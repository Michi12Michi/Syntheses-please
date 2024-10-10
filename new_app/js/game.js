// console.log("Porco dio")
document.addEventListener("DOMContentLoaded", function() {
    const lavoro = document.body.querySelector("div#lavoro");
    const materiali = document.body.querySelector("div#materiali");

    lavoro.addEventListener('dragover', (e) => {
        e.preventDefault();
    });

    lavoro.addEventListener('drop', (e) => {
        e.preventDefault();
        const droppedElementName = e.dataTransfer.getData('element');
        const droppedElement = materiali.querySelector(`[data-element='${droppedElementName}']`)
        if (droppedElement) {
            const newElement = new Elemento(null, droppedElement, lavoro);
            newElement.HTMLelement.style.position = 'absolute';
            newElement.HTMLelement.style.left = `${e.offsetX - 50}px`;
            newElement.HTMLelement.style.top = `${e.offsetY - 50}px`;
        }
        
    });
});