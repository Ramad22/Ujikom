<?php

//koneksi ke database
$host = "localhost";
$username = "root";
$password = "";
$database = "korban";

$conn = mysqli_connect($host,$username,$password,$database) or die ("connection failed");

function query($query){
    global $conn;
    $result = mysqli_query($conn, $query);
    $rows = [];
    while( $row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }
    return $rows;
}

function queri($queri){
    global $conn;
    $result = mysqli_query($conn, $queri);
    $rows = [];
    while( $row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }
    return $rows;
}



// function upload(){
//     $namafile = $_FILES['gambar']['name'];
//     $ukuranfile = $_FILES['gambar']['size'];
//     $error = $_FILES['gambar']['error'];
//     $tmpName = $_FILES['gambar']['tmp_name'];

//     //cek apakah tidak ada gambar yang diupload
//     if($error === 4){
//         echo "<script>
//         alert('pilih gambar terlebih dahulu');
//         </script>";
//         return false;
//     }

//     //cek apakah yang diupload adalah gambar
//     $ekstensigambarvalid = ['jpg', 'jpeg', 'png'];
//     $ekstensigambar = explode('.', $namafile);
//     $ekstensigambar = strtolower(end($ekstensigambar));
//     if(!in_array($ekstensigambar, $ekstensigambarvalid)){
//         echo "<script>
//         alert('yang anda upload bukan gambar');
//         </script>";
//         return false;
//     }

//     //cek jika ukuran gambar terlalu besar
//     if($ukuranfile > 1000000){
//         echo "<script>
//         alert('ukuran gambar terlalu besar');
//         </script>";
//         return false;
//     }

//     //lolos pengecekan, gambar siap diupload
//     //generate nama gambar baru
//     $namafilebaru = uniqid();
//     $namafilebaru .= '.';
//     $namafilebaru .= $ekstensigambar;
//     move_uploaded_file($tmpName, 'img/'. $namafilebaru);

//     return $namafilebaru;
// }

function hapus($id){
    global $conn;
    mysqli_query($conn, "DELETE FROM pendaftaran WHERE id = $id");
    return mysqli_affected_rows($conn);
}

function ubah($data){
    global $conn;
    //ambil data dari tiap elemen form
    $id = ($data["id"]);
    $nis = htmlspecialchars($data["nis"]);
    $nama = htmlspecialchars($data["nama"]);
    $kelas = htmlspecialchars($data["kelas"]);
    $tempat = htmlspecialchars($data["tempat"]);
    $tanggal = htmlspecialchars($data["tanggal"]);
    $jKelamin = htmlspecialchars($data["jenis_kelamin"]);
    $phone = htmlspecialchars($data["phone"]);
    $email = htmlspecialchars($data["email"]);
    $alamat = htmlspecialchars($data["alamat"]);

    //cek apakah user pilih gambar baru
    // if($_FILES['gambar']['error'] === 4){
    //     $gambar = $gambarlama;
    // }else{
    //     $gambar = upload();
    // }

    //query ubah data
    $query = "UPDATE pendaftaran SET nis = '$nis', nama = '$nama', kelas = '$kelas', tempat = '$tempat', tanggal = '$tanggal', jenis_kelamin = '$jKelamin', phone = '$phone', email = '$email', alamat = '$alamat' WHERE id = $id";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

// function cari($keyword){
//     $query = "SELECT * FROM mahasiswa WHERE nama LIKE '%$keyword%' OR nrp LIKE '%$keyword%'";
//     return query($query);
// }

// function registrasi($data){
//     global $conn;

//     $username = strtolower(stripslashes($data["username"]));
//     $password = mysqli_real_escape_string($conn, $data["password"]);
//     $password2 = mysqli_real_escape_string($conn, $data["password2"]);

//     //cek apakah username sudah ada atau tidak
//     $result = mysqli_query($conn, "SELECT username FROM users WHERE username = '$username'");

//     if(mysqli_fetch_assoc($result)){
//         echo "<script>
//         alert('Username sudah ada');
//         </script>";
//         return false;
//     }

//     //cek konfirmasi password
//     if($password !== $password2){
//         echo "<script>
//         alert('Password tidak sesuai');
//         </script>";
//         return false;
//     }

//     //enkripsi password
//     $password = password_hash($password2, PASSWORD_DEFAULT);

//     //insert ke database
//     mysqli_query($conn, "INSERT INTO users VALUES('', '$username', '$password')");

//     return mysqli_affected_rows($conn);
// }

?>