<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordini</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/category.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</head>
<body>
    <jsp:include page="fragments/header.jsp" />

    <main class="content">
        <%
            // Verifica se l'utente è loggato
            if (request.getSession().getAttribute("email") != null) {
                List<OrdineBean> ordini = (List<OrdineBean>) session.getAttribute("ordini");

                if (ordini != null && !ordini.isEmpty()) {
        %>
        <div class="purchase-history">
            <h2>Cronologia acquisti</h2>
            <div class="orders">
                <% 
                    for (OrdineBean ordine : ordini) {
                %>
                <div class="order">
                    <h3>Ordine</h3>
                    <div class="order-info">
                        <p><strong>Date:</strong> <%= ordine.getData() %></p>
                        <p><strong>Spesa:</strong> €<%= ordine.getSpesa() %></p>
                        <p><strong>Indirizzo:</strong> <%= ordine.getIndirizzo() %></p>
                    </div>
                    <div class="order-products">
                        <h3>Prodotti:</h3>
                        <ul>
                            <% 
                                List<ContenenteBean> contenenteLista = (List<ContenenteBean>) session.getAttribute("contenente" + ordine.getIdOrdine());
                                if (contenenteLista != null) {
                                    for (ContenenteBean contenente : contenenteLista) {
                                        int quantità = contenente.getQuantita();
                                        ProdottoBean prodotto = (ProdottoBean) session.getAttribute("prodotto" + contenente.getIdProdotto());
                            %>
                            <li>
                                <p><strong>Nome:</strong> <%= prodotto.getNome() %></p>
                                <p><strong>Prezzo:</strong> €<%= contenente.getPrezzoDiAcquisto() %></p>
                                <p><strong>Quantità:</strong> <%= quantità %></p>
                            </li>
                            <% 
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <% 
                    }
                %>
            </div>
        </div>
        <% 
                } else {
        %>
        <div class="no-orders">
            <p>No purchase history available.</p>
        </div>
        <% 
                }
            } else {
        %>
        <div class="error-message">
            <p>You must be logged in to view this page.</p>
        </div>
        <% 
            }
        %>
    </main>

    <jsp:include page="fragments/footer.jsp" />
</body>
</html>
