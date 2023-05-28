<?php
// Database connection
$servername = 'localhost'; // Ganti dengan host server database Anda
$username = 'root'; // Ganti dengan nama pengguna database Anda
$password = ''; // Ganti dengan kata sandi database Anda
$dbname = 'myspotify'; // Ganti dengan nama basis data yang ingin Anda hubungkan

$conn = mysqli_connect($servername, $username, $password, $dbname);

mysqli_set_charset($conn, "utf8");

if (!$conn) {
    echo mysqli_connect_error();
}
