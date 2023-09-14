<?php
include "function.php";
    if (isset($_POST['ubah'])){
    $no = $_POST['no'];

    $nama = $_POST['nama'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $kelas = $_POST['kelas'];
    $tgl = $_POST['tgl'];
    $keterangan = $_POST['keterangan'];

    $Perintah = mysqli_query($conn, "UPDATE absen SET nama='$nama',jenis_kelamin='$jenis_kelamin',kelas='$kelas',tgl='$tgl',keterangan='$keterangan' WHERE no = '$no' ");
    if ($Perintah) {
        header("location:halaman-admin.php");
        echo "<script>alert('Berhasil Di UPDATE MIN..');</script>";
        

    } else {
        echo "<script>alert('Gagal');</script>";
    }
    }

?>