<?php
include_once 'includes/layout/head.php';
require 'includes/conf/general_parameters.php';
ini_set('display_errors', false);
ini_set('display_startup_errors', false);
if ($_GET[logaut] == '1') {
  session_cache_limiter('nocache,private');
  session_name($sess_name);
  session_start();
  $sid = session_id();
  session_destroy();
}
?>
    <div class="accountbg"></div>
    <div class="wrapper-page">
        <div class="panel panel-color panel-primary panel-pages">
            <div class="panel-body">
                <h3 class="text-center m-t-0 m-b-15"> <a href="index.html" class="logo logo-admin"><span>Inv</span>entario</a></h3>
                <h4 class="text-muted text-center m-t-0"><b>Ingresar</b></h4>
                <form action="index2.php" id="login-validation" class="col-md-12 center-margin" method="post" enctype="multipart/form-data">
                <!-- notificacion de error -->
                <?php
                    if (isset($_GET['error_login'])) {
                        $error = $_GET['error_login']; ?>
                    <div class="alert-danger" id="alerta-msg"> <a class="close" data-dismiss="alert">&times;</a> <strong>Accion!</strong>
                        <?php echo $error_login_ms[$error];
?>
                    </div>
                    <?php
                    }
?>
                        <!-- fin notificacion de error -->
                        <div id="login-form" class="content-box bg-default">
                            <div class="content-box-wrapper pad20A">
                                <br>
                                <div class="form-group">
                                    <div class="input-group"> <span class="input-group-addon addon-inside bg-gray">
                                            <i class="glyph-icon icon-user"></i>
                                        </span>
                                        <input title="Ingrese su Usuario de Acceso" type="text" name="user" id="user" class="form-control" id="exampleInputEmail1" placeholder="Ingresa tu usuario" required="required"> </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group"> <span class="input-group-addon addon-inside bg-gray">
                                            <i class="glyph-icon icon-unlock-alt"></i>
                                        </span>
                                        <input title="Ingrese su Clave de Acceso" type="password" name="pass" id="pass" class="form-control" id="exampleInputPassword1" placeholder="Ingresa tu clave" required="required"> </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-block btn-primary">Ingresar</button>
                                </div>
                                <div class="row">
                                    <div class="text-right col-md-6"> <a href="#" data-toggle="modal" data-target="#myModal" class="switch-button" switch-target="#login-forgot" switch-parent="#login-form" title="Recover password">¿No tienes usuario? <br>Click aqui</a> </div>
                                </div>
                            </div>
                        </div>
            </form>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <form class="form-horizontal" action="login.php" method="post">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Registrar usuario nuevo</h4> </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="solicitud_Monto">Cedula</label>
                            <div id="Info"></div>
                            <div class="col-sm-8">
                                <input class="form-control" placeholder="Ejem: 1234567" id="cedula" type="text" name="cedula" required> </div>
                        </div>
                        <div class="form-group" id="monto_cuotas" style="display: block;">
                            <label class="col-sm-4 control-label" for="solicitud_Monto por cuota">Usuario</label>
                            <div class="col-sm-8">
                                <input class="form-control" placeholder="Ejem: ejemplo" id="usuario" type="text" name="usuario" required> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="solicitud_Observaciones">Contraseña</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="password" id="contrasena" name="contrasena" value="" placeholder="******" required> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="solicitud_Observaciones">Repita Contraseña</label>
                            <div class="col-sm-8">
                                <input class="form-control" type="password" id="recontrasena" name="recontrasena" value="" placeholder="******" required> </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Registrar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
    <?php
include_once("includes/layout/foot.php");
?>
