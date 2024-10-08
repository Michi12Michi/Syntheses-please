document.addEventListener('DOMContentLoaded', function() {
    const creditsButton = document.getElementById('back-to-menu');
    console.log("Ho eseguito la ricerca del bottone per uscire")
    if (creditsButton) {
        console.log("Il bottone c'è")
        creditsButton.addEventListener('click', function() {
            loadPage('menu'); 
        });
    }
});

