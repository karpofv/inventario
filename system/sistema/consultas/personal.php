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
                                <h4 class="m-b-30 m-t-0">Personal y estaciones asignadas</h4>
                                <div class="row">
                                    <table class="table table-hover" id="cargos">
                                        <thead>
                                            <tr>
                                                <td ><strong>Cédula</strong></td>
                                                <td ><strong>Nombres</strong></td>
                                                <td ><strong>Apellidos</strong></td>
                                                <td ><strong>Cargo</strong></td>
                                                <td ><strong>Departamento</strong></td>
                                                <td ><strong>Imprimir</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("*", "personal p, cargos c, departamento d", "p.per_cargo=c.car_codigo and p.per_departamento=d.dep_codigo order by per_cedula");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td >
                                                    <?php echo $row[per_cedula];?>
                                                </td>
                                                <td >
                                                    <?php echo utf8_decode($row[per_nombres]);?>
                                                </td>
                                                <td><?php echo utf8_decode($row[per_apellidos]);?></td>
                                                <td><?php echo utf8_decode($row[car_descripcion]);?></td>
                                                <td><?php echo utf8_decode($row[dep_descripcion]);?></td>
                                                <td ><a href="<?php echo $ruta_base."system/accion.php?dmn=$idMenut&act=2&ver=2&ced=$row[per_cedula]"?>" target="_blank"><i class="fa fa-print"></i></a></td>
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
