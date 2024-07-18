<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizza Pagamento</title>
</head>
<body>
    <jsp:include page="fragments/header.jsp" />
    <main>
        <% 
        if (request.getSession().getAttribute("email") != null) {
            float totalCost = 0;
            Integer idCarrello = (Integer) request.getSession().getAttribute("idCarrello");
            List<ContieneBean> cartItems = (List<ContieneBean>) request.getSession().getAttribute("ContenenteCarrelloBeanList" + idCarrello.toString());
            if (cartItems != null && !cartItems.isEmpty()) {
                for (ContieneBean item : cartItems) {
                    ProdottoBean product = (ProdottoBean) request.getSession().getAttribute("ProdottoCarrello" + item.getIdProdotto());
                    int quantity = item.getQuantita();
                    
                    
                    %>
                    <div class="cart-item" id="cart-item-<%= item.getIdProdotto() %>">
                        <div class="cart-item-image">
                            <img src="./images/<%= product.getImage() %>" alt="<%= product.getNome() %>">
                        </div>
                        <div class="cart-item-details">
                            <p><%= product.getNome() %></p>
                            <p>Quantità: <%= quantity %></p>
                            <p>Prezzo: <b><%= product.getPrezzo() %>€</b></p>
                        </div>
                    </div>
                    <% 
                    totalCost += quantity * product.getPrezzo();
                }
                %>
                <div class="total-cost">
                    <p>Costo totale: <b><%= totalCost %></b>€</p>
                </div>
                <div class="payment-method">
                    <h2>Inserisci informazioni di pagamento</h2>
                    <form id="checkoutForm" action="<%= request.getContextPath() %>/order" method="post">
                        <label for="cardNumber">Card Number:</label>
                        <input type="text" id="cardNumber" name="cardNumber" required>
                        <span id="errorCardNumber" aria-live="polite"></span>
                        
                        <label for="expiryDate">Expiry Date:</label>
                        <input type="date" id="expiryDate" name="expiryDate" required>
                        <span id="errorDate" aria-live="polite"></span>
                        
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" required>
                        <span id="errorCVV" aria-live="polite"></span>
                        
                        <label for="cardHolderName">Card Holder Name:</label>
                        <input type="text" id="cardHolderName" name="cardHolderName" required>
                        <span id="errorName" aria-live="polite"></span>
                        
                        <label for="indirizzoSpedizione">Indirizzo di spedizione:</label>
                        <input type="text" id="indirizzoSpedizione" name="indirizzoSpedizione" required>
                        <span id="errorIndirizzo" aria-live="polite"></span>
                        
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
    </main>
    <jsp:include page="fragments/footer.jsp" />
</body>
</html>