<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/enter.css">
    <title>Login</title>
</head>
<body style="background-image: url('./images/sfondo2.jpg');" >
    <div class="background"></div>
    <div class="login-container">
        <h2 class="section-title">Login</h2>
        <form action="${pageContext.request.contextPath}/Login.do" method="post" class="login-form">
        <% 
        String error = (String) session.getAttribute("error");
		if (error != null) {
	    out.println("<p style='color:red;'>" + error + "</p>");
	    session.removeAttribute("error"); 
		}
		%>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="usernameLogin" name="usernameLogin" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="passwordLogin" name="passwordLogin" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
        <div class="register-link">
            <p>Non hai un account? <a href="register.jsp">Registrati ora</a></p>
        </div>
    </div>
</body>
</html>


