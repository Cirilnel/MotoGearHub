const contextPath = document.getElementById('contextPath').value;

function clearCart() {
    fetch(`${contextPath}/SvuotaCarrello`, {
        method: 'GET',
        credentials: 'same-origin'
    }).then(function(response) {
        if (response.ok) {
            window.location.reload();
        } else {
            alert("Errore nello svuotamento del carrello");
        }
    }).catch(function(error) {
        console.error('Errore:', error);
        alert("Errore nello svuotamento del carrello");
    });
}
