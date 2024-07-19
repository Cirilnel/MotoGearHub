<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Gestione Prodotti</title>
    <link rel="shortcut icon" href="./favicon.png" type="image/svg+xml">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Carter+One&family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/category.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
  font-family: 'Nunito Sans', Arial, sans-serif;
}

body {
  background-color: #9C9C9C;
  display: flex;
  flex-direction: column;
  align-items: center;
}

h1 {
  text-align: center;
  margin-top: 50px;
  color: #fff;
}

form {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 300px;
  margin: 20px;
  text-align: center;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  color: #333;
  font-weight: bold;
  text-align: center;
  font-size: 1.2rem;
}

.form-group input,
.form-group textarea,
.form-group select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.form-group input[type="submit"] {
  background-color: #ff0000;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}

.form-group input[type="submit"]:hover {
  background-color: #cc0000;
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
  margin: 10px;
}

.btn:hover {
  background-color: #cc0000;
}

/* Stili per il footer */
footer {
  background-color: #333;
  color: #fff;
  text-align: center;
  padding: 10px 0;
  width: 100%;
  position: absolute;
  bottom: 0;
}

/* Media Queries */
@media (max-width: 768px) {
  form {
    width: 80%;
  }

  .btn {
    width: 80%;
    justify-content: center;
  }
}

@media (max-width: 600px) {
  form {
    width: 90%;
  }

  .btn {
    width: 90%;
    justify-content: center;
  }
}
</style>
</head>
<body>
 <jsp:include page="fragments/header.jsp" />
 
	<br><br>
    <h1>Gestione Prodotti</h1>
	<br><br><br>
    <!-- Form di inserimento prodotto -->
    <form action="<%= request.getContextPath() %>/inserisciElemento" method="post">
    <div class="form-group">
        <label for="marca">Marca:</label>
        <input type="text" id="marca" name="marca" required>
    </div>
    <div class="form-group">
        <label for="image">Immagine:</label>
        <input type="text" id="image" name="image" required>
    </div>
    <div class="form-group">
        <label for="prezzo">Prezzo:</label>
        <input type="number" id="prezzo" name="prezzo" step="1" min="0" required>
    </div>
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>
    </div>
    <div class="form-group">
        <label for="descrizione">Descrizione:</label>
        <textarea id="descrizione" name="descrizione" rows="4" required></textarea>
    </div>
    <div class="form-group">
        <label for="idCategoria">Categoria:</label>
        <select id="idCategoria" name="idCategoria" required>
            <option value="">Seleziona una categoria</option>
            <option value="1">Stivale</option>
            <option value="2">Pneumatici</option>
            <option value="3">Casco</option>
            <option value="4">Abbigliamento</option>
            <option value="5">Guanti</option>
        </select>
    </div>
    <div class="form-group">
        <input type="submit" value="Inserisci Prodotto" class="btn">
    </div> 
</form>


    <!-- Bottone per modificare la collezione -->
    <a href="${pageContext.request.contextPath}/LoadProdotti" class="btn">Modifica Collezione</a>

    <!-- Bottone per visualizzare gli ordini -->
    <a href="ordiniAdmin.jsp" class="btn">Visualizza Ordini</a>
     <jsp:include page="fragments/footer.jsp" />
</body>
</html>
