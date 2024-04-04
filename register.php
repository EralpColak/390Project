<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body,
        html {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
        }

        .left-side,
        .right-side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left-side {
            background-color: #769FCD;
            /* Light pink background */
        }

        .left-side img {
            max-width: 80%;
            height: auto;
        }

        .right-side {
            background-color: #D6E6F2;
            /* White background */
            color: #2D4059;
            /* Dark gray text color */
        }

        .registration-form {
            max-width: 400px;
            width: 80%;
            background: #F7FBFC;
            /* White background */
            border-radius: 8px;
            padding: 20px;
            margin: 0 auto;
        }

        .registration-form a {
            display: block;
            text-align: left;
            margin-top: 10px;
            color: #2D4059;
            /* Dark gray text color */
        }

        .registration-form a:hover {
            color: #FA7070;
            /* Light pink background */
        }

        h2 {
            text-align: center;
            color: #2D4059;
            /* Dark gray text color */
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #769FCD;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #D6E6F2;
        }
    </style>
</head>

<body>

    <div class="left-side">
        <img src="resimler/doctor_patient.png" alt="hospital_img">
    </div>

    <div class="right-side">
        <div class="registration-form">
            <h2>Register</h2>
            <form action="includes/register.inc.php" method="post">
                <label for="tc">T.C.</label>
                <input type="text" id="tc" name="tc" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="pwd" required>

                <input type="submit" value="Register">
                <a href="loginpage.php">Log in, if you have already an account.</a>
            </form>
        </div>
    </div>

</body>

</html>