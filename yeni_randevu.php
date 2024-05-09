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
    exit();
}

// Fetch cities from the database
$cities_query = "SELECT DISTINCT sehir FROM hastane";
$cities_result = mysqli_query($conn, $cities_query);



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the appointment form is submitted
    if (isset($_POST['doctor']) && !empty($_POST['doctor'])) {
        $tc = $_SESSION['tc']; // Get the logged-in user's TC
        $doctor_name = $_POST['doctor']; // Get the selected doctor's name from the form

        // Retrieve the doctor's ID based on the selected name
        $doctor_query = "SELECT doktor_ıd FROM doktorlar WHERE doktor_isim = ?";
        $stmt = $conn->prepare($doctor_query);
        $stmt->bind_param("s", $doctor_name);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $doctor_id = $row['doktor_ıd'];

        // Insert the appointment into the 'randevular' table
        $insert_query = "INSERT INTO randevular (tc, doktor_ıd) VALUES (?, ?)";
        $stmt = $conn->prepare($insert_query);
        $stmt->bind_param("ss", $tc, $doctor_id);
        if ($stmt->execute()) {
            // Appointment saved successfully, redirect to the appointments page
            header("Location: randevularım.php");
            exit();
        } else {
            echo 'Error: ' . $stmt->error;
        }
    }
}


// Fetch cities from the database
$cities_query = "SELECT DISTINCT sehir FROM hastane";
$cities_result = mysqli_query($conn, $cities_query);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yeni Randevu</title>

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
        max-width: 300px; /* Set a maximum width */
        background-color: #f2f2f2; /* Light gray background */
        color: #333; /* Dark gray text */
        font-size: 14px; /* Adjust font size */
        transition: border-color 0.3s ease; /* Add transition effect */
    }

    /* Additional styles for submit button */
    .submit-button {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    input[type="text"]:focus,
    select:focus {
        outline: none; /* Remove default focus outline */
        border-color: #2D4059; /* Dark blue border color on focus */
        box-shadow: 0 0 5px rgba(45, 64, 89, 0.3); /* Add box shadow on focus */
    }
    </style>
    <script>
        function showHospitals() {
            var cityDropdown = document.getElementById("city");
            var hospitalDropdown = document.getElementById("hospital");
            var departmentDropdown = document.getElementById("department");
            var doctorDropdown = document.getElementById("doctor");
            var selectedCity = cityDropdown.value;

            if (selectedCity !== "") {
                // Send AJAX request to fetch hospitals for the selected city
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        hospitalDropdown.innerHTML = xhr.responseText;
                        hospitalDropdown.disabled = false;
                        departmentDropdown.disabled = true;
                        doctorDropdown.disabled = true;
                    }
                };
                xhr.open("GET", "fetch_hospitals.php?city=" + selectedCity, true);
                xhr.send();
            } else {
                hospitalDropdown.innerHTML = '<option value="">Select Hospital</option>';
                hospitalDropdown.disabled = true;
                departmentDropdown.innerHTML = '<option value="">Select Department</option>';
                departmentDropdown.disabled = true;
                doctorDropdown.innerHTML = '<option value="">Select Doctor</option>';
                doctorDropdown.disabled = true;
            }
        }

        function showDepartments() {
            var hospitalDropdown = document.getElementById("hospital");
            var departmentDropdown = document.getElementById("department");
            var selectedHospital = hospitalDropdown.value;

            if (selectedHospital !== "") {
                // Send AJAX request to fetch departments for the selected hospital
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        departmentDropdown.innerHTML = xhr.responseText;
                        departmentDropdown.disabled = false;
                        doctorDropdown.disabled = true;
                    }
                };
                xhr.open("GET", "fetch_departments.php?hospital=" + selectedHospital, true);
                xhr.send();
            } else {
                departmentDropdown.innerHTML = '<option value="">Select Department</option>';
                departmentDropdown.disabled = true;
                doctorDropdown.innerHTML = '<option value="">Select Doctor</option>';
                doctorDropdown.disabled = true;
            }
        }

        function showDoctors() {
            var hospitalDropdown = document.getElementById("hospital");
            var departmentDropdown = document.getElementById("department");
            var doctorDropdown = document.getElementById("doctor");
            var selectedHospital = hospitalDropdown.value;
            var selectedDepartment = departmentDropdown.value;

            if (selectedHospital !== "" && selectedDepartment !== "") {
                // Send AJAX request to fetch doctors for the selected hospital and department
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        doctorDropdown.innerHTML = xhr.responseText;
                        doctorDropdown.disabled = false;
                    }
                };
                xhr.open("GET", "fetch_doctors.php?hospital=" + selectedHospital + "&department=" + selectedDepartment, true);
                xhr.send();
            } else {
                doctorDropdown.innerHTML = '<option value="">Select Doctor</option>';
                doctorDropdown.disabled = true;
            }
        }
    </script>
</head>

<body>
    <form method="POST" action="">
        <div class="container">
            <div class="info">
                <span>Şehir:</span>
                <select name="city" id="city" onchange="showHospitals()">
                    <option value="">Şehir Seç</option>
                    <?php while ($row = mysqli_fetch_assoc($cities_result)) : ?>
                        <option value="<?php echo $row['sehir']; ?>"><?php echo $row['sehir']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="info">
                <span>Hastane:</span>
                <select name="hospital" id="hospital" onchange="showDepartments()" disabled>
                    <option value="">Hastane Seç</option>
                </select>
            </div>

            <div class="info">
                <span>Departman:</span>
                <select name="department" id="department" onchange="showDoctors()" disabled>
                    <option value="">Departman Seç</option>
                </select>
            </div>

            <div class="info">
                <span>Doktor:</span>
                <select name="doctor" id="doctor" disabled>
                    <option value="">Doktor Seç</option>
                </select>
            </div>

            <div class="edit-button">
                <button type="submit">Kaydet</button>
            </div>
        </div>
    </form>
</body>

</html>
