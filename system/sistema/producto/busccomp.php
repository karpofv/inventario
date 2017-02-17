<?php
    $codigo = $_POST[codigo];
    $fecha = $_POST[fecha];
    $motivo = $_POST[motivo];
    if ($codigo!="" and $fecha!=""){
        paraTodos::arrayUpdate("comp_fechadesin='$fecha', comp_estado='DESINCORPORADO', comp_motivodesinc='$motivo'", "componente", "comp_codigo=$codigo");
    }
?>
<div class="modal-backdrop fade in"></div>
<div id="custom-width-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: block; padding-right: 16px;">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cerrarmodal()">×</button>
                <h4 class="modal-title" id="custom-width-modalLabel">Componentes activos</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-sm-4">
                            <label class="control-label" for="txtdesinc">Fecha de Desincorporación</label>
                            <input type="date" class="form-control" id="txtdesinc">
                        </div>
                        <div class="col-sm-8">
                            <label class="control-label" for="txtdesinc">Motivo de desincorporación</label>
                            <select class="form-control" id="selmotiv">
                                <option value="0">Seleccione una opción</option>
                                <option>Mantenimiento</option>
                                <option>Fin de vida util</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover" id="componentes">
                        <thead>
                            <tr>
                                <th>Serial</th>
                                <th>Nº bien nacional</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Desincorporar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $consul = paraTodos::arrayConsulta("*", "componente c", "c.comp_fechadesin is null");
                                foreach($consul as $row){
                            ?>
                            <tr>
                                <td><?php echo $row[comp_serial];?></td>
                                <td><?php echo $row[comp_biennac];?></td>
                                <td><?php echo $row[comp_nombre];?></td>
                                <td><?php echo $row[comp_descripcion];?></td>
                                <td><?php echo $row[comp_marca];?></td>
                                <td><?php echo $row[comp_modelo];?></td>
                                <td>
                                    <a href="javascript:void(0)" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[comp_codigo];?>,
                                                            fecha 	: $('#txtdesinc').val(),
                                                            motivo 	: $('#selmotiv').val(),
                                                            act 	: 2,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;">
                                        <i class="fa fa-plus-square"></i>
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
    <script>
        $('#componentes').DataTable({
            "language": {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            }
        });
    </script>
