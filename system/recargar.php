<?php
require('../../includes/conf/auth.php');
$nivel_acceso='Empleado';
if ($nivel_acceso!=$_SESSION['usuario_nivel']) {
    header ("Location: $redir?error_login=5");
    exit;
}

$permiso = $_SESSION['usuario_login'];
include_once '../../includes/conexion.php';
include_once('../../includes/conf/general_parameters.php');
conectar();
if ($nivel_acceso!=$_SESSION['usuario_nivel']) {
header ("Location: ../../index.php?error_login=5");
exit;
}
//function update_sessions()
//{
//    $sid = session_id();
//    if($_SESSION['sitename_online'] == "1")
//    {
//        mysql_query("UPDATE `sessions` SET `time` = '". time() ."' WHERE `sid` = '$sid'") or die(mysql_error());
//    }
//    else
//    {
//        $_SESSION['sitename_online'] = 1;
//        mysql_query("INSERT INTO `sessions` SET `time` = '". time() ."', `sid` = '$sid'") or die(mysql_error());
//    }
//}
//function get_onlineusers()
//{
//    $min = time() - 301;
//    mysql_query("DELETE FROM `sessions` WHERE `time` <= '$min'") or die(mysql_error());
//    $query = mysql_query("SELECT COUNT(sid) FROM `sessions`");
//    $num = mysql_fetch_row($query);
//    return($num[0]);
//}
?>
<!--<script type="text/javascript" src="js/jquery-1.7.js"></script> 
<script type="text/javascript" src="js/jcarousellite_1.0.1.min.js"></script>-->
<script type="text/javascript"> var cargando = '<center><img style="margin-top: 10px;height:30px;width:30px;" src="sistema/images/camera-loader.gif" border="0"> Cargando...</center>';</script>
<?php
include_once '../../includes/tools.php';
include_once '../../includes/validation.php';
include_once 'includes/datospers.php';
include_once 'includes/menu.php';
include_once 'includes/mensajes.php';
include_once 'includes/combos.php';
$result=mysql_query("set names utf8");
$cedula = $_SESSION['usuario_cedu'];
$permiso    = $_SESSION['usuario_login'];
$nivel      =$_SESSION['usuario_perfil'];

$idMenut=$_POST[dmn];
if ($idMenut=='') {
    $idMenut=$_GET[dmn];
}
$idMenutd=$_POST[dmnd];
if ($idMenutd=='') {
    $idMenutd=$_GET[dmnd];
}
$campos="URL";
$tablas="recargar";
$consultas="id=$idMenutd";
$res_ =paraTodos::arrayConsulta($campos,$tablas,$consultas);
foreach ($res_ as $rownivel ) {
    $conexf=$rownivel["URL"];
    $menuPrin=$rownivel["menu"];
}

include_once ($conexf);

@mysql_close();
?>
