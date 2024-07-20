<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rimozione Prodotti - MotoGearHub</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/category.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<%=request.getContextPath()%>/RemoveAdmin.js"></script>
</head>
<body id="top">
    <!-- Header -->
    <jsp:include page="fragments/header.jsp" />
    
    <div class="content">
        <div class="main-content">
            <% 
                List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("ProdottiList");
                if (prodotti != null) { 
            %>
            <section class="product-section">
                <div class="container">
                    <div class="row">
                        <% for (ProdottoBean prodotto : prodotti) { %>
                        <div class="col-md-6 col-lg-4 mb-4" id="product-<%= prodotto.getIdProdotto() %>">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="./images/<%= prodotto.getImage() %>" alt="<%= prodotto.getNome() %>">
                                </div>
                                <div class="product-details">
                                    <h2 class="product-title"><%= prodotto.getNome() %></h2>
                                    <p class="product-brand"><strong>Marca:</strong> <%= prodotto.getMarca() %></p>
                                    <p class="product-description"><%= prodotto.getDescrizione() %></p>
                                    <p class="product-price"><strong>Prezzo:</strong> €<%= prodotto.getPrezzo() %></p>                                    
                                    <% if (request.getSession().getAttribute("email") != null && request.getSession().getAttribute("is_admin") == Boolean.TRUE) { %>
                                    <button type="button" class="btn remove-product-button" data-product-id="<%= prodotto.getIdProdotto() %>">Rimuovi</button>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </section>
            <% } else { %>
            <p>Nessun prodotto disponibile.</p>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Back to Top Button -->
    <button class="back-top-btn" aria-label="back to top">
        <ion-icon name="arrow-up-outline"></ion-icon>
    </button>

    <script>
        console.log("Script inline caricato correttamente");
        
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
</body>
</html>
