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

// PHP code for deleting appointments
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['randevu_id'])) {
    // Database connection
    $conn = mysqli_connect('localhost', 'root', '', 'database_390');
    if (!$conn) {
        echo 'Connection error: ' . mysqli_connect_error();
    }

    $randevu_id = $_POST['randevu_id'];

    // SQL to delete appointment
    $sql = "DELETE FROM randevular WHERE randevu_id = $randevu_id";

    // Execute the query
    if (mysqli_query($conn, $sql)) {
        // Appointment deleted successfully
        echo 'success';
    } else {
        // Failed to delete appointment
        echo 'Error deleting appointment: ' . mysqli_error($conn);
    }

    // Close database connection
    mysqli_close($conn);
}
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



        .appointment-box {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
        }

        .appointment-details {
            margin-bottom: 10px;
        }

        .delete-button {
            text-align: right;
        }
    </style>

    <script>
        // JavaScript function to handle AJAX request for deleting appointments
        function deleteAppointment(appointmentId) {
            if (confirm('Are you sure you want to delete this appointment?')) {
                // Create a new XMLHttpRequest object
                var xhr = new XMLHttpRequest();

                // Configure the request
                xhr.open('POST', 'randevu_detay.php', true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

                // Define what happens on successful data submission
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Reload the page after deletion
                        window.location.reload();
                    } else {
                        alert('Error deleting appointment. Please try again.'); // Show error message
                    }
                };

                // Send the request with the appointment ID as data
                xhr.send('randevu_id=' + appointmentId);
            }
        }
    </script>
    <script>
        function goBack() {
            window.location.href = 'randevularım.php';
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
        <h2>Randevu Detayı</h2>

        <?php
        // Check if there are any appointments
        if (mysqli_num_rows($result) > 0) {
            // Loop through each appointment and display them
            while ($bilgi = mysqli_fetch_assoc($result)) {
                // Start appointment box
                echo '<div class="appointment-box" id="appointment-box-' . $bilgi['randevu_id'] . '">';

                // Individual appointment details
                echo '<div class="appointment-details">';
                echo '<div class="info">';
                echo '<span>Doktor Adı:</span>';
                echo '<p>' . htmlspecialchars($bilgi['doktor_isim']) . '</p>';
                echo '</div>';

                echo '<div class="info">';
                echo '<span>Departman:</span>';
                echo '<p>' . htmlspecialchars($bilgi['departman']) . '</p>';
                echo '</div>';

                echo '<div class="info">';
                echo '<span>Hastane:</span>';
                echo '<p>' . htmlspecialchars($bilgi['hastane']) . '</p>';
                echo '</div>';

                // Display the date and time
                echo '<div class="info">';
                echo '<span>Randevu Tarihi:</span>';
                echo '<p>' . htmlspecialchars($bilgi['tarih']) . '</p>';
                echo '</div>';
                echo '</div>'; // End appointment-details

                // Delete button
                echo '<div class="delete-button">';
                echo '<button onclick="deleteAppointment(' . $bilgi['randevu_id'] . ')">Randevuyu Sil</button>';
                echo '</div>'; // End delete-button

                echo '</div>'; // End appointment-box
            }
        } else {
            echo '<p>No appointments found.</p>';
        }
        ?>
        <div class="edit-button">
            <button type="button" onclick="goBack()">Geri</button>
        </div>
    </div>
</body>

</html>