-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2024 at 11:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_390`
--

-- --------------------------------------------------------

--
-- Table structure for table `sorular`
--

CREATE TABLE `sorular` (
  `soru_id` bigint(20) NOT NULL,
  `soru_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sorular`
--

INSERT INTO `sorular` (`soru_id`, `soru_icerik`) VALUES
(1, 'Kalbinizde sıkışma hissediyor musunuz?'),
(2, 'Nefes darlığı yaşıyor musunuz?'),
(3, 'Böbreklerinizde şiddetli bir ağrı var mı?'),
(4, 'Gebelik sürecinde bazen sancı yaşıyor musunuz?'),
(5, 'Şiddetli baş dönmesi yaşıyor musunuz?'),
(6, 'Diz ağrınız var mı?\r\n'),
(7, 'Karnınızda sürekli bir ağrı var mı?'),
(8, 'Cildinizde veya ağız içinde son zamanlarda yeni lekeler veya döküntüler fark ettiniz mi?'),
(9, 'Karın bölgenizde ani, şiddetli bir ağrı veya hassasiyet yaşadınız mı?'),
(10, 'Ani nefes darlığı veya bacaklarınızda şişlik fark ettiniz mi?');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sorular`
--
ALTER TABLE `sorular`
  ADD PRIMARY KEY (`soru_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sorular`
--
ALTER TABLE `sorular`
  MODIFY `soru_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
