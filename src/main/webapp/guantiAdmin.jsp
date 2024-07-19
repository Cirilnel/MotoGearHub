<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo Guanti - MotoGearHub</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/category.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<%=request.getContextPath()%>/AddToCart.js"></script>
</head>
<body id="top">
    <!-- Header -->
    <jsp:include page="fragments/header.jsp" />

    <div class="content">
        <div class="sidebar">
            <h2>Categorie</h2>
            <br><br><br>
            <ul>
                <li><a href="${pageContext.request.contextPath}/CascoRedirectServlet">Casco</a></li>
                <li><a href="${pageContext.request.contextPath}/StivaleRedirectServlet">Stivale</a></li>
                <li><a href="${pageContext.request.contextPath}/PneumaticiRedirectServlet">Pneumatici</a></li>
                <li><a href="${pageContext.request.contextPath}/AbbigliamentoRedirectServlet">Abbigliamento</a></li>
                <li><a href="${pageContext.request.contextPath}/GuantiRedirectServlet">Guanti</a></li>
            </ul>
        </div>
         
        <div class="main-content">
            <% 
                List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("ProdottiList");
                if (prodotti != null) { 
            %>
            <section class="product-section">
                <div class="container">
                    <div class="row">
                        <% for (ProdottoBean prodotto : prodotti) { 
                            if (prodotto.getIdCategoria() == 5) { %>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="./images/<%= prodotto.getImage() %>" alt="<%= prodotto.getNome() %>">
                                </div>
                                <div class="product-details">
                                    <form action="<%= request.getContextPath() %>/modificaProdotto" method="post">
                                        <input type="hidden" name="idProdotto" value="<%= prodotto.getIdProdotto() %>">
                                        
                                        <div class="form-group">
                                            <label for="nome_<%= prodotto.getIdProdotto() %>">Nome:</label>
                                            <input type="text" id="nome_<%= prodotto.getIdProdotto() %>" name="nome" value="<%= prodotto.getNome() %>" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="marca_<%= prodotto.getIdProdotto() %>">Marca:</label>
                                            <input type="text" id="marca_<%= prodotto.getIdProdotto() %>" name="marca" value="<%= prodotto.getMarca() %>" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="descrizione_<%= prodotto.getIdProdotto() %>">Descrizione:</label>
                                            <textarea id="descrizione_<%= prodotto.getIdProdotto() %>" name="descrizione" rows="4" required><%= prodotto.getDescrizione() %></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="prezzo_<%= prodotto.getIdProdotto() %>">Prezzo:</label>
                                            <input type="number" id="prezzo_<%= prodotto.getIdProdotto() %>" name="prezzo" value="<%= prodotto.getPrezzo() %>" step="0.01" min="0" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="image_<%= prodotto.getIdProdotto() %>">Immagine:</label>
                                            <input type="text" id="image_<%= prodotto.getIdProdotto() %>" name="image" value="<%= prodotto.getImage() %>" required>
                                        </div>
                                        
                                        <button type="submit" class="btn">Modifica</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% } } %>
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
