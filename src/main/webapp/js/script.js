// JavaScript per posizionare il footer in fondo alla pagina
window.addEventListener('load', function() {
  const footer = document.querySelector('.footer');
  const main = document.querySelector('main');

  function adjustFooter() {
    const footerHeight = footer.clientHeight;
    main.style.marginBottom = `${footerHeight}px`;
  }

  adjustFooter(); // Chiamata iniziale per adattare il margine al caricamento della pagina

  window.addEventListener('resize', adjustFooter); // Aggiorna il margine quando la finestra viene ridimensionata
});
