<?php
// db_conn.php
$servername = "localhost";    // biasanya localhost kalau guna XAMPP/Laragon
$username   = "root";         // tukar ikut username MySQL kamu
$password   = "";             // tukar ikut password MySQL kamu
$dbname     = "safespace_db"; // nama database kamu

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>