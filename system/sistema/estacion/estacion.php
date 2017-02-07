<?php
	$codigo = $_POST[codigo];
	$dep = $_POST[dep];
	$descrip = $_POST[descrip];
	$ip = $_POST[ip];
	$mac = $_POST[mac];
	$switch = $_POST[_switch];
	$ptswitch = $_POST[ptswitch];
	$patchp = $_POST[patchp];
	$ptpatchp = $_POST[ptpatchp];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
    $cantidad = 0;
	if ($insertar=='1'){
		$consulip = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_ip='$ip'");
        if ($consulip>0){
            $mensaje = "Ya Existe una estacion asociada a esta ip";
            $cantidad = 1;
        }
        $consulmac = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_mac='$mac'");
        if ($consulmac>0){
            $mensaje = "Ya Existe una estacion asociada a esta mac";
            $cantidad = 1;
        }
        $consuls = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_switch='$switch' and est_ptswitch='$ptswitch'");
        if ($consulsulip>0){
            $mensaje = "Ya Existe una estacion asociada a este puerto del switch";
            $cantidad = 1;
        }
        $consulmac = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_mac='$mac'");
        if ($consulmac>0){
            $mensaje = "Ya Existe una estacion asociada a esta mac";
            $cantidad = 1;
        }
		if ($cantidad>0){
			paraTodos::showMsg("$mensaje", "alert-danger");
		} else{
			paraTodos::arrayInserte("est_depcodigo, est_descripcion, est_ip, est_mac, est_switch, est_ptswitch, est_patchp, est_ptpatchp", "estacion", "$dep, '$descrip', '$ip', '$mac', '$switch', '$ptswitch', '$patchp', '$ptpatchp'");
		}
	}
	/*UPDATE*/
	if($editar == 1 and $descrip !=""){
		$consulip = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_ip='$ip' and est_codigo<>$codigo");
        if ($consulip>0){
            $mensaje = "Ya Existe una estacion asociada a esta ip";
            $cantidad = 1;
        }
        $consulmac = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_mac='$mac' and est_codigo<>$codigo");
        if ($consulmac>0){
            $mensaje = "Ya Existe una estacion asociada a esta mac";
            $cantidad = 1;
        }
        $consuls = paraTodos::arrayConsultanum("est_descripcion", "estacion", "est_switch='$switch' and est_ptswitch='$ptswitch' and est_codigo<>$codigo");
        if ($consuls>0){
            $mensaje = "Ya Existe una estacion asociada a este puerto del switch";
            $cantidad = 1;
        }
		if ($cantidad>0){
			paraTodos::showMsg("$mensaje", "alert-danger");
		} else{
            paraTodos::arrayUpdate("est_depcodigo='$dep', est_descripcion='$descrip', est_ip='$ip', est_mac='$mac', est_switch='$switch', est_ptswitch='$ptswitch', est_patchp='$patchp', est_ptpatchp='$ptpatchp'", "estacion", "est_codigo=$codigo");
            $editar="";
        }
	}
	/*MOSTRAR*/
	if($editar == 1 and $descrip ==""){
        $consulta = paraTodos::arrayConsulta("*", "estacion e, departamento d", "e.est_depcodigo=d.dep_codigo and e.est_codigo=$codigo");
		foreach($consulta as $row){
            $dep = $row[dep_codigo];
            $descrip = $row[est_descripcion];
            $ip = $row[est_ip];
            $mac = $row[est_mac];
            $switch = $row[est_switch];
            $ptswitch = $row[est_ptswitch];
            $patchp = $row[est_patchp];
            $ptpatchp = $row[est_ptpatchp];
		}
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("est_codigo=$codigo", "estacion");
        $eliminar="";
        $codigo="";
	}
?>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Estaciones de trabajo</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Administrar estaciones</h4>
                                <div class="row">
                                    <form class="form-horizontal">
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="ip">Departamento</label>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="dep">
                                                    <option value="0">Seleccione el departamento</option>
                                                <?php
                                                    combos::CombosSelect("1", "$dep", "dep_codigo, dep_descripcion", "departamento", "dep_codigo", "dep_descripcion", "1=1");
                                                ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="descrip">Descripción</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="descrip" type="text" value="<?php echo $descrip; ?>">
                                                <input class="form-control collapse" id="codigo" type="number" value="<?php echo $codigo; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="ip">Ip</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="ip" type="text" value="<?php echo $ip; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="mac">M.A.C.</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="mac" type="text" value="<?php echo $mac; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="switch">SWITCH</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="switch" type="text" value="<?php echo $switch; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="ptswitch">Puerto del SWITCH</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="ptswitch" type="text" value="<?php echo $ptswitch; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="patchp">Patch panel</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="patchp" type="text" value="<?php echo $patchp; ?>">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <label class="col-sm-2 control-label" for="ptpatchp">Puerto del Patch panel</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="ptpatchp" type="text" value="<?php echo $ptpatchp; ?>">
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
									descrip    : $('#descrip').val(),
									dep    : $('#dep').val(),
									ip    : $('#ip').val(),
									mac    : $('#mac').val(),
									_switch    : $('#switch').val(),
									ptswitch    : $('#ptswitch').val(),
									patchp    : $('#patchp').val(),
									ptpatchp    : $('#ptpatchp').val(),
									insertar   : 1,
									ver        : 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#codigo').val('');
									$('#descrip').val('');
									$('#ip').val('');
									$('#mac').val('');
									$('#switch').val('');
									$('#ptswitch').val('');
									$('#patchp').val('');
									$('#ptpatchp').val('');
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
									codigo     : $('#codigo').val(),
									descrip    : $('#descrip').val(),
									dep    : $('#dep').val(),
									ip    : $('#ip').val(),
									mac    : $('#mac').val(),
									_switch    : $('#switch').val(),
									ptswitch    : $('#ptswitch').val(),
									patchp    : $('#patchp').val(),
									ptpatchp    : $('#ptpatchp').val(),
									editar     : 1,
									ver        : 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#codigo').val('');
									$('#descrip').val('');
									$('#ip').val('');
									$('#mac').val('');
									$('#switch').val('');
									$('#ptswitch').val('');
									$('#patchp').val('');
									$('#ptpatchp').val('');
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
                                                <td class="text-center"><strong>Eliminar</strong></td>
                                                <td class="text-center"><strong>Editar</strong></td>
                                                <td class="text-center"><strong>Asig. Responsable</strong></td>
                                                <td class="text-center"><strong>Asig. Componente</strong></td>
                                                <td class="text-center"><strong>Departamento</strong></td>
                                                <td class="text-center"><strong>Descripción</strong></td>
                                                <td class="text-center"><strong>Ip</strong></td>
                                                <td class="text-center"><strong>M.A.C.</strong></td>
                                                <td class="text-center"><strong>Switch</strong></td>
                                                <td class="text-center"><strong>Pto. en el Switch</strong></td>
                                                <td class="text-center"><strong>Patch panel</strong></td>
                                                <td class="text-center"><strong>Pto. Patch panel</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("*", "estacion e, departamento d", "e.est_depcodigo=d.dep_codigo");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[est_codigo];?>,
                                                            eliminar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-eraser"></i>
									               </a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[est_codigo];?>,
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
                                                            codigoe 	: <?php echo $row[est_codigo];?>,
                                                            act 	: 2,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-plus-square"></i>
									               </a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigoe 	: <?php echo $row[est_codigo];?>,
                                                            act 	: 3,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-plus-square"></i>
									               </a>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[dep_descripcion];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_descripcion];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_ip];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_mac];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_switch];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_ptswitch];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_patchp];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[est_ptpatchp];?>
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
