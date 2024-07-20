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
    <link rel="stylesheet" href="./css/admin.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
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

    <!-- Bottone per eliminare un prodotto -->
    <a href="${pageContext.request.contextPath}/RimozioneAdmin" class="btn">Elimina Prodotto</a>

    <!-- Bottone per modificare la collezione -->
    <a href="${pageContext.request.contextPath}/LoadProdotti" class="btn">Modifica Collezione</a>

    <!-- Bottone per visualizzare gli ordini -->
    <a href="${pageContext.request.contextPath}/ordini" class="btn">Visualizza Ordini</a>

    <jsp:include page="fragments/footer.jsp" />
</body>
</html>
