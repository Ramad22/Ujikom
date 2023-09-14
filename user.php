<?php
session_start();
include "function.php";
if(!isset($_SESSION['ta'])){
  header("location: Login.php");
  exit;
}  
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Halaman | User</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link rel="stylesheet" href="stel.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">

  <!-- Favicons -->
  <link rel="shortcut icon" href="Icon.PNG" type="image/x-icon">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  

</head>

<body>

  <!-- ======= Mobile nav toggle button ======= -->
  <!-- <button type="button" class="mobile-nav-toggle d-xl-none"><i class="bi bi-list mobile-nav-toggle"></i></button> -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@"></script>
  <i class="bi bi-list mobile-nav-toggle d-lg-none"></i>
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex flex-column justify-content-center">

    <nav id="navbar" class="navbar nav-menu">
      <ul>
        
        <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
        <li><a href="#about" class="nav-link scrollto "><i class="bx bx-user"></i> <span>Profile</span></a></li>
        <li><a href="#daftar" class="nav-link scrollto"><i class="bi bi-person-plus-fill"></i> <span>Daftar</span></a></li>
        <li><a href="#absen" class="nav-link scrollto"><i class="bx bx-book-content"></i> <span>Absen</span></a></li>
      </ul>
    </nav><!-- .nav-menu -->

  </header><!-- Akhir Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container" data-aos="zoom-in" data-aos-delay="100">
      <h2 style="text-transform:capitalize;">Selamat Datang <?php echo $_SESSION['ta']; ?></h2>
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
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

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
                      <?php echo $_SESSION['ta']; ?>
                    </h4>
                    <p class="text-muted mb-4">ANGGOTA<br>
                      <a href="keluar.php"><small style="color:red;">LOG-OUT</small></a>
                  </div>
                </div>

              </div>
            </div>
        </section>
