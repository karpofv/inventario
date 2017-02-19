<?php
	$codigo = $_POST[codigo];
	$descrip = $_POST[descrip];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($insertar=='1'){
		$consul = paraTodos::arrayConsultanum("car_descripcion", "cargos", "car_descripcion='$descrip'");
		if ($consul>0){
			paraTodos::showMsg("Este cargo ya se encuentra registrado", "alert-danger");
		} else{
			paraTodos::arrayInserte("car_descripcion", "cargos", "'$descrip'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $descrip ==""){
        $consulta = paraTodos::arrayConsulta("*", "cargos c", "c.car_codigo=$codigo");
		foreach($consulta as $row){
		  $descrip = $row[car_descripcion];
		}
    }
	/*UPDATE*/
	if($editar == 1 and $descrip !=""){
		paraTodos::arrayUpdate("car_descripcion='$descrip'", "cargos", "car_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("car_codigo=$codigo", "cargos");
	}
?>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Cargos</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Estaciones por departamento<a class="pull-rigth" href="<?php echo $ruta_base."system/accion.php?dmn=$idMenut&act=3&ver=2"?>" target="_blank"><i class=" fa fa-print"></i></a></h4>
                                <div class="row">
                                    <table class="table table-hover" id="cargos">
                                        <thead>
                                            <tr>
                                                <td ><strong>Departamento</strong></td>
                                                <td ><strong>Estación</strong></td>
                                                <td ><strong>Ip</strong></td>
                                                <td ><strong>MAC</strong></td>
                                                <td ><strong>Imprimir</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("*", "estacion e, departamento d", "e.est_depcodigo=d.dep_codigo");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td >
                                                    <?php echo $row[dep_descripcion];?>
                                                </td>
                                                <td >
                                                    <?php echo utf8_decode($row[est_descripcion]);?>
                                                </td>
                                                <td><?php echo utf8_decode($row[est_ip]);?></td>
                                                <td><?php echo utf8_decode($row[est_mac]);?></td>
                                                <td ><a href="<?php echo $ruta_base."system/accion.php?dmn=$idMenut&act=2&ver=2&est=$row[est_codigo]"?>" target="_blank"><i class="fa fa-print"></i></a></td>
                                            </tr>
<?php
								            }
?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#cargos').DataTable({
            "language": {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            }
        });
    </script>
