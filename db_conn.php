<?php

$host = "localhost";
$user = "root";
$password = "";
$database = "safespace_db";

$conn = mysqli_connect($host,$user,$password,$database);

if (!$conn){
    echo json_encode([
        "status"=>"error",
        "message"=>"Database connection failed"
    ]);
    exit;
}

?>