<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        .login-form {
            max-width: 400px;
            width: 80%;
            background: #F7FBFC;
            /* White background */
            border-radius: 8px;
            padding: 20px;
            margin: 0 auto;
        }

        .login-form a {
            display: block;
            text-align: left;
            margin-top: 10px;
            color: #2D4059;
            /* Dark gray text color */
        }

        .login-form a:hover {
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
        <div class="login-form">
            <h2>Login</h2>
            <form action="includes/login.inc.php" method="post">
                <label for="tc">T.C.</label>
                <input type="text" id="tc" name="tc" pattern="\d{11}" maxlength="11" required oninput="validateTC(this)">


                <label for="password">Password:</label>
                <input type="password" id="password" name="pwd" required>

                <input type="submit" value="Login">
                <a href="register.php">Register, if you don't have an account.</a>
            </form>
        </div>
    </div>

    <script>
        function validateTC(input) {
            input.value = input.value.replace(/\D/g, '').slice(0, 11);
        }
    </script>


</body>

</html>