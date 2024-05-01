<?php
// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    echo 'Connection error: ' . mysqli_connect_error();
    exit();
}

// Fetch departments from the departmanlar table
$departments_query = "SELECT * FROM departmanlar";
$departments_result = mysqli_query($conn, $departments_query);

if (mysqli_num_rows($departments_result) > 0) {
    // Output department options
    echo '<option value="">Select Department</option>';
    while ($row = mysqli_fetch_assoc($departments_result)) {
        echo '<option value="' . $row['departman_adı'] . '">' . $row['departman_adı'] . '</option>';
    }
} else {
    echo '<option value="">No departments available</option>';
}

// Close the database connection
mysqli_close($conn);
