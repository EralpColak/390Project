<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start(); // Start the session

// Check if the user is logged in, if not, redirect them to the login page
if (!isset($_SESSION['tc'])) {
    header("Location: loginpage.php");
    exit();
}

// Database connection
$conn = mysqli_connect('localhost', 'root', '', 'database_390');
if (!$conn) {
    die('Connection error: ' . mysqli_connect_error());
}

// Retrieve the session value for 'tc' and sanitize it
$tc = mysqli_real_escape_string($conn, $_SESSION['tc']);

// Define the $tests array with queries and column names for each test
$tests = array(
    "BOSAnalizi" => array(
        "query" => "SELECT Renk, Gorunum, Miktar, Protein, Seker, LaktikAsit, Hucreler, Eritrosit, Lokosit, Monosit, Notrofil, Lenfosit, Eozinofil, Bazofil, EritrositSedimentasyonHizi, SitolojikDegerlendirme FROM BOSAnalizi WHERE tc = '$tc'",
        "columns" => array("Renk", "Gorunum", "Miktar", "Protein", "Seker", "LaktikAsit", "Hucreler", "Eritrosit", "Lokosit", "Monosit", "Notrofil", "Lenfosit", "Eozinofil", "Bazofil", "EritrositSedimentasyonHizi", "SitolojikDegerlendirme")
    ),
    "dahiliye_testi" => array(
        "query" => "SELECT HbA1c FROM dahiliye_testi WHERE tc = '$tc'",
        "columns" => array("HbA1c")
    ),
    "D_vitamini" => array(
        "query" => "SELECT OH_Kalsiferol FROM D_vitamini WHERE tc = '$tc'",
        "columns" => array("OH_Kalsiferol")
    ),
    "genelcerrahitesti" => array(
        "query" => "SELECT GGT, Bilirubin FROM genelcerrahitesti WHERE tc = '$tc'",
        "columns" => array("GGT", "Bilirubin")
    ),
    "hemogram" => array(
        "query" => "SELECT Hb, Hct, RBC, MCV, MCH, MCHC, RDW, Trombosit, WBC, Nötrofil, Lenfosit, Monosit, Eozinofil, Bazofil FROM hemogram WHERE tc = '$tc'",
        "columns" => array("Hb", "Hct", "RBC", "MCV", "MCH", "MCHC", "RDW", "Trombosit", "WBC", "Nötrofil", "Lenfosit", "Monosit", "Eozinofil", "Bazofil")
    ),
    "hıvtest" => array(
        "query" => "SELECT AntiHIV, HBsAg FROM hıvtest WHERE tc = '$tc'",
        "columns" => array("AntiHIV", "HBsAg")
    ),
    "kadındogum" => array(
        "query" => "SELECT bHCG FROM kadındogum WHERE tc = '$tc'",
        "columns" => array("bHCG")
    ),
    "kangazı" => array(
        "query" => "SELECT pH, PaO2, PaCO2, HCO3, O2S, BE, Laktat FROM kangazı WHERE tc = '$tc'",
        "columns" => array("pH", "PaO2", "PaCO2", "HCO3", "O2S", "BE", "Laktat")
    ),
    "KardiyolojiTestleri" => array(
        "query" => "SELECT TroponinI, TroponinT, CK_MB FROM KardiyolojiTestleri WHERE tc = '$tc'",
        "columns" => array("TroponinI", "TroponinT", "CK_MB")
    ),
    "uroloji_testi" => array(
        "query" => "SELECT renk, gorunum, yogunluk, ph, protein, glukoz, ketondis, bilirubin, urobilinojen, nitrit, eritrosit, lokosit, silendir, bakteri, epitel_hucreleri, kristaller FROM uroloji_testi WHERE tc = '$tc'",
        "columns" => array("renk", "gorunum", "yogunluk", "ph", "protein", "glukoz", "ketondis", "bilirubin", "urobilinojen", "nitrit", "eritrosit", "lokosit", "silendir", "bakteri", "epitel_hucreleri", "kristaller")
    )
);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tahliller</title>
    <style>
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
            margin-right: 10px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-buttons {
            display: flex;
            align-items: center;
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
            margin: 40px auto 0;
        }

        h2 {
            text-align: center;
            color: #2D4059;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        h3 {
            color: #2D4059;
            font-size: 24px;
            margin-bottom: 10px;
            border-bottom: 2px solid #2D4059;
            padding-bottom: 5px;
        }

        .info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 2px;
            border-bottom: 1px solid #ddd;
        }

        .info:last-child {
            border-bottom: none;
        }

        .info span {
            font-weight: bold;
            margin-right: 10px;
            flex: 1;
            text-align: left;
        }

        .info p {
            margin: 0;
            flex: 1;
            text-align: left;
        }

        .edit-button {
            display: flex;
            justify-content: center;
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
        }

        .disease {
            color: red;
            font-weight: bold;
        }

        .disease-info {
            background-color: #ffdede;
            border: 1px solid red;
            border-radius: 8px;
            padding: 10px;
            margin-top: 20px;
        }

        .disease-info p {
            margin: 5px 0;
        }

        .logolink {
            text-decoration: none;
            color: inherit;
            cursor: pointer;
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

            .info {
                flex-direction: column;
            }

            .info span,
            .info p {
                text-align: center;
            }

            button {
                font-size: 14px;
                padding: 8px 16px;
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

            .info {
                flex-direction: column;
            }

            .info span,
            .info p {
                text-align: center;
            }

            button {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
    </style>
    <script>
        function goBack() {
            window.location.href = 'tahlillerim.php';
        }
    </script>
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
    <div class="container">
        <h2>Tahliller</h2>

        <?php

        // Define custom labels for table names
        $custom_table_labels = array(
            "BOSAnalizi" => "BOS Analizi",
            "dahiliye_testi" => "Dahiliye",
            "D_vitamini" => "D Vitamini",
            "genelcerrahitesti" => "Genel Cerrahi",
            "hemogram" => "Hemogram",
            "hıvtest" => "HIV",
            "kadındogum" => "Kadın Doğum",
            "kangazı" => "Kangazı",
            "KardiyolojiTestleri" => "Kardiyoloji",
            "uroloji_testi" => "Üroloji"
        );

        $diseases = array();

        // Loop through each test
        foreach ($tests as $test => $data) {
            // Modify the query to fetch all entries for the specific 'tc' without ordering
            $all_entries_query = $data['query'];

            // Execute the query to fetch all entries
            $result = mysqli_query($conn, $all_entries_query);

            // Check if the query was successful and if there are any rows returned
            if ($result && mysqli_num_rows($result) > 0) {
                // Fetch all rows into an array
                $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

                // Free the result set
                mysqli_free_result($result);

                // Select the last entry from the fetched rows
                $last_entry = end($rows);

                // Display the data for the current test
                $label = isset($custom_table_labels[$test]) ? $custom_table_labels[$test] : $test;
                echo '<h3>' . htmlspecialchars($label) . '</h3>';
                echo '<div class="info">';

                foreach ($data['columns'] as $column) {
                    // Display column name and its value
                    echo '<div style="width: 45%;">';
                    echo '<span>' . htmlspecialchars($column) . ':</span>';
                    // Display the value of the last entry for the current column
                    echo '<p>' . htmlspecialchars($last_entry[$column]) . '</p>';
                    echo '</div>';
                }
                echo '</div>';

                // Check conditions for diseases and add to the diseases array if any condition is met
                if ($test == "KardiyolojiTestleri" && $last_entry['TroponinI'] > 0.05) {
                    $diseases[] = "Myokard Enfarktüsü";
                }
                if ($test == "kangazı") {
                    if ($last_entry['pH'] > 7.2) {
                        $diseases[] = "Metabolik Alkaloz";
                    } elseif ($last_entry['pH'] < 6.8) {
                        $diseases[] = "Metabolik Asidoz";
                    }
                }
                if ($test == "BOSAnalizi") {
                    if ($last_entry['Eritrosit'] > 6) {
                        $diseases[] = "Ürolitiasis";
                    }
                    if ($last_entry['Lokosit'] > 8) {
                        $diseases[] = "Menenjit";
                    }
                }
                if ($test == "dahiliye_testi" && $last_entry['HbA1c'] > 7) {
                    $diseases[] = "Diabetes Mellitus";
                }
                if ($test == "kadındogum" && $last_entry['bHCG'] > 7000) {
                    $diseases[] = "Gebelik";
                }
                if ($test == "D_vitamini" && $last_entry['OH_Kalsiferol'] < 20) {
                    $diseases[] = "Osteoporoz";
                }
                if ($test == "hıvtest" && $last_entry['HBsAg'] == 'Pozitif') {
                    $diseases[] = "Hepatit B";
                }
                if ($test == "genelcerrahitesti" && $last_entry['GGT'] > 90) {
                    $diseases[] = "Kolelitiasis";
                }
                if ($test == "hemogram" && $last_entry['Trombosit'] < 100) {
                    $diseases[] = "Hemofili";
                }
            }
        }

        // Display diseases section
        if (!empty($diseases)) {
            echo '<h3>Hastalıklar</h3>';
            echo '<div class="disease-info">';
            foreach ($diseases as $disease) {
                echo '<p class="disease">' . htmlspecialchars($disease) . '</p>';
            }
            echo '</div>';
        }

        ?>

        <div class="edit-button">
            <button type="button" onclick="goBack()">Geri</button>
        </div>
    </div>
</body>

</html>

<?php
// Close the database connection
mysqli_close($conn);
?>