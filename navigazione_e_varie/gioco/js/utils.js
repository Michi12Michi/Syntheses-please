// AREE DI INTERESSE PER IL DRAG AND DROP
const divLavoro = document.querySelector("#laboratorio .lab-work");
const divMateriali = document.querySelector("#laboratorio .lab-materials");
const divCategorie = document.querySelector("#laboratorio .lab-categories");

// SEZIONE DISPOSITIVO E DEFINIZIONE DEGLI EVENTI MOUSE E TOUCH
let deviceType = "unknown";

const isTouchDevice = () => {
    return ('ontouchstart' in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0);
};

const detectDeviceType = () => {
    if (isTouchDevice()) {
        deviceType = "mobile";
    } else {
        deviceType = "desktop";
    }
    return deviceType;
};

detectDeviceType();

const events = {
    desktop: {
        down: "mousedown",
        up: "mouseup",
        move: "mousemove",
    }, 
    mobile: {
        down: "touchstart",
        up: "touchend",
        move: "touchmove",
    }
};

// UTILITIES E FUNZIONI PER IL DRAG AND DROP
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

const checkDropZone = (e, GObj) => {
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
                // recupero l'id 
                var id = activeElement.getAttribute("data-materialid");
                activeElement.classList.add("disappearing");
                const elementToRemove = activeElement;
                setTimeout(() => {
                    elementToRemove.remove();
                }, 700);
                // qui va gestito il combinatore > collegato a addMaterialToReactor del GO
                GObj.addMaterialToReactor(id);
            }
        }
    }
    moving = false;
    activeElement = null;
};

// LA FUNZIONALITA' E' STATA GIA' TRASFERITA DENTRO LA FUNZIONE renderMaterials() (nel file game.js)

// document.querySelectorAll("div.material").forEach((material) => {
//     material.addEventListener(events[deviceType].down, (e) => {
//         if (!moving) {
//             e.preventDefault();
//             const clonedElement = material.cloneNode(true);
//             applyStyles(material, clonedElement);
//             clonedElement.style.left = material.getBoundingClientRect().left + "px";
//             clonedElement.style.top = material.getBoundingClientRect().top + "px";
//             document.querySelector("#laboratorio").appendChild(clonedElement);
//             makeDraggable(clonedElement);
//             startDragging(e, clonedElement);
//         }
//     });
// });

document.addEventListener(events[deviceType].move, (e) => {
    if (moving) {
        moveElement(e);
    }
}, {passive: "false"});

document.addEventListener(events[deviceType].up, (e) => {
    if (moving) {
        checkDropZone(e, GObj);
    }
});