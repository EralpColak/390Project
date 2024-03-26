<?php
$dsn = "mysql:host=localhost;dbname=database_390"; //nereye bağlanıcak
$dbusername = "root"; // database için xampp in def ismi
$dbpassword = ""; // database için xampp in def şifresi

$pdo = new PDO($dsn, $dbusername, $dbpassword); // burda pdo bizi bağlayan fonksiyon içerisine bu parametreleri alıp çalıştırıyoruz.
