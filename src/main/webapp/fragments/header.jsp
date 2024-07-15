 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/style.css">
<meta charset="ISO-8859-1">
</head>
 <header class="header" data-header>
    <div class="container">

      <button class="nav-toggle-btn" aria-label="toggle manu" data-nav-toggler>
        <ion-icon name="menu-outline" aria-hidden="true" class="menu-icon"></ion-icon>
        <ion-icon name="close-outline" aria-label="true" class="close-icon"></ion-icon>
      </button>

      <a href="collezione?mode=home" class="logo">MotoGearHub</a>

      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="collezione?mode=home" class="navbar-link" data-nav-link>Home</a>
          </li>

          <li class="navbar-item">
            <a href="collezione.jsp" class="navbar-link" data-nav-link>Collezione</a>
          </li>

          <li class="navbar-item">
            <a href="contact.jsp" class="navbar-link" data-nav-link>Contatti</a>
          </li>

        </ul>

        <a href="#" class="navbar-action-btn">Log In</a>
      </nav>

      <div class="header-actions">


       <a href="login.jsp" class="action-btn user" aria-label="User">
    	<ion-icon name="person-outline" aria-hidden="true"></ion-icon>
	   </a>
	   
	   <a href="carrello.jsp" class="action-btn user" aria-label="User">
        <button class="action-btn" aria-label="cart">
          <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>

          <span class="btn-badge">0</span>
        </button>
		</a>
      </div>

    </div>
  </header>