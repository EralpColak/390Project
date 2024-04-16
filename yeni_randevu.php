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

// If the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tc = $_SESSION['tc'];
    $doktor_ıd = $_POST['doktor_ıd'];

    // Insert the new appointment into the database
    $sql = "INSERT INTO randevular (tc, doktor_ıd) VALUES (?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "ss", $tc, $doktor_ıd);
    mysqli_stmt_execute($stmt);

    // Check if the appointment was successfully added
    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo "Appointment created successfully!";
    } else {
        echo "Error creating appointment!";
    }

    // Close the prepared statement
    mysqli_stmt_close($stmt);
}

// Fetch distinct cities from the hospitals table
$sql = "SELECT DISTINCT sehir FROM hastaneler";
$result = mysqli_query($conn, $sql);

// If there are cities available
if (mysqli_num_rows($result) > 0) {
    echo "<form action='yeni_randevu.php' method='POST'>";
    echo "<label for='city'>Choose a city:</label>";
    echo "<select name='city' id='city'>";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<option value='" . $row['city'] . "'>" . $row['city'] . "</option>";
    }
    echo "</select>";

    echo "<input type='submit' value='Next'>";
    echo "</form>";
} else {
    echo "No cities available.";
}

// Close the database connection
mysqli_close($conn);
