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
    $pdf->Cell(0,10,utf8_decode('Estaciones por departamento'),0,0,'C');
	$pdf->Ln();
	$pdf->SetFont('Arial','',8);
	$cuenta=0;
	$solicitudes = paraTodos::arrayConsulta("d.dep_codigo, d.dep_descripcion", "estacion e, departamento d", "e.est_depcodigo=d.dep_codigo");
	foreach($solicitudes as $rowf){
		$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(42, 50, 60);
        $pdf->SetTextColor(255,255,255,255);
		$pdf->Cell(190,5,utf8_decode($rowf[dep_descripcion]),1,1,'C',1);
		$pdf->Ln();
		$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(42, 50, 60);
        $pdf->SetTextColor(255,255,255,255);
        $pdf->SetTextColor(0,0,0,0);
        $consul = paraTodos::arrayConsulta("e.*", "estacion e", "est_depcodigo=$rowf[dep_codigo]");
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
        }
	}
    $pdf->Output();
?>
