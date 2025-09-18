<?php
include "db.php";
session_start();

if (isset($_POST['email']) && isset($_POST['senha'])) {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $sql = "SELECT * FROM users WHERE email='$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($senha, $user['senha'])) {
            $_SESSION['user_id'] = $user['id'];
            header("Location: dashboard.php");
            exit;
        } else {
            echo "<p>Senha incorreta!</p>";
        }
    } else {
        echo "<p>Email não encontrado!</p>";
    }
}
?>
<link rel="stylesheet" href="style.css">
<div class="container">
    <h2>Login</h2>
    <form method="post">
        <input type="email" name="email" placeholder="Digite seu email" required>
        <input type="password" name="senha" placeholder="Digite sua senha" required>
         <?php if (isset($erro)) { ?>
  <p style="color: red; font-size: 14px; margin: 5px 0; text-align: left; display: block;">
    <?php echo $erro; ?>
  </p>
<?php } ?>
        <button type="submit">Entrar</button>
    </form>
    <p><a href="register.php">Criar conta</a> | <a href="forgot.php">Esqueci minha senha</a></p>
</div>
