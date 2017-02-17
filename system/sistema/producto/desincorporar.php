<div class="content">
    <div>
        <div class="page-header-title">
            <h4 class="page-title">Desincorporaciones</h4> </div>
    </div>
    <div class="page-content-wrapper ">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <h4 class="m-b-30 m-t-0">Buscar componentes</h4>
                            <button type="button" class="btn btn-default" onclick="
                                         $.ajax({
                                            url:'accion.php',
                                            type:'POST',
                                            data:{
                                                dmn 	: <?php echo $idMenut;?>,
                                                ver 	: 2,
                                                act     : 2
                                            },
                                            success : function (html) {
                                                $('#ventanaVer').html(html);
                                            },
                                        }); return false;">Buscar</button>
                            <h4 class="m-b-30 m-t-0">Componentes desincorporados</h4>
                            <div class="row">
                                <table class="table table-hover" id="personal">
                                    <thead>
                                        <tr>
                                            <td class="text-center"><strong>Fec. Incorp.</strong></td>
                                            <td class="text-center"><strong>Serial</strong></td>
                                            <td class="text-center"><strong>Nº de bien nacional</strong></td>
                                            <td class="text-center"><strong>Componente</strong></td>
                                            <td class="text-center"><strong>Marca</strong></td>
                                            <td class="text-center"><strong>Modelo</strong></td>
                                            <td class="text-center"><strong>Descripción</strong></td>
                                            <td class="text-center"><strong>Fec. Desincorp.</strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
								            $consulsol = paraTodos::arrayConsulta("*", "componente", "comp_fechadesin is not null");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php echo paraTodos::convertDate($row[comp_fechain]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[comp_serial];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo $row[comp_biennac];?>
                                                </td>
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
                                                    <?php echo paraTodos::convertDate($row[comp_fechadesin]);?>
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
