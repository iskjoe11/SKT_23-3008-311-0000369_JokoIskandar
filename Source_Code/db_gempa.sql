-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 09:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gempa`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_gempa`
--

CREATE TABLE `t_gempa` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `kedalaman` int(3) NOT NULL,
  `magnitude` float NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_gempa`
--

INSERT INTO `t_gempa` (`id`, `lokasi`, `deskripsi`, `kedalaman`, `magnitude`, `waktu`) VALUES
(1, 'Pusat gempa berada di darat 12 km tenggara lalundu Donggala', 'Gempa bumi terjadi pada hari Selasa, tanggal 29 Agustus 2023, pukul 02:55:32 WIB', 9, 4.3, '2023-10-29 10:55:18'),
(2, 'Pusat gempa berada di darat 12 km tenggara lalundu Donggala', 'Gempa bumi terjadi pada hari Selasa, tanggal 29 Agustus 2023, pukul 02:55:32 WIB', 9, 4.3, '2023-10-29 10:55:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_gempa`
--
ALTER TABLE `t_gempa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_gempa`
--
ALTER TABLE `t_gempa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
