<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json');

include "db_conn.php";

// Ambil data POST
$userid = $_POST["user_id"] ?? '';
$username = $_POST["user_name"] ?? '';
$userpassword = $_POST["user_password"] ?? '';
$useremail = $_POST["user_email"] ?? '';

// Check empty
if ($userid == '' || $username == '' || $userpassword == '' || $useremail == '') {
    echo json_encode([
        "status" => "error",
        "message" => "All fields are required"
    ]);
    exit;
}

// Check user exist
$sql = "SELECT * FROM users WHERE user_id='$userid'";
$result = mysqli_query($conn, $sql);

if (!$result) {
    echo json_encode([
        "status" => "error",
        "message" => mysqli_error($conn)
    ]);
    exit;
}

if (mysqli_num_rows($result) > 0) {
    echo json_encode([
        "status" => "error",
        "message" => "User ID already exists"
    ]);
    exit;
}

// Hash password
$hashed_password = password_hash($userpassword, PASSWORD_DEFAULT);

// Insert user
$sql_insert = "INSERT INTO users (user_id,user_name,user_password,user_email)
               VALUES ('$userid','$username','$hashed_password','$useremail')";

if (mysqli_query($conn,$sql_insert)){

    echo json_encode([
        "status"=>"success",
        "message"=>"User registration successful"
    ]);

}else{

    echo json_encode([
        "status"=>"error",
        "message"=>mysqli_error($conn)
    ]);

}

mysqli_close($conn);
?>