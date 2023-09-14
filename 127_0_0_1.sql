-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2023 at 08:18 AM
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
-- Database: `basdad`
--
CREATE DATABASE IF NOT EXISTS `basdad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basdad`;

-- --------------------------------------------------------

--
-- Table structure for table `jumlah_siswa`
--

CREATE TABLE `jumlah_siswa` (
  `nip` int(20) NOT NULL,
  `rpl` int(40) NOT NULL,
  `bp` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jumlah_siswa`
--

INSERT INTO `jumlah_siswa` (`nip`, `rpl`, `bp`) VALUES
(1, 30, 34),
(2, 34, 29),
(3, 30, 28),
(4, 37, 18),
(6, 27, 23),
(7, 23, 20),
(8, 23, 20),
(9, 23, 45),
(34, 35, 36);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `kd_mapel` int(11) NOT NULL,
  `nm_barang` varchar(20) NOT NULL,
  `nis` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `kd_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `agama` enum('Islam',' katolik','kristen-protestan','buddha','hindu','kongucu') NOT NULL,
  `hobi` set('Badminton','futsal','lari','voly') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jurusan` varchar(11) DEFAULT NULL,
  `nip` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`kd_siswa`, `nis`, `nama`, `alamat`, `jk`, `agama`, `hobi`, `tgl_lahir`, `jurusan`, `nip`) VALUES
(21, '32', 'sira', 'junti', 'L', 'Islam', 'futsal', '0000-00-00', 'e', 1),
(22, '40', 'dani', 'junti', 'L', 'Islam', 'futsal', '0000-00-00', 'bp', 3),
(23, '45', 'gilang', 'warlob', 'L', 'Islam', 'futsal', '0000-00-00', 'rpl', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jumlah_siswa`
--
ALTER TABLE `jumlah_siswa`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kd_mapel`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kd_siswa`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `nip` (`nip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `kd_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34562;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mapel`
--
ALTER TABLE `mapel`
  ADD CONSTRAINT `mapel_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `jumlah_siswa` (`nip`);
--
-- Database: `clone_laravel`
--
CREATE DATABASE IF NOT EXISTS `clone_laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clone_laravel`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_24_033207_add_column_google_id_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `first`
--
CREATE DATABASE IF NOT EXISTS `first` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `first`;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `uname`, `pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `data_nilai`
--

CREATE TABLE `data_nilai` (
  `id_nil` int(11) NOT NULL,
  `nis` int(11) NOT NULL,
  `mapel` varchar(25) NOT NULL,
  `jnilai` varchar(10) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_nilai`
--

INSERT INTO `data_nilai` (`id_nil`, `nis`, `mapel`, `jnilai`, `nilai`) VALUES
(1, 12345678, 'JURUSAN', 'PTS', 99),
(3, 12345678, 'SEJARAH', 'PTS', 65),
(4, 23232323, 'BAHASA SUNDA', 'PTS', 99),
(5, 23232323, 'PPKN', 'PTS', 23),
(32, 43425, 'BAHASA INGGRIS', 'PTS', 80),
(33, 43425, 'BAHASA SUNDA', 'PTS', 75),
(34, 43425, 'PPKN', 'PTS', 77);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jur` int(11) NOT NULL,
  `nam_jur` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jur`, `nam_jur`) VALUES
(1, 'ELEKRONIKA'),
(2, 'MM'),
(3, 'RPL'),
(4, 'TEKSTILE'),
(5, 'TJKT'),
(6, 'OTOMOTIF'),
(7, 'MESIN');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_map` int(11) NOT NULL,
  `nm_map` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_map`, `nm_map`) VALUES
(1, 'PAIBP'),
(2, 'JURUSAN'),
(3, 'MATEMATIKA'),
(4, 'BAHASA INDONESIA'),
(5, 'BAHASA INGGRIS'),
(6, 'BAHASA SUNDA'),
(7, 'PPKN'),
(8, 'SEJARAH'),
(9, 'PJOK'),
(10, 'PKK');

-- --------------------------------------------------------

--
-- Table structure for table `regis`
--

CREATE TABLE `regis` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regis`
--

INSERT INTO `regis` (`id`, `username`, `password`) VALUES
(1, 'abas', '$2y$10$JGGjRUk.Nt6ru.7wmddeUOc5HAefaIZ2CSyIBcNjYOR'),
(2, 'gilang', '$2y$10$uXt39O6KTOJ9SZKnRjE2fe6RQS.UZKZSuNE32ljYiPk'),
(3, 'akhir', '$2y$10$fE9qiSUc.7Jm5imAPRnereYCI7eXRIiKtjW2FTU24Pr'),
(4, 'aneh', '$2y$10$kvJLo7R20kXYDKCKIy4r9OXRfKh8SnsI53kMD7sExxo'),
(5, 'ramadhan', '$2y$10$jWc6TUx1B1aZYPWZc6vKW.a9WVk5r5VFGMW0ndLFDUn');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `ids` int(11) NOT NULL,
  `nis` int(11) NOT NULL,
  `nm_sis` varchar(50) NOT NULL,
  `kls` varchar(5) NOT NULL,
  `id_jur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`ids`, `nis`, `nm_sis`, `kls`, `id_jur`) VALUES
