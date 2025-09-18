<?php
include "db.php";

if (isset($_GET['token'])) {
    $token = $_GET['token'];
    if (isset($_POST['senha'])) {
        $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
        $sql = "UPDATE users SET senha='$senha', token=NULL WHERE token='$token'";
        if ($conn->query($sql)) {
            echo "<p>Senha alterada com sucesso! <a href='index.php'>Fazer login</a></p>";
        } else {
            echo "<p>Erro ao redefinir senha!</p>";
        }
    }
} else {
    echo "<p>Token inválido!</p>";
}
?>
<link rel="stylesheet" href="style.css">
<div class="container">
    <h2>Redefinir Senha</h2>
    <form method="post">
        <input type="password" name="senha" placeholder="Digite a nova senha" required>
        <button type="submit">Redefinir</button>
    </form>
</div>
