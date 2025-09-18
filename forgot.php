<?php
include "db.php";

if (isset($_POST['email'])) {
    $email = $_POST['email'];
    $token = bin2hex(random_bytes(50));
    $sql = "UPDATE users SET token='$token' WHERE email='$email'";

    if ($conn->query($sql)) {
        echo "<p>Use este link para redefinir sua senha:</p>";
        echo "<a href='reset.php?token=$token'>Redefinir senha</a>";
    } else {
        echo "<p>Email não encontrado!</p>";
    }
}
?>
<link rel="stylesheet" href="style.css">
<div class="container">
    <h2>Esqueci minha senha</h2>
    <form method="post">
        <input type="email" name="email" placeholder="Digite seu email" required>
        <button type="submit">Recuperar senha</button>
    </form>
</div>
