<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
    <link rel="stylesheet" href="./css/enter.css"> <!-- Assicurati di aver salvato il tuo CSS in un file chiamato styles.css nella stessa directory -->
    <style>
        :root {
            --platinum: #e5e4e2;
            --black: #000000;
            --white: #ffffff;
            --eerie-black: #1b1b1b;
            --light-gray: #d3d3d3;
            --portland-orange: #ff5a36;
            --radius-4: 4px;
            --radius-10: 10px;
            --shadow-1: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            --transition-1: all 0.3s cubic-bezier(.25,.8,.25,1);
            --fs-3: 1.75rem;
            --fs-6: 1rem;
        }
    </style>
</head>
<body style="background-image: url('./images/sfondo2.jpg');" >
    <div class="login-container">
        <h2 class="section-title">Registrazione</h2>
        <form action="${pageContext.request.contextPath}/Register.do" method="POST" class="login-form" >
        <input type="hidden" name="mode" value="register">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="username">Cognome</label>
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
                <label for="password">Conferma Password</label>
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