</section>
   

       <!-- ======= Daftar Section ======= -->
    <section id="daftar" class="resume">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Pendaftaran</h2>
        </div>

        <div class="row justify-content-center">
            <div class="col-10">
                <div class=" my-4">
                    <div class="">
                        <form action="daftar.php" method="POST">
                        <input type="hidden" name="date">
                            <div class="alert alert-primary" role="alert">
                                <center><strong>DATA DIRI</strong></center>
                            </div>
    
                            <div class="row p-4">
                                <div class="col-lg-6">
                                    <div class="form-group"> 
                                        <label for="nis" class="form-label">NIS :</label>
                                        <input type="number" name="nis" id="nis" class="form-control form-control-user" placeholder="Enter nis" required>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="" class="form-label">Jenis Kelamin :</label><br>
                                        <label for="male" class="form-check-label">Laki-laki</label>
                                        <input type="radio" name="jenis_kelamin" id="male" value="Laki-Laki" class="form-check-input" required>
                                        <label for="female" class="form-check-label">Perempuan</label>
                                        <input type="radio" name="jenis_kelamin" id="female" value="Perempuan" class="form-check-input" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row p-4">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="name" class="form-label">Nama :</label>
                                        <input type="text" name="nama" id="name" class="form-control form-control-user" placeholder="Enter nama" required>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="phone" class="form-label">Phone :</label>
                                        <input type="number" name="phone" id="phone" class="form-control form-control-user" placeholder="Enter phone" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row p-4">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="class" class="form-label">Kelas :</label>
                                        <select name="kelas" id="class" class="form-control form-control-user" required>
                                            <option value="">---Kelas---</option>
                                            <option value="XII-Elektro-1">XII-Elektro-1</option>
                                            <option value="XII-Elektro-2">XII-Elektro-2</option>
                                            <option value="XII-Elektro-3">XII-Elektro-3</option>
                                            <option value="XII-Elektro-3">XII-Elektro-4</option>
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
                                        <input type="email" name="email" id="email" class="form-control form-control-user" placeholder="Enter email" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row p-4">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="place" class="form-label">Tempat Lahir :</label>
                                        <input type="text" name="tempat" id="place" class="form-control form-control-user" placeholder="Enter tempat" required>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="date" class="form-label">Tanggal lahir :</label>
                                        <input type="date" name="tanggal" id="date" class="form-control form-control-user" placeholder="Enter ttl" required>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="address" class="form-label">Alamat :</label>
                                        <textarea name="alamat" id="address" cols="5" rows="3" class="form-control form-control-user" placeholder="Enter alamat" required></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="alert alert-warning" role="alert">
                                <input type="checkbox" name="checkbox" required>
                                <label for=""><strong>Data yang diisikan di atas sudah benar</strong></label>
                            </div>

                            <div class="row justify-content-center p-3">
                                <div class="col-lg-6 d-grid gap-2">
                                    <button type="submit" name="daftar" class="btn btn-primary btn-lg btn-block">
                                        DAFTAR
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>     
            </div>
        </div>

      </div>
    </section><!-- Akhir Daftar Section -->

    <!-- ======= Absen Section ======= -->
    <section id="absen" class="portfolio section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Pengabsenan</h2>
        </div>

        <form action="" method="POST">
          <input type="hidden" name="no">
          <div class="container-border">
            <div class="row">
              <div class="col-sm-5">
                <label for=""><b> NAMA : </b></label>
               <select name="nama" id="nama" class="form-select" aria-label="default select example">
                <option value="">--Nama--</option>
               <?php
                $sql = mysqli_query($conn,"SELECT*FROM pendaftaran");
                while($row = mysqli_fetch_assoc($sql)):?>
                
                  <option value="<?=$row['nama'];?>"><?=$row['nama'];?></option>
                  <?php endwhile ; ?>
                  </select>
              </div><br>
    
              <div class="col-sm-5 mt-2">
                <label class="mt-3" for=""><b>JENIS KELAMIN : </b></label>
                <input class="" type="radio" value="Pria" name="jenis_kelamin" required><i>Pria</i></input>
                <input type="radio" value="Wanita" name="jenis_kelamin"><i>Wanita</i></input>
              </div>
            </div><br>
    
            <div class="row">
              <div class="col-sm-5">
                <label for=""><b>KELAS : </b></label>
                <select class="form-select" aria-label="Default select example" name="kelas">
                  <option value="">--Kelas--</option>
                <?php
                $sql = mysqli_query($conn,"SELECT*FROM pendaftaran");
                while($row = mysqli_fetch_assoc($sql)):?>
                  <option value="<?=$row['kelas'];?>"><?=$row['kelas'];?></option>
                  <?php endwhile ; ?>
                </select>
    
              </div>
    
    
              <div class="col-sm-5">
                <label for=""><B>KETERANGAN : </B></label>
                <select class="form-select" aria-label="Default select example" name="keterangan" required>
                  <option selected>--Pilih--</option>
                  <option value="HADIR">HADIR</option>
                  <option value="SAKIT">SAKIT</option>
                  <option value="IZIN">IZIN</option>
                </select>
              </div>
            </div><br>
            <button type="submit" name="submit" class="btn btn-primary">ABSEN</button><br>
          </div>
    
      </div>
      </form><br><br>
    
      <form action="" method="">
        <div class="container">
          <button style="float:right;" type="button"  class="btn btn-primary mt-1 h-30"><span
              class="fa fa-search"></span></button>
          <input style="float:right;" class="form-control w-25" type="text" placeholder="Search..."  id="myInput" autocomplete="off">
        </div>
      </form><br><br>
      </table>
