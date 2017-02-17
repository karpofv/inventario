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
	$pdf->Cell(0,5,utf8_decode('Fundación Fondo de Jubilaciones y Pensiones del Personal Académico'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('de la Universidad Nacional Experimental de los Llanos Occidentales'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('"Ezequiel Zamora"'),0,1,'C');
	$pdf->Cell(0,5,utf8_decode('"UNELLEZ"'),0,1,'C');
	$pdf->Ln(5);
	$pdf->SetFont('Arial','B',10);
    $pdf->Cell(0,10,'SOLICITUD DE PRESTAMO',0,0,'C');
	$pdf->Ln();
	$pdf->SetFont('Arial','',8);
	$cuenta=0;
	$solicitudes = paraTodos::arrayConsulta("*", "solict_prest sp, datos_per dp, vicerrectorado v, tp_prest tp, condicion c", "sp.CEDULA=dp.datp_cedula and dp.datp_viccodigo=v.vic_codigo and sp.TP_PREST=tp.ID and sp.ID='$_GET[id]' and dp.datp_condcodigo=c.cond_codigo");
	foreach($solicitudes as $rowf){
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(155,5,'Fecha: ',0,0,'R');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(25,5,paraTodos::convertDate($rowf['FECHA']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,utf8_decode('Cédula: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(79,5,$rowf['datp_cedula'],0,0,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(30,5,'Fecha de nacimiento: ',0,0,'R');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(25,5,paraTodos::convertDate($rowf['datp_fecnac']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,'Apellidos: ',0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,utf8_decode($rowf['datp_apellidos']),0,0,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,'Nombres: ',0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,utf8_decode($rowf['datp_nombres']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Teléfonos: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(150,5,utf8_decode($rowf['datp_telefono']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Correo Electrónico: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(150,5,utf8_decode($rowf['datp_correo']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Dirección: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(150,5,utf8_decode($rowf['datp_direccion']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Vicerrectorado: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(55,5,utf8_decode($rowf['vic_descripcion']),0,0,'L');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(40,5,utf8_decode('Fecha de ingreso: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,paraTodos::convertDate($rowf['datp_fecing']),0,1,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,'Banco: ',0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,utf8_decode($rowf['datp_banco']),0,0,'L');
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,utf8_decode('Nº de cuenta: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,utf8_decode($rowf['datp_cuenta']),0,1,'L');
        $pdf->SetFont('Arial','B',10);
		$pdf->Cell(25,5,utf8_decode('Condición: '),0,0,'L');
		$pdf->SetFont('Arial','',8);
		$pdf->Cell(70,5,utf8_decode($rowf['cond_descripcion']),0,1,'L');
		$pdf->Ln();
		$pdf->Ln(5);
		$pdf->SetFont('Arial','B',10);
		$pdf->Cell(0,10,'DATOS DEL PRESTAMO',0,0,'C');
		$pdf->Ln();
		$pdf->SetFont('Arial','B',8);
		$pdf->Cell(20,4,'Fecha',1,0,'C');
		$pdf->Cell(130,4,'Tipo de prestamo',1,0,'C');
		$pdf->Cell(40,4,'Monto',1,0,'C');
		$pdf->SetFont('Arial','',8);
		$pdf->Ln();
		$pdf->Cell(20,5,paraTodos::convertDate($rowf['FECHA']),1,0,'L');
		$pdf->Cell(130,5,$rowf['NAME'],1,0,'L');
		$pdf->Cell(40,5,number_format($rowf['MONTO'],2,',','.')." Bs.",1,0,'C');
		$pdf->Ln();
	}
    $pdf->Output();
?>
