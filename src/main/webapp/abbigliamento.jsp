<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo - MotoGearHub</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .content {
            flex: 1;
            display: flex;
        }
        /* Stili per l'header, da includere o definire in style.css */
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        /* Stili per la sidebar delle categorie */
        .sidebar {
            width: 200px;
            background-color: #555; /* Grigio più scuro */
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            position: sticky;
            top: 0; /* Fai in modo che la sidebar parta dall'inizio della sezione */
        }
        .sidebar h2 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #fff; /* Testo bianco */
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
            color: #fff; /* Testo bianco */
            font-size: 1.2rem;
            transition: color 0.3s;
        }
        .sidebar ul li a:hover {
            color: #ccc; /* Colore chiaro al passaggio del mouse */
        }
        /* Stili per la sezione dei prodotti */
        .product-section {
            padding: 50px 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            flex: 1;
        }
        .product-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 20px;
            text-align: center;
            flex: 1 1 300px; /* Flessibilità per adattarsi alla larghezza disponibile */
            height: 100%; /* Altezza fissa per tutte le carte */
        }
        .product-card .product-image {
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
        }
        .product-card img {
            border-radius: 5px;
            max-width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }
        .product-card:hover img {
            transform: scale(1.05);
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
        @media (max-width: 768px) {
            .product-card {
                max-width: 100%;
            }
            .sidebar {
                width: 100%;
                margin-bottom: 20px;
                position: static; /* Sidebar non sticky su schermi piccoli */
            }
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
<body id="top">
    <!-- Header -->
    <jsp:include page="fragments/header.jsp" />

    <div class="content">
        <!-- Sidebar con le categorie -->
        <div class="sidebar">
            <h2>Categorie</h2>
            <ul>
            <br> <br> <br>
                <li><a href="casco.jsp">Casco</a></li>
                <li><a href="stivale.jsp">Stivale</a></li>
                <li><a href="pneumatici.jsp">Pneumatici</a></li>
                <li><a href="abbigliamento.jsp">Abbigliamento</a></li>
                <li><a href="guanti.jsp">Guanti</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <%
                List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("ProdottiList");
                if (prodotti != null) {
            %>
            <!-- Product Section -->
            <section class="product-section">
                <div class="container">
                    <div class="row">
                        <!-- Product Cards -->
                        <% 
                            for (ProdottoBean prodotto : prodotti) { 
                            	 if (prodotto.getIdCategoria() == 4) { 
                        %>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="./images/<%= prodotto.getImage() %>" alt="<%= prodotto.getNome() %>">
                                </div>
                                <h2 class="product-title"><%= prodotto.getNome() %></h2>
                                <p class="product-brand"><strong>Marca:</strong> <%= prodotto.getMarca() %></p>
                                <p class="product-description"><%= prodotto.getDescrizione() %></p>
                                <p class="product-price"><strong>Prezzo:</strong> €<%= prodotto.getPrezzo() %></p>
                                <p class="product-stock"><strong>Quantità in magazzino:</strong> <%= prodotto.getQuantitaInMagazzino() %></p>
                                <% 
                            	 if(request.getSession().getAttribute("email")!=null){%>
                                <a href="/carrelloaggiungi" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                            </div>
                        </div>
                        <% }} %>
                    </div>
                </div>
            </section>
            <%}
                } else {
            %>
            <p>Nessun prodotto disponibile.</p>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Back to Top Button -->
    <button class="back-top-btn" aria-label="back to top">
        <ion-icon name="arrow-up-outline"></ion-icon>
    </button>

    <script>
        // Mostra/nascondi il pulsante "Back to Top"
        const backTopBtn = document.querySelector('.back-top-btn');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 100) {
                backTopBtn.style.display = 'block';
            } else {
                backTopBtn.style.display = 'none';
            }
        });

        // Scroll to top
        backTopBtn.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    </script>

    <!-- Script Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
