<div class="modal-backdrop fade in"></div>
<div id="custom-width-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: block; padding-right: 16px;">
    <div class="modal-dialog" style="width:70%">
        <div class="modal-content">
            <div class="modal-header">
<?php
    $codigoe = $_POST[codigoe];    
    $codigoer = $_POST[codigoer];
    $cedula = $_POST[cedula];
    $desasignar = $_POST[desasignar];  
    $asignar = $_POST[asignar];  
    $consul = paraTodos::arrayConsulta("*", "estacion", "est_codigo=$codigoe");
    foreach($consul as $row){
        $estacion = $row[est_descripcion];
    }
    if($desasignar!=""){
        $delete = paraTodos::arrayDelete("estr_codigo=$codigoer", "estacion_resp");
        if($delete){
            paraTodos::showMsg("Asignación eliminada", "alert-success");
        }
    }
    if($asignar!=""){
        /*Se valida no se encuentre ya asignado*/
        $consul = paraTodos::arrayConsultanum("*", "estacion_resp", "estr_estcodigo=$codigoe");
        if($consul>0){
            paraTodos::showMsg("Esta estación ya posee responsable", "alert-danger");
        } else {
            $insertar = paraTodos::arrayInserte("estr_estcodigo, estr_percedula", "estacion_resp", "$codigoe, $cedula");
        }
    }
?>                
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cerrarmodal()">×</button>
                <h4 class="modal-title" id="custom-width-modalLabel">Asignar responsable a la estación <?php echo $estacion;?></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table
                </div>
                <div class="divider"></div>
                <div class="row">
                    <table class="table table-hover" id="personal">
                        <thead>
                            <tr>
                                <th>Cédula</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Cargo</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $consul = paraTodos::arrayConsulta("*", "estacion_resp er, personal p, cargos c, departamento d", "er.estr_percedula=p.per_cedula and p.per_cargo=c.car_codigo and p.per_departamento=d.dep_codigo and estr_estcodigo=$codigoe");
                                foreach($consul as $row){
                            ?>
                            <tr>
                                <td><?php echo $row[per_cedula];?></td>
                                <td><?php echo $row[per_nombres];?></td>
                                <td><?php echo $row[per_apellidos];?></td>
                                <td><?php echo $row[car_descripcion];?></td>
                                <td>
                                    <a href="javascript:void(0)" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigoe 	: <?php echo $codigoe;?>,
                                                            codigoer 	: <?php echo $row[estr_codigo];?>,
                                                            act 	: 2,
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
$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigoe 	: <?php echo $codigoe;?>,
                                                            cedula 	: $('#cedulaa').val(),
                                                            act 	: 2,
                                                            asignar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;
