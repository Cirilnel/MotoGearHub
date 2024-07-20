// Filtra gli ordini in base ai criteri di email e date
function filterOrders() {
    // Ottieni i valori di filtro
    const emailFilter = document.getElementById('emailFilter').value.toLowerCase();
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    // Ottieni tutte le righe degli ordini
    const orders = document.querySelectorAll('.orderRow');

    orders.forEach(order => {
        // Ottieni le date e l'email dell'ordine
        const orderDate = order.getAttribute('data-order-date');
        const orderEmail = order.getAttribute('data-order-email');

        // Verifica se l'ordine soddisfa i criteri di filtro
        const dateMatches = (!startDate || orderDate >= startDate) && (!endDate || orderDate <= endDate);
        const emailMatches = !emailFilter || orderEmail.includes(emailFilter);

        // Mostra o nascondi l'ordine in base ai criteri di filtro
        if (dateMatches && emailMatches) {
            order.style.display = 'block';
        } else {
            order.style.display = 'none';
        }
    });
}
