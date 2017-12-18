<?php
 
 if(isset($_GET['id'])){
    $id=$_GET['id'];
    $type=$_GET['type'];

    echo "Deleting $type ID $id";
 }
?>