(1, 12345678, 'Andi', 'XI', 3),
(2, 23232323, 'Beta', 'X', 4),
(27, 43425, 'Dodonko', 'XI', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_nilai`
--
ALTER TABLE `data_nilai`
  ADD PRIMARY KEY (`id_nil`),
  ADD KEY `id_map` (`mapel`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jur`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_map`);

--
-- Indexes for table `regis`
--
ALTER TABLE `regis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`ids`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `siswa_ibfk_1` (`id_jur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_nilai`
--
ALTER TABLE `data_nilai`
  MODIFY `id_nil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_map` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `regis`
--
ALTER TABLE `regis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_jur`) REFERENCES `jurusan` (`id_jur`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `gudang`
--
CREATE DATABASE IF NOT EXISTS `gudang` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gudang`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":0}}', NULL, '2023-09-11 22:58:59', '2023-09-11 22:58:59'),
(2, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-11 22:59:44', '2023-09-11 22:59:44'),
(3, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":10},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":0}}', NULL, '2023-09-11 22:59:44', '2023-09-11 22:59:44'),
(4, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"400000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"2000000\"}}', NULL, '2023-09-11 23:01:02', '2023-09-11 23:01:02'),
(5, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":15},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":10}}', NULL, '2023-09-11 23:01:02', '2023-09-11 23:01:02'),
(6, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-11 23:01:48', '2023-09-11 23:01:48'),
(7, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":10},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":15}}', NULL, '2023-09-11 23:01:48', '2023-09-11 23:01:48'),
(8, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-11 23:02:11', '2023-09-11 23:02:11'),
(9, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":12},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":10}}', NULL, '2023-09-11 23:02:11', '2023-09-11 23:02:11'),
(10, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"400000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"2000000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"400000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"2000000\"}}', NULL, '2023-09-11 23:09:05', '2023-09-11 23:09:05'),
(11, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":13},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":12}}', NULL, '2023-09-11 23:09:05', '2023-09-11 23:09:05'),
(12, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"400000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"2000000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"400000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"2000000\"}}', NULL, '2023-09-11 23:11:45', '2023-09-11 23:11:45'),
(13, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":17},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Asus\",\"stok\":13}}', NULL, '2023-09-11 23:11:45', '2023-09-11 23:11:45'),
(14, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-11 23:13:29', '2023-09-11 23:13:29'),
(15, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0}}', NULL, '2023-09-11 23:13:53', '2023-09-11 23:13:53'),
(16, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:14:31', '2023-09-11 23:14:31'),
(17, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-11 23:14:31', '2023-09-11 23:14:31'),
(18, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"250000\"}}', NULL, '2023-09-11 23:14:58', '2023-09-11 23:14:58'),
(19, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0}}', NULL, '2023-09-11 23:14:58', '2023-09-11 23:14:58'),
(20, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:16:18', '2023-09-11 23:16:18'),
(21, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-11 23:16:18', '2023-09-11 23:16:18'),
(22, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"250000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"250000\"}}', NULL, '2023-09-11 23:17:01', '2023-09-11 23:17:01'),
(23, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5}}', NULL, '2023-09-11 23:17:01', '2023-09-11 23:17:01'),
(24, 'default', 'created', 'App\\Models\\Stock', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1350000\"}}', NULL, '2023-09-11 23:18:11', '2023-09-11 23:18:11'),
(25, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":3},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-11 23:18:11', '2023-09-11 23:18:11'),
(26, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:19:22', '2023-09-11 23:19:22'),
(27, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":6},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":3}}', NULL, '2023-09-11 23:19:22', '2023-09-11 23:19:22'),
(28, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:23:53', '2023-09-11 23:23:53'),
(29, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":7},\"old\":{\"nama_barang\":\"Laptop\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":6}}', NULL, '2023-09-11 23:23:53', '2023-09-11 23:23:53'),
(30, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:27:21', '2023-09-11 23:27:21'),
(31, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":1},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0}}', NULL, '2023-09-11 23:27:21', '2023-09-11 23:27:21'),
(32, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Laptop\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:28:51', '2023-09-11 23:28:51'),
(33, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":2},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":1}}', NULL, '2023-09-11 23:28:51', '2023-09-11 23:28:51'),
(34, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0}}', NULL, '2023-09-11 23:33:41', '2023-09-11 23:33:41'),
(35, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-11 23:33:59', '2023-09-11 23:33:59'),
(36, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"}}', NULL, '2023-09-11 23:34:31', '2023-09-11 23:34:31'),
(37, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":0}}', NULL, '2023-09-11 23:34:31', '2023-09-11 23:34:31'),
(38, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:34:56', '2023-09-11 23:34:56'),
(39, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-11 23:34:56', '2023-09-11 23:34:56'),
(40, 'default', 'created', 'App\\Models\\Stock', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:35:25', '2023-09-11 23:35:25'),
(41, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":10},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5}}', NULL, '2023-09-11 23:35:25', '2023-09-11 23:35:25'),
(42, 'default', 'created', 'App\\Models\\Stock', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"225000\"}}', NULL, '2023-09-11 23:35:57', '2023-09-11 23:35:57'),
(43, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":10},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-11 23:35:57', '2023-09-11 23:35:57'),
(44, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"}}', NULL, '2023-09-11 23:38:12', '2023-09-11 23:38:12'),
(45, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":10}}', NULL, '2023-09-11 23:38:12', '2023-09-11 23:38:12'),
(46, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Mouse\",\"kategori_id\":5,\"harga\":\"450000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2250000\"}}', NULL, '2023-09-11 23:44:08', '2023-09-11 23:44:08'),
(47, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":10}}', NULL, '2023-09-11 23:44:08', '2023-09-11 23:44:08'),
(48, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:47:45', '2023-09-11 23:47:45'),
(49, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":1},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5}}', NULL, '2023-09-11 23:47:45', '2023-09-11 23:47:45'),
(50, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:53:16', '2023-09-11 23:53:16'),
(51, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":2},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":1}}', NULL, '2023-09-11 23:53:17', '2023-09-11 23:53:17'),
(52, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:53:58', '2023-09-11 23:53:58'),
(53, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":3},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":2}}', NULL, '2023-09-11 23:53:58', '2023-09-11 23:53:58'),
(54, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:55:11', '2023-09-11 23:55:11'),
(55, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":4},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":3}}', NULL, '2023-09-11 23:55:11', '2023-09-11 23:55:11'),
(56, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"350000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1750000\"}}', NULL, '2023-09-11 23:56:11', '2023-09-11 23:56:11'),
(57, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":4}}', NULL, '2023-09-11 23:56:11', '2023-09-11 23:56:11'),
(58, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"}}', NULL, '2023-09-11 23:57:25', '2023-09-11 23:57:25'),
(59, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":6},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":5}}', NULL, '2023-09-11 23:57:25', '2023-09-11 23:57:25'),
(60, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"}}', NULL, '2023-09-12 00:00:20', '2023-09-12 00:00:20'),
(61, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":8},\"old\":{\"nama_barang\":\"Komputer\",\"kode_barang\":\"A001\",\"kategori_id\":5,\"detail_barang\":\"Votre Maroon\",\"stok\":6}}', NULL, '2023-09-12 00:00:20', '2023-09-12 00:00:20'),
(62, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Komputer\",\"kategori_id\":5,\"harga\":\"230000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"1150000\"}}', NULL, '2023-09-12 00:03:31', '2023-09-12 00:03:31'),
(63, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":6},\"old\":{\"nama_barang\":\"Mouse\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-12 00:03:31', '2023-09-12 00:03:31'),
(64, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 00:09:00', '2023-09-12 00:09:00'),
(65, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0}}', NULL, '2023-09-12 00:09:22', '2023-09-12 00:09:22'),
(66, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:10:00', '2023-09-12 00:10:00'),
(67, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":10},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 00:10:01', '2023-09-12 00:10:01'),
(68, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:11:52', '2023-09-12 00:11:52'),
(69, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":10}}', NULL, '2023-09-12 00:11:52', '2023-09-12 00:11:52'),
(70, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:12:22', '2023-09-12 00:12:22'),
(71, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":7},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-12 00:12:22', '2023-09-12 00:12:22'),
(72, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:19:19', '2023-09-12 00:19:19'),
(73, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":7}}', NULL, '2023-09-12 00:19:19', '2023-09-12 00:19:19'),
(74, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:21:04', '2023-09-12 00:21:04'),
(75, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":6},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-12 00:21:04', '2023-09-12 00:21:04'),
(76, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"},\"old\":{\"kode_barang\":\"A001\",\"nama_barang\":\"Baju\",\"kategori_id\":3,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-11\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"560000\"}}', NULL, '2023-09-12 00:22:30', '2023-09-12 00:22:30'),
(77, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":7},\"old\":{\"nama_barang\":\"Baju\",\"kode_barang\":\"A001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":6}}', NULL, '2023-09-12 00:22:31', '2023-09-12 00:22:31'),
(78, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:25:30', '2023-09-12 00:25:30'),
(79, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0}}', NULL, '2023-09-12 00:25:31', '2023-09-12 00:25:31'),
(80, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:26:05', '2023-09-12 00:26:05'),
(81, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5}}', NULL, '2023-09-12 00:26:05', '2023-09-12 00:26:05'),
(82, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:26:29', '2023-09-12 00:26:29'),
(83, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0}}', NULL, '2023-09-12 00:26:29', '2023-09-12 00:26:29'),
(84, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:28:44', '2023-09-12 00:28:44'),
(85, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1}}', NULL, '2023-09-12 00:28:45', '2023-09-12 00:28:45'),
(86, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:29:42', '2023-09-12 00:29:42'),
(87, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2}}', NULL, '2023-09-12 00:29:42', '2023-09-12 00:29:42'),
(88, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:31:28', '2023-09-12 00:31:28'),
(89, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3}}', NULL, '2023-09-12 00:31:28', '2023-09-12 00:31:28'),
(90, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:32:59', '2023-09-12 00:32:59'),
(91, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4}}', NULL, '2023-09-12 00:32:59', '2023-09-12 00:32:59'),
(92, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:35:57', '2023-09-12 00:35:57'),
(93, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5}}', NULL, '2023-09-12 00:35:57', '2023-09-12 00:35:57'),
(94, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:36:56', '2023-09-12 00:36:56'),
(95, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2}}', NULL, '2023-09-12 00:36:56', '2023-09-12 00:36:56'),
(96, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:40:26', '2023-09-12 00:40:26'),
(97, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3}}', NULL, '2023-09-12 00:40:26', '2023-09-12 00:40:26'),
(98, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:41:08', '2023-09-12 00:41:08'),
(99, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4}}', NULL, '2023-09-12 00:41:08', '2023-09-12 00:41:08'),
(100, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:44:12', '2023-09-12 00:44:12');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(101, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5}}', NULL, '2023-09-12 00:44:12', '2023-09-12 00:44:12'),
(102, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:44:29', '2023-09-12 00:44:29'),
(103, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1}}', NULL, '2023-09-12 00:44:29', '2023-09-12 00:44:29'),
(104, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:47:36', '2023-09-12 00:47:36'),
(105, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2}}', NULL, '2023-09-12 00:47:36', '2023-09-12 00:47:36'),
(106, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:49:38', '2023-09-12 00:49:38'),
(107, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":3}}', NULL, '2023-09-12 00:49:38', '2023-09-12 00:49:38'),
(108, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:52:09', '2023-09-12 00:52:09'),
(109, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":4}}', NULL, '2023-09-12 00:52:10', '2023-09-12 00:52:10'),
(110, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:53:16', '2023-09-12 00:53:16'),
(111, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5}}', NULL, '2023-09-12 00:53:16', '2023-09-12 00:53:16'),
(112, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:53:35', '2023-09-12 00:53:35'),
(113, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0}}', NULL, '2023-09-12 00:53:36', '2023-09-12 00:53:36'),
(114, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:55:35', '2023-09-12 00:55:35'),
(115, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":1}}', NULL, '2023-09-12 00:55:35', '2023-09-12 00:55:35'),
(116, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":2}}', NULL, '2023-09-12 00:57:42', '2023-09-12 00:57:42'),
(117, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"45000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"225000\"}}', NULL, '2023-09-12 00:57:43', '2023-09-12 00:57:43'),
(118, 'default', 'created', 'App\\Models\\Stock', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 00:58:21', '2023-09-12 00:58:21'),
(119, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":0}}', NULL, '2023-09-12 00:58:21', '2023-09-12 00:58:21'),
(120, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 00:58:50', '2023-09-12 00:58:50'),
(121, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10}}', NULL, '2023-09-12 00:58:50', '2023-09-12 00:58:50'),
(122, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 00:59:11', '2023-09-12 00:59:11'),
(123, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":7},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":5}}', NULL, '2023-09-12 00:59:12', '2023-09-12 00:59:12'),
(124, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":8,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 01:05:01', '2023-09-12 01:05:01'),
(125, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":8},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":7}}', NULL, '2023-09-12 01:05:01', '2023-09-12 01:05:01'),
(126, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":9,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":8,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 01:06:23', '2023-09-12 01:06:23'),
(127, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":9},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":8}}', NULL, '2023-09-12 01:06:23', '2023-09-12 01:06:23'),
(128, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":9,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 01:08:41', '2023-09-12 01:08:41'),
(129, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":9}}', NULL, '2023-09-12 01:08:41', '2023-09-12 01:08:41'),
(130, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":11,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 01:10:06', '2023-09-12 01:10:06'),
(131, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":11},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10}}', NULL, '2023-09-12 01:10:06', '2023-09-12 01:10:06'),
(132, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":12,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":11,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 01:28:14', '2023-09-12 01:28:14'),
(133, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":12},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":11}}', NULL, '2023-09-12 01:28:15', '2023-09-12 01:28:15'),
(134, 'default', 'login', NULL, NULL, NULL, 'App\\Models\\User', 5, '[]', NULL, '2023-09-12 01:43:05', '2023-09-12 01:43:05'),
(135, 'default', 'created', 'App\\Models\\Item', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":0}}', NULL, '2023-09-12 02:32:00', '2023-09-12 02:32:00'),
(136, 'default', 'created', 'App\\Models\\Stock', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Smartwact\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 02:33:14', '2023-09-12 02:33:14'),
(137, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":5},\"old\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":0}}', NULL, '2023-09-12 02:33:15', '2023-09-12 02:33:15'),
(138, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":12,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 02:34:25', '2023-09-12 02:34:25'),
(139, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":0},\"old\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":5}}', NULL, '2023-09-12 02:34:25', '2023-09-12 02:34:25'),
(140, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 02:37:24', '2023-09-12 02:37:24'),
(141, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":-5},\"old\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":0}}', NULL, '2023-09-12 02:37:24', '2023-09-12 02:37:24'),
(142, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":12}}', NULL, '2023-09-12 05:57:18', '2023-09-12 05:57:18'),
(143, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"3000000\"}}', NULL, '2023-09-12 05:57:18', '2023-09-12 05:57:18'),
(144, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":-10},\"old\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":-5}}', NULL, '2023-09-12 05:57:25', '2023-09-12 05:57:25'),
(145, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Smartwact\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 05:57:26', '2023-09-12 05:57:26'),
(146, 'default', 'deleted', 'App\\Models\\Item', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"nama_barang\":\"Smartwact\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Terbaru Modelnya\",\"stok\":-10}}', NULL, '2023-09-12 05:58:08', '2023-09-12 05:58:08'),
(147, 'default', 'deleted', 'App\\Models\\Item', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"B001\",\"kategori_id\":3,\"detail_barang\":\"Robot\",\"stok\":10}}', NULL, '2023-09-12 05:58:17', '2023-09-12 05:58:17'),
(148, 'default', 'created', 'App\\Models\\Item', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":0}}', NULL, '2023-09-12 06:00:17', '2023-09-12 06:00:17'),
(149, 'default', 'created', 'App\\Models\\Item', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 06:00:48', '2023-09-12 06:00:48'),
(150, 'default', 'created', 'App\\Models\\Stock', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 06:02:10', '2023-09-12 06:02:10'),
(151, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":5},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":0}}', NULL, '2023-09-12 06:02:10', '2023-09-12 06:02:10'),
(152, 'default', 'updated', 'App\\Models\\Stock', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"},\"old\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 06:05:27', '2023-09-12 06:05:27'),
(153, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":5}}', NULL, '2023-09-12 06:05:27', '2023-09-12 06:05:27'),
(154, 'default', 'updated', 'App\\Models\\Stock', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"},\"old\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 06:05:57', '2023-09-12 06:05:57'),
(155, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":3},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":2}}', NULL, '2023-09-12 06:05:57', '2023-09-12 06:05:57'),
(156, 'default', 'created', 'App\\Models\\Stock', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"2000\",\"tgl_beli\":\"2023-09-15\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"8000\"}}', NULL, '2023-09-12 07:27:24', '2023-09-12 07:27:24'),
(157, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":4},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 07:27:25', '2023-09-12 07:27:25'),
(158, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"90000\",\"tgl_beli\":\"2023-09-12\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"450000\"}}', NULL, '2023-09-12 07:27:31', '2023-09-12 07:27:31'),
(159, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":4}}', NULL, '2023-09-12 07:33:21', '2023-09-12 07:33:21'),
(160, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"2000\",\"tgl_beli\":\"2023-09-15\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"8000\"}}', NULL, '2023-09-12 07:33:21', '2023-09-12 07:33:21'),
(161, 'default', 'created', 'App\\Models\\Stock', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"30000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"150000\"}}', NULL, '2023-09-12 20:01:49', '2023-09-12 20:01:49'),
(162, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":8},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":3}}', NULL, '2023-09-12 20:01:50', '2023-09-12 20:01:50'),
(163, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":3},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":8}}', NULL, '2023-09-12 20:08:53', '2023-09-12 20:08:53'),
(164, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-2},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":3}}', NULL, '2023-09-12 20:10:08', '2023-09-12 20:10:08'),
(165, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-7},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-2}}', NULL, '2023-09-12 20:10:55', '2023-09-12 20:10:55'),
(166, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-12},\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-7}}', NULL, '2023-09-12 20:11:42', '2023-09-12 20:11:42'),
(167, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"G001\",\"nama_barang\":\"Celana\",\"kategori_id\":3,\"harga\":\"30000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"150000\"}}', NULL, '2023-09-12 20:11:42', '2023-09-12 20:11:42'),
(168, 'default', 'deleted', 'App\\Models\\Item', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"nama_barang\":\"Celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Brand Avo\",\"stok\":-12}}', NULL, '2023-09-12 20:19:23', '2023-09-12 20:19:23'),
(169, 'default', 'created', 'App\\Models\\Stock', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"}}', NULL, '2023-09-12 20:24:16', '2023-09-12 20:24:16'),
(170, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 20:24:16', '2023-09-12 20:24:16'),
(171, 'default', 'updated', 'App\\Models\\Stock', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"},\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"}}', NULL, '2023-09-12 20:24:45', '2023-09-12 20:24:45'),
(172, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":2},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5}}', NULL, '2023-09-12 20:24:45', '2023-09-12 20:24:45'),
(173, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":2}}', NULL, '2023-09-12 20:25:17', '2023-09-12 20:25:17'),
(174, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"}}', NULL, '2023-09-12 20:25:17', '2023-09-12 20:25:17'),
(175, 'default', 'created', 'App\\Models\\Stock', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"200000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 20:35:05', '2023-09-12 20:35:05'),
(176, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 20:35:05', '2023-09-12 20:35:05'),
(177, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5}}', NULL, '2023-09-12 20:35:52', '2023-09-12 20:35:52'),
(178, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"200000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 20:35:53', '2023-09-12 20:35:53'),
(179, 'default', 'created', 'App\\Models\\Stock', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1500000\"}}', NULL, '2023-09-12 20:39:27', '2023-09-12 20:39:27'),
(180, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 20:39:27', '2023-09-12 20:39:27'),
(181, 'default', 'created', 'App\\Models\\Stock', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"}}', NULL, '2023-09-12 20:39:54', '2023-09-12 20:39:54'),
(182, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":10},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5}}', NULL, '2023-09-12 20:39:54', '2023-09-12 20:39:54'),
(183, 'default', 'updated', 'App\\Models\\Stock', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1500000\"},\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1500000\"}}', NULL, '2023-09-12 20:40:58', '2023-09-12 20:40:58'),
(184, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":8},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":10}}', NULL, '2023-09-12 20:40:58', '2023-09-12 20:40:58'),
(185, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":8}}', NULL, '2023-09-12 20:41:29', '2023-09-12 20:41:29'),
(186, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":2},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":5}}', NULL, '2023-09-12 20:42:00', '2023-09-12 20:42:00'),
(187, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-1},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":2}}', NULL, '2023-09-12 20:45:17', '2023-09-12 20:45:17'),
(188, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 10, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"300000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1500000\"}}', NULL, '2023-09-12 20:45:17', '2023-09-12 20:45:17'),
(189, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-6},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-1}}', NULL, '2023-09-12 20:47:01', '2023-09-12 20:47:01'),
(190, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 11, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"250000\"}}', NULL, '2023-09-12 20:47:02', '2023-09-12 20:47:02'),
(191, 'default', 'created', 'App\\Models\\Stock', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"122323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":12,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1467876\"}}', NULL, '2023-09-12 20:48:48', '2023-09-12 20:48:48'),
(192, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":6},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-6}}', NULL, '2023-09-12 20:48:48', '2023-09-12 20:48:48'),
(193, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-6},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":6}}', NULL, '2023-09-12 20:52:07', '2023-09-12 20:52:07'),
(194, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 12, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"122323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":12,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"1467876\"}}', NULL, '2023-09-12 20:52:07', '2023-09-12 20:52:07'),
(195, 'default', 'created', 'App\\Models\\Stock', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"5000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000\"}}', NULL, '2023-09-12 20:52:47', '2023-09-12 20:52:47'),
(196, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-5},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-6}}', NULL, '2023-09-12 20:52:47', '2023-09-12 20:52:47'),
(197, 'default', 'created', 'App\\Models\\Stock', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"6000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"36000\"}}', NULL, '2023-09-12 20:53:09', '2023-09-12 20:53:09'),
(198, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":1},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-5}}', NULL, '2023-09-12 20:53:09', '2023-09-12 20:53:09'),
(199, 'default', 'updated', 'App\\Models\\Stock', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"5000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000\"},\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"5000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000\"}}', NULL, '2023-09-12 20:53:35', '2023-09-12 20:53:35'),
(200, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":1}}', NULL, '2023-09-12 20:53:35', '2023-09-12 20:53:35'),
(201, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 13, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"5000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"5000\"}}', NULL, '2023-09-12 20:53:54', '2023-09-12 20:53:54'),
(202, 'default', 'updated', 'App\\Models\\Item', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":-6},\"old\":{\"nama_barang\":\"Keyboard\",\"kode_barang\":\"H001\",\"kategori_id\":5,\"detail_barang\":\"Eksternal\",\"stok\":0}}', NULL, '2023-09-12 21:01:18', '2023-09-12 21:01:18'),
(203, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 14, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"H001\",\"nama_barang\":\"Keyboard\",\"kategori_id\":5,\"harga\":\"6000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":6,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"36000\"}}', NULL, '2023-09-12 21:01:18', '2023-09-12 21:01:18'),
(204, 'default', 'created', 'App\\Models\\Item', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:05:19', '2023-09-12 21:05:19'),
(205, 'default', 'created', 'App\\Models\\Stock', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"60\"}}', NULL, '2023-09-12 21:05:43', '2023-09-12 21:05:43'),
(206, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:05:43', '2023-09-12 21:05:43'),
(207, 'default', 'updated', 'App\\Models\\Stock', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"60\"},\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"60\"}}', NULL, '2023-09-12 21:06:01', '2023-09-12 21:06:01'),
(208, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":4},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-12 21:06:01', '2023-09-12 21:06:01'),
(209, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":4}}', NULL, '2023-09-12 21:06:31', '2023-09-12 21:06:31'),
(210, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 15, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"60\"}}', NULL, '2023-09-12 21:06:31', '2023-09-12 21:06:31');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(211, 'default', 'created', 'App\\Models\\Stock', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"9292\"}}', NULL, '2023-09-12 21:20:05', '2023-09-12 21:20:05'),
(212, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":4},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:20:06', '2023-09-12 21:20:06'),
(213, 'default', 'updated', 'App\\Models\\Stock', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"9292\"},\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"9292\"}}', NULL, '2023-09-12 21:20:29', '2023-09-12 21:20:29'),
(214, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":3},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":4}}', NULL, '2023-09-12 21:20:29', '2023-09-12 21:20:29'),
(215, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":3}}', NULL, '2023-09-12 21:21:25', '2023-09-12 21:21:25'),
(216, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 16, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2323\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"9292\"}}', NULL, '2023-09-12 21:21:25', '2023-09-12 21:21:25'),
(217, 'default', 'created', 'App\\Models\\Stock', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"10000\"}}', NULL, '2023-09-12 21:24:28', '2023-09-12 21:24:28'),
(218, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:24:28', '2023-09-12 21:24:28'),
(219, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":5}}', NULL, '2023-09-12 21:24:50', '2023-09-12 21:24:50'),
(220, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 17, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"2000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"10000\"}}', NULL, '2023-09-12 21:24:50', '2023-09-12 21:24:50'),
(221, 'default', 'created', 'App\\Models\\Stock', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"24\"}}', NULL, '2023-09-12 21:30:10', '2023-09-12 21:30:10'),
(222, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":2},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:30:10', '2023-09-12 21:30:10'),
(223, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":2}}', NULL, '2023-09-12 21:30:35', '2023-09-12 21:30:35'),
(224, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 18, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"L001\",\"nama_barang\":\"Meja\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Gramedia\",\"alamat_toko\":\"Miko\",\"total_harga\":\"24\"}}', NULL, '2023-09-12 21:30:35', '2023-09-12 21:30:35'),
(225, 'default', 'updated', 'App\\Models\\Item', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Meja Belajar\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"Meja\",\"kode_barang\":\"L001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:33:01', '2023-09-12 21:33:01'),
(226, 'default', 'created', 'App\\Models\\Item', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:33:20', '2023-09-12 21:33:20'),
(227, 'default', 'created', 'App\\Models\\Stock', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"G001\",\"nama_barang\":\"celana\",\"kategori_id\":3,\"harga\":\"1212\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2424\"}}', NULL, '2023-09-12 21:33:44', '2023-09-12 21:33:44'),
(228, 'default', 'updated', 'App\\Models\\Item', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":2},\"old\":{\"nama_barang\":\"celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0}}', NULL, '2023-09-12 21:33:45', '2023-09-12 21:33:45'),
(229, 'default', 'updated', 'App\\Models\\Item', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":0},\"old\":{\"nama_barang\":\"celana\",\"kode_barang\":\"G001\",\"kategori_id\":3,\"detail_barang\":\"Warna biru\",\"stok\":2}}', NULL, '2023-09-12 21:34:00', '2023-09-12 21:34:00'),
(230, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 19, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"G001\",\"nama_barang\":\"celana\",\"kategori_id\":3,\"harga\":\"1212\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"Hap-hap\",\"alamat_toko\":\"jln raya soreang\",\"total_harga\":\"2424\"}}', NULL, '2023-09-12 21:34:00', '2023-09-12 21:34:00'),
(231, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":0}}', NULL, '2023-09-12 22:54:31', '2023-09-12 22:54:31'),
(232, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":0}}', NULL, '2023-09-12 22:55:10', '2023-09-12 22:55:10'),
(233, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 22:57:46', '2023-09-12 22:57:46'),
(234, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":0}}', NULL, '2023-09-12 22:57:46', '2023-09-12 22:57:46'),
(235, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"},\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 22:59:45', '2023-09-12 22:59:45'),
(236, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":3},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5}}', NULL, '2023-09-12 22:59:45', '2023-09-12 22:59:45'),
(237, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":0},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":3}}', NULL, '2023-09-12 23:00:16', '2023-09-12 23:00:16'),
(238, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 23:00:17', '2023-09-12 23:00:17'),
(239, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 23:05:57', '2023-09-12 23:05:57'),
(240, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":10},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":0}}', NULL, '2023-09-12 23:05:58', '2023-09-12 23:05:58'),
(241, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":8,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"},\"old\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 23:07:28', '2023-09-12 23:07:28'),
(242, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":8},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":10}}', NULL, '2023-09-12 23:07:28', '2023-09-12 23:07:28'),
(243, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":9},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":8}}', NULL, '2023-09-12 23:10:48', '2023-09-12 23:10:48'),
(244, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"},\"old\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":8,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 23:14:31', '2023-09-12 23:14:31'),
(245, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":6},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":9}}', NULL, '2023-09-12 23:14:31', '2023-09-12 23:14:31'),
(246, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":1},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":6}}', NULL, '2023-09-12 23:18:17', '2023-09-12 23:18:17'),
(247, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 23:18:18', '2023-09-12 23:18:18'),
(248, 'default', 'created', 'App\\Models\\Stock', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 23:22:09', '2023-09-12 23:22:09'),
(249, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":10},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":0}}', NULL, '2023-09-12 23:22:09', '2023-09-12 23:22:09'),
(250, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"},\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 23:23:02', '2023-09-12 23:23:02'),
(251, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":10}}', NULL, '2023-09-12 23:23:02', '2023-09-12 23:23:02'),
(252, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"},\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 23:23:57', '2023-09-12 23:23:57'),
(253, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":9},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5}}', NULL, '2023-09-12 23:23:58', '2023-09-12 23:23:58'),
(254, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":9}}', NULL, '2023-09-12 23:26:19', '2023-09-12 23:26:19'),
(255, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"500000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"5000000\"}}', NULL, '2023-09-12 23:26:19', '2023-09-12 23:26:19'),
(256, 'default', 'created', 'App\\Models\\Stock', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"10000000\"}}', NULL, '2023-09-12 23:27:32', '2023-09-12 23:27:32'),
(257, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":15},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5}}', NULL, '2023-09-12 23:27:32', '2023-09-12 23:27:32'),
(258, 'default', 'updated', 'App\\Models\\Stock', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"10000000\"},\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"10000000\"}}', NULL, '2023-09-12 23:28:54', '2023-09-12 23:28:54'),
(259, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":10},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":15}}', NULL, '2023-09-12 23:28:54', '2023-09-12 23:28:54'),
(260, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":5},\"old\":{\"nama_barang\":\"Kursi\",\"kode_barang\":\"B005\",\"kategori_id\":5,\"detail_barang\":\"Kerja\",\"stok\":10}}', NULL, '2023-09-12 23:29:19', '2023-09-12 23:29:19'),
(261, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B005\",\"nama_barang\":\"Kursi\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"10000000\"}}', NULL, '2023-09-12 23:29:19', '2023-09-12 23:29:19'),
(262, 'default', 'created', 'App\\Models\\Stock', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":100,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"100000000\"}}', NULL, '2023-09-12 23:35:18', '2023-09-12 23:35:18'),
(263, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":101},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":1}}', NULL, '2023-09-12 23:35:18', '2023-09-12 23:35:18'),
(264, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":1},\"old\":{\"nama_barang\":\"meja\",\"kode_barang\":\"B004\",\"kategori_id\":5,\"detail_barang\":\"kerja\",\"stok\":101}}', NULL, '2023-09-12 23:35:47', '2023-09-12 23:35:47'),
(265, 'default', 'deleted', 'App\\Models\\Stock', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"kode_barang\":\"B004\",\"nama_barang\":\"meja\",\"kategori_id\":5,\"harga\":\"1000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":100,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"100000000\"}}', NULL, '2023-09-12 23:35:47', '2023-09-12 23:35:47'),
(266, 'default', 'created', 'App\\Models\\Item', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-12 23:40:04', '2023-09-12 23:40:04'),
(267, 'default', 'created', 'App\\Models\\Stock', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"10000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-12 23:41:53', '2023-09-12 23:41:53'),
(268, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":5},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-12 23:41:53', '2023-09-12 23:41:53'),
(269, 'default', 'updated', 'App\\Models\\Stock', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"10000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"10000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-12 23:42:34', '2023-09-12 23:42:34'),
(270, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":2},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":5}}', NULL, '2023-09-12 23:42:34', '2023-09-12 23:42:34'),
(271, 'default', 'updated', 'App\\Models\\Stock', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"10000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"10000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-12 23:44:12', '2023-09-12 23:44:12'),
(272, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":3},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":2}}', NULL, '2023-09-12 23:44:12', '2023-09-12 23:44:12'),
(273, 'default', 'created', 'App\\Models\\Stock', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"7000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"70000000\"}}', NULL, '2023-09-12 23:51:31', '2023-09-12 23:51:31'),
(274, 'default', 'updated', 'App\\Models\\Item', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":13},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":3}}', NULL, '2023-09-12 23:51:31', '2023-09-12 23:51:31'),
(275, 'default', 'created', 'App\\Models\\Item', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":0}}', NULL, '2023-09-12 23:56:24', '2023-09-12 23:56:24'),
(276, 'default', 'created', 'App\\Models\\Stock', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a002\",\"nama_barang\":\"laptop\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-12 23:57:24', '2023-09-12 23:57:24'),
(277, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":10},\"old\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":0}}', NULL, '2023-09-12 23:57:24', '2023-09-12 23:57:24'),
(278, 'default', 'updated', 'App\\Models\\Stock', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a002\",\"nama_barang\":\"laptop\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"},\"old\":{\"kode_barang\":\"a002\",\"nama_barang\":\"laptop\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-13 00:00:35', '2023-09-13 00:00:35'),
(279, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":5},\"old\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":10}}', NULL, '2023-09-13 00:00:35', '2023-09-13 00:00:35'),
(280, 'default', 'updated', 'App\\Models\\Stock', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a002\",\"nama_barang\":\"laptop\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"},\"old\":{\"kode_barang\":\"a002\",\"nama_barang\":\"laptop\",\"kategori_id\":5,\"harga\":\"100000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"1000000\"}}', NULL, '2023-09-13 00:02:47', '2023-09-13 00:02:47'),
(281, 'default', 'updated', 'App\\Models\\Item', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":6},\"old\":{\"nama_barang\":\"laptop\",\"kode_barang\":\"a002\",\"kategori_id\":5,\"detail_barang\":\"asus\",\"stok\":5}}', NULL, '2023-09-13 00:02:47', '2023-09-13 00:02:47'),
(282, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":0}}', NULL, '2023-09-13 00:19:02', '2023-09-13 00:19:02'),
(283, 'default', 'created', 'App\\Models\\Stock', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Kacamata\",\"kategori_id\":3,\"harga\":\"3000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"15000\"}}', NULL, '2023-09-13 00:19:25', '2023-09-13 00:19:25'),
(284, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":5},\"old\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":0}}', NULL, '2023-09-13 00:19:25', '2023-09-13 00:19:25'),
(285, 'default', 'updated', 'App\\Models\\Stock', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Kacamata\",\"kategori_id\":3,\"harga\":\"3000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"15000\"},\"old\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Kacamata\",\"kategori_id\":3,\"harga\":\"3000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"15000\"}}', NULL, '2023-09-13 00:19:51', '2023-09-13 00:19:51'),
(286, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":2},\"old\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":5}}', NULL, '2023-09-13 00:19:51', '2023-09-13 00:19:51'),
(287, 'default', 'updated', 'App\\Models\\Stock', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Kacamata\",\"kategori_id\":3,\"harga\":\"3000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"15000\"},\"old\":{\"kode_barang\":\"C001\",\"nama_barang\":\"Kacamata\",\"kategori_id\":3,\"harga\":\"3000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"15000\"}}', NULL, '2023-09-13 00:20:19', '2023-09-13 00:20:19'),
(288, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":3},\"old\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":2}}', NULL, '2023-09-13 00:20:19', '2023-09-13 00:20:19'),
(289, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":4},\"old\":{\"nama_barang\":\"Kacamata\",\"kode_barang\":\"C001\",\"kategori_id\":3,\"detail_barang\":\"Kacamata Malik\",\"stok\":3}}', NULL, '2023-09-13 00:24:54', '2023-09-13 00:24:54'),
(290, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"BAju\",\"kode_barang\":\"x001\",\"kategori_id\":3,\"detail_barang\":\"baju MAlik\",\"stok\":0}}', NULL, '2023-09-13 00:28:36', '2023-09-13 00:28:36'),
(291, 'default', 'created', 'App\\Models\\Stock', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"x001\",\"nama_barang\":\"BAju\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"60\"}}', NULL, '2023-09-13 00:29:03', '2023-09-13 00:29:03'),
(292, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"BAju\",\"kode_barang\":\"x001\",\"kategori_id\":3,\"detail_barang\":\"baju MAlik\",\"stok\":5},\"old\":{\"nama_barang\":\"BAju\",\"kode_barang\":\"x001\",\"kategori_id\":3,\"detail_barang\":\"baju MAlik\",\"stok\":0}}', NULL, '2023-09-13 00:29:03', '2023-09-13 00:29:03'),
(293, 'default', 'updated', 'App\\Models\\Stock', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"x001\",\"nama_barang\":\"BAju\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"60\"},\"old\":{\"kode_barang\":\"x001\",\"nama_barang\":\"BAju\",\"kategori_id\":3,\"harga\":\"12\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"60\"}}', NULL, '2023-09-13 00:33:32', '2023-09-13 00:33:32'),
(294, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"BAju\",\"kode_barang\":\"x001\",\"kategori_id\":3,\"detail_barang\":\"baju MAlik\",\"stok\":10},\"old\":{\"nama_barang\":\"BAju\",\"kode_barang\":\"x001\",\"kategori_id\":3,\"detail_barang\":\"baju MAlik\",\"stok\":5}}', NULL, '2023-09-13 00:33:32', '2023-09-13 00:33:32'),
(295, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-13 00:36:16', '2023-09-13 00:36:16'),
(296, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"7000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"70000000\"}}', NULL, '2023-09-13 00:36:52', '2023-09-13 00:36:52'),
(297, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":10},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-13 00:36:52', '2023-09-13 00:36:52'),
(298, 'default', 'created', 'App\\Models\\Item', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-13 00:38:34', '2023-09-13 00:38:34'),
(299, 'default', 'created', 'App\\Models\\Stock', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:39:16', '2023-09-13 00:39:16'),
(300, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":10},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":0}}', NULL, '2023-09-13 00:39:16', '2023-09-13 00:39:16'),
(301, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:39:52', '2023-09-13 00:39:52'),
(302, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":5},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":10}}', NULL, '2023-09-13 00:39:52', '2023-09-13 00:39:52'),
(303, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":7,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:40:50', '2023-09-13 00:40:50'),
(304, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:40:51', '2023-09-13 00:40:51'),
(305, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":7},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":5}}', NULL, '2023-09-13 00:40:51', '2023-09-13 00:40:51'),
(306, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":8},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":7}}', NULL, '2023-09-13 00:43:22', '2023-09-13 00:43:22'),
(307, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:54:47', '2023-09-13 00:54:47'),
(308, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":7},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":8}}', NULL, '2023-09-13 00:54:47', '2023-09-13 00:54:47'),
(309, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":8},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":7}}', NULL, '2023-09-13 00:55:12', '2023-09-13 00:55:12'),
(310, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":-2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":1,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:57:38', '2023-09-13 00:57:38'),
(311, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":11},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":8}}', NULL, '2023-09-13 00:57:39', '2023-09-13 00:57:39'),
(312, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":-1,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 00:59:56', '2023-09-13 00:59:56'),
(313, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":13},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":11}}', NULL, '2023-09-13 00:59:56', '2023-09-13 00:59:56'),
(314, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":14},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":13}}', NULL, '2023-09-13 01:03:54', '2023-09-13 01:03:54'),
(315, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 01:32:48', '2023-09-13 01:32:48'),
(316, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":16},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":14}}', NULL, '2023-09-13 01:32:49', '2023-09-13 01:32:49'),
(317, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":2,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 01:35:40', '2023-09-13 01:35:40'),
(318, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":17},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":16}}', NULL, '2023-09-13 01:35:40', '2023-09-13 01:35:40'),
(319, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":3,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 01:36:54', '2023-09-13 01:36:54'),
(320, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":18},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":17}}', NULL, '2023-09-13 01:36:54', '2023-09-13 01:36:54'),
(321, 'default', 'created', 'App\\Models\\Item', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":0}}', NULL, '2023-09-13 01:49:20', '2023-09-13 01:49:20');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(322, 'default', 'created', 'App\\Models\\Stock', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"}}', NULL, '2023-09-13 01:50:47', '2023-09-13 01:50:47'),
(323, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":0}}', NULL, '2023-09-13 01:50:47', '2023-09-13 01:50:47'),
(324, 'default', 'created', 'App\\Models\\Stock', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"500000\"}}', NULL, '2023-09-13 01:51:17', '2023-09-13 01:51:17'),
(325, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":15},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5}}', NULL, '2023-09-13 01:51:17', '2023-09-13 01:51:17'),
(326, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"500000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"500000\"}}', NULL, '2023-09-13 01:53:18', '2023-09-13 01:53:18'),
(327, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":15}}', NULL, '2023-09-13 01:53:19', '2023-09-13 01:53:19'),
(328, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"}}', NULL, '2023-09-13 01:53:49', '2023-09-13 01:53:49'),
(329, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":0},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5}}', NULL, '2023-09-13 01:53:49', '2023-09-13 01:53:49'),
(330, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"}}', NULL, '2023-09-13 02:12:55', '2023-09-13 02:12:55'),
(331, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":0}}', NULL, '2023-09-13 02:12:55', '2023-09-13 02:12:55'),
(332, 'default', 'updated', 'App\\Models\\Stock', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"56000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":5,\"nama_toko\":\"olimpic\",\"alamat_toko\":\"bandung\",\"total_harga\":\"280000\"}}', NULL, '2023-09-13 02:13:21', '2023-09-13 02:13:21'),
(333, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":10},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":5}}', NULL, '2023-09-13 02:13:21', '2023-09-13 02:13:21'),
(334, 'default', 'updated', 'App\\Models\\Stock', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":10,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"500000\"},\"old\":{\"kode_barang\":\"B001\",\"nama_barang\":\"Hp\",\"kategori_id\":5,\"harga\":\"50000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":0,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"500000\"}}', NULL, '2023-09-13 02:14:25', '2023-09-13 02:14:25'),
(335, 'default', 'updated', 'App\\Models\\Item', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":20},\"old\":{\"nama_barang\":\"Hp\",\"kode_barang\":\"B001\",\"kategori_id\":5,\"detail_barang\":\"Ipon\",\"stok\":10}}', NULL, '2023-09-13 02:14:25', '2023-09-13 02:14:25'),
(336, 'default', 'updated', 'App\\Models\\Stock', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":8,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"},\"old\":{\"kode_barang\":\"a001\",\"nama_barang\":\"komputer\",\"kategori_id\":5,\"harga\":\"5000000\",\"tgl_beli\":\"2023-09-13\",\"foto_barang\":null,\"foto_kwitansi\":null,\"stok\":4,\"nama_toko\":\"bec\",\"alamat_toko\":\"bandung\",\"total_harga\":\"50000000\"}}', NULL, '2023-09-13 02:15:46', '2023-09-13 02:15:46'),
(337, 'default', 'updated', 'App\\Models\\Item', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":22},\"old\":{\"nama_barang\":\"komputer\",\"kode_barang\":\"a001\",\"kategori_id\":5,\"detail_barang\":\"gaming\",\"stok\":18}}', NULL, '2023-09-13 02:15:46', '2023-09-13 02:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `data_peminjam`
--

CREATE TABLE `data_peminjam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_peminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_peminjam`
--

INSERT INTO `data_peminjam` (`id`, `nama_peminjam`, `alamat`, `no_hp`, `created_at`, `updated_at`) VALUES
(1, 'gilang', 'warung lobak', '08538734783', '2023-09-12 22:58:57', '2023-09-12 22:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `data_toko`
--

CREATE TABLE `data_toko` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_wa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `detail_barang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(3, 'Sport', '2023-09-08 01:01:53', '2023-09-08 01:01:53'),
(4, 'Sofware', '2023-09-10 22:49:54', '2023-09-10 22:49:54'),
(5, 'Hardware', '2023-09-11 06:40:34', '2023-09-11 06:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_30_072814_create_activity_log_table', 1),
(6, '2023_07_30_072815_add_event_column_to_activity_log_table', 1),
(7, '2023_07_30_072816_add_batch_uuid_column_to_activity_log_table', 1),
(8, '2023_07_30_100238_create_barang_table', 1),
(9, '2023_07_31_035758_create_categories_table', 1),
(10, '2023_07_31_040048_create_items_table', 1),
(11, '2023_07_31_040202_create_stock_table', 1),
(12, '2023_09_01_031508_create_data_toko_table', 2),
(13, '2023_09_01_033500_create_data_peminjam_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_barang`
--

CREATE TABLE `status_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tersedia` int(11) NOT NULL DEFAULT 0,
  `rusak` int(11) NOT NULL DEFAULT 0,
  `dipinjam` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_barang`
--

INSERT INTO `status_barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `nama_toko`, `tersedia`, `rusak`, `dipinjam`, `created_at`, `updated_at`) VALUES
(1, 'a001', 'komputer', 5, 'bec', 32, 3, -23, '2023-09-13 00:39:16', '2023-09-13 02:15:47'),
(2, 'B001', 'Hp', 5, 'olimpic', 10, 0, -5, '2023-09-13 01:50:47', '2023-09-13 02:13:21'),
(3, 'B001', 'Hp', 5, 'bec', 0, 0, 10, '2023-09-13 01:51:17', '2023-09-13 01:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `status_pinjam`
--

CREATE TABLE `status_pinjam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pinjam','Kembalikan','Rusak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dipinjam` int(11) NOT NULL DEFAULT 0,
  `dikembalikan` int(11) NOT NULL DEFAULT 0,
  `rusak` int(11) NOT NULL DEFAULT 0,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `tgl_rusak` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `tgl_beli` date NOT NULL,
  `foto_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_kwitansi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_toko` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_harga` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super_admin','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dani', 'Dani12', 'danik@gmail.com', 'super_admin', '$2y$10$WEZBElq5GljqEvlezziq9.Nm7PHVubJfOxaqYxBZCknHXxzJGHBgG', NULL, '2023-09-07 06:00:50', '2023-09-07 06:00:50'),
(4, 'MALIK', 'Malik12', 'malik@gmail.com', 'admin', '$2y$10$xLgfSzcXJ5O8Hs9cdZbPCO2U4J2stxvFi1NCc2jpoHnqo3QYeIx6C', NULL, '2023-09-11 00:10:50', '2023-09-11 00:29:52'),
(5, 'Sananta', 'Gr22', 'gilang@gamil.com', 'admin', '$2y$10$5TCD9Cq85q8OnDFhHXiebeB7g3IfLxPcdReBpYtC8JXQfbAiAt0tu', NULL, '2023-09-11 00:19:13', '2023-09-11 05:50:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `data_peminjam`
--
ALTER TABLE `data_peminjam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_toko`
--
ALTER TABLE `data_toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `status_barang`
--
ALTER TABLE `status_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_barang_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `status_pinjam`
--
ALTER TABLE `status_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `data_peminjam`
--
ALTER TABLE `data_peminjam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_toko`
--
ALTER TABLE `data_toko`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_barang`
--
ALTER TABLE `status_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status_pinjam`
--
ALTER TABLE `status_pinjam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `status_barang`
--
ALTER TABLE `status_barang`
  ADD CONSTRAINT `status_barang_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;
--
-- Database: `inventory`
--
CREATE DATABASE IF NOT EXISTS `inventory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inventory`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `nama`, `telepon`, `foto`) VALUES
(12, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '0812838281', '22092020020607employee1.png'),
(19, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user 1', '0812838281', '22092020020520employee3.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ajuan`
--

CREATE TABLE `tb_ajuan` (
  `no_ajuan` int(11) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `kode_brg` varchar(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `jml_ajuan` int(11) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  `val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ajuan`
--

INSERT INTO `tb_ajuan` (`no_ajuan`, `tanggal`, `kode_brg`, `nama_brg`, `stok`, `jml_ajuan`, `petugas`, `val`) VALUES
(112, '2020-09-22', '92938', 'Ssd IOS 1 tb', 91, 2, 'Petugas', 1),
(212, '2020-09-22', '92938', 'Ssd IOS 1 tb', 91, 3, 'Petugas', 1),
(222, '2020-09-22', '99105', 'Handphone Maus', 13, 2, 'Petugas', 0),
(224, '2020-09-22', '92938', 'Ssd IOS 1 tb', 91, 2, 'Petugas', 0),
(990, '2020-09-22', '99101', 'Flashdisk 12 gb', 1, 2, 'Kliment Vederov', 0),
(992, '2020-09-19', '99102', 'Handphone Xue hua piao piao', 93, 1, 'Petugas 1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `rak` varchar(255) NOT NULL,
  `supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_brg`, `nama_brg`, `stok`, `rak`, `supplier`) VALUES
(99101, 'Flashdisk 12 gb', 23, 'RAK 001', 'CV.Abadi Sentosa'),
(99102, 'Handphone T34', 70, 'RAK 001', 'CV.Abadi Sentosa'),
(99103, 'Laptop Rock', 11, 'RAK 001', 'CV.Abadi Sentosa'),
(99105, 'Handphone Maus', 13, 'RAK 001', 'CV.Abadi Sentosa');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_in`
--

CREATE TABLE `tb_barang_in` (
  `id_brg_in` int(11) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `noinv` varchar(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `kode_brg` varchar(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `jml_masuk` int(11) NOT NULL,
  `jam` varchar(255) NOT NULL,
  `petugas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang_in`
--

INSERT INTO `tb_barang_in` (`id_brg_in`, `tanggal`, `noinv`, `supplier`, `kode_brg`, `nama_brg`, `stok`, `jml_masuk`, `jam`, `petugas`) VALUES
(1, '19-12-2002', '1', 'CV. Tes', '22922', 'Kancut', 11, 22, '07.00', 'Budi\r\n'),
(5, '2020-09-19', '001', 'CV.Abadi Sentosa', '99102', 'Handphone Xue hua piao piao', 92, 1, '10:11 am', 'Hibiki Chan <3  >_<'),
(7, '2020-09-19', '001', 'CV.Abadi Sentosa', '99102', 'Handphone Xue hua piao piao', 93, 1, '10:58 am', 'Petugas satu'),
(8, '2020-09-22', '0022', 'CV.Abadi Sentosa', '93333', 'Speaker Diskotik', 22, 9, '07:28 am', 'Petugas'),
(9, '2020-09-22', '121', 'CV Indah Pertiwi', '99101', 'Flashdisk 12 gb', 1, 22, '09:49 am', 'Petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_out`
--

CREATE TABLE `tb_barang_out` (
  `no_brg_out` int(11) NOT NULL,
  `no_ajuan` int(11) NOT NULL,
  `tanggal_ajuan` varchar(255) NOT NULL,
  `tanggal_out` varchar(255) NOT NULL,
  `petugas` varchar(255) NOT NULL,
  `kode_brg` varchar(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `jml_ajuan` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang_out`
--

INSERT INTO `tb_barang_out` (`no_brg_out`, `no_ajuan`, `tanggal_ajuan`, `tanggal_out`, `petugas`, `kode_brg`, `nama_brg`, `stok`, `jml_ajuan`, `jml_keluar`, `admin`) VALUES
(115, 990, '2020-09-22', '2020-09-22', 'Kliment Vederov', '99101', 'Flashdisk 12 gb', 3, 2, 2, 'admin'),
(123, 933, '2020-09-20', '2020-09-22', 'Viktor Reznov', '99102', 'Handphone Xue hua piao piao', 71, 1, 1, 'admin'),
(124, 222, '2020-09-22', '2020-09-22', 'Petugas', '99105', 'Handphone Maus', 15, 2, 2, 'admin'),
(133, 224, '2020-09-22', '2020-09-22', 'Petugas', '92938', 'Ssd IOS 1 tb', 93, 2, 2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `username`, `password`, `nama`, `telepon`) VALUES
(11, 'Abdul', 'e80a0702d314d055d05af996fe60cff9', 'Kliment Vederov', '0812822929'),
(12, 'petugas1', 'd41d8cd98f00b204e9800998ecf8427e', 'Lyudmilla Pavlichenko', '0812838281'),
(14, 'biksu', 'd41d8cd98f00b204e9800998ecf8427e', 'Leonid Budovkin', '0812822929'),
(15, 'viktor', '4e3c1f58d4ace2057d5e18f4a5a478fb', 'Viktor Reznov', '081282939999'),
(16, 'vlad', 'd701fde59d74f76803087b6632186caf', 'Vladimir Vorosilov', '0812838222'),
(17, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'Petugas', '081280328889');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rak`
--

CREATE TABLE `tb_rak` (
  `id_rak` int(11) NOT NULL,
  `nama_rak` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_rak`
--

INSERT INTO `tb_rak` (`id_rak`, `nama_rak`) VALUES
(1, 'RAK 001'),
(2, 'RAK 002\r\n'),
(3, 'RAK 003'),
(5, 'RAK 004');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sup`
--

CREATE TABLE `tb_sup` (
  `id_sup` int(11) NOT NULL,
  `nama_sup` varchar(255) NOT NULL,
  `kontak_sup` varchar(255) NOT NULL,
  `alamat_sup` text NOT NULL,
  `telepon_sup` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_sup`
--

INSERT INTO `tb_sup` (`id_sup`, `nama_sup`, `kontak_sup`, `alamat_sup`, `telepon_sup`) VALUES
(1, 'CV.Abadi Sentosa', 'Absentosa.gmail.com', 'Jl. Pekan 5 Pasarbaru km 2', '081208828388'),
(2, 'CV.Matahari', 'Matahari@aman.com', 'JL. Matahari', '0820283882883\r\n'),
(3, 'CV Indah Pertiwi', 'Indah@pertiwi.com', 'Jl. Makmur raya', '081202928382'),
(4, 'PT budi beriman sangat', 'Budi@gmail.com', 'Jl. Mekarpati Km 10', '081292039992'),
(5, 'CV. Ayu Senja', 'Santay@gmail.com', 'Pantai Jingga, KM 01', '081202928322');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_ajuan`
--
ALTER TABLE `tb_ajuan`
  ADD PRIMARY KEY (`no_ajuan`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `tb_barang_in`
--
ALTER TABLE `tb_barang_in`
  ADD PRIMARY KEY (`id_brg_in`);

--
-- Indexes for table `tb_barang_out`
--
ALTER TABLE `tb_barang_out`
  ADD PRIMARY KEY (`no_brg_out`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tb_rak`
--
ALTER TABLE `tb_rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- Indexes for table `tb_sup`
--
ALTER TABLE `tb_sup`
  ADD PRIMARY KEY (`id_sup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_ajuan`
--
ALTER TABLE `tb_ajuan`
  MODIFY `no_ajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=998;

--
-- AUTO_INCREMENT for table `tb_barang_in`
--
ALTER TABLE `tb_barang_in`
  MODIFY `id_brg_in` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_rak`
--
ALTER TABLE `tb_rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_sup`
--
ALTER TABLE `tb_sup`
  MODIFY `id_sup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `korban`
--
CREATE DATABASE IF NOT EXISTS `korban` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `korban`;

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
(1, '0000-00-00', '123', 'Ramad', 'XI-RPL-1', 'Bandung', '2023-05-26', 'laki-laki', '089712361', 'gil@gmail.com', 'Warlob'),
(2, '0000-00-00', '2345', 'malik', 'XII-RPL-1', 'soreang', '2023-05-12', 'laki-laki', '028923', 'e@gmail.com', 'ahdhads');

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
(1, 'Admin', 'a3122685eb7ef848ab7633c0e0e9b0d8', 'admin');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`);

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
  MODIFY `no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ramad', 'ramad@gmail.com', 'çoba', NULL, '2023-06-01 20:37:09', '2023-06-01 20:41:17'),
(2, 'Gilang', 'gilang@gmail.com', '$2y$10$kr9DXi7IL6lXKcL5hBiZe.3SOcsbGNHbZbPNyq7xZnQ/sFeVZzRnO', NULL, '2023-06-01 20:49:34', '2023-06-01 20:49:34'),
(6, 'rahma', 'rahma@gmail.com', '$2y$10$lonBXWQK7VZj6Uj6FBwimuT.jU98htWav4lLsfrBjtuO6452W0CGe', 'xkLjci2s4HxZCSPQfthkpUauAv1992ARzFa1mNvkUqkD2jfmnxdPpzS1yXNU', '2023-06-18 21:19:22', '2023-06-18 21:19:22'),
(7, 'Malik', 'Malik@gmail.com', '$2y$10$TaTnWC75qC3tO.tq5JfYkefd8S0uTpScY//tM7eeqdXTxSI4/XgzG', NULL, '2023-06-19 01:02:21', '2023-06-19 01:02:21'),
(8, 'Ramadhan', 'gil@gmail.com', '$2y$10$LyPtgg9/hzt714x7AnUequ8d9DVxlGIGV5sGCcXGRKSJQ8N72JL1m', NULL, '2023-06-21 01:50:25', '2023-06-21 01:50:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `larav_siswa`
--
CREATE DATABASE IF NOT EXISTS `larav_siswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `larav_siswa`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_08_070940_create_siswas_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `me1`
--
CREATE DATABASE IF NOT EXISTS `me1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `me1`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga_barang` int(15) DEFAULT NULL,
  `jumlah_barang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `jumlah_barang`) VALUES
(1, 'celana', 20000, 1),
(2, 'baju', 30000, 2),
(3, 'topi', 15000, 3),
(4, 'buku', 10000, 4),
(5, 'pulpen', 2000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_siswa`
--

CREATE TABLE `data_siswa` (
  `nis` int(9) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_siswa`
--

INSERT INTO `data_siswa` (`nis`, `nama`, `kelas`, `alamat`, `phone`) VALUES
(12, 'izal', 'XI', 'huh', '082132'),
(23, 'kanxa', 'X', 'cicukang', '08182'),
(121, 'gilang', 'X', 'warlob', '08921'),
(122, 'uut', 'X', 'warlob', '01823'),
(123, 'izal', 'XI', '', ''),
(203, 'adnan', 'X', 'ciwidey', '0132'),
(823, 'ikbal', 'XI', 'warlob', '120'),
(7823, 'abas', 'XI', 'warlob', '082423'),
(23723, 'grku', 'X', 'uhu', '01212'),
(86746374, 'zizan', 'XI', 'jhgg', '0857423632');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `jenis` varchar(25) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `jenis`, `keterangan`) VALUES
(1, 'tugas', 'complete'),
(2, 'UH', 'complete'),
(4, 'UTS', 'complete'),
(5, 'PAS', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(25) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`, `keterangan`) VALUES
(1, 'pwpb', 'produktif'),
(2, 'ppl', 'produktif'),
(3, 'PKK', 'produktif'),
(4, 'basdat', 'produktif');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nis` int(9) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nis`, `id_jenis`, `id_mapel`, `nilai`, `keterangan`) VALUES
(1, 86746374, 1, 2, 85, 'atas kkm'),
(2, 121, 1, 1, 70, 'bawah kkm'),
(3, 12, 2, 2, 50, 'Remedial'),
(4, 203, 1, 1, 79, 'Diatas KKM'),
(5, 823, 2, 1, 80, 'Diatas KKM'),
(6, 23723, 2, 4, 89, 'Diatas KKM'),
(7, 122, 1, 3, 80, 'Diatas KKM'),
(8, 122, 1, 3, 80, 'Diatas KKM'),
(9, 23723, 2, 4, 89, 'Diatas KKM');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`) VALUES
('malik', '$nama=malik;', ''),
('admin', 'admin01', ''),
('coba', 'coba134', ''),
('dafa', '123', ''),
('gilang', 'ramadhan', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`),
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `nilai_ibfk_4` FOREIGN KEY (`nis`) REFERENCES `data_siswa` (`nis`);
--
-- Database: `pbo`
--
CREATE DATABASE IF NOT EXISTS `pbo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pbo`;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tiket`
--

CREATE TABLE `jenis_tiket` (
  `id_tiket` int(11) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `haraga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_tiket`
--

INSERT INTO `jenis_tiket` (`id_tiket`, `kelas`, `haraga`) VALUES
(1, 'vip', 1000000),
(2, 'Premium', 500000),
(3, 'Standar', 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `konser`
--

CREATE TABLE `konser` (
  `id` int(30) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_tiket` int(11) NOT NULL,
  `hp` varchar(16) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `tanggal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konser`
--

INSERT INTO `konser` (`id`, `nama`, `email`, `id_tiket`, `hp`, `alamat`, `tanggal`) VALUES
(23, 'huhu', 'hhu@gmail', 2, '0912371', 'warlob', '2023-5-7'),
(123, ' Gilang R', 'gilang@gamail', 2, '0823942', 'warlob', '2023-3-27'),
(1234, 'nur', 'nur@gmail.com', 1, '0182319', 'soreang', '2023-3-27');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `nama`) VALUES
('hu', '123', 'hu'),
('fazar', '12345', 'fazar'),
('Gilang', '123456', 'ramad'),
('gilang', 'ramadhan', 'gilang'),
('memek', 'konttl', 'galangs'),
('ikbal', '12345', 'ha'),
('gilang', '123456', 'ramadhan'),
('kepo', '12345678', 'bam'),
('ramad', 'gilang123', 'gil'),
('gilangr', 'ramadhan22', 'ramad'),
('bu susan', '1234', 'ra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_tiket`
--
ALTER TABLE `jenis_tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- Indexes for table `konser`
--
ALTER TABLE `konser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `konser`
--
ALTER TABLE `konser`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12132;
--
-- Database: `pw`
--
CREATE DATABASE IF NOT EXISTS `pw` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pw`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jeniskelamin` enum('cowo','cewe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `nama`, `jeniskelamin`, `jurusan`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Apriani', 'cowo', 'TJKT', 'Jasa Pembuat Website Caleg.png', '2023-07-08 21:00:02', '2023-07-10 07:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_11_010106_create_employees_table', 1),
(6, '2023_06_18_113148_add_search_field_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('super','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `search` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `google_id`, `role`, `remember_token`, `created_at`, `updated_at`, `search`) VALUES
(1, 'Gilang Super', 'gil@gmail.com', NULL, '$2y$10$n.0MfNV2aKhw0JLXyznm9ekhsTBAA.WBv0O5ggaY7rINQCmwGtB.2', NULL, 'super', NULL, '2023-07-06 00:40:16', '2023-07-06 00:40:16', NULL),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$vA1jrqCRkKgdGkd4kBSMMuQ.1UjkwvdYwZhlNB7TIm9eR/A2cf6s.', NULL, 'admin', NULL, '2023-07-06 00:40:16', '2023-07-06 00:40:16', NULL),
(8, 'abas', 'aba@gmail.com', NULL, '$2y$10$CmPqB4p6IV1LF8Rl1EAj4O2R/3UYRP2osiEEOWe/k7DfY6SlOr1hO', NULL, 'admin', NULL, '2023-07-07 22:21:58', '2023-07-07 22:21:58', NULL),
(9, 'Ahmad', 'ahmad@gmail.com', NULL, '$2y$10$T4IRLm35INR9qrN56fENfujnX293.3mxGhBY5JGfBTOKKtSoNVWrq', NULL, 'admin', NULL, '2023-07-07 22:48:26', '2023-07-07 22:48:26', NULL),
(10, 'Ramadhan', 'ramad@gmail.com', NULL, '$2y$10$Ytr7109Mju6nFdhcWJRv6eAeh0BdQXB.a7AEEz5MzlSedgtUNY92m', NULL, 'admin', NULL, '2023-07-07 23:32:28', '2023-07-07 23:32:28', NULL),
(11, 'Malik', 'Malik@gmail.com', NULL, '$2y$10$tgNg7oGF9t4hbJiGFtb1/Oj1P8IHo98ANAkcXv6LckJ0Fn0NjScHu', NULL, 'admin', NULL, '2023-07-07 23:39:09', '2023-07-07 23:39:09', NULL),
(12, 'Dani', 'dani@gmail.com', NULL, '$2y$10$v.mBj9W.Tqp4kONSmC0OoezZtoaarDiCWRK/p4CkWic.IrK8zJIxS', NULL, 'admin', NULL, '2023-07-07 23:45:27', '2023-07-07 23:45:27', NULL),
(13, 'Ramad Gil', 'gilramad52@gmail.com', NULL, NULL, NULL, 'super', NULL, '2023-07-07 23:49:38', '2023-07-07 23:49:38', NULL),
(14, 'putra', 'putra@gmail.com', NULL, '$2y$10$mr69wxrC/bp3TA3R0XbeJOWUcM6LUM9W5s.keH71jQvShDhkSvxt.', NULL, 'admin', NULL, '2023-07-08 20:27:47', '2023-07-08 20:27:47', NULL),
(15, 'GILANG .R', 'gilramad011@gmail.com', NULL, NULL, NULL, 'super', NULL, '2023-07-08 20:59:20', '2023-07-08 20:59:20', NULL),
(16, 'Dani', 'e@gmail.com', NULL, '$2y$10$7bFyXyf8i9QeK/yOE.GjMe5zRDUR/xaN6hO2iv6CPVIoJilgY9boO', NULL, 'admin', NULL, '2023-07-10 20:24:49', '2023-07-10 20:24:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Database: `pwpb`
--
CREATE DATABASE IF NOT EXISTS `pwpb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pwpb`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `judu_buku` varchar(30) DEFAULT NULL,
  `stock_buku` int(5) DEFAULT NULL,
  `penulis_buku` varchar(30) DEFAULT NULL,
  `penerbit_buku` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kembali`
--

CREATE TABLE `kembali` (
  `id_kembali` int(5) NOT NULL,
  `kembali` varchar(30) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id_pinjam` int(5) NOT NULL,
  `pinjam` varchar(30) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`id_kembali`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
--
-- Database: `rumah`
--
CREATE DATABASE IF NOT EXISTS `rumah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rumah`;

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `no` int(20) NOT NULL,
  `nama_barang` varchar(70) NOT NULL,
  `stok` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`no`, `nama_barang`, `stok`) VALUES
(9, 'berlian', 3),
(10, 'penggaris', 12),
(11, 'kertas', 21),
(12, 'laptop ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_siswa`
--

CREATE TABLE `data_siswa` (
  `nis` int(12) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelas` varchar(32) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `mapel` varchar(30) NOT NULL,
  `jenis_penilaian` varchar(20) NOT NULL,
  `nilai` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_siswa`
--

INSERT INTO `data_siswa` (`nis`, `nama`, `kelas`, `alamat`, `no_hp`, `mapel`, `jenis_penilaian`, `nilai`) VALUES
(1, 'hadush', 'sadsa', 'sdas', 9234, 'ipa', 'UTS', 60),
(3, 'Gilang Ramadan', 'xi-rpl 1', 'warunglobak', 899432, 'ipa', 'UH', 85);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_nilai`
--

CREATE TABLE `jenis_nilai` (
  `id_jenis` int(30) NOT NULL,
  `penilaian` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_nilai`
--

INSERT INTO `jenis_nilai` (`id_jenis`, `penilaian`, `keterangan`) VALUES
(1, 'UH', 'lulus'),
(2, 'UTS', 'lulus'),
(4, '90', 'lulus');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE `murid` (
  `nis` int(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `noHp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`nis`, `nama`, `kelas`, `alamat`, `noHp`) VALUES
(12, 'juju', 'k12', 'UH', 80),
(23, 'dani', 'pplh10', 'UH', 12),
(73, 'huhuh', '19', 'UH', 98),
(123, 'gilang', '11 rpl', 'UH', 90),
(211, 'huh', '11', 'UH', 78),
(1213, 'malik', '12', 'UH', 90),
(3423, 'kuku', '10bp', 'katapang', 7324824),
(3435, 'alul', '23', 'ada', 1923),
(7624, 'jadi', '274g', 'ad', 723987);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(20) NOT NULL,
  `nis_nilai` int(16) NOT NULL,
  `id_jenis_nilai` int(20) NOT NULL,
  `nilai` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nis_nilai`, `id_jenis_nilai`, `nilai`) VALUES
(23, 123, 1, 88),
(34, 3423, 4, 67);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `username`, `password`) VALUES
(1, 'rumah', 'dudi', 'fb2722965a3452cd96f27fbfb5beeca1'),
(3, 'fazar', 'fazar', '4e4d6c332b6fe62a63afe56171fd3725'),
(5, 'ahsan', 'ahsan01', '8ba97607a1485ccdbe19745ed80cd52d'),
(11, 'siswa', 'ahmad', 'c168c2f78558ed3a3b69a5ec3574cf11'),
(12, 'siswa', 'vingki', 'aec07f935649a5b028c070251f617de7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `jenis_nilai`
--
ALTER TABLE `jenis_nilai`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_jenis` (`id_jenis_nilai`),
  ADD KEY `nis` (`nis_nilai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_barang`
--
ALTER TABLE `data_barang`
  MODIFY `no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jenis_nilai`
--
ALTER TABLE `jenis_nilai`
  MODIFY `id_jenis` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_jenis_nilai`) REFERENCES `jenis_nilai` (`id_jenis`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nis_nilai`) REFERENCES `murid` (`nis`);
--
-- Database: `siswa`
--
CREATE DATABASE IF NOT EXISTS `siswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `siswa`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id` int(16) NOT NULL,
  `kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id`, `kelas`) VALUES
(1, 'elektro'),
(2, 'elektro'),
(3, 'elekro'),
(4, 'bp');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id` int(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id`, `nama`, `id_kelas`) VALUES
(1, 'Dodi', 1),
(2, 'iji', 2),
(3, 'kuring', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `tb_barang`
--
CREATE DATABASE IF NOT EXISTS `tb_barang` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tb_barang`;

-- --------------------------------------------------------

--
-- Table structure for table `data_warga`
--

CREATE TABLE `data_warga` (
  `nik` int(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `ttl` varchar(30) NOT NULL,
  `agama` varchar(16) NOT NULL,
  `no_hp` int(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_warga`
--

INSERT INTO `data_warga` (`nik`, `nama`, `alamat`, `pekerjaan`, `ttl`, `agama`, `no_hp`, `email`, `foto`) VALUES
(2323, 'all', 'junti', 'ibu', 'kurs / 2023-02-16', 'islam', 899, 'gu@huhuh', ''),
(3403, 'gilang ', 'jkdad', 'usaha', 'bener / 2023-02-15', 'islam', 93274397, '@gil.com', ''),
(13123, 'juju', 'warlob', 'guru', 'bansung / 2023-02-02', 'islam', 29473, '@juju', 'th.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kd_kat` varchar(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`kd_kat`, `nama_kategori`) VALUES
('01', 'makanan'),
('02', 'minuman'),
('03', 'alatrt'),
('04', 'bumbud'),
('05', 'elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `kat_barang`
--

CREATE TABLE `kat_barang` (
  `kd_barang` int(3) NOT NULL,
  `kd_kat` varchar(5) NOT NULL,
  `nme_kat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kat_barang`
--

INSERT INTO `kat_barang` (`kd_barang`, `kd_kat`, `nme_kat`) VALUES
(1, 'g22a1', 'Makanan'),
(2, 'g22a1', 'Makanan'),
(3, 'g22a1', 'Makanan'),
(4, 'g22a1', 'Makanan'),
(5, 'g22a2', 'Minuman'),
(6, 'g22a2', 'Minuman'),
(7, 'g22a2', 'Minuman'),
(8, 'g22a2', 'Minuman'),
(9, 'g22a3', 'AlatRT'),
(10, 'g22a3', 'AlatRT'),
(11, 'g22a3', 'AlatRT'),
(12, 'g22a3', 'AlatRT'),
(13, 'g22a4', 'Bumbu'),
(14, 'g22a4', 'Bumbu'),
(15, 'g22a4', 'Bumbu'),
(16, 'g22a4', 'Bumbu'),
(17, 'g22a5', 'Elektronik'),
(18, 'g22a5', 'Elektronik'),
(19, 'g22a5', 'Elektronik'),
(20, 'g22a5', 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `no_bar`
--

CREATE TABLE `no_bar` (
  `no` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `no_bar`
--

INSERT INTO `no_bar` (`no`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kd_barang` int(3) NOT NULL,
  `no_bar` int(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_barang` int(10) NOT NULL,
  `kd_kategori` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kd_barang`, `no_bar`, `nama_barang`, `harga_barang`, `kd_kategori`) VALUES
(1, 1, 'oreo', 8000, '01'),
(2, 2, 'taro', 1000, '01'),
(3, 3, 'roti', 5000, '01'),
(4, 4, 'misedap', 2900, '01'),
(5, 5, 'tehpucuk', 3000, '02'),
(6, 6, 'fruittea', 6000, '02'),
(7, 7, 'teazegar', 1000, '02'),
(8, 8, 'ultramilk', 5000, '02'),
(9, 9, 'sapu', 17000, '03'),
(10, 10, 'alatpel', 20000, '03'),
(11, 11, 'speaker', 300000, '03'),
(12, 12, 'sikat', 50000, '03'),
(13, 13, 'royko', 12000, '04'),
(14, 14, 'masako', 12000, '04'),
(15, 15, 'jahe', 15000, '04'),
(16, 16, 'cabe', 30000, '04'),
(17, 17, 'mouse', 50000, '05'),
(18, 18, 'mejicom', 300000, '05'),
(19, 19, 'laptop', 4000000, '05'),
(20, 20, 'komputer', 5000000, '05');

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `id_bar` int(5) NOT NULL,
  `tanggal` varchar(150) NOT NULL,
  `nota` int(5) NOT NULL,
  `kd_bar` int(3) NOT NULL,
  `beli` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`id_bar`, `tanggal`, `nota`, `kd_bar`, `beli`) VALUES
(1, 'Monday 31st of October 2022 04:01:18 PM', 134, 3, 11),
(2, 'Monday 31st of October 2022 04:03:29 PM', 456, 1, 1),
(4, 'Monday 31st of October 2022 04:08:16 PM', 527, 4, 1),
(9, 'Monday 31st of October 2022 11:01:22 PM', 885, 2, 3),
(10, 'Monday 31st of October 2022 11:01:22 PM', 885, 2, 3),
(11, 'Monday 31st of October 2022 11:01:22 PM', 885, 2, 3),
(14, 'Monday 31st of October 2022 11:01:22 PM', 885, 2, 3),
(25, 'Tuesday 1st of November 2022 05:26:04 AM', 714, 2, 1),
(26, 'Tuesday 1st of November 2022 05:29:07 AM', 736, 2, 4),
(41, 'Friday 31st of March 2023 04:32:10 PM', 36, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `role`) VALUES
('gilang', 'a0474afafcc264aa0039e649736d8c80', 'admin'),
('gilang', '2b036ce7c4ae8e5304bb3ac6600edd03', 'guru'),
('yuyu', '871237bf25ba34556a2755fdf2f0ee44', 'admin'),
('ramadhan', '192bf1bb0c9d8e9a713f1969aa854316', 'murid'),
('siswa', '7038663cc684aa330956752c7e6fe7d4', 'jijik'),
('admin', '7e5f248802cc9c9e16ef72a59ede931e', 'nur123'),
('admin', 'ccbe2d1f204cfc2381ff4998f04eae52', 'jujur123'),
('example', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('malik', 'd41d8cd98f00b204e9800998ecf8427e', ''),
('malik', 'ed1e56ef963bb91c45a14a50c2f3cd95', 'admin'),
('malik', '5ddc47513696be03631bd326219bf74b', 'admin'),
('mal@gmail.com', '5ddc47513696be03631bd326219bf74b', 'admin'),
('abas', '6d9bb61367e886a11562846edf4fa35b', 'guru'),
('salman', 'b7b97c3bdbb4574435ead0f449ceebeb', 'anggota'),
('all', '03346657feea0490a4d4f677faa0583d', 'admin'),
('malik', 'b55178b011bfb206965f2638d0f87047', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_warga`
--
ALTER TABLE `data_warga`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kd_kat`);

--
-- Indexes for table `kat_barang`
--
ALTER TABLE `kat_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kd_barang`),
  ADD KEY `kd_kategori` (`kd_kategori`);

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`id_bar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kat_barang`
--
ALTER TABLE `kat_barang`
  MODIFY `kd_barang` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `kd_barang` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `trans`
--
ALTER TABLE `trans`
  MODIFY `id_bar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_barang` (`kd_kat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
