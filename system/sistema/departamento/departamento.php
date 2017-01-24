<?php
	$codigo = $_POST[codigo];
	$descrip = $_POST[descrip];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($insertar=='1'){
		$consul = paraTodos::arrayConsultanum("dep_descripcion", "departamento", "dep_descripcion='$descrip'");
		if ($consul>0){
			paraTodos::showMsg("Este departamento ya se encuentra registrado", "alert-danger");
		} else{
			paraTodos::arrayInserte("dep_descripcion", "departamento", "'$descrip'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $descrip ==""){
        $consulta = paraTodos::arrayConsulta("*", "departamento c", "c.dep_codigo=$codigo");
		foreach($consulta as $row){
		  $descrip = $row[dep_descripcion];
		}
    }
	/*UPDATE*/
	if($editar == 1 and $descrip !=""){
		paraTodos::arrayUpdate("dep_descripcion='$descrip'", "departamento", "dep_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("dep_codigo=$codigo", "departamento");
	}
?>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Departamentos</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Administrar departamentos</h4>
                                <div class="row">
                                    <form class="form-horizontal">
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-3 control-label" for="txtdescrip">Descripción del departamento</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="txtdescrip" type="text" value="<?php echo $descrip; ?>">
                                                <input class="form-control collapse" id="txtcodigo" type="number" value="<?php echo $codigo; ?>">
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <input id="enviar" type="button" value="Guardar" class="btn btn-primary col-md-offset-5" onclick="
<?php
						if($editar==""){
?>
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn 	: <?php echo $idMenut;?>,
									descrip 	: $('#txtdescrip').val(),
									insertar: 1,
									ver 	: 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#txtdescrip').val('');
								},
							}); return false;
<?php
						} else {
?>
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn 	: <?php echo $idMenut;?>,
									codigo 	: $('#txtcodigo').val(),
									descrip 	: $('#txtdescrip').val(),
									editar: 1,
									ver 	: 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#txtdescrip').val('');
								},
							}); return false;
<?php
					}
?>
                   "> </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <table class="table table-hover" id="departamentos">
                                        <thead>
                                            <tr>
                                                <td class="text-center"><strong>Codigo</strong></td>
                                                <td class="text-center"><strong>Descripción</strong></td>
                                                <td class="text-center"><strong>Editar</strong></td>
                                                <td class="text-center"><strong>Eliminar</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("dep_codigo, dep_descripcion", "departamento c", "1=1 order by dep_descripcion");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php echo $row[dep_codigo];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[dep_descripcion]);?>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[dep_codigo];?>,
                                                            editar 	: 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-edit"></i>
									               </a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[dep_codigo];?>,
                                                            eliminar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-eraser"></i>
									               </a>
                                                </td>
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
        $('#departamentos').DataTable({
            "language": {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            }
        });
    </script>
