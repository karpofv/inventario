<?php
    session_start();
    ini_set('display_errors', false);
    ini_set('display_startup_errors', false);
    /**
     *
     * Description: Archivo de autentificacion.
     *
     * LICENSE:   HFJ_LICENSE
     *
     * @category    includes
     * @package     Seido
     * @author      <hfj@hfj.com>
     * @version     3.0
     * @file        auth.php
     * @path        includes/
     * @date        21/06/2009
    */
    require_once 'db.php';
    require_once 'general_parameters.php';
    $url = explode("?",$_SERVER['HTTP_REFERER']);
    $pag_referida = $url[0];
    $redir2 = $pag_referida;
    // chequear si se llama directo al script.    
    if ($_SERVER['HTTP_REFERER'] == '') {
        die(header ("Location:  $redir?error_login=10"));
        exit;
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (isset($_POST['user']) && isset($_POST['pass']) && ($_POST['user']!='') && ($_POST['pass']!='')) {
        $conexion = new mysqli("$host", "$user", "$passwd", "$database") or die(header ("Location:  $redir?error_login=0"));    
        //$conexion = mysqli_connect($host, $user, $passwd);// or die(header ("Location:  $redir?error_login=0"));
        //mysqli_select_db($database);
        //$cons=mysqli_query('SET NAMES utf8');
        $usu = trim($_POST['user']);
        $login = stripslashes($usu);
        $login = preg_replace("/[';]/", "", $login);
        $usuario_consulta = $conexion->query("SELECT * FROM $auth_table WHERE Usuario='$login'") or die(header ("Location:  $redir?error_login=1"));// or die(header ("Location:  $redir?error_login=1"));
        if (mysqli_num_rows($usuario_consulta) != 0) {
            $password = trim($_POST['pass']);
            $password = md5($password);
            // almacenamos datos del Usuario en un array para empezar a chequear.
            $usuario_datos = mysqli_fetch_array($usuario_consulta);
            // liberamos la memoria usada por la consulta, ya que tenemos estos datos en el Array.
            @mysql_free_result($usuario_consulta);
            // cerramos la Base de dtos.
            mysql_close($conexion);
            // chequeamos el nombre del usuario otra vez contrastandolo con la BD
            // esta vez sin barras invertidas, etc ...
            // si no es correcto, salimos del script con error 4 y redireccionamos a la
            // pagina de error.
            if ($login != $usuario_datos['Usuario']) {
                Header ("Location: $redir?error_login=4");
                exit;
            }        
            if ($password != $usuario_datos['contrasena']) {
                Header ("Location: $redir?error_login=3");
                exit;
            }   
            unset($login);
            unset($password);
            //session_name($sess_name);
            session_start();
            session_cache_limiter('nocache,private');
            $_SESSION['usuario_nivel'] = $usuario_datos['Tipo'];
            $_SESSION['usuario_login'] = $usuario_datos['id'];
            $_SESSION['ci'] = $usuario_datos['Cedula'];
            $_SESSION['usuario_password']  = $usuario_datos['contrasena'];
            $_SESSION['user_pass_ne'] = $_POST['pass'];
            $_SESSION['usuario_perfil'] = $usuario_datos['Nivel'];
            $_SESSION['usuario_stilo']=$usuario_datos['Stilo'];
            $_SESSION['tipo_usuario']=$usuario_datos['TipoUsuario'];
            //Verificacion de los permisos de lectura escritura
            $auth['S']=1;
            $auth['I']=1;
            $auth['D']=1;
            $auth['U']=1;
            $pag = $_SERVER['PHP_SELF'];
            Header ("Location: $pag?valida=hola");
            exit;
        } else {
            Header ("Location: $redir?error_login=2");
            exit;
        }
    } else {

        $auth['S']=1;
        $auth['I']=1;
        $auth['D']=1;
        $auth['U']=1;
        if (!isset($_SESSION['usuario_login']) && !isset($_SESSION['usuario_password'])) {
            session_destroy();
            Header ("Location: $redir?error_login=9");
            exit;
        }
    }
?>