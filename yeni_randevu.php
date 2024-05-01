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
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Appointment</title>
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
                <span>City:</span>
                <select name="city" id="city" onchange="showHospitals()">
                    <option value="">Select City</option>
                    <?php while ($row = mysqli_fetch_assoc($cities_result)) : ?>
                        <option value="<?php echo $row['sehir']; ?>"><?php echo $row['sehir']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="info">
                <span>Hospital:</span>
                <select name="hospital" id="hospital" onchange="showDepartments()" disabled>
                    <option value="">Select Hospital</option>
                </select>
            </div>

            <div class="info">
                <span>Department:</span>
                <select name="department" id="department" onchange="showDoctors()" disabled>
                    <option value="">Select Department</option>
                </select>
            </div>

            <div class="info">
                <span>Doctor:</span>
                <select name="doctor" id="doctor" disabled>
                    <option value="">Select Doctor</option>
                </select>
            </div>

            <div class="edit-button">
                <button type="submit">Save Appointment</button>
            </div>
        </div>
    </form>
</body>

</html>