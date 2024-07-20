<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" %>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<%=request.getContextPath()%>/js/script.js" defer></script>
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

          <a href="${pageContext.request.contextPath}/collezione" class="btn">Acquista ora</a>

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
                        <a href="casco.jsp">
                            <img src="./images/category-1.jpg" width="330" height="300" loading="lazy" alt="Cat Food"
                                class="img-cover">
                        </a>
                    </figure>

                    <h3 class="h3">
                        <a href="${pageContext.request.contextPath}/CascoRedirectServlet" class="card-title">Caschi</a>
                    </h3>

                </div>
            </li>

            <li class="scrollbar-item">
                <div class="category-card">

                    <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                        <a href="abbigliamento.jsp">
                            <img src="./images/category-2.jpg" width="330" height="300" loading="lazy" alt="Cat Toys"
                                class="img-cover">
                        </a>
                    </figure>

                    <h3 class="h3">
                        <a href="${pageContext.request.contextPath}/AbbigliamentoRedirectServlet" class="card-title">Abbigliamento da moto</a>
                    </h3>

                </div>
            </li>

            <li class="scrollbar-item">
                <div class="category-card">

                    <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                        <a href="guanti.jsp">
                            <img src="./images/category-3.jpg" width="330" height="300" loading="lazy" alt="Dog Food"
                                class="img-cover">
                        </a>
                    </figure>

                    <h3 class="h3">
                        <a href="${pageContext.request.contextPath}/GuantiRedirectServlet" class="card-title">Guanti</a>
                    </h3>

                </div>
            </li>

            <li class="scrollbar-item">
                <div class="category-card">

                    <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                        <a href="stivale.jsp">
                            <img src="./images/category-4.jpg" width="330" height="300" loading="lazy" alt="Dog Toys"
                                class="img-cover">
                        </a>
                    </figure>

                    <h3 class="h3">
                        <a href="${pageContext.request.contextPath}/StivaleRedirectServlet" class="card-title">Stivali da moto</a>
                    </h3>

                </div>
            </li>

            <li class="scrollbar-item">
                <div class="category-card">

                    <figure class="card-banner img-holder" style="--width: 330; --height: 300;">
                        <a href="pneumatici.jsp">
                            <img src="./images/category-5.jpg" width="330" height="300" loading="lazy" alt="Dog Supplements"
                                class="img-cover">
                        </a>
                    </figure>

                    <h3 class="h3">
                        <a href="${pageContext.request.contextPath}/PneumaticiRedirectServlet" class="card-title">Pneumatici</a>
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

                <a href="${pageContext.request.contextPath}/AbbigliamentoRedirectServlet" class="btn">Read More</a>

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
                <a href="${pageContext.request.contextPath}/PneumaticiRedirectServlet" class="btn">Read More</a>

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

                <a href="${pageContext.request.contextPath}/CascoRedirectServlet" class="btn">Read More</a>

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

                <h3 class="h3 card-title">Spedizione in 1 giorno gratuita!</h3>

                <p class="card-text">
                  Ordina prima delle 14:00 per ottenere la spedizione gratuita su ordini di +35$
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-2.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">Rimborso entro 30 giorni</h3>

                <p class="card-text">
                  Rimborso fino a più del 50% del valore dei prodotti garantito!
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-3.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">Transazioni sicure</h3>

                <p class="card-text">
                  Sconto del 25% sul tuo ordine online di $50+. Disponibile nella maggior parte di Italia.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <figure class="card-icon">
                  <img src="./images/service-icon-4.png" width="70" height="70" loading="lazy"
                    alt="service icon">
                </figure>

                <h3 class="h3 card-title">Assistenza Clienti 24/7</h3>

                <p class="card-text">
                  Assistenza clienti disponibile ad ogni ora di ogni giorno!
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
				 
<h2 class="sicurezza">
    La sicurezza in moto non è un optional: indossa sempre il casco, mantieni una guida prudente e rispetta i limiti di velocità.<br>
    I nostri prodotti sono progettati specificamente per i motociclisti, costruiti con materiali sicuri ed ecologici,<br> e ti aiuteranno ad affrontare la strada in tranquillità.<br>Dai un'occhiata alle nuove collezioni!
</h2>
            <p class="section-text">
        try
            </p>

        
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

    <jsp:include page="fragments/footer.jsp" />





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