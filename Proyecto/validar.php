<?php

$usuario=$_POST['Email'];
$contraseña=$_POST['Password'];
session_start();
$_SESSION['Email']=$usuario;

include('db.php');
$consulta="SELECT * FROM usuarios1 WHERE Correo_Electronico='$usuario' AND Contraseña='$contraseña'";
$resultado=mysqli_query($conexion,$consulta);

$filas=mysqli_num_rows($resultado);

if($filas){
    header('location: index.php');
} else
    ?> 
    <?php
        include('iniciarSesion.php');
    ?>
    <h1 class="error">ERROR AL INICIAR SESIÓN</h1>        
}
<?php

mysqli_free_result($resultado);
mysqli_close($conexion);

?>