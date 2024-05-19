<?php
session_start(); // Start the session

// Redirect to login page if the user is not logged in
if (!isset($_SESSION['tc'])) {
    header("Location: loginpage.php");
    exit();
}

// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    die('Connection error: ' . mysqli_connect_error());
}

// Retrieve session variable
$tc = $_SESSION['tc'];

// Retrieve the value of yesResponses from the AJAX request
$yesResponses = $_POST['yesResponses'];

// Convert the yesResponses array into a string
$yesResponsesString = implode(',', $yesResponses);

// Prepare the SQL statement
$sql = "INSERT INTO `soru_cevaplari` (`tc`, `soru_id`) VALUES ('$tc', '$yesResponsesString')";

// Execute the SQL statement
if (mysqli_query($conn, $sql)) {
    echo "Data inserted successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
