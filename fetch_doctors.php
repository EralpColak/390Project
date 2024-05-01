<?php
// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    echo 'Connection error: ' . mysqli_connect_error();
    exit();
}

// Fetch doctors for the selected hospital and department
if (isset($_GET['hospital']) && isset($_GET['department'])) {
    $selectedHospital = $_GET['hospital'];
    $selectedDepartment = $_GET['department'];

    // Prepare and execute the SQL query to fetch doctors
    $doctors_query = "SELECT * FROM doktorlar WHERE hastane = '$selectedHospital' AND departman = '$selectedDepartment'";
    $doctors_result = mysqli_query($conn, $doctors_query);

    if (mysqli_num_rows($doctors_result) > 0) {
        // Output doctor options
        while ($row = mysqli_fetch_assoc($doctors_result)) {
            echo '<option value="' . $row['doktor_isim'] . '">' . $row['doktor_isim'] . '</option>';
        }
    } else {
        echo '<option value="">No doctors available</option>';
    }
} else {
    echo '<option value="">Select Doctor</option>';
}

// Close the database connection
mysqli_close($conn);
