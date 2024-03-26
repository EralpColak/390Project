<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tc = $_POST["tc"];
    $pwd = $_POST["pwd"];

    try {
        require_once "dbh.inc.php";

        // Check if the entered tc and password match with the data in the database
        $query = "SELECT * FROM register_info WHERE tc = ? AND pwd = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$tc, $pwd]);
        $user = $stmt->fetch();

        if ($user) {
            // If login successful, redirect to the main page
            header("Location: ../main_page.php");
            exit();
        } else {
            // If login failed, redirect back to the login page with an error message
            echo "<script>alert('Error: Wrong tc or password');window.history.back();;</script>";
            exit();
        }
    } catch (PDOException $e) {
        exit("Query failed: " . $e->getMessage());
    }
} else {
    header("Location: loginpage.php");
    exit();
}
