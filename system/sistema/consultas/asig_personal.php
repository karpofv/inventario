<?php
    require_once('../includes/fpdf/fpdf.php');
    class PDF extends FPDF {
        function Header() {
            /*** Funcion Donde es Escribe los Datos que se Imprimen en la zona superior del Documento ***/
         }
         function Footer() {
          /*** Funcion Donde es Escribe los Datos que se Imprimen en la zona Inferior del Documento ***/
          }
     }
    $pdf=new PDF();
	$pdf->addpage();
	$pdf->SetFont('Arial','B',10);
	$pdf->Image($absolute_uri.'assets/images/logo.jpg',10,10,30);
	/*$pdf->Cell(0,5,utf8_decode('Inventario de Esta'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('de la Universidad Nacional Experimental de los Llanos Occidentales'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('"Ezequiel Zamora"'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('"UNELLEZ"'),0,1,'C');*/
	$pdf->Ln(5);
	$pdf->SetFont('Arial','B',10);
    $pdf->Cell(0,10,utf8_decode('Ficha de asignación la personal'),0,0,'C');
	$pdf->Ln();
	$pdf->SetFont('Arial','',8);
	$cuenta=0;
	$solicitudes = paraTodos::arrayConsulta("*", "personal p, cargos c, departamento d", "p.per_cargo=c.car_codigo and p.per_departamento=d.dep_codigo and p.per_cedula=$_GET[ced]");
	foreach($solicitudes as $rowf){
		$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(42, 50, 60);
        $pdf->SetTextColor(255,255,255,255);
		$pdf->Cell(190,5,utf8_decode('Datos personales y ubicación: '),1,1,'C',1);
        $pdf->SetTextColor(0,0,0,0);
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(20,5,utf8_decode('Cédula:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(170,5,$rowf[per_cedula],0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Nombes y Apellidos:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(150,5,utf8_decode($rowf[per_nombres]." ".$rowf[per_apellidos]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(30,5,utf8_decode('Teléfono:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[per_telefonos]),0,0,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(30,5,utf8_decode('correo'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[per_correo]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(30,5,utf8_decode('Cargo:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[car_descripcion]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(30,5,utf8_decode('Departamento:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[dep_descripcion]),0,1,'');
		$pdf->Ln();
		$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(42, 50, 60);
        $pdf->SetTextColor(255,255,255,255);
		$pdf->Cell(190,5,utf8_decode('Datos de la estación de trabajo asignada'),1,1,'C',1);
        $pdf->SetTextColor(0,0,0,0);
        $consul = paraTodos::arrayConsulta("e.*", "personal p, estacion_resp er, estacion e", "p.per_cedula=er.estr_percedula and e.est_codigo=er.estr_estcodigo and p.per_cedula=$_GET[ced]");
        foreach($consul as $est){
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(60,5,utf8_decode('Desscripción de la estación:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(130,5,$est[est_descripcion],0,1,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(60,5,utf8_decode('IP asignada:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(130,5,$est[est_ip],0,1,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(60,5,utf8_decode('M.A.C.:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(130,5,$est[est_mac],0,1,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(30,5,utf8_decode('Switch:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(65,5,$est[est_switch],0,0,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(30,5,utf8_decode('Puerto:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(65,5,$est[est_ptswitch],0,1,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(30,5,utf8_decode('Patch panel:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(65,5,$est[est_patchp],0,0,'');
            $pdf->SetFont('Arial','B',10);
            $pdf->Cell(30,5,utf8_decode('Puerto:'),0,0,'');
            $pdf->SetFont('Arial','',10);
            $pdf->Cell(65,5,$est[est_ptpatchp],0,1,'');
            $pdf->Ln();
            $pdf->SetFont('Arial','B',10);
            $pdf->SetFillColor(42, 50, 60);
            $pdf->SetTextColor(255,255,255,255);
            $pdf->Cell(190,5,utf8_decode('Componentes de la estación'),1,1,'C',1);
            $pdf->SetTextColor(0,0,0,0);
            $consulcomp = paraTodos::arrayConsulta("c.*", "estacion e, estacion_comp ec, componente c", "e.est_codigo=ec.estc_estcodigo and c.comp_codigo=ec.estc_compcodigo and e.est_codigo=$est[est_codigo]");
            foreach($consulcomp as $comp){
                $pdf->SetFillColor(42, 50, 60);
                $pdf->SetTextColor(255,255,255,255);
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Componente:'),0,0,'',1);
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(120,5,$comp[comp_nombre],0,0,'',1);
                $pdf->Cell(40,5,$comp[comp_estado],0,1,'',1);
                $pdf->SetTextColor(0,0,0,0);
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(50,5,utf8_decode('Fecha de incorporación:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,paraTodos::convertDate($comp[comp_fechain]),0,0,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(50,5,utf8_decode('Fecha de desincorporación:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,paraTodos::convertDate($comp[comp_fechadesin]),0,1,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Nº bien nacional:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,$comp[comp_biennac],0,1,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Serial:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,$comp[comp_serial],0,1,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Descripción:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,$comp[comp_descripcion],0,1,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Marca:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,$comp[comp_marca],0,0,'');
                $pdf->SetFont('Arial','B',10);
                $pdf->Cell(30,5,utf8_decode('Modelo:'),0,0,'');
                $pdf->SetFont('Arial','',10);
                $pdf->Cell(30,5,$comp[comp_modelo],0,0,'');
            }
        }
	}
    $pdf->Output();
?>
