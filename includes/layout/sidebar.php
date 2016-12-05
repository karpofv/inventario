<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
        <div class="user-details">
            <div class="text-center"> <img src="<?php echo $ruta_base;?>assets/images/users/avatar-1.jpg" alt="" class="img-circle"></div>
            <div class="user-info">
                <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo $_SESSION['nombre_usuario'];?></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)"> Cambiar Contraseña</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)"> Salir</a></li>
                    </ul>
                </div>
                <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> Online</p>
            </div>
        </div>
        <div id="sidebar-menu">
            <ul>
                <?php menu::menuEmpMenj($quien,$nivel); ?>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>