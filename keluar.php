<?php
    session_start();
    if(isset($_SESSION['min'])){
        unset($_SESSION['min']);
        header('location:Login.php');
    }else if (isset($_SESSION['ta'])){
        unset($_SESSION['ta']);
        header('location:Login.php');
    }

?>