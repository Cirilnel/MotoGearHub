function AddToCart(productId) {
    let quantityElement = document.getElementById('Quantità');
    let quantity = quantityElement ? quantityElement.value : 1;

    fetch('carrelloaggiungi', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'AddProdottoId=' + encodeURIComponent(productId) + '&quantity=' + encodeURIComponent(quantity)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            Swal.fire({
                icon: 'success',
                title: 'Successo',
                text: 'Prodotto aggiunto al carrello!',
                confirmButtonColor: '#E09777'
            });

            // Aggiorna il pallino rosso
            updateCartBadge(quantity);
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'Non è stato possibile aggiungere il prodotto al carrello.',
                confirmButtonColor: '#E09777'
            });
        }
    })
    .catch(error => {
        console.error('Errore:', error);
        Swal.fire({
            icon: 'error',
            title: 'Errore',
            text: 'Si è verificato un errore durante l\'aggiornamento della quantità.',
            confirmButtonColor: '#E09777'
        });
    });
}

function updateCartBadge(quantity) {
    const cartBadge = document.querySelector('.btn-badge');
    if (cartBadge) {
        let currentQuantity = parseInt(cartBadge.textContent);
        currentQuantity += parseInt(quantity);
        cartBadge.textContent = currentQuantity;
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('.product-item button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation();
            let productId = button.getAttribute('data-product-id');
            AddToCart(productId);
        });
    });
});
