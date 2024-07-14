<?php

    include('../DB/con_db.php');

    $sql_extraer_stock="SELECT * FROM STOCK";

    $query = $connection->query($sql_extraer_stock);

    if($query){
        $array_stock=  array();
        while($row  = $query->fetch_array()){
            //var_dump(json_encode($row));
            array_push($array_stock,$row);
        }
        //echo '<br><br>';
        //var_dump($array_stock);
        echo (json_encode($array_stock));
    }

?>