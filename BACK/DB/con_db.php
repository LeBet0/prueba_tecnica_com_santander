<?php

$user = "root";
$pass = "";
$host = "localhost";
$database = "tienda_online";


$connection = new mysqli($host, $user, $pass, $database);

if(!$connection) 
        {
            echo "No se ha podido conectar con el servidor. Error: " .$connection->$php_errormsg ;
        }
  else
        {
           // echo "Conexión exitosa a la Base de datos! <br><br>" ;
        }

$db=mysqli_select_db($connection,$database);

    // $db = $connection->

if (!$db)
{
    echo "No se pudo conectar con el esquema";
}
else
{
    //echo "Esquema seleccionado exitosamente!<br><br>";
};

?>