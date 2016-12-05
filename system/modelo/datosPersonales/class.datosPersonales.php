<?php
/**
* @param la variable modelo hace referencia a la conexion
* Otener los datos del usuario que inicio session
*/

class DatosPersonales {

  /*
  |--------------------------------------------------------------------------
  | Metodo para buscar los datos del empleado
  |--------------------------------------------------------------------------
  | Este busca todos los datos del empleado que ha iniciado session
  |
  */
  public function datosEmpleado($cedula) {
    $campos     = "*";
    $tablas     = 'personal';
    $consultas  = "cedemp='$cedula'";
    $res_       = paraTodos::arrayConsulta($campos,$tablas,$consultas);
    return $res_;
  }
  /*
  |--------------------------------------------------------------------------
  | CARGA FAMILIAR
  |--------------------------------------------------------------------------
  | Con este metodo traemos todos los datos de la carga familiar del
  | usuarios logueado
  |
  */
  public function cargaFamiliar($cedula) {
    $campos     = "*";
    $tablas     = '"SIMA001".npinffam';
    $consultas  = "codemp='$cedula'";
    $res_       = paraTodos::arrayConsultaPG($campos,$tablas,$consultas);
    return $res_;
  }
  /*
  |--------------------------------------------------------------------------
  | CARGA datosCargo
  |--------------------------------------------------------------------------
  | Con este metodo traemos todos los datos de la carga familiar del
  | usuarios logueado
  |
  */
  public function datosCargo($cedula) {
    $campos   = "*";
    $tablas   = '"SIMA001".npasicaremp';
    $consulta = "codemp='$cedula' and status='V'";
    $res_     = paraTodos::arrayConsultaPG($campos,$tablas,$consulta);
    return $res_;
  }
}

?>
