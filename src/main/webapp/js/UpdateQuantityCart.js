function updateQuantity(productId) {
    const quantity = document.getElementById('quantity' + productId).value;
    fetch('UpdateQuantity', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'updateProductId=' + encodeURIComponent(productId) + '&quantity=' + encodeURIComponent(quantity)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Calculate the new total cost
            let totalCost = 0;
            document.querySelectorAll('.cart-item').forEach(item => {
                const price = parseFloat(item.querySelector('.cart-item-details p b').textContent.replace('€', ''));
                const qty = parseInt(item.querySelector('input[name="quantity"]').value);
                totalCost += price * qty;
            });

            // Update total cost display
            const totalCostElement = document.getElementById('total-cost');
            if (totalCostElement) {
                totalCostElement.innerHTML = '<p>Total Cost: <b>' + totalCost.toFixed(2) + '</b>€</p>';
            }

            if (parseInt(quantity) === 0) {
                const cartItem = document.getElementById('cart-item-' + productId);
                if (cartItem) {
                    cartItem.remove();
                }
            }
        } else {
            alert('Failed to update quantity.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while updating the quantity.');
    });
}

function removeItem(productId) {
    // Ottieni la selezione della quantità da sottrarre
    const quantitySelect = document.getElementById('quantity_' + productId);
    const quantityToRemove = quantitySelect ? parseInt(quantitySelect.value) : 0;

    // Invio della richiesta per aggiornare la quantità
    fetch('UpdateQuantity', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'updateProductId=' + encodeURIComponent(productId) + '&quantityToRemove=' + encodeURIComponent(quantityToRemove)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Ricarica la pagina per aggiornare il carrello
            location.reload();
        } else {
            alert('Failed to update quantity.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while updating the quantity.');
    });
}


