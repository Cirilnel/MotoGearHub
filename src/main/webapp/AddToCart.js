function AddToCart(productId) {
    // Aggiungi un alert per verificare l'esecuzione della funzione
    

    let quantityElement = document.getElementById('Quantità');
    let quantity;
    if (quantityElement) {
        quantity = quantityElement.value;
    }
    
    if (quantity == null) {
        quantity = 1;
    }

    fetch('carrelloaggiungi', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'AddProdottoId=' + encodeURIComponent(productId) + '&quantity=' + encodeURIComponent(quantity)
    })
    .then(response => response.json())
    .then(data => {
        // Gestisci la risposta del server qui
        Swal.fire({
            icon: 'success',
            title: 'Successo',
            text: 'Prodotto aggiunto al carrello!',
            confirmButtonColor: '#E09777' // Questo colore verrà applicato dal CSS globale
        });
    })
    .catch(error => {
        console.error('Errore:', error);
        Swal.fire({
            icon: 'error',
            title: 'Errore',
            text: 'Si è verificato un errore durante l\'aggiornamento della quantità.',
            confirmButtonColor: '#E09777' // Questo colore verrà applicato dal CSS globale
        });
    });
}

document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('.product-item button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation();
            // Chiamiamo la funzione AddToCart quando il pulsante viene cliccato
            let productId = button.getAttribute('data-product-id');
            AddToCart(productId);
        });
    });
});
