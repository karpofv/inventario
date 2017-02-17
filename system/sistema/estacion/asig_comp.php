<div class="modal-backdrop fade in"></div>
<div id="custom-width-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: block; padding-right: 16px;">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
<?php
    $codigoe = $_POST[codigoe];
    $codigoc = $_POST[codigoc];
    $desasignar = $_POST[desasignar];
    $asignar = $_POST[asignar];
    $consul = paraTodos::arrayConsulta("*", "estacion", "est_codigo=$codigoe");
    foreach($consul as $row){
        $estacion = $row[est_descripcion];
    }
    if($desasignar!=""){
        $delete = paraTodos::arrayDelete("estc_codigo=$codigoc", "estacion_comp");
        if($delete){
            paraTodos::showMsg("Asignación eliminada", "alert-success");
        }
    }
    if($asignar!=""){
        /*Se valida no se encuentre ya asignado*/
        $consul = paraTodos::arrayConsultanum("*", "estacion_comp", "estc_compcodigo=$codigoc");
        if($consul>0){
            paraTodos::showMsg("Este componente ya ha sido asginado", "alert-danger");
        } else {
            $insertar = paraTodos::arrayInserte("estc_estcodigo, estc_compcodigo", "estacion_comp", "$codigoe, $codigoc");
        }
    }
?>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cerrarmodal()">×</button>
                <h4 class="modal-title" id="custom-width-modalLabel">Asignar componentes a la estación <?php echo $estacion;?></h4>
            </div>
            <div class="modal-body">
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
                                <th>Asignar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $consul = paraTodos::arrayConsulta("*", "componente", "comp_codigo not in (select estc_compcodigo from estacion_comp) and comp_estado='ACTIVO'");
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
                                                            codigoe 	: <?php echo $codigoe;?>,
                                                            codigoc 	: <?php echo $row[comp_codigo];?>,
                                                            act 	: 3,
                                                            asignar : 1,
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
                <div class="divider"></div>
                <div class="row">
                    <h4>Componentes asignados</h4>
                    <table class="table table-hover" id="personal">
                        <thead>
                            <tr>
                                <th>Serial</th>
                                <th>Nº bien nacional</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $consul = paraTodos::arrayConsulta("*", "estacion_comp ec, componente c", "ec.estc_compcodigo=c.comp_codigo and estc_estcodigo=$codigoe");
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
                                                            codigoe 	: <?php echo $codigoe;?>,
                                                            codigoc 	: <?php echo $row[estc_codigo];?>,
                                                            act 	: 3,
                                                            desasignar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;">
                                        <i class="fa fa-eraser"></i>
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
