// QUI CI METTIAMO IL GO E LE FUNZIONI DI RENDERING

// TODO: a te l'onore di copiare il GO




// FUNZIONI DI RENDERING

function Categoria(id, img) { // renderizza una determina categoria nell'apposito "divCategorie" e, al click, renderizza tutti i materiali scoperti
    let cat_div = document.createElement("div");
    cat_div.classList.add("category");
    cat_div.setAttribute("data-categoryid", id);
    cat_div.innerHTML = `<div class="hexagon"><div class="inner">${img}</div></div>`;
    cat_div.addEventListener(events[deviceType].down, function() {
        divMateriali.innerHTML = "";
        Materiali(id);
    });
    divCategorie.appendChild(cat_div);
};

function Materiali(id_cat, disc_mat_list) { // renderizza i materiali della categoria con dato id_cat
    // va gestita la query che mi ritorna id e immagine di tutti i materiali in giocatore.material_list
    // appartenenti alla categoria con id_cat
    //
    // SELECT m.id, m.image FROM materials m JOIN material_category mc ON mc.material_id = m.id WHERE mc.category_id = id_cat ORDER BY m.id ASC;
    //
    // esempio-prototipo di prova
    let elementi = new Array(1,2,3,4);
    elementi.forEach(element => {
        const mat_div = document.createElement("div");
        mat_div.classList.add("material");
        mat_div.setAttribute("data-materialid", element);
        mat_div.innerHTML = `<div class="hexagon"><div class="inner">${image}</div></div>`;
        mat_div.appendChild(hex_div).appendChild(inner_div).innerHTML = "sto cazzo"; // mettere immagine
        // TODO: aggiungere eventlistener per il trasporto
        divMateriali.appendChild(mat_div);
    });
};

function discoverMaterial(material_name, img, descrption) {
    var modal = document.querySelector("#laboratorio #discover");
    // TODO: inserire tutti gli elementi nel contenuto del modal
    modal.innerHTML = `<div><p style="color: antiquewhite;">Ciao</p></div>`;
    modal.show();
    setTimeout(() => {
        modal.addEventListener("click", function() {
            modal.hide();
            modal.innerHTML = "";
        });
    }, 4000);
}