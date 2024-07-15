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
<body id="top">

    <!-- Header -->
    <jsp:include page="fragments/header.jsp" />

    <!-- Product Section -->
    <section class="product-section">
        <div class="container">
            <!-- Product Card 1 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="product1.jpg" alt="Product 1">
                </div>
                <h2 class="product-title">Product Title 1</h2>
                <p class="product-price">$19.99</p>
                <a href="#" class="btn">Add to Cart <ion-icon name="cart-outline"></ion-icon></a>
            </div>

            <!-- Product Card 2 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="product2.jpg" alt="Product 2">
                </div>
                <h2 class="product-title">Product Title 2</h2>
                <p class="product-price">$24.99</p>
                <a href="#" class="btn">Add to Cart <ion-icon name="cart-outline"></ion-icon></a>
            </div>

            <!-- Aggiungi altre card di prodotto secondo necessità -->
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

</body>
</html>
