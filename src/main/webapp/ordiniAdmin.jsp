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
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Stili base per html e body */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Nunito Sans', Arial, sans-serif;
        }

        body {
            background-color: #9C9C9C;
            display: flex;
            flex-direction: column;
        }

        /* Stili per il contenuto principale */
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding-top: 70px; /* Altezza dell'header più un po' di margine */
        }

        /* Stili per la sidebar */
        .sidebar {
            width: 200px;
            background-color: #555;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            position: sticky;
            top: 70px; /* Altezza dell'header */
        }

        .sidebar h2 {
            font-size: 1.8rem; /* Ingrandito rispetto al precedente 1.6rem */
            margin-bottom: 20px;
            color: #fff;
            font-weight: bold;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 1.5rem; /* Ingrandito rispetto al precedente 1.3rem */
            font-weight: 600;
            transition: color 0.3s;
        }

        .sidebar ul li a:hover {
            color: #ccc;
        }

        /* Stili per la sezione dei prodotti */
        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Spaziatura tra le card */
        }

        /* Stili per la card dell'ordine */
        .card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%; /* Occupare tutta la larghezza disponibile */
            max-width: 100%; /* Impedisce l'overflow della card */
            margin-bottom: 20px;
            padding: 1.5rem; /* Maggiore padding */
        }

        /* Stili comuni per il testo all'interno della card */
        .card-text {
            margin: 0;
            padding: 10px 0; /* Maggiore padding */
            font-size: 1.5rem; /* Ingrandito rispetto al precedente 1.4rem */
            color: #333;
        }

        .card-text strong {
            font-weight: bold;
            color: #000;
        }

        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
            padding: 1.5rem; /* Maggiore padding */
            font-weight: bold;
            font-size: 1.8rem; /* Ingrandito rispetto al precedente 1.6rem */
            color: #333;
        }

        .card-title {
            margin: 0;
            font-size: 1.8rem; /* Ingrandito rispetto al precedente 1.6rem */
            color: #333;
        }

        .card-body {
            padding: 1.5rem; /* Maggiore padding */
        }

        .list-group-item {
            border: none;
            padding: 1rem 1.5rem; /* Maggiore padding */
            font-size: 1.3rem; /* Ingrandito rispetto al precedente 1.2rem */
            color: #555;
        }

        .order-products h3 {
            margin-top: 0;
            font-size: 1.7rem; /* Ingrandito rispetto al precedente 1.6rem */
            color: #444;
        }

        .order-products ul {
            list-style: none;
            padding: 0;
        }

        .order-products li {
            border-bottom: 1px solid #ddd;
            padding: 15px 0; /* Maggiore padding */
            font-size: 1.4rem; /* Ingrandito rispetto al precedente 1.3rem */
            color: #555;
        }

        .order-products li p {
            margin: 0;
            padding: 5px 0;
        }

        .order-products li p strong {
            font-weight: bold;
            color: #000;
        }

        /* Stili per i messaggi di stato */
        .alert-info, .alert-warning {
            text-align: center;
            font-size: 1.5rem; /* Ingrandito rispetto al precedente 1.4rem */
            color: #333;
        }

        /* Stili per il modulo di filtro */
        .filter-form {
            margin-bottom: 20px;
        }

        .filter-form input, .filter-form select {
            margin-right: 10px;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                margin-right: 0;
                padding: 10px;
                box-shadow: none;
                position: static;
                top: auto;
            }

            .sidebar h2 {
                font-size: 1.6rem; /* Ingrandito rispetto al precedente 1.4rem */
            }

            .sidebar ul li a {
                font-size: 1.3rem; /* Ingrandito rispetto al precedente 1.1rem */
            }

            .row {
                flex-direction: column;
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                display: none; /* Nasconde la sidebar su schermi molto piccoli */
            }

            .content.show-sidebar .sidebar {
                display: block;
                position: fixed;
                left: 0;
                top: 70px; /* Altezza dell'header */
                width: 70%;
                height: calc(100% - 70px); /* Altezza totale meno l'header */
                z-index: 999;
                background-color: #555;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .content.show-sidebar {
                position: relative;
            }
        }

        @media (min-width: 992px) {
            .row {
                flex-direction: row;
            }
        }

        @media (min-width: 1200px) {
            .row {
                flex-direction: row;
            }
        }

        .product-card .btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px; /* Maggiore padding */
            background-color: #ff0000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2rem; /* Ingrandito rispetto al precedente 1.1rem */
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            font-weight: bold;
        }

        .product-card .btn:hover {
            background-color: #cc0000;
        }

        .product-card .btn ion-icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <jsp:include page="fragments/header.jsp" />

    <main class="content">
        <div class="container">
            <h2 class="my-4">Gestione Ordini</h2>

            <!-- Form di filtro -->
            <form class="filter-form" action="ordiniAdmin.jsp" method="get">
                <input type="text" name="username" placeholder="Filtra per cliente" class="form-control d-inline-block w-auto">
                <input type="date" name="start_date" placeholder="Data di inizio" class="form-control d-inline-block w-auto">
                <input type="date" name="end_date" placeholder="Data di fine" class="form-control d-inline-block w-auto">
                <button type="submit" class="btn btn-primary">Filtra</button>
            </form>

            <%
                // Verifica se l'utente è loggato e se è admin
                if (request.getSession().getAttribute("email") != null && Boolean.TRUE.equals(request.getSession().getAttribute("is_admin"))) {
                    List<OrdineBean> ordini = (List<OrdineBean>) session.getAttribute("ordini");

                    if (ordini != null && !ordini.isEmpty()) {
            %>
            <div class="row">
                <% 
                    for (OrdineBean ordine : ordini) {
                %>
                <div class="col-md-4 mb-4">
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
                                            int quantità = contenente.getQuantita();
                                            ProdottoBean prodotto = (ProdottoBean) session.getAttribute("prodotto" + contenente.getIdProdotto());
                                %>
                                <li class="list-group-item">
                                    <p class="card-text"><strong>Nome:</strong> <%= prodotto.getNome() %></p>
                                    <p class="card-text"><strong>Prezzo:</strong> €<%= contenente.getPrezzoDiAcquisto() %></p>
                                    <p class="card-text"><strong>Quantità:</strong> <%= quantità %></p>
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
                %>
            </div>
            <% 
                    } else {
            %>
            <div class="alert alert-info">
                <p>No orders available.</p>
            </div>
            <% 
                    }
                } else {
            %>
            <div class="alert alert-warning">
                <p>You must be logged in as an admin to view this page.</p>
            </div>
            <% 
                }
            %>
        </div>
    </main>

    <jsp:include page="fragments/footer.jsp" />
</body>
</html>
