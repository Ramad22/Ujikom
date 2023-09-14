-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 07:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `korban`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `no` int(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `tgl` varchar(20) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`no`, `nama`, `jenis_kelamin`, `kelas`, `tgl`, `keterangan`) VALUES
(1, 'Gilang', 'Pria', 'XI-TJKT1', 'Wed May 2023', 'IZIN'),
(2, 'bima', 'Pria', 'XI-TJKT1', 'Wed May 2023', 'IZIN'),
(3, 'Muhammad fazar', 'Pria', 'XI-RPL2', 'Wed May 2023', 'HADIR'),
(4, 'adnan P', 'Pria', 'X-E1', 'Wed May 2023', 'HADIR'),
(5, 'Dani', 'Pria', 'X-E1', 'Wed May 2023', 'HADIR'),
(7, 'Dian', 'Pria', 'XI-BP2', 'Mon May 2023', 'HADIR'),
(8, 'dappa', 'Pria', 'XI-BP2', 'Mon May 2023', 'HADIR'),
(9, 'Abas', 'Pria', 'X-BP2', 'Mon May 2023', 'HADIR'),
(10, 'Abas', 'Pria', 'X-BP2', 'Mon May 2023', 'HADIR'),
(12, 'Zio', 'Pria', 'X-BP1', 'Mon May 2023', 'HADIR'),
(14, 'Gr', 'Pria', 'X-BP2', 'Mon May 2023', 'HADIR'),
(17, 'Dian Ambar', 'Wanita', 'X-PPLG1', 'Mon May 2023', 'SAKIT'),
(18, 'Ramad', 'Pria', 'XI-RPL1', 'Tue May 2023', 'SAKIT'),
(19, 'Abas', 'Pria', 'XII-RPL1', 'Sun May 2023', 'HADIR'),
(20, 'Malik nur', 'Pria', 'XI-TJKT1', 'Mon May 2023', 'HADIR'),
(21, 'iqbal', 'Pria', 'X-BP1', 'Mon May 2023', 'HADIR'),
(22, 'Malik', 'Pria', 'XII-RPL-1', '2023-May-Mon', 'HADIR'),
(23, 'Gilang RAMAD', 'Pria', 'XII-RPL-1', '2023-May-29', 'HADIR');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `nis` char(9) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `phone` char(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `tanggal_daftar`, `nis`, `nama`, `kelas`, `tempat`, `tanggal`, `jenis_kelamin`, `phone`, `email`, `alamat`) VALUES
(1, '0000-00-00', '8324', 'Gilang RAMAD', 'XII-RPL-1', 'Bandung', '2023-05-26', 'laki-laki', '8239423', 'huhuh@gmaiil', 'huh'),
(2, '0000-00-00', '372', 'reyhan', 'XII-Tekstil-2', 'bansung', '2023-05-26', 'laki-laki', '012381', 'Ridho@gmail.com', 'Pangauban'),
(3, '0000-00-00', '1231', 'Malik', 'XII-RPL-1', 'Bandung', '2023-05-27', 'laki-laki', '01831', 'gilang@gamil.com', 'cipinang'),
(4, '0000-00-00', '1231', 'Malik nur', 'XII-RPL-1', 'Bandung', '2023-05-27', 'laki-laki', '01831', 'gilang@gamil.com', 'cipinang');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'Admin', 'a3122685eb7ef848ab7633c0e0e9b0d8', 'admin'),
(2, 'gilang', '2e25b1ec317a32f691cf6fddb756d1be', 'anggota');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
