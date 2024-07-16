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
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
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

    <!-- Product Section -->
    <section class="product-section">
        <div class="container">
            <div class="row">
                <!-- Product Card 1 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="./images/product-2.jpg" alt="Product 1">
                        </div>
                        <h2 class="product-title">DAINESE VR46 DAEMON-X SAFETY HOODIE FULL ZIP</h2>
                        <p class="product-price">309.95€</p>
                        <a href="#" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                    </div>
                </div>

                <!-- Product Card 2 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="./images/product-3.jpg" alt="Product 2">
                        </div>
                        <h2 class="product-title">RAVEN JEANS</h2>
                        <p class="product-price">219.99€</p>
                        <a href="#" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                    </div>
                </div>
                
                  <div class="col-md-6 col-lg-4 mb-4">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="./images/product-3.jpg" alt="Product 2">
                        </div>
                        <h2 class="product-title">RAVEN JEANS</h2>
                        <p class="product-price">219.99€</p>
                        <a href="#" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                    </div>
                </div>
                  <div class="col-md-6 col-lg-4 mb-4">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="./images/product-3.jpg" alt="Product 2">
                        </div>
                        <h2 class="product-title">RAVEN JEANS</h2>
                        <p class="product-price">219.99€</p>
                        <a href="#" class="btn">Add to Cart <ion-icon name="bag-add-outline"></ion-icon></a>
                    </div>
                </div>
                
                <!-- Aggiungi altre card di prodotto secondo necessità -->
            </div>
        </div>
                <!-- Aggiungi altre card di prodotto secondo necessità -->
            </div>
        </div>
            </div>
        </div>
        
    </section>

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

    <!-- Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Script Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
