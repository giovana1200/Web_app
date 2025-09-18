<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}
?>
<link rel="stylesheet" href="style.css">
<div class="container">
    <h2>Bem-vindo!</h2>
    <p>Você está logado no sistema.</p>
    <a href="index.php">Sair</a>
</div>
