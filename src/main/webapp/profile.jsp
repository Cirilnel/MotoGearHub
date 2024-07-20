<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo - MotoGearHub</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
      <link rel="stylesheet" href="./css/profile.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">

   
<script src="<%=request.getContextPath()%>/js/script.js" defer></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body id="top">

    <!-- Header -->
    <jsp:include page="fragments/header.jsp" />

    <!-- Profile Section -->
    <section class="section">
        <div class="container">
            <div class="profile-card">
                <div class="profile-image">
                    <center><img src="./images/omino.jpg" alt="Profile Image" class="img-cover"></center>
                </div>
                
         
                
                <div class="profile-info">       
                <h2>Informazioni dell'account</h2>
            	<p>Username: <%= request.getSession().getAttribute("utente") %></p>
                <p>Email: <%= request.getSession().getAttribute("email") %></p>
                <p>Nome: <%= request.getSession().getAttribute("nome") %></p>
                <p>Cognome: <%= request.getSession().getAttribute("cognome") %></p>        
                    
                      <form action="<%= request.getContextPath() %>/logout" method="post">
                        <button class="btn" type="submit">
                            <ion-icon name="log-out-outline"></ion-icon>
                            Logout
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Back to Top Button -->
    <button class="back-top-btn" aria-label="back to top">
        <ion-icon name="arrow-up-outline"></ion-icon>
    </button>

 
	
</body>
</html>
