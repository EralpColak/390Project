

<?php
// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    echo 'Connection error: ' . mysqli_connect_error();
    exit();
}

// Fetch hospitals for the selected city
if (isset($_GET['city'])) {
    $selectedCity = $_GET['city'];
    $hospitals_query = "SELECT DISTINCT hastane FROM hastane WHERE sehir = '$selectedCity'";
    $hospitals_result = mysqli_query($conn, $hospitals_query);

    if (mysqli_num_rows($hospitals_result) > 0) {
        // Output hospital options
        echo '<option value="">Select Hospital</option>';
        while ($row = mysqli_fetch_assoc($hospitals_result)) {
            echo '<option value="' . $row['hastane'] . '">' . $row['hastane'] . '</option>';
        }
    } else {
        echo '<option value="">No hospitals available</option>';
    }
}

// Close the database connection
mysqli_close($conn);
