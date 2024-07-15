<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
 	<link rel="stylesheet" href="./css/style.css">
    <script type="module" src="https://cdn.jsdelivr.net/npm/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>

<!-- Header -->
<header class="header">
    <div class="container">
        <a href="#" class="logo">Logo</a>
        <button class="action-btn user">
            <ion-icon name="person-circle-outline"></ion-icon>
            
        </button>
    </div>
</header>

<!-- Profile Section -->
<section class="section">
    <div class="container">
        <div class="profile-card">
            <div class="profile-image">
                <img src="path/to/profile-image.jpg" alt="Profile Image" class="img-cover">
            </div>
            <div class="profile-info">
                <h2 class="h2">John Doe</h2>
                <p class="profile-text">Email: johndoe@example.com</p>
                <p class="profile-text">Phone: +123456789</p>
                <button class="btn logout-btn">
                    <ion-icon name="log-out-outline"></ion-icon>
                    Logout
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Back to Top Button -->
<button class="back-top-btn">
    <ion-icon name="arrow-up-outline"></ion-icon>
</button>

</body>
</html>
