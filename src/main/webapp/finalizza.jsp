<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.*" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizza Pagamento</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/finalizza.css">
    
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<%= request.getContextPath() %>/checkoutValidation.js"></script>
</head>
<body class="content">
    <!-- Inclusione dell'header -->
    <jsp:include page="fragments/header.jsp" />

    <!-- Contenuto principale -->
    <main class="row">
        <section class="section cart">
            <div class="container">
                <h2 class="section-title">Finalizza Pagamento</h2>

                <% 
                // Verifica se l'utente è loggato
                if (request.getSession().getAttribute("email") != null) {
                    float totalCost = 0;
                    Integer idCarrello = (Integer) request.getSession().getAttribute("idCarrello");
                    List<ContieneBean> cartItems = (List<ContieneBean>) request.getSession().getAttribute("contieneCarrelloBeanList" + idCarrello);
                    
                    // Se il carrello non è vuoto
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (ContieneBean item : cartItems) {
                            ProdottoBean product = (ProdottoBean) request.getSession().getAttribute("prodottoCarrello" + item.getIdProdotto());
                            int quantity = item.getQuantita();
                            
                            if (product != null) {
                            %>
                            <div class="product-card" id="cart-item-<%= item.getIdProdotto() %>">
                                <div class="product-image">
                                    <img src="<%= request.getContextPath() %>/images/<%= product.getImage() %>" alt="<%= product.getNome() %>">
                                </div>
                                <div class="product-details">
                                    <h3 class="product-title"><%= product.getNome() %></h3>
                                    <p class="product-price">Prezzo: <%= product.getPrezzo() %>€</p>
                                    <p class="product-quantity">Quantità: <%= quantity %></p>
                                </div>
                            </div>
                            <% 
                            totalCost += quantity * product.getPrezzo();
                            }
                        }
                        %>
                        <div class="total-cost">
                            <p>Costo totale: <b><%= totalCost %></b>€</p>
                        </div>
                        <div class="payment-method">
                            <h2>Inserisci informazioni di pagamento</h2>
                            <form id="checkoutForm" action="<%= request.getContextPath() %>/order" method="post">
                                <label for="cardNumber">Numero di Carta:</label>
                                <input type="text" id="cardNumber" name="cardNumber" required>
                                
                                <label for="expiryDate">Data:</label>
                                <input type="date" id="expiryDate" name="expiryDate" required>
                                
                                <label for="cvv">CVV:</label>
                                <input type="text" id="cvv" name="cvv" required>
                                
                                <label for="indirizzoSpedizione">Indirizzo di spedizione:</label>
                                <input type="text" id="indirizzoSpedizione" name="indirizzoSpedizione" required>
                                
                                <button type="submit">Effettua pagamento e concludi ordine</button>
                            </form>
                        </div>
                        <% 
                    } else {
                        %>
                        <div class="error-message">
                            <p>Il carrello è vuoto.</p>
                        </div>
                        <% 
                    }
                } else {
                    %>
                    <div class="error-message">
                        <p>Devi essere loggato per visualizzare questa pagina.</p>
                    </div>
                    <% 
                }
                %>
            </div>
        </section>
    </main>

    <!-- Inclusione del footer -->
    <jsp:include page="fragments/footer.jsp" />
</body>
</html>
