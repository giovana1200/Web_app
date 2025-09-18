<?php
$host = "localhost";
$user = "root"; // coloque o usuário do seu MySQL
$pass = "";     // 12345
$db   = "webapp";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}
?>
