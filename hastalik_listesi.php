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

// Retrieve diseases for the logged-in user along with doctor information
$tc = $_SESSION['tc'];
$query = "
    SELECT h.hastalik_adi, h.departman_adı, d.doktor_isim, d.departman, d.hastane
    FROM hastalik_listesi hl
    JOIN hastaliklar h ON hl.hastalik_id = h.id
    JOIN doktorlar d ON hl.doktor_id = d.doktor_ıd
    WHERE hl.tc = '$tc'
";
$result = mysqli_query($conn, $query);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hastalıklarım</title>

    <style>
        /* Your CSS styles here */
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
            width: 50%;
            padding: 40px;
            background-color: #fff;
            /* White background */
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            /* Box shadow */
            margin-top: 20px;
            /* Add margin from navbar */
            margin: 40px auto 0;
            /* Add margin from top */
        }

        h2 {
            text-align: center;
            /* Align title to the left */
            color: #2D4059;
            /* Dark blue */
            font-size: 36px;
            /* Adjust font size */
            font-weight: bold;
            /* Bold text */
            margin-bottom: 20px;
            /* Add margin for spacing */
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
            /* Align items vertically */
            margin-bottom: 20px;
            padding-bottom: 2px;
            border-bottom: 1px solid #ddd;
            /* Add border between info sections */
        }

        .disease-info:last-child {
            border-bottom: none;
            /* Remove border from the last info section */
        }

        .disease-info span {
            font-weight: bold;
            margin-right: 10px;
            /* Add margin between title and info */
            flex: 1;
            /* Occupy remaining space */
            text-align: left;
            /* Right-align text */
        }

        .disease-info p {
            margin: 0;
            flex: 1;
            /* Occupy remaining space */
            text-align: left;
            /* Right-align text */
        }

        .edit-button {
            display: flex;
            justify-content: center;
            /* Center the button */
        }

        button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 8px;
            background-color: #2D4059;
            /* Dark blue */
            color: #fff;
            /* White text */
            font-size: 16px;
            /* Adjust font size */
            font-weight: bold;
            /* Bold text */
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
        <h2>Hastalıklarım</h2>

        <?php
        // Check if there are any diseases
        if (mysqli_num_rows($result) > 0) {
            // Loop through each disease and display them
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<div class="disease-box">';
                echo '<div class="disease-info">';
                echo '<span>Hastalık Adı:</span>';
                echo '<p>' . htmlspecialchars($row['hastalik_adi']) . '</p>';
                echo '</div>';

                echo '<div class="disease-info">';
                echo '<span>Departman:</span>';
                echo '<p>' . htmlspecialchars($row['departman_adı']) . '</p>';
                echo '</div>';

                echo '<div class="disease-info">';
                echo '<span>Doktor Adı:</span>';
                echo '<p>' . htmlspecialchars($row['doktor_isim']) . '</p>';
                echo '</div>';

                echo '<div class="disease-info">';
                echo '<span>Hastane:</span>';
                echo '<p>' . htmlspecialchars($row['hastane']) . '</p>';
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