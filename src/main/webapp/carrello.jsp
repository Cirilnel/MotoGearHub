<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoGearHub - Carrello</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

    <!-- Header -->
    <header class="header active">
        <div class="container">
            <a href="#" class="logo">MotoGearHub</a>
            <nav class="navbar">
                <a href="#" class="navbar-link">Home</a>
                <a href="#" class="navbar-link">Shop</a>
                <a href="#" class="navbar-link">About</a>
                <a href="#" class="navbar-link">Contact</a>
            </nav>
            <div class="header-actions">
                <a href="#" class="action-btn">
                    <ion-icon name="person-outline"></ion-icon>
                </a>
                <a href="#" class="action-btn">
                    <ion-icon name="heart-outline"></ion-icon>
                </a>
                <a href="#" class="action-btn">
                    <ion-icon name="cart-outline"></ion-icon>
                    <span class="btn-badge">0</span>
                </a>
            </div>
            <button class="nav-toggle-btn">
                <ion-icon class="menu-icon" name="menu-outline"></ion-icon>
                <ion-icon class="close-icon" name="close-outline"></ion-icon>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <section class="section cart">
            <div class="container">
                <h2 class="section-title">Il tuo carrello</h2>
                <div class="grid-list">
                    <p>Il tuo carrello è vuoto.</p>
                </div>
                <div class="cart-summary">
                    <h3 class="h3">Riepilogo ordine</h3>
                    <p>Totale prodotti: €0.00</p>
                    <p>Spedizione: €0.00</p>
                    <h3 class="h3">Totale: €0.00</h3>
                    <button class="btn checkout-btn" disabled>Procedi al pagamento</button>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-top">
            <div class="container">
                <a href="#" class="logo">MotoGearHub</a>
                <p class="footer-text">Il miglior negozio di attrezzature per moto.</p>
                <div class="social-list">
                    <a href="#" class="social-link">
                        <ion-icon name="logo-facebook"></ion-icon>
                    </a>
                    <a href="#" class="social-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                    <a href="#" class="social-link">
                        <ion-icon name="logo-twitter"></ion-icon>
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <p class="copyright">© 2024 MotoGearHub. Tutti i diritti riservati.</p>
            </div>
        </div>
    </footer>

    <button class="back-top-btn">
        <ion-icon name="arrow-up-outline"></ion-icon>
    </button>

    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons.js"></script>
</body>
</html>
