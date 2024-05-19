<?php
session_start(); // Start the session

// Check if the user is logged in, if not, redirect them to the login page
if (!isset($_SESSION['tc'])) {
    header("Location: loginpage.php");
    exit();
}

// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    echo 'Connection error: ' . mysqli_connect_error();
}

// Retrieve diseases for the logged-in user along with images
$tc = $_SESSION['tc'];
$query = "
    SELECT h.hastalik_adi AS 'Hastalık Adı', h.departman_adı AS 'Departman', g.görününtÜ AS 'görüntü'
    FROM görüntüleme g
    JOIN hastaliklar h ON g.hastalik_id = h.id
    WHERE g.tc = '$tc'
";
$result = mysqli_query($conn, $query);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Görüntülemeler</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            min-height: 100vh;
            background-image: url("resimler/bg.png");
            background-size: cover;
        }

        nav {
            background-color: #f5f5f5;
            color: #2D4059;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar-logo {
            display: flex;
            align-items: center;
        }

        .navbar-logo img {
            height: 80px;
            vertical-align: middle;
            margin-right: 10px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-buttons {
            display: flex;
            align-items: center;
        }

        .navbar-buttons a {
            color: #2D4059;
            text-decoration: none;
            margin: 0 10px;
        }

        .container {
            width: 50%;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin: 40px auto 0;
        }

        h2 {
            text-align: center;
            color: #2D4059;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .disease-box {
            background-color: #f5f5f5;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .disease-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 2px;
            border-bottom: 1px solid #ddd;
        }

        .disease-info:last-child {
            border-bottom: none;
        }

        .disease-info span {
            font-weight: bold;
            margin-right: 10px;
            flex: 1;
            text-align: left;
        }

        .disease-info p {
            margin: 0;
            flex: 1;
            text-align: left;
        }

        .disease-img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .edit-button {
            display: flex;
            justify-content: center;
        }

        button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 8px;
            background-color: #2D4059;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .logolink {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .navbar-logo img {
                height: 60px;
            }

            .navbar-brand {
                font-size: 20px;
            }

            .container {
                width: 80%;
                padding: 20px;
                margin: 20px auto;
            }

            h2 {
                font-size: 28px;
            }

            .disease-info {
                flex-direction: column;
            }

            .disease-info span,
            .disease-info p {
                text-align: center;
            }

            button {
                font-size: 14px;
                padding: 8px 16px;
            }
        }

        @media (max-width: 480px) {
            .navbar-logo img {
                height: 50px;
            }

            .navbar-brand {
                font-size: 18px;
            }

            .navbar-buttons a {
                font-size: 14px;
                margin: 0 5px;
            }

            .container {
                width: 80%;
                padding: 15px;
                margin: 15px auto;
            }

            h2 {
                font-size: 24px;
            }

            .disease-info {
                flex-direction: column;
            }

            .disease-info span,
            .disease-info p {
                text-align: center;
            }

            button {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
    </style>
    <script>
        function goBack() {
            window.location.href = 'homepage.php';
        }
    </script>
</head>

<body>

    <nav>
        <!-- Your navigation bar -->
        <div class="navbar-logo">
            <a href="homepage.php"><img src="resimler/CareConnect.png" alt="Your Logo"></a>
            <a href="homepage.php" class="logolink"><span class="navbar-brand">CareConnect</span></a>

        </div>
        <div class="navbar-buttons">
            <a href="loginpage.php">Çıkış</a>
        </div>
    </nav>

    <div class="container">
        <h2>Görüntülemeler</h2>

        <?php
        // Check if there are any diseases
        if (mysqli_num_rows($result) > 0) {
            // Loop through each disease and display them
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<div class="disease-box">';
                echo '<div class="disease-info">';
                echo '<span>Hastalık Adı:</span>';
                echo '<p>' . htmlspecialchars($row['Hastalık Adı']) . '</p>';
                echo '</div>';

                echo '<div class="disease-info">';
                echo '<span>Departman:</span>';
                echo '<p>' . htmlspecialchars($row['Departman']) . '</p>';
                echo '</div>';


                echo '<div class="disease-info">';
                echo '<span>Görüntü:</span>';
                echo '<p><img class="disease-img" src="data:image/jpeg;base64,' . base64_encode($row['görüntü']) . '" alt="Disease Image"></p>';
                echo '</div>';


                echo '</div>'; // Close disease-box
            }
        } else {
            echo '<p>Hiçbir hastalık bulunamadı.</p>';
        }
        ?>
        <div class="edit-button">
            <button type="button" onclick="goBack()">Geri</button>
        </div>
    </div>

</body>

</html>

<?php
mysqli_free_result($result);
mysqli_close($conn);
?>