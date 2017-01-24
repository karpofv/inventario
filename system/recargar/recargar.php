<?php
//-------------------------------------------------------
// GENERAL********************************************
//-------------------------------------------------------
	$consul = paraTodos::arrayConsulta("*", "recargar", "id=$idMenut");
	foreach ($consul as $row){
		$opcion = $row[actd];
	}
	if($opcion == '1'){
		$consul = paraTodos::arrayConsulta("*", "tp_prest", "ID =$_POST[tiposol]");
		foreach( $consul as $row){
?>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="montomax">Monto Maximo</label>
				<div class="col-sm-8">
					<input class="form-control" placeholder="Monto Maximo" readonly="readonly" id="montomax" type="number" value="<?php echo $row['MTO_MAX'];?>">
				</div>
			</div>
<?php
		}
	}
	if($opcion == '2'){
		paraTodos::arrayUpdate("notif_leido=1", "notificacion", "notif_codigo=$_POST[codigo]");
	}
	if($opcion == '3'){
		paraTodos::arrayUpdate("ESTATUS='$_POST[estatus]'", "solict_prest", "ID=$_POST[codigo]");
		$consulsol = paraTodos::arrayConsulta("s.ID, s.FECHA, s.CEDULA, s.NAME,s.MONTO, s.ESTATUS, tp.NAME as tipop", "solict_prest s, tp_prest tp", "s.TP_PREST=tp.ID and s.ID=$_POST[codigo]");
		foreach($consulsol as $row){
		?>
			<td class="text-center"><?php echo $row[FECHA];?></td>
								<td class="text-center"><?php echo $row[CEDULA];?></td>
								<td class="text-center"><?php echo $row[NAME];?></td>
								<td class="text-center"><?php echo $row[tipop];?></td>
								<td class="text-center"><?php echo $row[MONTO];?></td>
								<td class="text-center"><?php echo $row[ESTATUS];?></td>
								<?php
									if($row[ESTATUS]<>'APROBADO' and $row[ESTATUS]<>'RECHAZADO'){

								?>
								<td class="text-center">
									<a href="javascript:void(0);" onclick="$.ajax({
								url:'recargar.php',
								type:'POST',
								data:{
									dmn 	: 357,
									codigo 	: <?php echo $row[ID];?>,
									estatus : 'APROBADO',
									ver 	: 1
								},
								success : function (html) {
									$('#tr<?php echo $row[ID];?>').html(html);
								},
							}); return false;"><i class="fa fa-edit"></i>
									</a>
								</td>
								<td class="text-center">
									<a href="javascript:void(0);" onclick="$.ajax({
								url:'recargar.php',
								type:'POST',
								data:{
									dmn 	: 357,
									codigo 	: <?php echo $row[ID];?>,
									estatus : 'RECHAZADO',
									ver 	: 1
								},
								success : function (html) {
									$('#tr<?php echo $row[ID];?>').html(html);
								},
							}); return false;"><i class="fa fa-eraser"></i>
									</a>
								</td>
                      		<?php
									} else{
										?>
							<td></td>
							<td></td>
										<?php
									}
							?>
		<?php
		}
	}
?>
