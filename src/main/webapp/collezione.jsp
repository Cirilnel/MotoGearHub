<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Catalogo Prodotti</title>
     <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<!-- Header -->
<header class="header">
    <div class="container">
        <a href="#" class="logo">Il Tuo Negozio</a>
        <nav class="navbar">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Prodotti</a></li>
                <li><a href="#">Contatti</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <h1 class="hero-title">Benvenuti nel nostro Catalogo Prodotti</h1>
    <p class="hero-text">Scopri la nostra vasta gamma di prodotti</p>
</section>

<!-- Catalogo Prodotti -->
<section class="product section">
    <div class="container">
        <h2 class="section-title">I nostri prodotti</h2>
        <div class="grid-list">
            <div class="product-card">
                <figure class="card-banner">
                    <img src="path/to/image1.jpg" alt="Prodotto 1" class="img-cover">
                </figure>
                <h3 class="h3 card-title">Prodotto 1</h3>
                <span class="card-price">€19.99</span>
            </div>

            <div class="product-card">
                <figure class="card-banner">
                    <img src="path/to/image2.jpg" alt="Prodotto 2" class="img-cover">
                </figure>
                <h3 class="h3 card-title">Prodotto 2</h3>
                <span class="card-price">€29.99</span>
            </div>

            <!-- Aggiungi altri prodotti qui -->
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Il Tuo Negozio. Tutti i diritti riservati.</p>
    </div>
</footer>

</body>
</html>
