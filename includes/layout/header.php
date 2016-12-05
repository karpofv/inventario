<div class="topbar">
    <div class="topbar-left">
        <div class="text-center"> <a href="index.html" class="logo"><span>Inv</span>entario</a> <a href="javascript:void(0)" class="logo-sm"><span>I</span></a></div>
    </div>
    <div class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="">
                <div class="pull-left">
                    <button type="button" class="button-menu-mobile open-left waves-effect waves-light"> <i class="ion-navicon"></i> </button> <span class="clearfix"></span> </div>
                <ul class="nav navbar-nav navbar-right pull-right">
                    <li class="hidden-xs"> <a href="#" id="btn-fullscreen" class="waves-effect waves-light notification-icon-box"><i class="mdi mdi-fullscreen"></i></a></li>
                    <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true"> <img src="<?php echo $ruta_base;?>assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> <span class="profile-username"> <?php echo $_SESSION['nombre_usuario'];?> <br/> <small></small> </span> </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)"><span class="badge badge-success pull-right"></span>  Cambiar Contraseña </a></li>
                            <li class="divider"></li>
                            <li><a href="accion.php?org=44&salir=1"> Salir</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>