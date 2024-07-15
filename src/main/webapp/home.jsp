<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" %>

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>MotoGearHub</title>

  <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">

  <link rel="stylesheet" href="./css/style.css">

 
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link
    href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap"
    rel="stylesheet">

 
  <link rel="preload" as="image" href="./images/hero-banner.jpg">

</head>

<body id="top">

  

  <jsp:include page="fragments/header.jsp" />





  <main>
    <article>

      <!-- 
        - #HERO
      -->

      <section class="section hero has-bg-image" id="home" aria-label="home"
        style="background-image: url('./images/hero-banner.jpg')">
        <div class="container">

          <h1 class="h1 hero-title">
            <span class="span">Proteggiti con noi</span>
            <span class="span">Fallo con stile</span>  
            
          </h1>

          <p class="hero-text">40% di sconto oggi</p>

          <a href="#" class="btn">Acquista ora</a>

        </div>
      </section>





      <!-- 
        - #CATEGORY
      -->

      <section class="section category" aria-label="category">
        <div class="container">

          <h2 class="h2 section-title">
            <span class="span">Migliori</span> categorie
          </h2>

          <ul class="has-scrollbar">

            <li class="scrollbar-item">
              <div class="category-card">

                <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                  <img src="./images/category-1.jpg" width="330" height="300" loading="lazy" alt="Cat Food"
                    class="img-cover">
                </figure>

                <h3 class="h3">
                  <a href="#" class="card-title">Caschi</a>
                </h3>

              </div>
            </li>

            <li class="scrollbar-item">
              <div class="category-card">

                <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                  <img src="./images/category-2.jpg" width="330" height="300" loading="lazy" alt="Cat Toys"
                    class="img-cover">
                </figure>

                <h3 class="h3">
                  <a href="#" class="card-title">Abbigliamento da moto</a>
                </h3>

              </div>
            </li>

            <li class="scrollbar-item">
              <div class="category-card">

                <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                  <img src="./images/category-3.jpg" width="330" height="300" loading="lazy" alt="Dog Food"
                    class="img-cover">
                </figure>

                <h3 class="h3">
                  <a href="#" class="card-title">Guanti</a>
                </h3>

              </div>
            </li>

            <li class="scrollbar-item">
              <div class="category-card">

                <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                  <img src="./images/category-4.jpg" width="330" height="300" loading="lazy" alt="Dog Toys"
                    class="img-cover">
                </figure>

                <h3 class="h3">
                  <a href="#" class="card-title">Stivali da moto</a>
                </h3>

              </div>
            </li>

            <li class="scrollbar-item">
              <div class="category-card">

                <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                  <img src="./images/category-5.jpg" width="330" height="300" loading="lazy"
                    alt="Dog Sumpplements" class="img-cover">
                </figure>

                <h3 class="h3">
                  <a href="#" class="card-title">Pneumatici</a>
                </h3>

              </div>
            </li>

          </ul>

        </div>
      </section>





      <!-- 
        - #OFFERS
      -->

      <section class="section offer" aria-label="offer">
        <div class="container">

          <ul class="grid-list">

            <li>
              <div class="offer-card has-bg-image img-holder"
                style="background-image: url('./images/offer-banner-1.png'); --width: 540; --height: 374;">

                <p class="card-subtitle">I nostri prodotti estivi</p>
				<p class="card-subtitle">leggeri ma superprotettivi</p>
                <h3 class="h3 card-title">
                  Calore non<span class="span">ti temo!</span>
                </h3>

                <a href="#" class="btn">Read More</a>

              </div>
            </li>

            <li>
              <div class="offer-card has-bg-image img-holder"
                style="background-image: url('./images/offer-banner-2.png'); --width: 540; --height: 374;">

                <p class="card-subtitle">Finalmente anche nel</p>
				<p class="card-subtitle">nostro store!!</p>
                <h3 class="h3 card-title">
                  Sconti per<span class="span">il lancio</span>
                  <span class="span">Affrettatevi!</span>
                </h3>
                <a href="#" class="btn">Read More</a>

              </div>
            </li>

            <li>
              <div class="offer-card has-bg-image img-holder"
                style="background-image: url('./images/offer-banner-3.png'); --width: 540; --height: 374;">

				 <p class="card-subtitle">Ancora più vestibilità </p>	
				 <p class="card-subtitle">Sempre più ergonomia</p>
                <h3 class="h3 card-title">
                Novità  di<span class="span">quest'anno</span>
                </h3>

                <a href="#" class="btn">Read More</a>

              </div>
            </li>

          </ul>

        </div>
      </section>





      <!-- 
        - #PRODUCT
      -->

      <section class="section product" id="shop" aria-label="product">
        <div class="container">

          <h2 class="h2 section-title">
            <span class="span">Più</span> Venduti
          </h2>

          <ul class="grid-list">

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-1.jpg" width="360" height="360" loading="lazy"
                    alt="Commodo leo sed porta" class="img-cover default">
                  <img src="./images/product-1_0.jpg" width="360" height="360" loading="lazy"
                    alt="Commodo leo sed porta" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">
                
                  <h3 class="h3">
                    <a href="#" class="card-title">ALPINESTARS SUPERTECH R10</a>
                  </h3>

                  <data class="card-price" value="15">999.95 €</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-2.jpg" width="360" height="360" loading="lazy"
                    alt="Purus consequat congue sit" class="img-cover default">
                  <img src="./images/product-2_0.jpg" width="360" height="360" loading="lazy"
                    alt="Purus consequat congue sit" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">
                
                  <h3 class="h3">
                    <a href="#" class="card-title">DAINESE VR46 DAEMON-X SAFETY HOODIE FULL ZIP</a>
                  </h3>

                  <data class="card-price" value="45">309.95€</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-3.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover default">
                  <img src="./images/product-3_0.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">
                  <h3 class="h3">
                    <a href="#" class="card-title">RAVEN JEANS</a>
                  </h3>

                  <data class="card-price" value="45">219.99€</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-4.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover default">
                  <img src="./images/product-4_0.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">

                  <h3 class="h3">
                    <a href="#" class="card-title">ALPINESTARS GP FORCE PHANTOM</a>
                  </h3>

                  <data class="card-price" value="49">599.95€</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-5.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover default">
                  <img src="./images/product-5_0.jpg" width="360" height="360" loading="lazy"
                    alt="Morbi vel arcu scelerisque" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">
	
                  

                  <h3 class="h3">
                    <a href="#" class="card-title">STIVALI MOTOTECNICA</a>
                  </h3>

                  <data class="card-price" value="85">179.00 €</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-6.jpg" width="360" height="360" loading="lazy"
                    alt="Nam justo libero porta ege" class="img-cover default">
                  <img src="./images/product-6_0.jpg" width="360" height="360" loading="lazy"
                    alt="Nam justo libero porta ege" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">

                  <h3 class="h3">
                    <a href="#" class="card-title">ALPINESTARS GUANTI MOTO IN PELLE GP PLUS R V2 NERO/ROSSO FLUO</a>
                  </h3>

                  <data class="card-price" value="85">179.00 €</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-7.jpg" width="360" height="360" loading="lazy"
                    alt="Nam justo libero porta ege" class="img-cover default">
                  <img src="./images/product-7_0.jpg" width="360" height="360" loading="lazy"
                    alt="Nam justo libero porta ege" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">

                  <h3 class="h3">
                    <a href="#" class="card-title">GIUBBOTTO GIACCA MOTO DAINESE AVRO D2</a>
                  </h3>

                  <data class="card-price" value="85">209.95€</data>

                </div>

              </div>
            </li>

            <li>
              <div class="product-card">

                <div class="card-banner img-holder" style="--width: 360; --height: 360;">
                  <img src="./images/product-8.jpg" width="360" height="360" loading="lazy"
                    alt="Etiam commodo leo sed" class="img-cover default">
                  <img src="./images/product-8_0.jpg" width="360" height="360" loading="lazy"
                    alt="Etiam commodo leo sed" class="img-cover hover">

                  <button class="card-action-btn" aria-label="add to card" title="Add To Card">
                    <ion-icon name="bag-add-outline" aria-hidden="true"></ion-icon>
                  </button>
                </div>

                <div class="card-content">

                  <h3 class="h3">
                    <a href="#" class="card-title">Pirelli Diablo Rosso Corsa 2</a>
                  </h3>

                  <data class="card-price" value="55">240.00 €</data>

                </div>

              </div>
            </li>

          </ul>

        </div>
      </section>





      <!-- 
        - #SERVICE
      -->

      <section class="section service" aria-label="service">
        <div class="container">

          <img src="./images/service-image.png" width="244" height="272" loading="lazy" alt="" class="img">

          <h2 class="h2 section-title">
            <span class="span">Tutto</span> quello <span class="span">che</span> tu <span class="span">e</span> la <span class="span">tua</span> moto <span class="span">desiderate</span>,in <span class="span">un</span> unico <span class="span">posto</span>.
          </h2>

          <ul class="grid-list">

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-1.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">Free Same-Day Delivery</h3>

                <p class="card-text">
                  Order by 2pm local time to get free delivery on orders $35+ today.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-2.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">30 Day Return</h3>

                <p class="card-text">
                  35% off your first order plus 5% off all future orders.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-3.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">Security payment</h3>

                <p class="card-text">
                  25% off your online order of $50+. Available at most locations.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-4.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">24/7 Support</h3>

                <p class="card-text">
                  Shop online to get orders over $35 shipped fast and free.
                </p>

              </div>
            </li>

          </ul>

        </div>
      </section>





      <!-- 
        - #CTA
      -->

      <section class="cta has-bg-image" aria-label="cta" style="background-image: url('./images/cta-bg.jpeg')">
        <div class="container">

          <figure class="cta-banner">
            <img src="./images/cta-banner.png" width="900" height="660" loading="lazy" alt="cat" class="w-100">
          </figure>

				<!-- da cambiare immagine --> 

          <div class="cta-content">
            <img src="./images/cta-icon.png" width="120" height="35" loading="lazy" alt="taste guarantee"
              class="img">

            <h2 class="h2 section-title">Scrivere qualcosa</h2>

            <p class="section-text">
        Prova
            </p>

            <a href="#" class="btn">Prova</a>

          </div>

        </div>
      </section>





      <!-- 
        - #BRAND
      -->

      <section class="section brand" aria-label="brand">
        <div class="container">

          <h2 class="h2 section-title">
            <span class="span">Brand</span> Popolari
          </h2>

          <ul class="has-scrollbar">

            <li class="scrollbar-item">
              <div class="brand-card img-holder" style="--width: 150; --height: 150;">
                <img src="./images/brand-1.png" width="150" height="150" loading="lazy" alt="brand logo"
                  class="img-cover">
              </div>
            </li>

            <li class="scrollbar-item">
              <div class="brand-card img-holder" style="--width: 150; --height: 150;">
                <img src="./images/brand-2.jpg" width="150" height="150" loading="lazy" alt="brand logo"
                  class="img-cover">
              </div>
            </li>

            <li class="scrollbar-item">
              <div class="brand-card img-holder" style="--width: 150; --height: 150;">
                <img src="./images/brand-3.jpg" width="150" height="150" loading="lazy" alt="brand logo"
                  class="img-cover">
              </div>
            </li>

            <li class="scrollbar-item">
              <div class="brand-card img-holder" style="--width: 150; --height: 150;">
                <img src="./images/brand-4.png" width="150" height="150" loading="lazy" alt="brand logo"
                  class="img-cover">
              </div>
            </li>

            <li class="scrollbar-item">
              <div class="brand-card img-holder" style="--width: 150; --height: 150;">
                <img src="./images/brand-5.jpg" width="150" height="150" loading="lazy" alt="brand logo"
                  class="img-cover">
              </div>
            </li>

          </ul>

        </div>
      </section>

    </article>
  </main>





  <!-- 
    - #FOOTER
  -->

  <footer class="footer" style="background-image: url('./images/footer-bg.jpg')">

    <div class="footer-top section">
      <div class="container">

        <div class="footer-brand">

          <a href="#" class="logo">Kitter</a>

          <p class="footer-text">
            If you have any question, please contact us at <a href="mailto:support@gmail.com"
              class="link">support@gmail.com</a>
          </p>

          <ul class="contact-list">

            <li class="contact-item">
              <ion-icon name="location-outline" aria-hidden="true"></ion-icon>

              <address class="address">
                30 Buttonwood St.Pataskala OH 43062
              </address>
            </li>

            <li class="contact-item">
              <ion-icon name="call-outline" aria-hidden="true"></ion-icon>

              <a href="tel:+16234567891011" class="contact-link">(+1)-6234-56-789-1011</a>
            </li>

          </ul>

          <ul class="social-list">

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-facebook"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-twitter"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-pinterest"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-instagram"></ion-icon>
              </a>
            </li>

          </ul>

        </div>

        <ul class="footer-list">

          <li>
            <p class="footer-list-title">Corporate</p>
          </li>

          <li>
            <a href="#" class="footer-link">Careers</a>
          </li>

          <li>
            <a href="#" class="footer-link">About Us</a>
          </li>

          <li>
            <a href="#" class="footer-link">Contact Us</a>
          </li>

          <li>
            <a href="#" class="footer-link">FAQs</a>
          </li>

          <li>
            <a href="#" class="footer-link">Vendors</a>
          </li>

          <li>
            <a href="#" class="footer-link">Affiliate Program</a>
          </li>

        </ul>

        <ul class="footer-list">

          <li>
            <p class="footer-list-title">Information</p>
          </li>

          <li>
            <a href="#" class="footer-link">Online Store</a>
          </li>

          <li>
            <a href="#" class="footer-link">Privacy Policy</a>
          </li>

          <li>
            <a href="#" class="footer-link">Refund Policy</a>
          </li>

          <li>
            <a href="#" class="footer-link">Shipping Policy</a>
          </li>

          <li>
            <a href="#" class="footer-link">Terms of Service</a>
          </li>

          <li>
            <a href="#" class="footer-link">Track Order</a>
          </li>

        </ul>

        <ul class="footer-list">

          <li>
            <p class="footer-list-title">Services</p>
          </li>

          <li>
            <a href="#" class="footer-link">Grooming</a>
          </li>

          <li>
            <a href="#" class="footer-link">Positive Dog Training</a>
          </li>

          <li>
            <a href="#" class="footer-link">Veterinary Services</a>
          </li>

          <li>
            <a href="#" class="footer-link">Petco Insurance</a>
          </li>

          <li>
            <a href="#" class="footer-link">Pet Adoption</a>
          </li>

          <li>
            <a href="#" class="footer-link">Resource Center</a>
          </li>

        </ul>

      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">

        <p class="copyright">
          &copy; 2022 Made with â¥ by <a href="#" class="copyright-link">codewithsadee.</a>
        </p>

        <img src="./images/payment.png" width="397" height="32" loading="lazy" alt="payment method" class="img">

      </div>
    </div>

  </footer>





  <!-- 
    - #BACK TO TOP
  -->

  <a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
    <ion-icon name="chevron-up" aria-hidden="true"></ion-icon>
  </a>





  <!-- 
    - custom js link
  -->
  <script src="./js/script.js" defer></script>

  <!-- 
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>