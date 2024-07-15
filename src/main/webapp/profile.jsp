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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #f7b453;
            margin: 0;
            padding: 0;
            font-family: 'Nunito Sans', Arial, sans-serif;
        }
        .profile-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }
        .profile-image img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-info h2 {
            font-family: 'Bangers', cursive;
            font-size: 2.5rem;
            color: #333;
            margin: 10px 0;
        }
        .profile-text {
            font-family: 'Nunito Sans', sans-serif;
            font-size: 1.2rem;
            color: #666;
            margin: 5px 0;
        }
        .btn {
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
        .btn:hover {
            background-color: #cc0000;
        }
        .btn ion-icon {
            margin-right: 5px;
        }
        .back-top-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #ff0000;
            color: white;
            border: none;
            border-radius: 50%;
            padding: 10px;
            cursor: pointer;
            display: none;
        }
        .back-top-btn ion-icon {
            font-size: 1.5rem;
        }
    </style>

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

    <script>
        // Show/hide back to top button
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
