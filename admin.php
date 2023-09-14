<?php
session_start();
include "function.php";
$anggotas = query("SELECT * FROM pendaftaran");
if(!isset($_SESSION['username'])){
  header("location: Login.php");
} 

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Halaman | Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

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
  <i class="bi bi-list mobile-nav-toggle d-lg-none"></i>
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex flex-column justify-content-center">

    <nav id="navbar" class="navbar nav-menu">
      <ul>
        <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
        <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Profile</span></a></li>
        <li><a href="#daftar" class="nav-link scrollto"><i class="bx bx-file-blank"></i> <span>Histori Daftar</span></a>
        </li>
        <li><a href="#absen" class="nav-link scrollto"><i class="bx bx-book-content"></i> <span>Histori Absen</span></a>
        </li>
      </ul>
    </nav><!-- .nav-menu -->

  </header><!-- Akhir Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container" data-aos="zoom-in" data-aos-delay="100">
      <h1>Selamat Datang</h1>
      <p>Di <span class="typed" data-typed-items="Badminton Nekat"></span></p>
      <div class="social-links">
        <a href="https://wa.me/628996982837" target="_blank" class="linkedin"><i class="bx bxl-whatsapp"></i></a>
        <a href="https://www.instagram.com/badminton_nekat" target="_blank" class="instagram"><i
            class="bx bxl-instagram"></i></a>
        <a href="https://www.youtube.com/@Badminton_Nekat" target="_blank" class="youtube"><i
            class="bx bxl-youtube"></i></a>
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
        <section class="vh-100" style="">
          <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col-md-12 col-xl-4">

                <div style="width:450px;" class="card" style="border-radius: px;">
                  <div class="card-body text-center">
                    <div class="mt-3 mb-4">
                      <img style="height:320px;" src="https://clipartspub.com/images/manager-clipart-cartoon-5.png"
                        class="rounded-circle img-fluid" style="width: 500px;" />
                    </div>

                    <h4 class="mb-2">
                      <?php echo $_SESSION['username']; ?>
                    </h4>
                    <p class="text-muted mb-4">ADMIN<br>
                      <a href="Login.php"><small style="color:red;">LOG-OUT</small></a>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </section>

    </section><!-- Akhir About Section -->

    <!-- ======= Daftar Section ======= -->
    <section id="daftar" class="resume">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Data Daftar</h2>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card my-4">
              <div class="card-body">
                <div>
                  <h3>Data Pendaftaran</h3>
                </div>
                <table id="example" class="table table-striped" style="width:100%">
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
                    <?php foreach ($anggotas as $anggota): ?>
                      <tr>
                        <td>
                          <?= $i; ?>
                        </td>
                        <td>
                          <?= $anggota["nis"]; ?>
                        </td>
                        <td>
                          <?= $anggota["nama"]; ?>
                        </td>
                        <td>
                          <?= $anggota["kelas"]; ?>
                        </td>
                        <td>
                          <?= $anggota["tempat"]; ?>
                        </td>
                        <td>
                          <?= $anggota["tanggal"]; ?>
                        </td>
                        <td>
                          <?= $anggota["jenis_kelamin"]; ?>
                        </td>
                        <td>
                          <?= $anggota["phone"]; ?>
                        </td>
                        <td>
                          <?= $anggota["email"]; ?>
                        </td>
                        <td>
                          <?= $anggota["alamat"]; ?>
                        </td>
                        <td>
                          <a href="ubah" class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#modalUbah"><i class="fa fa-pen"></i></a>
                          <a href="hapus.php?id=<?= $anggota["id"]; ?>" onclick="return confirm('Data akan dihapus?');"
                            class="btn btn-light"><i class="fa fa-trash"></i></a>
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

                      <section id="ubah" >
                      <div class="modal fade modal-lg" id="modalUbah" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h1 class="modal-title fs-5" id="staticBackdropLabel">Ubah Data Anggota</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <form action="edit1.php" method="POST" class="user">
                              <div class="modal-body">

                                <div class="py-3">
                                  <h3 class="text-center">FORM PENDAFTARAN</h3>
                                </div>

                                <div class="alert alert-primary" role="alert">
                                  <center><strong>DATA DIRI</strong></center>
                                </div>

                                <div class="row p-4">
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <input type="hidden" name="id" value="<?= $anggota["id"]; ?>"
                                        class="form-control form-control-user" required>
                                    </div>
                                  </div>
                                </div>

                                <div class="row p-4">
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="nis" class="form-label">NIS :</label>
                                      <input type="number" name="nis" id="nis" value="<?= $anggota["nis"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter nis" required>
                                    </div>
                                  </div>

                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="" class="form-label">Jenis Kelamin :</label><br>
                                      <label for="male" class="form-check-label">Laki-laki</label>
                                      <input type="radio" name="jenis_kelamin" id="male" value="laki-laki"
                                        class="form-check-input" required <?php
                                        if ($anggota["jenis_kelamin"] == "laki-laki") {
                                          echo "checked";
                                        }
                                        ?>>
                                      <label for="female" class="form-check-label">Perempuan</label>
                                      <input type="radio" name="jenis_kelamin" id="female" value="perempuan"
                                        class="form-check-input" required <?php
                                        if ($anggota["jenis_kelamin"] == "perempuan") {
                                          echo "checked";
                                        }
                                        ?>>
                                    </div>
                                  </div>
                                </div>

                                <div class="row p-4">
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="name" class="form-label">Nama :</label>
                                      <input type="text" name="nama" id="name" value="<?= $anggota["nama"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter nama" required>
                                    </div>
                                  </div>

                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="phone" class="form-label">Phone :</label>
                                      <input type="number" name="phone" id="phone" value="<?= $anggota["phone"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter phone" required>
                                    </div>
                                  </div>
                                </div>

                                <div class="row p-4">
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="class" class="form-label">Kelas :</label>
                                      <select name="kelas" id="class" class="form-control form-control-user" required>
                                        <option value="<?= $anggota["kelas"]; ?>"><?= $anggota["kelas"]; ?></option>
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
                                      <input type="email" name="email" id="email" value="<?= $anggota["email"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter email" required>
                                    </div>
                                  </div>
                                </div>

                                <div class="row p-4">
                                  <div class="col-lg-3">
                                    <div class="form-group">
                                      <label for="place" class="form-label">Tempat Lahir :</label>
                                      <input type="text" name="tempat" id="place" value="<?= $anggota["tempat"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter tempat" required>
                                    </div>
                                  </div>

                                  <div class="col-lg-3">
                                    <div class="form-group">
                                      <label for="date" class="form-label">Tanggal lahir :</label>
                                      <input type="date" name="tanggal" id="date" value="<?= $anggota["tanggal"]; ?>"
                                        class="form-control form-control-user" placeholder="Enter ttl" required>
                                    </div>
                                  </div>

                                  <div class="col-lg-6">
                                    <div class="form-group">
                                      <label for="address" class="form-label">Alamat :</label>
                                      <textarea name="alamat" id="address" cols="5" rows="3"
                                        class="form-control form-control-user" placeholder="Enter alamat"
                                        required><?= $anggota["alamat"]; ?></textarea>
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
                      </section>

   


      <!-- ======= Absen Section ======= -->
      <section id="absen" class="portfolio section-bg">
        <div class="container" data-aos="fade-up">

          <div class="section-title">
            <h2>Pengabsenan</h2>
          </div>

          <!-- Akhir Absen Section -->

          <!-- ======= Informasi Section ======= -->
          <section id="services" class="services">
            <div class="container" data-aos="fade-up">

              <div class="section-title">
                <h2>Informasi</h2>
                <ul>
                  <li>Ini adalah halaman admin</li>
                  <li>Admin dapat mengecek data absen maupun pendaftaran</li>
                  <li>Admin juga dapat menghapus/mengedit data yang tidak sesuai dengan kebenaran</li>
                </ul>
              </div>

              <div class="row">

                <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">

                </div>
              </div>

              <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in"
                data-aos-delay="200">

              </div>

              <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in"
                data-aos-delay="300">

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
                        <h4>Ceo &amp; Coach</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus.
                          Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Degia</h3>
                      <h4>Ketua</h4>
                      <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram
                        malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                      </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Zahra F</h3>
                      <h4>Wakil Ketua</h4>
                        <p>
                          <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                          Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis
                          minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                          <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>
                  </div><!-- Akhir Struktur item -->


                  <div class="swiper-slide">
                    <div class="testimonial-item">
                      <img src="" class="testimonial-img" alt="">
                      <h3>Bendahara</h3>
                      <h4>Sinta A</h4>
                      <p>
                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                        Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim
                        culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum
                        quid.
                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                      </p>
                    </div>
                  </div><!-- Akhir Struktur item -->

                </div>
                <div class="swiper-pagination"></div>
              </div>

            </div>
          </section><!-- Akhir Struktur Section -->

          <!-- ======= Contact Section ======= -->
          <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">

              <div class="section-title">
                <h2>Contact</h2>
              </div>

              <div class="row mt-1">

                <div class="col-lg-4">
                  <div class="info">
                    <div class="address">
                      <i class="bi bi-geo-alt"></i>
                      <h4>Location:</h4>
                      <p>Soreang Resident</p>
                    </div>

                    <div class="email">
                      <i class="bi bi-envelope"></i>
                      <h4>Email:</h4>
                      <p>info@example.com</p>
                    </div>

                    <div class="phone">
                      <i class="bi bi-phone"></i>
                      <h4>Wa:</h4>
                      <p>08996982837</p>
                    </div>

                  </div>

                </div>

                <div class="col-lg-8 mt-5 mt-lg-0">

                  <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                    <div class="row">
                      <div class="col-md-6 form-group">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                      </div>
                      <div class="col-md-6 form-group mt-3 mt-md-0">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email"
                          required>
                      </div>
                    </div>
                    <div class="form-group mt-3">
                      <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject"
                        required>
                    </div>
                    <div class="form-group mt-3">
                      <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                    </div>
                    <div class="my-3">
                      <div class="loading">Loading</div>
                      <div class="error-message"></div>
                      <div class="sent-message">Your message has been sent. Thank you!</div>
                    </div>
                    <div class="text-center"><button type="submit">Send Message</button></div>
                  </form>

                </div>

              </div>

            </div>
          </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <hr size="10">
    <div class="container">
      <p>Info Lebih Lanjut</p>
      <div class="social-links mt-4">
        <a href="https://wa.me/628996982837" class="linkedin"><i class="bx bxl-whatsapp"></i></a>
        <a href="https://www.instagram.com/badminton_nekat" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="youtube"><i class="bx bxl-youtube"></i></a>
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
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

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