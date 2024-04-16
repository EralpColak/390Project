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

// Retrieve personal information for the logged-in user
$tc = $_SESSION['tc'];
$sql = "SELECT randevular.*, doktorlar.doktor_isim, doktorlar.departman, doktorlar.hastane 
        FROM randevular 
        INNER JOIN doktorlar ON randevular.doktor_ıd = doktorlar.doktor_ıd 
        WHERE randevular.tc = '$tc'";
$result = mysqli_query($conn, $sql);

// If there is no information for the logged-in user, display blank space
if (mysqli_num_rows($result) === 0) {
    $bilgi = array(
        'doktor_isim' => '',
        'departman' => '',
        'hastane' => '',
    );
} else {
    // Fetch personal information for the logged-in user
    $bilgi = mysqli_fetch_assoc($result);
}

mysqli_free_result($result);
mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Randevu Detayı</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            /* Light background */
            min-height: 100vh;
            background-image: url("bg.png");
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

        .info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            /* Align items vertically */
            margin-bottom: 20px;
            padding-bottom: 2px;
            border-bottom: 1px solid #ddd;
            /* Add border between info sections */
        }

        .info:last-child {
            border-bottom: none;
            /* Remove border from the last info section */
        }

        .info span {
            font-weight: bold;
            margin-right: 10px;
            /* Add margin between title and info */
            flex: 1;
            /* Occupy remaining space */
            text-align: left;
            /* Right-align text */
        }

        .info p {
            margin: 0;
            flex: 1;
            /* Occupy remaining space */
            text-align: left;
            /* Right-align text */
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: #ccc;
            /* Light gray background */
            margin: 0 auto 20px;
            /* Center the image and add margin */
            overflow: hidden;
            /* Hide overflow content */
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* Maintain aspect ratio */
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

    <div class="container">
        <h2>Randevu Detayı</h2>

        <div class="info">
            <span>Doktor Adı:</span>
            <p><?php echo htmlspecialchars($bilgi['doktor_isim']); ?></p>
        </div>

        <div class="info">
            <span>Departman:</span>
            <p><?php echo htmlspecialchars($bilgi['departman']); ?></p>
        </div>

        <div class="info">
            <span>Hastane:</span>
            <p><?php echo htmlspecialchars($bilgi['hastane']); ?></p>
        </div>
    </div>

</body>

</html>