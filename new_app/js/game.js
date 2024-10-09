document.addEventListener("DOMContentLoaded", function() {
    console.log("Sto eseguendo il JS per il CSS");
    const cssLink = document.createElement("link");
    cssLink.href = "../css/game.css";
    cssLink.rel = "stylesheet";
    cssLink.setAttribute("data-page", "game");
    document.head.appendChild(cssLink);
});