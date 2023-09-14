<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>BD</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<style>
		body {
			background-color: #0066ff;
			font-family: Georgia, times new roman, Times, Merriweather, Cambria, Times, serif;
			font-weight: 300;
			font-size: 16px;
			line-height: 2;
			/* color: #777; */
			color: #4d4b4b;
		}

		.centerDiv {
			height: 100vh;
			width: 100%;
		}
	</style>
</head>

<body>

	<div class="auth ">
		<div class="container mt-5">
			<div class="row d-flex justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="card border-3">
						<div class="col-md-12">
							<div class="card-body ">
								<div class="mb-0 text-center">
									<h2 class="my-3"><B>LOGIN</B></h2>
									
										<marquee behavior="" direction="right"><h5 class="">Welcome!! ..DiBadminton Nekat..</h5></marquee>
									
								</div>
								<form action="Proses_login.php" method="POST">
									<div class="mb-4">
										<div id="" class="form-text"> USERNAME </div>
										<input type="input" class="form-control" name="username" minlength="4" placeholder="Enter username" autocomplete="off" required="required">
									</div>
									<div class="mb-4">
										<div id="" class="form-text">PASSWORD</div>
										<input type="password" name="password" class="form-control" minlength="5" placeholder="Enter password" autocomplete="off" required="required">
									</div>
									<div class="mb-4 form-check">
										<input type="checkbox" class="form-check-input" id="exampleCheck1">
										<label class="form-check-label" for="exampleCheck1">Remember me</label>
									</div>
									<input type="submit" class="btn btn-primary w-100" value="LOG-IN"></input>

									<?php
									// include "Koneksi.php";
									// if (isset($_POST['username'])) {
									// 	$username = $_POST['username'];
									// 	$password = $_POST['password'];
									
									// 	$query = mysqli_query($Koneksi, "SELECT*FROM user where username='$username' and password='$password'");
									
									// 	if (mysqli_num_rows($query)) {
									// 		$data = mysqli_fetch_array($query);
									// 		echo '<script> alert ("SUCCES BROO");
									//                     location.href="Registrasi.php";</script>';
									// 	} else {
									// 		echo '<script> alert("GAGAL A")</script>';
									// 	}
									
									// }
									?>

									<center><a href="Registrasi.php">Create Account</a></center><br>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- JavaScript Bundle with Popper -->
		<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
</body>

</html>