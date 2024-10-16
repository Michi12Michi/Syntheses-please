const divLavoro = document.body.querySelector("div#lavoro");
const divMateriali = document.body.querySelector("div#materiali");
const divCategorie = document.body.querySelector("div#categorie");
// seleziono solo un elemento da muovere (PROVA)
const originalElement = document.body.querySelector("div#materiali .materiale");

////////////////////////////////////////////////////////////////////////
// utilities per il drag and drop degli elementi #materiali.materiale //
let initialX = 0, initialY = 0;
let moving = false;
let activeElement = null; 

const startDragging = (e, element) => {
    e.preventDefault();
    initialX = e.clientX;
    initialY = e.clientY;
    moving = true;
    activeElement = element;
};

const applyStyles = (sourceElement, targetElement) => {
    const computedStyles = window.getComputedStyle(sourceElement);
    targetElement.style.width = computedStyles.width;
    targetElement.style.height = computedStyles.height;
    targetElement.style.position = "absolute";
    targetElement.style.zIndex = 1000;
}

const makeDraggable = (element) => {
    element.addEventListener(events[deviceType].down, (e) => {
        if (!moving)
            startDragging(e, element);
    });
};

originalElement.addEventListener(events[deviceType].down, (e) => {
    if (!moving) {
        const clonedElement = originalElement.cloneNode(true);
        applyStyles(originalElement, clonedElement);
        clonedElement.style.left = originalElement.getBoundingClientRect().left + "px";
        clonedElement.style.top = originalElement.getBoundingClientRect().top + "px";
        document.body.appendChild(clonedElement);
        makeDraggable(clonedElement);
        startDragging(e, clonedElement);
    }
});

const moveElement = (e) => {
    if (moving && activeElement) {
        let newX = e.clientX, newY = e.clientY;
        activeElement.style.top = activeElement.offsetTop - (initialY - newY) + "px";
        activeElement.style.left = activeElement.offsetLeft - (initialX - newX) + "px";
        initialX = newX;
        initialY = newY;
    }
};

const checkDropZone = (e) => {
    if (!activeElement) return;

    const itemRect = activeElement.getBoundingClientRect();
    const itemCenterX = itemRect.left + itemRect.width / 2;
    const itemCenterY = itemRect.top + itemRect.height / 2;

    const divLavoroRect = divLavoro.getBoundingClientRect();

    if (!(itemCenterX > divLavoroRect.left && itemCenterX < divLavoroRect.right && itemCenterY > divLavoroRect.top && itemCenterY < divLavoroRect.bottom)) {
        activeElement.remove();
    } 
    moving = false;
    activeElement = null;
};

document.addEventListener(events[deviceType].move, moveElement);
document.addEventListener(events[deviceType].up, checkDropZone);

makeDraggable(originalElement);