</div>

    <div class="table-responsive">
        <table class="table table-striped table-hover ms-2 w-100">
          <tr>
            <thead class="thead-striped">
              <th>No</th>
              <th>Nama</th>
              <th>Jenis-Kelamin</th>
              <th>Kelas</th>
              <th>Tanggal</th>
              <th>Keterangan</th>
            </thead>
            <tbody id="myTable">
          </tr>
          
          
          <?php 
           
            $batas = 15;
            $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman']: 1;
            $halaman_awal = ($halaman> 1) ? ($halaman * $batas) - $batas: 0;
    
            $previuos = $halaman -1;
            $next = $halaman +1; 
    
            $query = mysqli_query($conn,"SELECT * FROM absen ORDER BY no ASC");
            $jumlah_data = mysqli_num_rows($query);
            $total_halaman= ceil($jumlah_data/$batas);
    
            $data_absen = mysqli_query($conn,"SELECT * FROM absen LIMIT $halaman_awal, $batas");
            $nomor= $halaman_awal+1;
          while($row = mysqli_fetch_assoc($data_absen)){ ?>
              <tr>
              <td><?php echo $row['no'];?></td>
              <td><?php echo $row['nama'] ?></td>
              <td><?php echo $row["jenis_kelamin"]?></td>
              <td><?php echo $row["kelas"]?></td>
              <td><?php echo $row["tgl"]?></td>
              <td><?php echo $row["keterangan"]?></td>
              </tr>
            <?php }?>
         
        </table>
    
            <nav class="mt-4 me-5" style="float:right;">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link"  <?php if($halaman > 1){ echo "href='?halaman=$previuos'"; } ?>><</a>
            </li>
            <?php 
            for($i=1;$i<=$total_halaman;$i++){
              ?> 
              <li class="page-item"><a class="page-link" href="?halaman=<?php echo $x ?>"><?php echo $i; ?></a></li>
              <?php
            }
            ?>				
            <li class="page-item">
              <a  class="page-link" <?php if($halaman < $total_halaman) { echo "href='?halaman=$next'"; } ?>>></a>
            </li>
          </ul>
        </nav>

      </div>
    </section><!-- Akhir Absen Section -->

    <!-- ======= Informasi Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Informasi</h2>
          <p>Mengenai Informasi Ada Hal-Hal Penting Yang Perlu Di Sampaikan Seperti : </p><br>
          <ul class="text-center">
            <li>Sebelum bergabung dalam anggota eskul diwajibkan untuk daftar terlebih dahulu di website resmi Badminton-Nekat.</li>
            <li>Membayar sebesar 35k untuk keperluan lapang dan registrasi.</li>
            <li>Jangan menggunkan sepatu dari rumah.</li>
            <li>Tidak eskul/alfa 5x di pertanyakan.</li>
            <li>Mempunyai perlengkapan eskul.</li>
            <li>Eskul setiap hari sabtu di gor JS.</li>
            <li>Harga 1 shuttlekok 5k</li>
            <b>Sekian dan Terimakasih.</b>
          </ul>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">

            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
          
    </section><!-- Akhir Informasi Section -->

    <!-- ======= Struktur Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Struktur Eskul</h2>
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
                  </div>
                  </div>
                <div class="swiper-pagination"></div>
              </div>

            </div>
          </section>
    </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <p class="my-2">Info Lebih Lanjut</p>
      <div class="social-links mt-4">
        <a href="https://wa.me/628996982837" class="linkedin"><i class="bx bxl-whatsapp"></i></a>
        <a href="https://www.instagram.com/badminton_nekat" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="https://www.youtube.com/@Badminton_Nekat" class="youtube"><i class="bx bxl-youtube"></i></a><br><br>
      <div class="copyright">
        &copy;<strong><span>2023</span></strong>
      </div>
      <div class="credits">
        by <strong><span>Gilang & Malik</span></strong>
      </div>
    </div>
    </div>
  </footer><!-- Akhir Footer --> 
  <!-- <button type="button" onclick="print();" class="btn btn-warning">PRINT</button> -->

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

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
      crossorigin="anonymous"></script>
    <!-- JS files: jQuery pertama, lalu Popper.js, selanjutnya Bootstrap JS, lalu Font Awesome JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/206142bfe3.js" crossorigin="anonymous"></script>
    <script src="./js/java.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
<?php


if (isset($_POST['submit'])) {
  $Nama =htmlspecialchars ($_POST['nama']);
  $Jenis_kelamin =htmlspecialchars ($_POST['jenis_kelamin']);
  $Kelas =htmlspecialchars ($_POST['kelas']);
  $Tgl = date("d-M-Y");
  $Keterangan =htmlspecialchars ($_POST['keterangan']);


  $query = mysqli_query($conn, "INSERT INTO absen VALUES ('','$Nama', '$Jenis_kelamin', '$Kelas','$Tgl', '$Keterangan')");

  if ($query) {
    ?>

    <script>
    swal({
  title: "Succes!",
  text: "Absen Badminton_Nekat Berhasil",
  icon: "success"
});
</script>
<?php echo "<meta http-equiv=\"refresh\" content=\"2;URL=user.php\">"; ?>
<?php
  }
   else {
    echo "<script>alert('Gagal')</script>";
   header('location : user.php');
   }
}
?>

<script>
  $(document).ready(function () {
      $("#myInput").on("keyup", function () {
          var value = $(this).val().toLowerCase();
          $("#myTable tr").filter(function () {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
          });
      });
  });
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
