<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatti - MotoGearHub</title>
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>

      <jsp:include page="fragments/header.jsp" />

    <main>
        <section class="contact">
            <div class="container">
                <div class="section-title">
                    <h2>Contatti</h2>
                </div>
                <div class="contact-info">
                    <div class="contact-item">
                        <ion-icon name="location-outline"></ion-icon>
                        <span>Via Roma, 123 - 00100 Roma</span>
                    </div>
                    <div class="contact-item">
                        <ion-icon name="mail-outline"></ion-icon>
                        <span>info@motogearhub.com</span>
                    </div>
                    <div class="contact-item">
                        <ion-icon name="call-outline"></ion-icon>
                        <span>+39 0123 456789</span>
                    </div>
                    <div class="contact-item">
                        <ion-icon name="logo-facebook"></ion-icon>
                        <span><a href="#">/motogearhub</a></span>
                    </div>
                    <div class="contact-item">
                        <ion-icon name="logo-twitter"></ion-icon>
                        <span><a href="#">@motogearhub</a></span>
                    </div>
                </div>
                <div class="contact-form">
                    <h3>Invia un messaggio</h3>
                    <form action="#">
                        <input type="text" placeholder="Nome">
                        <input type="email" placeholder="Email">
                        <textarea placeholder="Messaggio"></textarea>
                        <button type="submit" class="btn">Invia</button>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="footer-top">
            <div class="container">
                <div class="logo">MotoGearHub</div>
                <div class="footer-text">
                    <p>&copy; 2024 MotoGearHub. Tutti i diritti riservati. Design by CodewithSadee.</p>
                </div>
                <div class="social-list">
                    <a href="#" class="social-link"><ion-icon name="logo-facebook"></ion-icon></a>
                    <a href="#" class="social-link"><ion-icon name="logo-twitter"></ion-icon></a>
                    <a href="#" class="social-link"><ion-icon name="logo-instagram"></ion-icon></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="footer-list-title">Link utili</div>
                <ul class="footer-list">
                    <li><a href="#" class="footer-link">Termini e condizioni</a></li>
                    <li><a href="#" class="footer-link">Privacy policy</a></li>
                    <li><a href="#" class="footer-link">Resi e rimborsi</a></li>
                    <li><a href="#" class="footer-link">Supporto</a></li>
                </ul>
                <div class="footer-bottom-img">
                    <img src="path_to_your_image" alt="Payment Methods">
                </div>
            </div>
        </div>
    </footer>

    <button class="back-top-btn" onclick="backToTop()">Top</button>

    <script>
        function backToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>
