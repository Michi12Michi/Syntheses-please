const divLavoro = document.body.querySelector("div#lavoro");
const divMateriali = document.body.querySelector("div#materiali");
const divCategorie = document.body.querySelector("div#categorie");
// seleziono gli elementi da muovere (PROVA)(PROVA)(PROVA) --> andrà applicato ai child prodotti in Categoria()
const materialsToDrag = document.body.querySelectorAll("div#materiali .materiale");
// (FINE PROVA)

// LOGICA DI GIOCO
// 1) istanzio oggetto di gioco
var giocatore = new GameObject();

// TODO: proposta -> i punti 2 e sottopunti a e b possono essere gestiti nel costruttore dell'oggetto?
// 2c per le categorie e 2z possono essere racchiusi in una funzione render()

// 2) lettura dei dati dal db
// ...... 2a) se non ci sono dati, bootstrappa il tutorial o l'intro o il cazzo che è
//              ..........................
// ...... 2b) altrimenti l'oggetto giocatore va popolato
//              ..........................
// ...... 2c) le categorie vanno istanziate (almeno queste) in ordine di id crescente
//              ... query* che rende id e immagine categoria dalla lista giocatore.elements_list
//              ... SELECT DISTINCT c.id, c.image FROM categories c JOIN material_category mc ON mc.category_id = c.id WHERE mc.material_id IN (/* lista di id dei materiali */) ORDER BY c.id ASC;
//              ... e per ognuno di essi chiama Categoria (già definita sotto)
//              ... la quale renderizza la categoria e appende eventlistener per renderizzare i materiali al click (già def)



// ...... 2z) gli indicatori vanno aggiornati
let indicatore_esperienza = document.querySelector("#esperienza span");
let indicatore_livello = document.querySelector("#livello span");
let indicatore_soldi = document.querySelector("#soldi span");
// ...... set dei valori
indicatore_esperienza.innerHTML = giocatore.experience;
indicatore_livello.innerHTML = giocatore.level;
// TO DO:
// noto il livello, posso tranquillamente gestire/inizializzare il blog
indicatore_soldi.innerHTML = giocatore.credit;


// (QUESTO BLOCCO NON HA BISOGNO DI MANUTENZIONE (PER ORA))
////////////////////////////////////////////////////////////////////////
// utilities per il drag and drop degli elementi #materiali .materiale //
let initialX = 0, initialY = 0;
let moving = false;
let activeElement = null; 

const startDragging = (e, element) => {
    e.preventDefault();
    initialX = e.type.startsWith('touch') ?  e.touches[0].clientX : e.clientX;
    initialY = e.type.startsWith('touch') ?  e.touches[0].clientY : e.clientY;
    moving = true;
    activeElement = element;
};

const applyStyles = (sourceElement, targetElement) => {
    const computedStyles = window.getComputedStyle(sourceElement);
    targetElement.style.width = computedStyles.width;
    targetElement.style.height = computedStyles.height;
    targetElement.style.position = "absolute";
    targetElement.style.zIndex = 900;
}

const makeDraggable = (element) => {
    element.addEventListener(events[deviceType].down, (e) => {
        e.preventDefault();
        if (!moving)
            startDragging(e, element);
    });
};

// questa va usata in un foreach su tutti i materiali ogni qualvolta viene renderizzata una categoria
// originalElement.addEventListener(events[deviceType].down, (e) => {
//     if (!moving) {
//         e.preventDefault();
//         const clonedElement = originalElement.cloneNode(true);
//         applyStyles(originalElement, clonedElement);
//         clonedElement.style.left = originalElement.getBoundingClientRect().left + "px";
//         clonedElement.style.top = originalElement.getBoundingClientRect().top + "px";
//         document.body.appendChild(clonedElement);
//         makeDraggable(clonedElement);
//         startDragging(e, clonedElement);
//     }
// });

materialsToDrag.forEach((material) => {
    material.addEventListener(events[deviceType].down, (e) => {
        if (!moving) {
            e.preventDefault();
            const clonedElement = material.cloneNode(true);
            applyStyles(material, clonedElement);
            clonedElement.style.left = material.getBoundingClientRect().left + "px";
            clonedElement.style.top = material.getBoundingClientRect().top + "px";
            document.body.appendChild(clonedElement);
            makeDraggable(clonedElement);
            startDragging(e, clonedElement);
        }
    });
});

