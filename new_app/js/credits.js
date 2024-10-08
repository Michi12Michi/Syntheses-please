document.addEventListener('DOMContentLoaded', function() {
    const creditsButton = document.getElementById('back-to-menu');
    if (creditsButton) {
        creditsButton.addEventListener('click', function() {
            loadPage('menu'); 
        });
    }
});

