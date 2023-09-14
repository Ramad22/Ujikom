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
        <div class="container mt-4">
            <div class="row d-flex justify-content-center">
                <div class="col-md-7 col-lg-5">
                    <div class="card border-3">
                        <div class="col-md-12">
                            <div class="card-body ">
                                <div class="mb-5 text-center">
                                    <h2 class="mt-3"><B>REGISTER</B></h2>
                                </div>
                                <form action="" method="post">
                                    <div class="mb-4">
                                        <div id="" class="form-text"> USERNAME </div>
                                        <input type="input" class="form-control" name="username" minlength="4" autocomplete="off" placeholder="Enter username" required="required">
                                    </div>
                                    <div class="mb-4">
                                        <div id="" class="form-text">PASSWORD</div>
                                        <input type="password" class="form-control" minlength="5" name="password" autocomplete="off" placeholder="Enter password" required="required">
                                    </div>
                                    <div class="mb-4">
                                        <div id="" class="form-text">CONFIRM PASSWORD</div>
                                        <input type="password" class="form-control" minlength="5" name="password" autocomplete="off" placeholder="Enter password" required="required">
                                    </div>
                                    <div class="mb-4">
                                        <input class="" aria-label="Default select example" name="level" type="hidden" value="anggota">
                                    </div>
                                    <div class="mb-4 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                    </div>
                                    <input type="submit" class="btn btn-primary w-100" value="REGISTER"></input>
                                    <center><a href="Login.php">Login</a></center><br>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php
    include "function.php";
    if (isset($_POST['username'])) {
        $username = $_POST['username'];
        $password =md5($_POST['password']);
        $nama = $_POST['level'];


        $query = mysqli_query($conn, "INSERT INTO user(username,password,level) values ('$username','$password','$nama')");
        if ($query) {
            echo '<script>alert("pendaftaran berhasil silahkan login.");</script>';
            header('location:Login.php');
        } else {
            echo '<script>alert("gagal.")</script>';
        }
    }
    ?>

    <!-- JavaScript Bundle with Popper -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
</body>

</html>