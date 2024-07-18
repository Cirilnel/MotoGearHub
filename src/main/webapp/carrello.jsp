<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoGearHub - Carrello</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
       body {
            background-color: #9C9C9C;
            margin: 0;
            padding: 0;
            font-family: 'Nunito Sans', Arial, sans-serif;
        }
        /* Stili per l'header, da includere o definire in style.css */
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        /* Stili per la sezione dei prodotti */
        .product-section {
            padding: 50px 0;
        }
        .product-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto 20px;
            text-align: center;
        }
        .product-card .product-image {
            margin-bottom: 20px;
        }
        .product-card img {
            border-radius: 5px;
            max-width: 100%;
            height: auto;
        }
        .product-card .product-title {
            font-family: 'Bangers', cursive;
            font-size: 1.8rem;
            color: #333;
            margin: 10px 0;
        }
        .product-card .product-price {
            font-size: 1.2rem;
            color: #009688;
            margin: 5px 0;
        }
        .product-card .btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #ff0000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        .product-card .btn:hover {
            background-color: #cc0000;
        }
        .product-card .btn ion-icon {
            margin-right: 5px;
        }
        /* Stili per il footer, da includere o definire in style.css */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>

    <!-- Inclusione dell'header -->
    <jsp:include page="fragments/header.jsp" />

    <!-- Contenuto principale -->
    <main>
        <section class="section cart">
            <div class="container">
                <h2 class="section-title">Il tuo carrello</h2>

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
                                    </div>
                                    <div class="product-details">
                                        <h3 class="product-title"><%= product.getNome() %></h3>
                                        <p class="product-price">Prezzo: <%= product.getPrezzo() %>€</p>
                                        <p class="product-quantity">Quantità: <%= quantity %></p>
                                        <button type="button" onclick="removeItem(<%= item.getIdProdotto() %>)">Rimuovi</button>
                                    </div>
                                </div>
                            <% 
                                // Calcola il costo totale
                                totalCost += quantity * product.getPrezzo();
                            } %>
                        </div>
                        <!-- Riepilogo ordine -->
                        <div class="cart-summary">
                            <h3 class="h3">Riepilogo ordine</h3>
                            <p>Totale prodotti: <%= totalCost %>€</p>
                            <p>Spedizione: €0.00</p>
                            <h3 class="h3">Totale: <%= totalCost %>€</h3>
                            <!-- Pulsante di checkout -->
                            <button class="btn checkout-btn" <%= cartItems.isEmpty() ? "disabled" : "" %> onclick="window.location.href='finalizza.jsp'">Procedi al pagamento</button>
                        </div>
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
