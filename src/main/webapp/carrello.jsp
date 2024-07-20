<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoGearHub - Carrello</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/carrello.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<%= request.getContextPath() %>/js/UpdateQuantityCart.js"></script>
     <script src="<%= request.getContextPath() %>/js/clearActions.js"></script>
    <script>
function clearCart() {
  fetch('<%= request.getContextPath() %>/SvuotaCarrello', {
    method: 'GET',
    credentials: 'same-origin'
  }).then(function(response) {
    if (response.ok) {
      window.location.reload();
    } else {
      alert("Errore nello svuotamento del carrello");
    }
  });
}
</script>
<script src="<%=request.getContextPath()%>/js/script.js" defer></script>

</head>
<body>

    <!-- Inclusione dell'header -->
    <jsp:include page="fragments/header.jsp" />

    <!-- Contenuto principale -->
    <main>
        <section class="section cart">
            <div class="container">
                <h2 class="section-title" style="font-family: Arial, sans-serif; font-size: 28px; color: #333; margin-bottom: 15px; border-bottom: 2px solid #000000; padding-bottom: 10px;">Il tuo carrello</h2>

                <% 
                // Verifica se l'utente è loggato
                if(request.getSession().getAttribute("email") != null){
                    // Recupera dati dal carrello dalla sessione
                    List<ContieneBean> cartItems = (List<ContieneBean>) request.getSession().getAttribute("contieneCarrelloBeanList" + request.getSession().getAttribute("idCarrello"));

                    // Se il carrello è vuoto
                    if(cartItems == null || cartItems.isEmpty()) {
                %>
                        <div class="grid-list">
                            <p>Il tuo carrello è vuoto.</p>
                        </div>
                <% 
                    } else {
                        // Se il carrello contiene prodotti
                        float totalCost = 0;
                        %>
                        <div class="grid-list">
                            <% 
                            // Itera attraverso gli elementi del carrello
                            for(ContieneBean item : cartItems) {
                                ProdottoBean product = (ProdottoBean) request.getSession().getAttribute("prodottoCarrello" + item.getIdProdotto());
                                int quantity = item.getQuantita();
                            %>
                                <div class="product-card">
    <div class="product-image">
        <!-- Immagine del prodotto -->
        <img src="./images/<%= product.getImage() %>" alt="<%= product.getNome() %>">
    </div>
    <div class="product-details">
        <h3 class="product-title"><%= product.getNome() %></h3>
        <p class="product-price">Prezzo: <%= product.getPrezzo() %>€</p>
        <p class="product-quantity">Quantità: <%= quantity %></p>
        <!-- Selezione della quantità da rimuovere -->
        <select id="quantity_<%= item.getIdProdotto() %>" class="quantity-select">
            <% for (int i = 1; i <= quantity; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>
        <button type="button" class="btn" onclick="removeItem(<%= item.getIdProdotto() %>)">Rimuovi</button>
    </div>
</div>
                            <% 
                                // Calcola il costo totale
                                totalCost += quantity * product.getPrezzo();
                            } %>
                        </div>
                        <!-- Riepilogo ordine -->
                        <h3 class="h3" style="font-family: Arial, sans-serif; font-size: 24px; color: #333; margin-bottom: 10px;">Riepilogo ordine</h3>
                        <h3 class="h3" style="font-family: Arial, sans-serif; font-size: 24px; color: #333; margin-bottom: 20px;">Totale: <%= totalCost %>€</h3>
                        <!-- Pulsante di checkout -->
                        <button type="button" 
                                onclick="window.location.href='finalizza.jsp'" 
                                style="background-color: #28a745; color: white; padding: 10px 20px; font-size: 18px; border: none; border-radius: 5px; cursor: pointer;">
                            Procedi al pagamento
                        </button>
                         <br>
                      <button type="button" 
        onclick="clearCart()" 
        style="background-color: #dc3545; color: white; padding: 10px 20px; font-size: 18px; border: none; border-radius: 5px; cursor: pointer;">
    Svuota carrello
</button>

		      <% 
                    }
                } else {
                %>
                    <div class="error-message">
                        <p>Devi effettuare l'accesso per visualizzare questa pagina.</p>
                    </div>
                <% 
                } %>
            </div>
        </section>
    </main>

    <!-- Pulsante per tornare in cima -->
    <button class="back-top-btn">
        <ion-icon name="arrow-up-outline"></ion-icon>
    </button>

    <!-- Inclusione del footer -->
    <jsp:include page="fragments/footer.jsp" />

</body>
</html>