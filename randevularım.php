<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Randevularım</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            /* Light background */
            min-height: 100vh;
            background-image: url("resimler/bg.png");
            background-size: cover;
        }

        nav {
            background-color: #f5f5f5;
            /* Light background */
            color: #2D4059;
            /* Dark blue */
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            /* Box shadow for separation */
        }

        .navbar-logo {
            display: flex;
            align-items: center;
        }

        .navbar-logo img {
            height: 80px;
            /* Adjust height as needed */
            vertical-align: middle;
            margin-right: 10px;
            /* Add margin to separate logo and text */
        }

        .navbar-brand {
            font-size: 24px;
            /* Adjust font size */
            font-weight: bold;
            /* Bold text */
        }

        .navbar-buttons {
            display: flex;
            align-items: center;
        }

        .navbar-buttons a {
            color: #2D4059;
            /* Dark blue */
            text-decoration: none;
            margin: 0 10px;
        }

        .container {
            display: grid;
            grid-template-rows: auto auto auto;
            grid-template-columns: repeat(18, 1fr);
            gap: 20px;
            padding: 20px;
        }

        .card {
            width: 100%;
            height: 150px;
            background-color: #769FCD;
            /* Light blue */
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            text-decoration: none;
            transition: transform 0.3s ease;
            font-size: 24px;
        }

        .card:nth-child(1),
        .card:nth-child(3) {
            grid-column: 3 / span 7;
            /* Adjusted column span */
        }

        .card:nth-child(2),
        .card:nth-child(4) {
            grid-column: 10 / span 7;
            /* Adjusted column span */
        }

        .card:nth-child(5) {
            grid-column: 6 / span 8;
            /* Centered at the middle */
        }


        .card:hover {
            transform: scale(1.05);
        }

        h2 {
            text-align: center;
            /* Center the text */
            margin-top: 30px;
            /* Add margin for better spacing */
            color: #2D4059;
            /* Dark blue */
            font-size: 36px;
            /* Adjust font size */
            font-weight: bold;
            /* Bold text */
        }
    </style>
</head>

<body>

    <nav>
        <div class="navbar-logo">
            <a href="homepage.php"><img src="resimler/CareConnect.png" alt="Your Logo"></a>
            <span class="navbar-brand">CareConnect</span>
        </div>
        <div class="navbar-buttons">

            <a href="loginpage.php">Çıkış</a>
        </div>
    </nav>

    <h2>Randevularım</h2>

    <div class="container">

        <a href="yeni_randevu.php" class="card">Yeni Randevu</a>
        <a href="randevu_detay.php" class="card">Randevularım</a>

    </div>

</body>

</html>
