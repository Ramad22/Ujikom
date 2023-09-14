<?php
 include "function.php";
if (isset($_POST["daftar"])){

$date = date('D F Y');
$nis = htmlspecialchars($_POST["nis"]);
$nama = htmlspecialchars($_POST["nama"]);
$kelas = htmlspecialchars($_POST["kelas"]);
$tempat = htmlspecialchars($_POST["tempat"]);
$tanggal = htmlspecialchars($_POST["tanggal"]);
$jKelamin = htmlspecialchars($_POST["jenis_kelamin"]);
$phone = htmlspecialchars($_POST["phone"]);
$email = htmlspecialchars($_POST["email"]);
$alamat = htmlspecialchars($_POST["alamat"]);

$cek = mysqli_query($conn,"SELECT COUNT(*)as count FROM pendaftaran WHERE nis = '$nis'");
$row =mysqli_fetch_assoc($cek);
  if($row['count']>0){
      echo "
      <script>
      alert('Nis sudah ada');
      document.location.href = 'user.php';
      </script>
      ";
  } else{
     $query = mysqli_query($conn,"INSERT INTO pendaftaran VALUES ('','$date', '$nis','$nama','$kelas','$tempat','$tanggal','$jKelamin','$phone','$email','$alamat')");
      echo "
      <script>
      alert('Pendaftaran Berhasil');
      document.location.href = 'user.php';
      </script>
      ";
  }
}

?>
