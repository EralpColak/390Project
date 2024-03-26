<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tc = $_POST["tc"];
    $pwd = $_POST["pwd"];

    try {
        require_once "dbh.inc.php";

        // Check if the tc already exists in the database
        $check_query = "SELECT COUNT(*) FROM register_info WHERE tc = ?";
        $check_stmt = $pdo->prepare($check_query);
        $check_stmt->execute([$tc]);
        $count = $check_stmt->fetchColumn();

        if ($count > 0) {
            // If the tc already exists, display an error message in a JavaScript pop-up window.
            echo "<script>alert('Error: The provided T.C. already exists. Please choose a different one.');window.history.back();;</script>";
        } else {
            // tc does not exist, register the user.
            $insert_query = "INSERT INTO register_info(tc, pwd) VALUES (?, ?)";
            $insert_stmt = $pdo->prepare($insert_query);
            $insert_stmt->execute([$tc, $pwd]);
            $pdo = null;
            $insert_stmt = null;

            // Redirect to the login page after successful registration
            header("Location: ../loginpage.php");
            exit();
        }
    } catch (PDOException $e) {
        exit("Query failed: " . $e->getMessage());
    }
} else {
    // If the request method is not POST, redirect to the registration page
    header("Location: ../register.php");
    exit();
}
