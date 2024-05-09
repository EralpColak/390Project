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

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if there is already a row associated with the user's TC
    $tc = $_SESSION['tc'];
    $check_query = "SELECT * FROM kisisel_bilgiler WHERE tc = '$tc'";
    $check_result = mysqli_query($conn, $check_query);
    if (mysqli_num_rows($check_result) > 0) {
        // If a row exists, update it
        $update_query = "UPDATE kisisel_bilgiler SET isim = ?, soyisim = ?, cinsiyet = ?, kan_grubu = ?, adres = ?, aile_hekimi = ? WHERE tc = ?";
        $stmt = $conn->prepare($update_query);
        $stmt->bind_param("sssssss", $_POST['isim'], $_POST['soyisim'], $_POST['cinsiyet'], $_POST['kan_grubu'], $_POST['adres'], $_POST['aile_hekimi'], $tc);
        $stmt->execute();
        $stmt->close();
    } else {
        // If no row exists, insert a new one
        $insert_query = "INSERT INTO kisisel_bilgiler (tc, isim, soyisim, cinsiyet, kan_grubu, adres, aile_hekimi) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($insert_query);
        $stmt->bind_param("sssssss", $tc, $_POST['isim'], $_POST['soyisim'], $_POST['cinsiyet'], $_POST['kan_grubu'], $_POST['adres'], $_POST['aile_hekimi']);
        $stmt->execute();
        $stmt->close();
    }
    // Redirect to kisisel_bilgilerim.php after updating
    header('Location: kisisel_bilgilerim.php');
    exit;
}

// Retrieve personal information
$tc = $_SESSION['tc'];
$sql = "SELECT * FROM kisisel_bilgiler WHERE tc = '$tc'";
$result = mysqli_query($conn, $sql);
$bilgiler = mysqli_fetch_assoc($result);
mysqli_free_result($result);
mysqli_close($conn);
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kişisel Bilgileri Düzenle</title>
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

        .logolink {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
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



        /* Custom styles for input and select tags */
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            max-width: 300px;
            /* Set a maximum width */
            background-color: #f2f2f2;
            /* Light gray background */
            color: #333;
            /* Dark gray text */
            font-size: 14px;
            /* Adjust font size */
            transition: border-color 0.3s ease;
            /* Add transition effect */
        }

        /* Additional styles for submit button */
        .submit-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        input[type="text"]:focus,
        select:focus {
            outline: none;
            /* Remove default focus outline */
            border-color: #2D4059;
            /* Dark blue border color on focus */
            box-shadow: 0 0 5px rgba(45, 64, 89, 0.3);
            /* Add box shadow on focus */
        }
    </style>
    <script>
        function submitForm() {
            // Submit the form
            document.getElementById("updateForm").submit();
        }

        function goBack() {
            window.location.href = 'kisisel_bilgilerim.php';
        }
    </script>


</head>

<body>
    <nav>
        <div class="navbar-logo">
            <a href="homepage.php"><img src="resimler/CareConnect.png" alt="Your Logo"></a>
            <a href="homepage.php" class="logolink"><span class="navbar-brand">CareConnect</span></a>
        </div>
        <div class="navbar-buttons">
            <a href="loginpage.php">Çıkış</a>
        </div>
    </nav>
    <form id="updateForm" method="POST" action="">
        <div class="container">
            <h2>Kişisel Bilgilerim</h2>
            <div class="info">
                <span>Ad:</span>
                <input type="text" value="<?php echo htmlspecialchars($bilgiler['isim']); ?>" name="isim">
            </div>
            <div class="info">
                <span>Soy Ad:</span>
                <input type="text" value="<?php echo htmlspecialchars($bilgiler['soyisim']); ?>" name="soyisim">
            </div>
            <div class="info">
                <span>Cinsiyet:</span>
                <select name="cinsiyet">
                    <option value="erkek" <?php if ($bilgiler['cinsiyet'] === 'erkek') echo 'selected'; ?>>Erkek</option>
                    <option value="kadın" <?php if ($bilgiler['cinsiyet'] === 'kadın') echo 'selected'; ?>>Kadın</option>
                </select>
            </div>
            <div class="info">
                <span>Kan Grubu:</span>
                <select name="kan_grubu">
                    <option value="A Rh+" <?php if ($bilgiler['kan_grubu'] === 'A Rh+') echo 'selected'; ?>>A Rh+</option>
                    <option value="A Rh-" <?php if ($bilgiler['kan_grubu'] === 'A Rh-') echo 'selected'; ?>>A Rh-</option>
                    <option value="B Rh+" <?php if ($bilgiler['kan_grubu'] === 'B Rh+') echo 'selected'; ?>>B Rh+</option>
                    <option value="B Rh-" <?php if ($bilgiler['kan_grubu'] === 'B Rh-') echo 'selected'; ?>>B Rh-</option>
                    <option value="AB Rh+" <?php if ($bilgiler['kan_grubu'] === 'AB Rh+') echo 'selected'; ?>>AB Rh+</option>
                    <option value="AB Rh-" <?php if ($bilgiler['kan_grubu'] === 'AB Rh-') echo 'selected'; ?>>AB Rh-</option>
                    <option value="0 Rh+" <?php if ($bilgiler['kan_grubu'] === '0 Rh+') echo 'selected'; ?>>0 Rh+</option>
                    <option value="0 Rh-" <?php if ($bilgiler['kan_grubu'] === '0 Rh-') echo 'selected'; ?>>0 Rh-</option>
                </select>
            </div>
            <div class="info">
                <span>Adres:</span>
                <input type="text" value="<?php echo htmlspecialchars($bilgiler['adres']); ?>" name="adres">
            </div>
            <div class="info">
                <span>Aile hekimi:</span>
                <input type="text" value="<?php echo htmlspecialchars($bilgiler['aile_hekimi']); ?>" name="aile_hekimi">
            </div>
            <div class="edit-button">
                <button type="button" onclick="submitForm()">Kaydet</button>
                <button type="button" onclick="goBack()">Geri</button>
            </div>

        </div>


    </form>
</body>

</html>