const divLavoro = document.body.querySelector("div#lavoro");
const divMateriali = document.body.querySelector("div#materiali");
const divCategorie = document.body.querySelector("div#categorie");

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

const makeDraggable = (element) => {
    element.addEventListener(events[deviceType].down, (e) => {
        if (!moving)
            startDragging(e, element);
    });
};

// associo al contenitore div di materiali un event listener, di modo che ciascun materiale (anche dinamicamente generato
// possa ereditare la funzionalità di drag and drop