const moveElement = (e) => {
    if (moving && activeElement) {
        let newX = e.type.startsWith('touch') ?  e.touches[0].clientX : e.clientX;
        let newY = e.type.startsWith('touch') ?  e.touches[0].clientY : e.clientY;
        activeElement.style.top = activeElement.offsetTop - (initialY - newY) + "px";
        activeElement.style.left = activeElement.offsetLeft - (initialX - newX) + "px";
        initialX = newX;
        initialY = newY;
    }
};

const checkDropZone = (e) => {
    e.preventDefault();
    if (!activeElement) return;
    
    const itemRect = activeElement.getBoundingClientRect();
    const itemCenterX = itemRect.left + itemRect.width / 2;
    const itemCenterY = itemRect.top + itemRect.height / 2;
    const divLavoroRect = divLavoro.getBoundingClientRect();
    
    // verifico prima che l'elemento non sia droppato fuori dal div lavoro
    if (!(itemCenterX > divLavoroRect.left && itemCenterX < divLavoroRect.right && itemCenterY > divLavoroRect.top && itemCenterY < divLavoroRect.bottom)) {
        activeElement.classList.add("disappearing");
        const elementToRemove = activeElement;
        setTimeout(() => {
            elementToRemove.remove();
        }, 700);
    // e in subordine verifico che non sia stato mollato nel combinatore (se c'è)
    } else {
        // dichiaro lo spazio di un eventuale posto in cui fare le combinazioni
        const combinator = document.querySelector(".combinator");
        if (combinator !== null) {
            const combinatorRect = combinator.getBoundingClientRect();
            if (itemCenterX > combinatorRect.left && itemCenterX < combinatorRect.right && itemCenterY > combinatorRect.top && itemCenterY < combinatorRect.bottom) {
                // recupero l'id coddato in data-materialeid
                var id = activeElement.getAttribute("data-materialeid");
                console.log(id);
                activeElement.classList.add("disappearing");
                const elementToRemove = activeElement;
                setTimeout(() => {
                    elementToRemove.remove();
                }, 700);
                // qui va gestito il combinatore
                //

            }
        }
    }
    moving = false;
    activeElement = null;
};

document.addEventListener(events[deviceType].move, moveElement, {passive: "false"});
document.addEventListener(events[deviceType].up, checkDropZone);

// makeDraggable(originalElement);
// 
// FINE UTILITIES PER DRAG AND DROP
//

// renderizza le categorie e appende eventlistener al click --> serve in prima istanza a inizializzarle -> la sezione #materiali resta vuota,
// nel senso che non ho previsto (né credo sia necessario) una popolazione di una categoria in particolare, di inizio
function Categoria(id, img) {
    const cat_div = document.createElement("div");
    const hex_div = document.createElement("div");
    const inner_div = document.createElement("div");
    cat_div.classList.add("categoria");
    cat_div.classList.add("p-0");
    hex_div.classList.add("hexagon");
    inner_div.classList.add("inner");
    cat_div.setAttribute("data-categoriaid", id);
    cat_div.appendChild(hex_div).appendChild(inner_div).innerHTML = img;
    cat_div.addEventListener(events[deviceType].down, function() {
        Materiali(id);
    });
    divCategorie.appendChild(cat_div);
};

function Materiali(id_cat) {
    // SERVE SOLO A RENDERIZZARE I MATERIALI DI UNA CATEGORIA CON DATO id_cat
    // va gestita la query che mi ritorna id e immagine di tutti i materiali in giocatore.material_list
    // appartenenti alla categoria con id_cat
    //
    // SELECT m.id, m.image FROM materials m JOIN material_category mc ON mc.material_id = m.id WHERE mc.category_id = id_cat ORDER BY m.id ASC;
    //
    // esempio-prototipo di prova
    let elementi = new Array(1,2,3,4);
    elementi.forEach(element => {
        const mat_div = document.createElement("div");
        const hex_div = document.createElement("div");
        const inner_div = document.createElement("div");
        mat_div.classList.add("materiale");
        mat_div.classList.add("p-0");
        mat_div.setAttribute("data-materialeid", element);
        hex_div.classList.add("hexagon");
        inner_div.classList.add("inner");
        mat_div.appendChild(hex_div).appendChild(inner_div).innerHTML = "sto cazzo"; // mettere immagine
        // manca da aggiungere eventlistener per il trasporto
        divMateriali.appendChild(mat_div);
    });
};
