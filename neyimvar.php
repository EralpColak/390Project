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

// Fetch questions from the 'sorular' table
$sql = "SELECT soru_id, soru_icerik FROM sorular";
$result = mysqli_query($conn, $sql);

// Initialize an array to store questions
$questions = [];
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $questions[] = $row;
    }
    mysqli_free_result($result);
}

// Fetch departments from the 'departmanlar' table
$sql = "SELECT departman_id, departman_adı FROM departmanlar";
$result = mysqli_query($conn, $sql);

// Initialize a dictionary to map departman_id to departman_adı
$departmanMap = [];
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $departmanMap[$row['departman_id']] = $row['departman_adı'];
    }
    mysqli_free_result($result);
}

// Close the database connection
mysqli_close($conn);

// Encode questions and departmanMap arrays as JSON and embed in script tag
echo "<script>";
echo "const questions = " . json_encode($questions) . ";";
echo "const departmanMap = " . json_encode($departmanMap) . ";";
echo "</script>";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Neyim Var?</title>
    <style>
        /* Add your CSS styling here */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            min-height: 100vh;
            background-image: url("resimler/bg.png");
            background-size: cover;
        }

        nav {
            background-color: #f5f5f5;
            color: #2D4059;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar-logo {
            display: flex;
            align-items: center;
        }

        .navbar-logo img {
            height: 80px;
            vertical-align: middle;
            margin-right: 10px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-buttons a {
            color: #2D4059;
            text-decoration: none;
            margin: 0 10px;
        }

        .container {
            width: 50%;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin: 40px auto;
        }

        h2 {
            text-align: center;
            color: #2D4059;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 8px;
            background-color: #2D4059;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background-color: #384B63;
        }

        button:disabled {
            background-color: #ccc;
            color: #666;
            cursor: not-allowed;
        }

        #submit-button {
            padding: 15px 30px;
            margin-top: 20px;
            background-color: #2D4059;
            border: none;
            border-radius: 7px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        #question-container {
            margin-bottom: 10px;
        }


        .logolink {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
        }

        /* Add your desired styling for the departman-names class */
        .departman-names {
            font-weight: bold;
            color: #A91D3A;
            font-size: 1.1em;
            /* You can add more styles as needed */
        }

        .submit {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>

<body>
    <nav>
        <div class="navbar-logo">
            <a href="homepage.php"><img src="resimler/CareConnect.png" alt="Your Logo"></a>
            <a href="homepage.php" class="logolink"><span class="navbar-brand">CareConnect</span></a>
        </div>
        <div class="navbar-buttons">
            <a href="loginpage.php">Çıkış</a>
        </div>
    </nav>


    <h2>Neyim Var?</h2>
    <div class="container">
        <div id="question-container"></div>
        <form id="yesno-form">
            <button id="yes-button" type="button">Yes</button>
            <button id="no-button" type="button">No</button>
        </form>
        <div id="response-display"></div>
        <a class="submit" href="yeni_randevu.php"><button id="submit-button">Randevu al</button></a>
    </div>


    <script>
        // Initialize the current question index and an array to store "Yes" responses
        let currentQuestionIndex = 0;
        let yesResponses = [];

        // Get the buttons
        const yesButton = document.getElementById("yes-button");
        const noButton = document.getElementById("no-button");
        const submitButton = document.getElementById("submit-button"); // "Randevu al" button

        // Initially hide the submit button
        submitButton.style.display = 'none';

        // Function to display a question with its ID and content
        function showQuestion() {
            const questionContainer = document.getElementById("question-container");
            // Check if there are questions remaining
            if (currentQuestionIndex < questions.length) {
                const currentQuestion = questions[currentQuestionIndex];
                // Display the question ID and content
                questionContainer.textContent = `${currentQuestion.soru_id} - ${currentQuestion.soru_icerik}`;
                // Enable the buttons for user interaction
                yesButton.disabled = false;
                noButton.disabled = false;
            } else {
                // All questions have been answered
                displayDepartmanForYesResponses();
                // Disable the "Yes" and "No" buttons
                yesButton.disabled = true;
                noButton.disabled = true;
                // Show the "Randevu al" button
                submitButton.style.display = 'block';
            }
        }

        // Function to handle user response
        function handleUserResponse(isYes) {
            const currentQuestion = questions[currentQuestionIndex];
            // Add current question's soru_id to the yesResponses array if the user responded "Yes"
            if (isYes) {
                yesResponses.push(currentQuestion.soru_id);
            }
            // Move to the next question
            currentQuestionIndex++;
            // Show the next question
            showQuestion();
        }

        // Function to display department names for "Yes" responses
        function displayDepartmanForYesResponses() {
            const responseDisplay = document.getElementById("response-display");
            const departmanAdlari = [];

            // Iterate through the yesResponses array and find corresponding departman_adı
            yesResponses.forEach(soru_id => {
                const departmanAdı = departmanMap[soru_id];
                if (departmanAdı) {
                    departmanAdlari.push(departmanAdı);
                }
            });

            // Display the department names for all "Yes" responses
            responseDisplay.innerHTML = `İsterseniz bu departmanlardan randevu alabilirsiniz: <span class="departman-names">${departmanAdlari.join(', ')}</span>`;

        }

        // Add event listeners to the buttons
        yesButton.addEventListener("click", function() {
            handleUserResponse(true);
        });

        noButton.addEventListener("click", function() {
            handleUserResponse(false);
        });

        // Initialize by showing the first question
        showQuestion();
    </script>
</body>

</html>