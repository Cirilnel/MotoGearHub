function RemoveAdmin(productId) {
    fetch('RimozioneAdmin', { // Assicurati che il percorso sia corretto
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'RemoveProdottoId=' + encodeURIComponent(productId)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            Swal.fire({
                icon: 'success',
                title: 'Successo',
                text: 'Prodotto rimosso con successo!',
                confirmButtonColor: '#E09777'
            }).then(() => {
                // Trova l'elemento nel DOM e rimuovilo se esiste
                const productElement = document.getElementById('product-' + productId);
                if (productElement) {
                    productElement.remove();
                } else {
                    console.warn('Elemento con ID product-' + productId + ' non trovato.');
                }
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'Non è stato possibile rimuovere il prodotto: ' + (data.error || 'Errore sconosciuto'),
                confirmButtonColor: '#E09777'
            });
        }
    })
    .catch(error => {
        console.error('Errore:', error);
        Swal.fire({
            icon: 'error',
            title: 'Errore',
            text: 'Si è verificato un errore durante la rimozione del prodotto.',
            confirmButtonColor: '#E09777'
        });
    });
}

// Event listener per i pulsanti di rimozione
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.remove-product-button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation();
            let productId = button.getAttribute('data-product-id');
            RemoveAdmin(productId);
        });
    });
});
