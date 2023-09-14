<?php

//koneksi ke db melalui file function
require 'function.php';

//mengambil data di URL
// $id = $_GET["id"];

//query data pendaftaran berdasarkan id
// $anggota = query("SELECT * FROM pendaftaran WHERE id = $id")[0];

//cek apakah button submit sudah ditekan atau belum
if ( isset($_POST["submit"])) {

    //cek apakah data berhasil diubah atau tidak
    if( ubah($_POST) > 0){
        echo "
        <script>
        alert('Update Berhasil');
        document.location.href = 'halaman-admin.php';
        </script>
        ";
    }else{
        echo "
        <script>
        alert('Update Gagal');
        document.location.href = 'halaman-admin.php';
        </script>
        ";
    }
}

?>