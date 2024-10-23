document.addEventListener('DOMContentLoaded', function () {
    
    var navigator = document.getElementById('navigator');
    // TO DO: gestire il caricamento dei dati con localStorage e istanziare l'oggetto di gioco
    setTimeout(function() {
        // Passa alla pagina "main.html"
        navigator.pushPage('main.html');
    }, 3000); 
});