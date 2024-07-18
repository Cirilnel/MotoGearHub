<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/header.css">
<meta charset="ISO-8859-1">
</head>
<body>
 <header class="header" data-header>
    <div class="container">

      <button class="nav-toggle-btn" aria-label="toggle menu" data-nav-toggler>
        <ion-icon name="menu-outline" aria-hidden="true" class="menu-icon"></ion-icon>
        <ion-icon name="close-outline" aria-label="true" class="close-icon"></ion-icon>
      </button>

      <a href="home.jsp" class="logo">MotoGearHub</a>

      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="home.jsp" class="navbar-link" data-nav-link>Home</a>
          </li>

          <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/collezione" class="navbar-link" data-nav-link>Collezione</a>
          </li>
        </ul>

        <a href="#" class="navbar-action-btn">Log In</a>
      </nav>
        
      <div class="header-actions">

        <% if(request.getSession().getAttribute("logged") == null) {%>
            <a href="login.jsp" class="action-btn user" aria-label="User">
                <ion-icon name="person-outline" aria-hidden="true"></ion-icon>
            </a>   
        <%} else if(request.getSession().getAttribute("is_admin") == Boolean.TRUE){ %>
            <a href="admin.jsp" class="action-btn user" aria-label="User">
                <ion-icon name="person-outline" aria-hidden="true"></ion-icon>
            </a> 
            <a href="logout" class="action-btn user" aria-label="Logout">
                <ion-icon name="log-out-outline" aria-hidden="true"></ion-icon>
            </a>
        <%} else{%>
            <a href="profile.jsp" class="action-btn user" aria-label="User">
                <ion-icon name="person-outline" aria-hidden="true"></ion-icon>
            </a> 
            <a href="<%= request.getContextPath() %>/logout" class="action-btn user" aria-label="Logout">
                <ion-icon name="log-out-outline" aria-hidden="true"></ion-icon>
            </a>
        <%} %>

        <%
        // Recupera la lista degli articoli nel carrello dalla sessione
        List<ContieneBean> cartItems = (List<ContieneBean>) request.getSession().getAttribute("contieneCarrelloBeanList" + request.getSession().getAttribute("idCarrello"));

        // Calcola la somma delle quantità
        int totalQuantity = 0;
        if (cartItems != null) {
            for (ContieneBean item : cartItems) {
                totalQuantity += item.getQuantita();
            }
        }
        %>
        
        <a href="<%= request.getContextPath() %>/carrello" class="action-btn user" aria-label="User">
            <button class="action-btn" aria-label="cart">
                <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>
                <span class="btn-badge"><%= totalQuantity %></span>
            </button>
        </a>
      </div>

    </div>
  </header>
</body>
</html>
