<?php
	$codigo = $_POST[codigo];
	$comp = $_POST[comp];
	$descrip = $_POST[descrip];
	$marca = $_POST[marca];
	$modelo = $_POST[modelo];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($insertar=='1'){
		$consul = paraTodos::arrayConsultanum("comp_descripcion", "componente", "comp_nombre='$comp' and comp_modelo='$modelo' and comp_marca='$marca'");
		if ($consul>0 and $consulu>0){
			paraTodos::showMsg("Este existe un componente bajo esta marca y modelo", "alert-danger");
		} else{
			paraTodos::arrayInserte("comp_nombre, comp_descripcion, comp_marca, comp_modelo", "componente", "'$comp', '$descrip', '$marca', '$modelo'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $comp ==""){
        $consulta = paraTodos::arrayConsulta("*", "componente c", "c.comp_codigo=$codigo");
		foreach($consulta as $row){
		  $descrip = $row[comp_descripcion];
		  $marca = $row[comp_marca];
		  $modelo = $row[comp_modelo];
		  $comp = $row[comp_nombre];
		}
	}
	/*UPDATE*/
	if($editar == 1 and $comp !=""){
		paraTodos::arrayUpdate("comp_nombre='$comp', comp_descripcion='$descrip', comp_marca='$marca', comp_modelo='$modelo'", "componente", "comp_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("comp_codigo=$codigo", "componente");
	}
?>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Componentes</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Administración de componentes</h4>
                                <div class="row">
                                    <form class="form-horizontal">
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="comp">Componente</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="comp" type="text" value="<?php echo $comp; ?>">
                                                <input class="form-control collapse" id="codigo" type="number" value="<?php echo $codigo; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="descrip">Marca</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="marca" type="text" value="<?php echo $marca; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="descrip">Modelo</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="modelo" type="text" value="<?php echo $modelo; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="descrip">Descripción</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="descrip" type="text" value="<?php echo $descrip; ?>">
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
									dmn        : <?php echo $idMenut;?>,
									codigo     : $('#codigo').val(),
									comp       : $('#comp').val(),
									descrip    : $('#descrip').val(),
									marca      : $('#marca').val(),
									modelo     : $('#modelo').val(),
									insertar   : 1,
									ver        : 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#descrip').val('');
									$('#comp').val('');
									$('#marca').val('');
									$('#modelo').val('');
								},
							}); return false;
<?php
						} else {
?>
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn        : <?php echo $idMenut;?>,
									codigo 	   : $('#codigo').val(),
									descrip    : $('#descrip').val(),
									comp       : $('#comp').val(),
									marca      : $('#marca').val(),
									modelo     : $('#modelo').val(),
									editar     : 1,
									ver        : 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#descrip').val('');
									$('#comp').val('');
									$('#marca').val('');
									$('#modelo').val('');
								},
							}); return false;
<?php
					}
?>
                   "> </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <table class="table table-hover" id="personal">
                                        <thead>
                                            <tr>
                                                <td class="text-center"><strong>Componente</strong></td>
                                                <td class="text-center"><strong>Marca</strong></td>
                                                <td class="text-center"><strong>Modelo</strong></td>
                                                <td class="text-center"><strong>Descripción</strong></td>
                                                <td class="text-center"><strong>Editar</strong></td>
                                                <td class="text-center"><strong>Eliminar</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("*", "componente", "1=1");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php echo $row[comp_nombre];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[comp_modelo];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[comp_marca];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[comp_descripcion];?>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[comp_codigo];?>,
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
                                                            codigo 	: <?php echo $row[comp_codigo];?>,
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
        $('#personal').DataTable({
            "language": {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            }
        });
    </script>
