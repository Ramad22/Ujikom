<?php 
    include "function.php";

   $no = $_GET['no'];

   $o=mysqli_query($conn,"DELETE FROM absen WHERE no = '$no'");
   
   if ($o)
   {
    header('location:halaman-admin.php');
   }else
   {
    echo "<script>alert('Gagal Min');</script>";
   }


?>