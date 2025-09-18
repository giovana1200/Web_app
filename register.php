<?php
include "db.php";

if (isset($_POST['nome']) && isset($_POST['email']) && isset($_POST['senha'])) {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (nome, email, senha) VALUES ('$nome','$email','$senha')";
    if ($conn->query($sql)) {
        echo "<p>Cadastro realizado com sucesso! <a href='index.php'>Fazer login</a></p>";
    } else {
        echo "<p>Erro: " . $conn->error . "</p>";
    }
}
?>
<link rel="stylesheet" href="style.css">
<div class="container">
    <h2>Cadastro</h2>
    <form method="post">
        <input type="text" name="nome" placeholder="Seu nome" required>
        <input type="email" name="email" placeholder="Seu email" required>
        <input type="password" name="senha" placeholder="Sua senha" required>
        <button type="submit">Cadastrar</button>
    </form>
</div>
