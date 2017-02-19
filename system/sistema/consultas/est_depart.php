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
    $pdf->Cell(0,10,utf8_decode('Información detallada de la estación'),0,0,'C');
	$pdf->Ln();
	$pdf->SetFont('Arial','',8);
	$cuenta=0;
	$solicitudes = paraTodos::arrayConsulta("*", "estacion e, departamento d", "e.est_depcodigo=d.dep_codigo and est_codigo=$_GET[est]");
	foreach($solicitudes as $rowf){
        $pdf->SetTextColor(0,0,0,0);
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(20,5,utf8_decode('Estación:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(170,5,$rowf[est_descripcion],0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Ip:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(150,5,utf8_decode($rowf[est_ip]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('M.A.C.:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[est_mac]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Switch'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[est_switch]),0,0,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Puerto del switch:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[est_ptswitch]),0,1,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Patch panel:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[est_patchp]),0,0,'');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Puerto del patch panel:'),0,0,'');
		$pdf->SetFont('Arial','',10);
		$pdf->Cell(65,5,utf8_decode($rowf[est_ptpatchp]),0,1,'');
		$pdf->Ln();
		$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(42, 50, 60);
        $pdf->SetTextColor(255,255,255,255);
		$pdf->Cell(190,5,utf8_decode('Componentes asignados'),1,1,'C',1);
        $consulcomp = paraTodos::arrayConsulta("*", "estacion_comp e, componente c", "e.estc_compcodigo=c.comp_codigo and e.estc_estcodigo=$rowf[est_codigo]");
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
    $pdf->Output();
?>
