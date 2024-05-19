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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Neyim Var?</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            min-height: 100vh;
            background-image: url("resimler/bg.png");
            background-size: cover;
            background-position: center;
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
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        #submit-button:active {
            background-color: #1A2C40;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }

        #question-container {
            margin-bottom: 10px;
        }

        .logolink {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
        }

        .departman-names {
            font-weight: bold;
            color: #A91D3A;
            font-size: 1.1em;
        }

        .submit {
            text-decoration: none;
            color: inherit;
        }

        .back {
            margin-left: 82%;
        }

        @media (max-width: 768px) {
            .navbar-logo img {
                height: 60px;
            }

            .navbar-brand {
                font-size: 20px;
            }

            .container {
                width: 80%;
                padding: 20px;
                margin: 20px auto;
            }

            h2 {
                font-size: 28px;
            }

            button {
                font-size: 14px;
                padding: 8px 16px;
            }

            #submit-button {
                font-size: 14px;
                padding: 12px 24px;
            }

            .back {
                margin-left: 60%;
            }
        }

        @media (max-width: 480px) {
            .navbar-logo img {
                height: 50px;
            }

            .navbar-brand {
                font-size: 18px;
            }

            .navbar-buttons a {
                font-size: 14px;
                margin: 0 5px;
            }

            .container {
                width: 80%;
                padding: 15px;
                margin: 15px auto;
            }

            h2 {
                font-size: 24px;
            }

            button {
                font-size: 12px;
                padding: 6px 12px;
            }

            #submit-button {
                font-size: 12px;
                padding: 10px 20px;
            }

            .back {
                margin-left: 70%;
            }
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
        <a class="submit" href="homepage.php"><button class="back">Geri Dön</button></a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        let currentQuestionIndex = 0;
        let yesResponses = [];

        const yesButton = document.getElementById("yes-button");
        const noButton = document.getElementById("no-button");
        const submitButton = document.getElementById("submit-button");

        submitButton.style.display = 'none';

        function showQuestion() {
            const questionContainer = document.getElementById("question-container");
            if (currentQuestionIndex < questions.length) {
                const currentQuestion = questions[currentQuestionIndex];
                questionContainer.textContent = `${currentQuestion.soru_id} - ${currentQuestion.soru_icerik}`;
                yesButton.disabled = false;
                noButton.disabled = false;
            } else {
                displayDepartmanForYesResponses();
                yesButton.disabled = true;
                noButton.disabled = true;
                submitButton.style.display = 'block';
            }
        }

        function handleUserResponse(isYes) {
            const currentQuestion = questions[currentQuestionIndex];
            if (isYes) {
                yesResponses.push(currentQuestion.soru_id);
            }
            currentQuestionIndex++;
            showQuestion();
        }

        function displayDepartmanForYesResponses() {
            const responseDisplay = document.getElementById("response-display");
            const departmanAdlari = [];

            if (yesResponses.length === 0) {
                responseDisplay.innerHTML = "<span class='departman-names'>Hiçbir departman önerisi bulunamadı.</span>";
                return;
            }

            yesResponses.forEach(soru_id => {
                const departmanAdı = departmanMap[soru_id];
                if (departmanAdı) {
                    departmanAdlari.push(departmanAdı);
                }
            });

            responseDisplay.innerHTML = `İsterseniz bu departmanlardan randevu alabilirsiniz: <span class="departman-names">${departmanAdlari.join(', ')}</span>`;
        }

        yesButton.addEventListener("click", function() {
            handleUserResponse(true);
        });

        noButton.addEventListener("click", function() {
            handleUserResponse(false);
        });

        function sendDataToServer() {
            $.ajax({
                url: 'insert_data.php',
                method: 'POST',
                data: {
                    yesResponses: yesResponses
                },
                success: function(response) {
                    console.log(response);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }

        submitButton.addEventListener("click", function() {
            sendDataToServer();
        });

        showQuestion();
    </script>
</body>

</html>