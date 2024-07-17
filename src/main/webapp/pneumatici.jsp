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
       <link rel="stylesheet" href="./css/category.css">
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
                            	 if (prodotto.getIdCategoria() == 2) { 
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
                                <a href="#" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                            </div>
                        </div>
                        <%   } 
                            } %>
                    </div>
                </div>
            </section>
            <%
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