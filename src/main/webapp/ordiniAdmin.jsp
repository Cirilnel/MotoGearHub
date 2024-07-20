<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordini - Admin</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/category.css">
     <link rel="stylesheet" href="./css/ordiniAdmin.css">
    
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<%= request.getContextPath() %>/js/filtraOrdini.js"></script>
    
   
</head>
<body>
     <jsp:include page="fragments/header.jsp" />

    <div class="content">

        
			
        <div class="main">
        <br><br><br>
            <h1>Gestione Ordini</h1>

            <!-- Form di filtro -->
            <form id="filterForm" class="filter-form">
                <label for="emailFilter">Filtra per Email:</label>
                <input type="email" id="emailFilter" placeholder="Email cliente">

                <label for="startDate">Data Inizio:</label>
                <input type="date" id="startDate">

                <label for="endDate">Data Fine:</label>
                <input type="date" id="endDate">

                <button type="button" class="btn" onclick="filterOrders()">Filtra</button>
            </form>

            <div id="ordersContainer" class="row">
                <% 
                    List<OrdineBean> ordini = (List<OrdineBean>) session.getAttribute("ordini");
                    if (ordini != null && !ordini.isEmpty()) {
                        for (OrdineBean ordine : ordini) {
                %>
                <div class="col-md-4 mb-4 orderRow" 
                     data-order-date="<%= ordine.getData() %>" 
                     data-order-email="<%= ordine.getEmail().toLowerCase() %>">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Ordine del <%= ordine.getData() %></h4>
                        </div>
                        <div class="card-body">
                            <p class="card-text"><strong>Spesa:</strong> €<%= ordine.getSpesa() %></p>
                            <p class="card-text"><strong>Indirizzo:</strong> <%= ordine.getIndirizzo() %></p>
                            <p class="card-text"><strong>Cliente:</strong> <%= ordine.getEmail() %></p> <!-- Username dell'utente -->
                            <h5 class="card-text">Prodotti:</h5>
                            <ul class="list-group order-products">
                                <% 
                                    List<ContenenteBean> contenenteLista = (List<ContenenteBean>) session.getAttribute("contenente" + ordine.getIdOrdine());
                                    if (contenenteLista != null) {
                                        for (ContenenteBean contenente : contenenteLista) {
                                            ProdottoBean prodotto = (ProdottoBean) session.getAttribute("prodotto" + contenente.getIdProdotto());
                                %>
                                <li class="list-group-item">
                                    <p class="card-text"><strong>Nome:</strong> <%= prodotto.getNome() %></p>
                                    <p class="card-text"><strong>Prezzo:</strong> €<%= contenente.getPrezzoDiAcquisto() %></p>
                                    <p class="card-text"><strong>Quantità:</strong> <%= contenente.getQuantita() %></p>
                                </li>
                                <% 
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } else {
                %>
                <p class="alert-info">Nessun ordine disponibile.</p>
                <% 
                    }
                %>
            </div>
        </div>
    </div>
     <jsp:include page="fragments/footer.jsp" />
</body>
</html>
