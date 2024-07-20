<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link rel="stylesheet" href="./css/enter.css"> 
      <link rel="stylesheet" href="./css/register.css"> 
</head>
<body style="background-image: url('./images/sfondo2.jpg');" >
    <div class="login-container">
        <h2 class="section-title">Registrazione</h2>

        <!-- Messaggio di errore -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message"><%= error %></div>
        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/Register.do" method="POST" class="login-form">
            <input type="hidden" name="mode" value="register">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" required>
            </div>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="passwordCheck">Conferma Password</label>
                <input type="password" id="passwordCheck" name="passwordCheck" required>
            </div>
            <button type="submit" class="btn">Registrati</button>
        </form>
        <div class="register-link">
            Hai già un account? <a href="login.jsp">Accedi</a>
        </div>
    </div>
</body>
</html>
