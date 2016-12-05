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
    <?php
session_start();
session_destroy();
?>
            <div class="accountbg"></div>
            <div class="wrapper-page">
                <div class="panel panel-color panel-primary panel-pages">
                    <div class="panel-body">
                        <h3 class="text-center m-t-0 m-b-15"> <a href="index.php" class="logo logo-admin"><span>Inv</span>entario</a></h3>
                        <h4 class="text-muted text-center m-t-0"><b>Ingresar</b></h4>
				        <form action="index2.php" id="login-form" class="smart-form client-form" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input class="form-control" type="text" required="" placeholder="Usuario" name="user">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input class="form-control" type="password" required="" placeholder="Contraseña" name="pass">
                                </div>
                            </div>
                            <div class="form-group text-center m-t-40">
                                <div class="col-xs-12">
                                    <button class="btn btn-primary btn-block btn-lg waves-effect waves-light" type="submit">Ingresar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <?php if (isset($_GET['error_login'])) {
                $error = $_GET['error_login'];
                ?>
                <div class="callout callout-danger">
                    <p>
                        <?php echo $error_login_ms[$error]; ?>
                    </p>
                </div>
                <?php
                }
                ?>
        </div>
        <div class="col-lg-4"></div>
        <?php
include_once("includes/layout/foot.php");
?>