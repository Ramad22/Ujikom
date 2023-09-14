<?php
session_start();
include "function.php";
if (!isset($_SESSION['min'])) {
  header('location: Login.php');
}
?>
<?php
//koneksi ke db melalui file function
$anggotas = query("SELECT * FROM pendaftaran");
//mengambil data dari tabel
$daftars = query("SELECT * FROM pendaftaran");

//mengambil data dari tabel
$absens = query("SELECT * FROM absen");

// Get data from database
$query = "SELECT DATE_FORMAT(tanggal_daftar, '%Y-%m') AS month, COUNT(*) AS count FROM pendaftaran GROUP BY month";
$result = $conn->query($query);

// Prepare data for chart
$labels = [];
$data = [];

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    array_push($labels, $row["month"]);
    array_push($data, $row["count"]);
  }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Halaman | Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="shortcut icon" href="Icon.PNG" type="image/x-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- link bootstrap online -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.bootstrap5.min.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>

  <i class="bi bi-list mobile-nav-toggle d-lg-none"></i>
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex flex-column justify-content-center">

    <nav id="navbar" class="navbar nav-menu">
      <ul>
        <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
        <li><a href="#Profile" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Profile</span></a></li>
        <li><a href="#pendaftar" class="nav-link scrollto"><i class="bx bx-file-blank"></i> <span> Histori Daftar</span></a></li>
        <li><a href="#Absen" class="nav-link scrollto"><i class="bi bi-journal"></i> <span>Histori Absen</span></a></li>
        <li><a href="#Grafik" class="nav-link scrollto"><i class="bi bi-bar-chart"></i> <span>Grafik</span></a></li>
      </ul>
    </nav><!-- .nav-menu -->

  </header><!-- Akhir Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container" data-aos="zoom-in" data-aos-delay="100">
      <h2 style="text-transform:capitalize;">Selamat Datang <?php echo $_SESSION['min']; ?></h2>
      <p>Di <span class="typed" data-typed-items="Badminton Nekat"></span></p>
      <div class="social-links">
        <a href="https://wa.me/628996982837" target="_blank" class="linkedin"><i class="bx bxl-whatsapp"></i></a>
        <a href="https://www.instagram.com/badminton_nekat" target="_blank" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="https://www.youtube.com/@Badminton_Nekat" target="_blank" class="youtube"><i class="bx bxl-youtube"></i></a>
      </div>
    </div>
  </section><!-- Akhir Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="Profile" class="about">
      
        <div class="section-title">
          <h2>Profile</h2>
        </div>
        <section class="" style="">
            <div class="justify-content-center align-items-center h-0">
                <div style="width:px;" class="" style="border-radius: px;">
                  <div class="text-center">
                    <div class="mt-3 mb-4">
                      <img style="height:320px;" src="https://clipartspub.com/images/manager-clipart-cartoon-5.png"
                        class="rounded-circle img-fluid" style="width: 500px;" />
                    </div>
                    <h4 style="text-transform:capitalize;" class="mb-2">
                      <?php echo $_SESSION['min']; ?>
                    </h4>
                    <p class="text-muted mb-4">ADMIN<br>
                      <a href="keluar.php"><small style="color:red;">LOG-OUT</small></a>
                  </div>
                </div>

              </div>
            </div>
        </section>
    </section>
  <!-- Akhir About Section -->

    <!-- ======= Data Pendaftar Section ======= -->
    <section id="pendaftar" class="resume">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Data Pendaftar</h2>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-body">
                        <div>
                        </div>
                        <div class="table-responsive">
                        <table id="example" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nis</th>
                                    <th>Nama</th>
                                    <th>Kelas</th>
                                    <th>Tempat</th>
                                    <th>Tanggal</th>
                                    <th>JKelamin</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Alamat</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1; ?>
                                <?php foreach ($daftars as $daftar): ?>
                                      <tr>
                                          <td><?= $i; ?></td>
                                          <td><?= $daftar["nis"]; ?></td>
                                          <td><?= $daftar["nama"]; ?></td>
                                          <td><?= $daftar["kelas"]; ?></td>
                                          <td><?= $daftar["tempat"]; ?></td>
                                          <td><?= $daftar["tanggal"]; ?></td>
                                          <td><?= $daftar["jenis_kelamin"]; ?></td>
                                          <td><?= $daftar["phone"]; ?></td>
                                          <td><?= $daftar["email"]; ?></td>
                                          <td><?= $daftar["alamat"]; ?></td>
                                          <td>
                                              <a href="#" class="btn btn-light" data-bs-toggle="modal" onclick="modal('<?= $daftar['id']; ?>','<?= $daftar['nis']; ?>','<?= $daftar['nama']; ?>','<?= $daftar['kelas']; ?>','<?= $daftar['tempat']; ?>','<?= $daftar['tanggal']; ?>','<?= $daftar['jenis_kelamin']; ?>','<?= $daftar['phone']; ?>','<?= $daftar['email']; ?>','<?= $daftar['alamat']; ?>')" data-bs-target="#modalUbah"><i class="fa fa-pen"></i></a>
                                              <a href="hapus.php?id=<?= $daftar["id"]; ?>" onclick="return confirm('Data akan dihapus?');" class="btn btn-light"><i class="fa fa-trash"></i></a>
                                          </td>
                                      </tr>

                                      <?php $i++; ?>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>No.</th>
                                    <th>Nis</th>
                                    <th>Nama</th>
                                    <th>Kelas</th>
                                    <th>Tempat</th>
                                    <th>Tanggal</th>
                                    <th>JKelamin</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Alamat</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                        </table>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

      </div>
    </section><!-- Akhir Data Pendaftar Section -->

    <script>
        function modal(id, nis, nama, kelas, tempat, tanggal, kelamin, phone, email, alamat){
            $("#id").val(id);
            $("#nis").val(nis);
            $("#name").val(nama);
            $("#class").val(kelas);
            $("#place").val(tempat);
            $("#date").val(tanggal);
            $("#phone").val(phone);
            $("#email").val(email);
            $("#address").val(alamat);
        }
    </script>
                               <!-- Modal -->
      <div class="modal fade modal-lg" id="modalUbah" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Ubah Data Anggota</h1>
                                                </div>

                                                <form action="edit1.php" method="POST" class="user">
                                                    <div class="modal-body">

                                                        <div class="alert alert-primary" role="alert">
                                                            <center><strong>DATA DIRI</strong></center>
                                                        </div>

                                                        <div class="row p-4">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <input type="hidden" name="id" value="<?= $daftar["id"]; ?>" class="form-control form-control-user" required>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row p-4">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="nis" class="form-label">NIS :</label>
                                                                    <input type="number" name="nis" id="nis" value="<?= $daftar["nis"]; ?>" class="form-control form-control-user" placeholder="Enter nis" required>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="" class="form-label">Jenis Kelamin :</label><br>
                                                                    <label for="male" class="form-check-label">Laki-laki</label>
                                                                    <input type="radio" name="jenis_kelamin" id="male" value="laki-laki" class="form-check-input" required <?php if ($daftar["jenis_kelamin"] == "laki-laki") {
                                                                      echo "checked";
                                                                    } ?>>
                                                                    <label for="female" class="form-check-label">Perempuan</label>
                                                                    <input type="radio" name="jenis_kelamin" id="female" value="perempuan" class="form-check-input" required <?php if ($daftar["jenis_kelamin"] == "perempuan") {
                                                                      echo "checked";
                                                                    } ?>>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row p-4">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="name" class="form-label">Nama :</label>
                                                                    <input type="text" name="nama" id="name" value="<?= $daftar["nama"]; ?>" class="form-control form-control-user" placeholder="Enter nama" required>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="phone" class="form-label">Phone :</label>
                                                                    <input type="number" name="phone" id="phone" value="<?= $daftar["phone"]; ?>" class="form-control form-control-user" placeholder="Enter phone" required>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row p-4">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="class" class="form-label">Kelas :</label>
                                                                    <select name="kelas" id="class" class="form-control form-control-user" required>
                                                                        <option value="<?= $daftar["kelas"]; ?>"><?= $daftar["kelas"]; ?></option>
                                                                        <option value="XII-Elektro-1">XII-Elektro-1</option>
                                                                        <option value="XII-Elektro-2">XII-Elektro-2</option>
                                                                        <option value="XII-Elektro-3">XII-Elektro-3</option>
                                                                        <option value="XII-Elektro-4">XII-Elektro-4</option>
                                                                        <option value="XII-Mekatronika-1">XII-Mekatronika-1</option>
                                                                        <option value="XII-Mekatronika-2">XII-Mekatronika-2</option>
                                                                        <option value="XII-Otomotif-1">XII-Otomotif-1</option>
                                                                        <option value="XII-Otomotif-2">XII-Otomotif-2</option>
                                                                        <option value="XII-Mesin-1">XII-Mesin-1</option>
                                                                        <option value="XII-Mesin-2">XII-Mesin-2</option>
                                                                        <option value="XII-Tekstil-1">XII-Tekstil-1</option>
                                                                        <option value="XII-Tekstil-2">XII-Tekstil-2</option>
                                                                        <option value="XII-TKJ-1">XII-TKJ-1</option>
                                                                        <option value="XII-TKJ-2">XII-TKJ-2</option>
                                                                        <option value="XII-RPL-1">XII-RPL-1</option>
                                                                        <option value="XII-RPL-2">XII-RPL-2</option>
                                                                        <option value="XII-MM-1">XII-MM-1</option>
                                                                        <option value="XII-MM-2">XII-MM-2</option>
                                                                        <option value="XI-Elektro-1">XI-Elektro-1</option>
                                                                        <option value="XI-Elektro-2">XI-Elektro-2</option>
                                                                        <option value="XI-Elektro-3">XI-Elektro-3</option>
                                                                        <option value="XI-Elektro-4">XI-Elektro-4</option>
                                                                        <option value="XI-Mekatronika-1">XI-Mekatronika-1</option>
                                                                        <option value="XI-Mekatronika-2">XI-Mekatronika-2</option>
                                                                        <option value="XI-Otomotif-1">XI-Otomotif-1</option>
                                                                        <option value="XI-Otomotif-2">XI-Otomotif-2</option>
                                                                        <option value="XI-Mesin-1">XI-Mesin-1</option>
                                                                        <option value="XI-Mesin-2">XI-Mesin-2</option>
                                                                        <option value="XI-Tekstil-1">XI-Tekstil-1</option>
                                                                        <option value="XI-Tekstil-2">XI-Tekstil-2</option>
                                                                        <option value="XI-TKJ-1">XI-TKJ-1</option>
                                                                        <option value="XI-TKJ-2">XI-TKJ-2</option>
                                                                        <option value="XI-RPL-1">XI-RPL-1</option>
                                                                        <option value="XI-RPL-2">XI-RPL-2</option>
                                                                        <option value="XI-BP-1">XI-BP-1</option>
                                                                        <option value="XI-BP-2">XI-BP-2</option>
                                                                        <option value="X-Elektro-1">X-Elektro-1</option>
                                                                        <option value="X-Elektro-2">X-Elektro-2</option>
                                                                        <option value="X-Elektro-3">X-Elektro-3</option>
                                                                        <option value="X-Elektro-4">X-Elektro-4</option>
                                                                        <option value="X-Mekatronika-1">X-Mekatronika-1</option>
                                                                        <option value="X-Mekatronika-2">X-Mekatronika-2</option>
                                                                        <option value="X-Otomotif-1">X-Otomotif-1</option>
                                                                        <option value="X-Otomotif-2">X-Otomotif-2</option>
                                                                        <option value="X-Mesin-1">X-Mesin-1</option>
                                                                        <option value="X-Mesin-2">X-Mesin-2</option>
                                                                        <option value="X-Tekstil-1">X-Tekstil-1</option>
                                                                        <option value="X-Tekstil-2">X-Tekstil-2</option>
                                                                        <option value="X-TKJ-1">X-TKJ-1</option>
                                                                        <option value="X-TKJ-2">X-TKJ-2</option>
                                                                        <option value="X-PPLG-1">X-PPLG-1</option>
                                                                        <option value="X-PPLG-2">X-PPLG-2</option>
                                                                        <option value="X-BP-1">X-BP-1</option>
                                                                        <option value="X-BP-2">X-BP-2</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="email" class="form-label">Email :</label>
                                                                    <input type="email" name="email" id="email" value="<?= $daftar["email"]; ?>" class="form-control form-control-user" placeholder="Enter email" required>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row p-4">
                                                            <div class="col-lg-3">
                                                                <div class="form-group">
                                                                    <label for="place" class="form-label">Tempat Lahir :</label>
                                                                    <input type="text" name="tempat" id="place" value="<?= $daftar["tempat"]; ?>" class="form-control form-control-user" placeholder="Enter tempat" required>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3">
                                                                <div class="form-group">
                                                                    <label for="date" class="form-label">Tanggal lahir :</label>
                                                                    <input type="date" name="tanggal" id="date" value="<?= $daftar["tanggal"]; ?>" class="form-control form-control-user" placeholder="Enter ttl" required>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="address" class="form-label">Alamat :</label>
                                                                    <textarea name="alamat" id="address" cols="5" rows="3" class="form-control form-control-user" placeholder="Enter alamat" required><?= $daftar["alamat"]; ?></textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="alert alert-warning" role="alert">
                                                            <input type="checkbox" name="checkbox" required>
                                                            <label for=""><strong>Data yang diisikan di atas sudah benar</strong></label>
                                                        </div>

                                                    </div>


                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCEL</button>
                                                        <button type="submit" class="btn btn-primary" name="submit">UPDATE</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                  

    <!-- ======= Absen Section ======= -->
    <section id="Absen" class="portfolio section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Data Absen</h2>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-body">
                        <div>
                        </div>
                        <div class="table-responsive">
                        <table id="absen" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama</th>
                                    <th>Jenis-kelamin</th>
                                    <th>Kelas</th>
                                    <th>Tanggal</th>
                                    <th>Keterangan</th>
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($absens as $absen): ?>
                                      <tr>
                                          <td><?= $absen["no"]; ?></td>
                                          <td><?= $absen["nama"]; ?></td>
                                          <td><?= $absen["jenis_kelamin"]; ?></td>
                                          <td><?= $absen["kelas"]; ?></td>
                                          <td><?= $absen["tgl"]; ?></td>
                                          <td><?= $absen["keterangan"]; ?></td>
                                          <td>
                                              <a id="aUbah" data-toggle="modal" data-target="#ubahModal" data-no="<?= $absen['no']; ?>" data-nama="<?= $absen['nama']; ?>" data-jenis_kelamin="<?= $absen['jenis_kelamin']; ?>" data-kelas="<?= $absen['kelas']; ?>" data-tgl="<?= $absen['tgl']; ?>" data-keterangan="<?= $absen['keterangan']; ?>"><i class="fa fa-pen"></i></a>
                                              <a href="Hapus1.php?no=<?= $absen['no']; ?>" class="btn btn-ligth"><i class="fa fa-trash" onclick="return confirm('Admin Yakin ?');"></i>
                                          </td>
                                      </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama</th>
                                    <th>Jenis-kelamin</th>
                                    <th>Kelas</th>
                                    <th>Tanggal</th>
                                    <th>Keterangan</th>
                                    <th>Option</th>
                                </tr>
                            </tfoot>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Bismillah-->
    <!-- Modal -->
    <div class="modal fade" id="ubahModal" tabindex="-1" aria-labelledby="ubahModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary">
                    <h3 class="modal-title fs-5" id="ubahModalLabel">Update Data Anggota Eskul</h3>

                </div>
                <div class="modal-body">

                    <div class="container mt-3">
                        <form action="Edit.php" method="POST">
                            <input type="hidden" name="no" id="no">
                            <div class="container-border">
                                <div class="">
                                    <div class="col-sm-0">
                                        <label for=""><b> NAMA : </b></label>
                                        <input type="text" class="form-control" name="nama" id="nama" required>
                                    </div><br>

                                    <div class="col-sm-0 mt-0">
                                        <label class="mt-3" for=""><b>JENIS KELAMIN : </b></label>
                                        <select class="form-select" aria-label="Default select example" name="jenis_kelamin" id="jenis_kelamin">
                                            <option></option>
                                            <option value="Pria">Pria</option>
                                            <option value="Wanita">Wanita</option>
                                    </div>
                                    </select>
                                </div><br>

                                <div class="">
                                    <div class="col-sm-0">
                                        <label for=""><b>KELAS : </b></label>
                                        <select class="form-select" aria-label="Default select example" name="kelas" id="kelas">
                                        <option value="<?= $absen["kelas"]; ?>"><?= $absen["kelas"]; ?></option>
                                            <option value="X-PPLG1">X-PPLG1</option>
                                            <option value="X-PPLG2">X-PPLG2</option>
                                            <option value="X-BP1">X-BP1</option>
                                            <option value="X-BP2">X-BP2</option>
                                            <option value="X-TJKT1">X-TJKT1</option>
                                            <option value="X-TJKT2">X-TJKT2</option>
                                            <option value="X-E1">X-E1</option>
                                            <option value="X-2">X-E2</option>
                                            <option value="X-3">X-E3</option>
                                            <option value="X-TKR1">X-TKR1</option>
                                            <option value="X-TKR2">X-TKR2</option>
                                            <option value="X-M1">X-M1</option>
                                            <option value="X-M2">X-M2</option>
                                            <option value="XI-RPL1">XI-RPL1</option>
                                            <option value="XI-RPL2">XI-RPL2</option>
                                            <option value="XI-BP1">XI-BP1</option>
                                            <option value="XI-BP2">XI-BP2</option>
                                            <option value="XI-TJKT1">XI-TJKT1</option>
                                            <option value="XI-TJKT2">XI-TJKT2</option>
                                            <option value="XI-E1">XI-E1</option>
                                            <option value="XI-E2">XI-E2</option>
                                            <option value="XI-E3">XI-E3</option>
                                            <option value="XI-TKR1">XI-TKR1</option>
                                            <option value="XI-TKR2">XI-TKR2</option>
                                            <option value="XI-M1">XI-M1</option>
                                            <option value="XI-2">XI-M2</option>
                                            <option value="XII-RPL1">XII-RPL1</option>
                                            <option value="XII-RPL2">XII-RPL2</option>
                                            <option value="XII-BP1">XII-BP1</option>
                                            <option value="XII-BP2">XII-BP2</option>
                                            <option value="XII-TJKT1">XII-TJKT1</option>
                                            <option value="XII-TJKT2">XII-TJKT2</option>
                                            <option value="XII-E1">XII-E1</option>
                                            <option value="XII-E2">XII-E2</option>
                                            <option value="XII-E3">XII-E3</option>
                                            <option value="XII-TKR1">XII-TKR1</option>
                                            <option value="XII-TKR2">XII-TKR2</option>
                                            <option value="XII-M1">XII-M1</option>
                                            <option value="XII-M2">XII-M2</option>
                                        </select>

                                    </div>
                                    <div class="col-sm-0">
                                        <label for=""><b> TANGGAL : </b></label>
                                        <input type="text" class="form-control" name="tgl" id="tgl" required>
                                    </div><br>


                                    <div class="col-sm-0">
                                        <label for=""><B>KETERANGAN : </B></label>
                                        <select class="form-select" aria-label="Default select example" name="keterangan" id="keterangan" required>
                                            <option></option>
                                            <option value="HADIR">HADIR</option>
                                            <option value="SAKIT">SAKIT</option>
                                            <option value="IZIN">IZIN</option>
                                        </select>
                                    </div>
                                </div><br>
                            </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                    <button type="submit" name="ubah" class="btn btn-primary">Save</button>
                </div>

      </div>
    </section><!-- Akhir Absen Section -->

    <!-- ======= Informasi Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Informasi</h2>
         <ul class="text-center">
            <li>Ini adalah halaman admin</li>
            <li>Admin dapat mengecek data absen maupun pendaftaran</li>
             <li>Admin juga dapat menghapus/mengedit data yang tidak sesuai dengan kebenaran</li>
          </ul>
         </ul>
         
        </div>

      </div>
    </section><!-- Akhir Informasi Section -->

    <!-- ======= Grafik Section ======= -->
    <section id="Grafik" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Grafik</h2>
        </div>

        <div class="card">
          <div class="card-body"><canvas id="myChart"></canvas></div>
          <div class="row d-flex justify-content-center align-items-center h-100">
        </div>
        
        <script>
        
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: <?= json_encode($labels); ?>,
            datasets: [{
              label: 'Data Pendaftar',
              data: <?php echo json_encode($data); ?>,
              backgroundColor: [
                'rgb(75, 192, 192)'
              ],
              borderColor: [
                'rgb(75, 192, 192)'
              ],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
        </script>

      </div>
      </div>
    </section><!-- Akhir Grafik Section -->

    <!-- ======= Struktur Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Struktur</h2>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                <div class="swiper-wrapper">

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Ivan</h3>
                        <h4>Coach</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Jadikan sehat sebagai tujuan olahraga, jangan jadikan gaya-gayaan.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Febby Septian</h3>
                      <h4>XI-E-2</h4>
                      <h4>Ketua</h4>
                     
                      <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        Setelah rutin berolahraga, hal tersulit adalah menghentikannya.
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                      </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>M Rizwan</h3>
                      <h4>XI-BP-2</h4>
                      <h4>Wakil Ketua</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Selain menyegarkan tubuh, berolahraga juga dapat menyegarkan pikiran.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div>

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Emmysa Zulfa</h3>
                      <h4>XI-T-1</h4>
                      <h4>Sekertaris 1</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Satu-satunya olahraga yang buruk adalah yang tidak dilakukan.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div>

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Raiysha Ainun</h3>
                      <h4>XI-T-1</h4>
                      <h4>Sekertaris 2</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Seseorang yang lebih sibuk darimu sedang berolahraga sekarang.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div>

                  <!-- Akhir Struktur item -->

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Nessya Salsabila</h3>
                      <h4>XI-TJKT-1</h4>
                      <h4>Bendahara</h4>
                      <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        Kesehatan adalah anugerah terbesar, kepuasan adalah kekayaan terbesar, dan kesetiaan adalah hubungan yang terbaik.  
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                      </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                </div>
                <div class="swiper-pagination"></div>
              </div>

            </div>
          </section>
       <!-- Akhir Struktur Section -->

  </main><!-- Akhir #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <p class="my-2">Info Lebih Lanjut</p>
      <div class="social-links">
        <a href="https://wa.me/628996982837" class="linkedin"><i class="bx bxl-whatsapp"></i></a>
        <a href="https://www.instagram.com/badminton_nekat" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="https://www.youtube.com/@Badminton_Nekat" class="youtube"><i class="bx bxl-youtube"></i></a>
      </div>
      <div class="copyright">
        &copy;<strong><span>2023</span></strong>
      </div>
      <div class="credits">
        by <strong><span>Gilang & Malik</span></strong>
      </div>
    </div>
  </footer><!-- Akhir Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

  <!-- link bootstrap-js online -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.bootstrap5.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.colVis.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/206142bfe3.js" crossorigin="anonymous"></script>

  <script>
    $(document).on("click", "#aUbah", function() {
      let no = $(this).data('no');
      let nama = $(this).data('nama');
      let jenis_kelamin = $(this).data('jenis_kelamin');
      let kelas = $(this).data('kelas');
      let tgl = $(this).data('tgl');
      let keterangan = $(this).data('keterangan');

      $("#no").val(no);
      $(".modal-body #nama").val(nama);
      $(".modal-body #jenis_kelamin").val(jenis_kelamin);
      $(".modal-body #kelas").val(kelas);
      $(".modal-body #tgl").val(tgl);
      $(".modal-body #keterangan").val(keterangan);

    });

    $(document).ready(function() {
      var table = $('#absen').DataTable({
        buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
      });

      table.buttons().container()
        .appendTo('#absen_wrapper .col-md-6:eq(0)');
    });

    $(document).ready(function() {
      var table = $('#example').DataTable({
        buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
      });

      table.buttons().container()
        .appendTo('#example_wrapper .col-md-6:eq(0)');
    });
  </script>

</body>

</html>