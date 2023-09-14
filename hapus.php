<?php

//koneksi ke db melalui file function
require 'function.php';

//ambil data di URL
$id = $_GET["id"];

//cek apakah data berhasil dihapus atau tidak
if( hapus($id) > 0){
    echo "
        <script>
        alert('Delete Berhasil');
        document.location.href = 'admin.php';
        </script>
        ";
    }else{
        echo "
        <script>
        alert('Delete Gagal');
        document.location.href = 'admin.php';
        </script>
        ";
    }

?>