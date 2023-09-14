<?php 
session_start();
	include "function.php";

	if($_SERVER["REQUEST_METHOD"]=="POST")
{
	$username = $_POST['username'];
	$password =md5($_POST['password']);

	$query = "SELECT*FROM user WHERE username = '$username' AND password = '$password'";
	$result = mysqli_query($conn,$query);
	
	$row = mysqli_fetch_assoc($result);
	if ($row['level']=="admin"){
		$_SESSION['min'] = $_POST['username'];
		header("location:halaman-admin.php");
	}
	elseif ($row['level']=="anggota"){
		$_SESSION['ta'] = $_POST['username'];
		header("location:user.php ");
	}
	else{
		echo '<script>alert("CEK USERNAME DAN PASSWORD ANDA ATAU BUAT AKUN TERLEBIH DAHULU(:");
				document.location.href = "Login.php";</script>';
		
	}
	 
}	

?>
<a href ="Login.php">BACK</a>