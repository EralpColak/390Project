-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2024 at 11:30 AM
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
-- Table structure for table `BOSAnalizi`
--

CREATE TABLE `BOSAnalizi` (
  `tc` bigint(20) DEFAULT NULL,
  `Renk` varchar(255) DEFAULT NULL,
  `Gorunum` varchar(255) DEFAULT NULL,
  `Miktar` float DEFAULT NULL,
  `Protein` float DEFAULT NULL,
  `Seker` float DEFAULT NULL,
  `LaktikAsit` float DEFAULT NULL,
  `Hucreler` float DEFAULT NULL,
  `Eritrosit` float DEFAULT NULL,
  `Lokosit` float DEFAULT NULL,
  `Monosit` float DEFAULT NULL,
  `Notrofil` float DEFAULT NULL,
  `Lenfosit` float DEFAULT NULL,
  `Eozinofil` float DEFAULT NULL,
  `Bazofil` float DEFAULT NULL,
  `EritrositSedimentasyonHizi` float DEFAULT NULL,
  `SitolojikDegerlendirme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dahiliye_testi`
--

CREATE TABLE `dahiliye_testi` (
  `tc` bigint(20) DEFAULT NULL,
  `HbA1c` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departmanlar`
--

CREATE TABLE `departmanlar` (
  `departman_id` int(11) NOT NULL,
  `departman_adı` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departmanlar`
--

INSERT INTO `departmanlar` (`departman_id`, `departman_adı`) VALUES
(1, 'Kardiyoloji'),
(2, 'Göğüs Hastalıkları'),
(3, 'Üroloji'),
(4, 'Kadın Doğum'),
(5, 'Nöroloji'),
(6, 'Ortopedi'),
(7, 'Dahiliye'),
(8, 'Enfeksiyon Hastalıkları'),
(9, 'Genel Cerrahi'),
(10, 'Kalp ve Damar Cerrahisi');

-- --------------------------------------------------------

--
-- Table structure for table `doktorlar`
--

CREATE TABLE `doktorlar` (
  `doktor_ıd` int(20) NOT NULL,
  `doktor_isim` varchar(255) DEFAULT NULL,
  `departman` varchar(255) DEFAULT NULL,
  `hastane` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `D_vitamini`
--

CREATE TABLE `D_vitamini` (
  `tc` bigint(20) DEFAULT NULL,
  `OH_Kalsiferol` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genelcerrahitesti`
--

CREATE TABLE `genelcerrahitesti` (
  `tc` bigint(20) DEFAULT NULL,
  `GGT` float DEFAULT NULL,
  `Bilirubin` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `görüntüleme`
--

CREATE TABLE `görüntüleme` (
  `tc` bigint(20) DEFAULT NULL,
  `görününtÜ` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hastaliklar`
--

CREATE TABLE `hastaliklar` (
  `hastalik_adi` varchar(255) NOT NULL,
  `departman_adı` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hastane`
--

CREATE TABLE `hastane` (
  `sehir` varchar(255) DEFAULT NULL,
  `hastane` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hemogram`
--

CREATE TABLE `hemogram` (
  `Hb` float DEFAULT NULL,
  `Hct` float DEFAULT NULL,
  `RBC` float DEFAULT NULL,
  `MCV` float DEFAULT NULL,
  `MCH` float DEFAULT NULL,
  `MCHC` float DEFAULT NULL,
  `RDW` float DEFAULT NULL,
  `Trombosit` float DEFAULT NULL,
  `WBC` float DEFAULT NULL,
  `Nötrofil` float DEFAULT NULL,
  `Lenfosit` float DEFAULT NULL,
  `Monosit` float DEFAULT NULL,
  `Eozinofil` float DEFAULT NULL,
  `Bazofil` float DEFAULT NULL,
  `tc` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hıvtest`
--

CREATE TABLE `hıvtest` (
  `tc` bigint(20) DEFAULT NULL,
  `AntiHIV` varchar(255) DEFAULT NULL,
  `HBsAg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kadındogum`
--

CREATE TABLE `kadındogum` (
  `tc` bigint(20) DEFAULT NULL,
  `bHCG` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kangazı`
--

CREATE TABLE `kangazı` (
  `tc` bigint(20) DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `PaO2` float DEFAULT NULL,
  `PaCO2` float DEFAULT NULL,
  `HCO3` float DEFAULT NULL,
  `O2S` float DEFAULT NULL,
  `BE` float DEFAULT NULL,
  `Laktat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `KardiyolojiTestleri`
--

CREATE TABLE `KardiyolojiTestleri` (
  `tc` bigint(20) DEFAULT NULL,
  `TroponinI` float DEFAULT NULL,
  `TroponinT` float DEFAULT NULL,
  `CK_MB` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kisisel_bilgiler`
--

CREATE TABLE `kisisel_bilgiler` (
  `tc` bigint(20) DEFAULT NULL,
  `isim` varchar(50) DEFAULT NULL,
  `soyisim` varchar(50) DEFAULT NULL,
  `cinsiyet` enum('Erkek','Kadın') DEFAULT NULL,
  `kan_grubu` enum('A Rh+','A Rh-','B Rh+','B Rh-','AB Rh+','AB Rh-','0 Rh+','0 Rh-') DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `aile_hekimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kisisel_bilgiler`
--

INSERT INTO `kisisel_bilgiler` (`tc`, `isim`, `soyisim`, `cinsiyet`, `kan_grubu`, `adres`, `aile_hekimi`) VALUES
(12345678900, 'Eralp', 'Çolak', 'Erkek', 'A Rh+', 'Gaziantep/şehitkamil', 'Dr Murat'),
(12345678955, 'Buse', 'Birinci', 'Erkek', 'A Rh+', 'samsun', 'Doktor Balımsu'),
(12345678941, 'Furkan', 'Özateş', 'Erkek', 'A Rh+', 'Ankara', 'İcardi'),
(12345678931, 'Eyyüpcan', 'İşler', 'Erkek', 'B Rh+', 'İzmir', 'İcardi'),
(12345678927, 'antepli', 'Balımsu', 'Erkek', '0 Rh+', 'Barak Ovası', 'Kılıçdaroğlu'),
(11123456789, '', '', 'Erkek', 'A Rh+', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `randevular`
--

CREATE TABLE `randevular` (
  `tc` bigint(20) DEFAULT NULL,
  `doktor_ıd` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register_info`
--

CREATE TABLE `register_info` (
  `tc` bigint(20) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_info`
--

INSERT INTO `register_info` (`tc`, `pwd`, `register_date`) VALUES
(11123456789, '1234', '2024-04-01 10:50:56'),
(12345678900, '1234', '2024-03-26 21:13:06'),
(12345678927, '2727', '2024-03-30 17:17:30'),
(12345678931, '1234', '2024-03-30 17:12:13'),
(12345678941, '5566', '2024-03-30 15:06:40'),
(12345678955, '5566', '2024-03-26 21:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `sorular`
--

CREATE TABLE `sorular` (
  `soru_id` bigint(20) NOT NULL,
  `soru_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soru_cevaplari`
--

CREATE TABLE `soru_cevaplari` (
  `tc` bigint(20) DEFAULT NULL,
  `soru_id` bigint(20) DEFAULT NULL,
  `soru_icerik` text DEFAULT NULL,
  `soru_cevap_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uroloji_testi`
--

CREATE TABLE `uroloji_testi` (
  `tc` bigint(20) DEFAULT NULL,
  `renk` float DEFAULT NULL,
  `gorunum` float DEFAULT NULL,
  `yogunluk` float DEFAULT NULL,
  `ph` float DEFAULT NULL,
  `protein` float DEFAULT NULL,
  `glukoz` float DEFAULT NULL,
  `ketondis` float DEFAULT NULL,
  `bilirubin` float DEFAULT NULL,
  `urobilinojen` float DEFAULT NULL,
  `nitrit` float DEFAULT NULL,
  `eritrosit` float DEFAULT NULL,
  `lokosit` float DEFAULT NULL,
  `silendir` float DEFAULT NULL,
  `bakteri` float DEFAULT NULL,
  `epitel_hucreleri` float DEFAULT NULL,
  `kristaller` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOSAnalizi`
--
ALTER TABLE `BOSAnalizi`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `dahiliye_testi`
--
ALTER TABLE `dahiliye_testi`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `departmanlar`
--
ALTER TABLE `departmanlar`
  ADD PRIMARY KEY (`departman_adı`),
  ADD KEY `departman_id` (`departman_id`);

--
-- Indexes for table `doktorlar`
--
ALTER TABLE `doktorlar`
  ADD PRIMARY KEY (`doktor_ıd`),
  ADD KEY `departman` (`departman`),
  ADD KEY `hastane` (`hastane`);

--
-- Indexes for table `D_vitamini`
--
ALTER TABLE `D_vitamini`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `genelcerrahitesti`
--
ALTER TABLE `genelcerrahitesti`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `görüntüleme`
--
ALTER TABLE `görüntüleme`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `hastaliklar`
--
ALTER TABLE `hastaliklar`
  ADD PRIMARY KEY (`hastalik_adi`),
  ADD KEY `departman_adı` (`departman_adı`);

--
-- Indexes for table `hastane`
--
ALTER TABLE `hastane`
  ADD PRIMARY KEY (`hastane`);

--
-- Indexes for table `hemogram`
--
ALTER TABLE `hemogram`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `hıvtest`
--
ALTER TABLE `hıvtest`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `kadındogum`
--
ALTER TABLE `kadındogum`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `kangazı`
--
ALTER TABLE `kangazı`
  ADD KEY `tc` (`tc`),
  ADD KEY `tc_2` (`tc`);

--
-- Indexes for table `KardiyolojiTestleri`
--
ALTER TABLE `KardiyolojiTestleri`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `kisisel_bilgiler`
--
ALTER TABLE `kisisel_bilgiler`
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `randevular`
--
ALTER TABLE `randevular`
  ADD KEY `tc` (`tc`),
  ADD KEY `doktor_ıd` (`doktor_ıd`);

--
-- Indexes for table `register_info`
--
ALTER TABLE `register_info`
  ADD PRIMARY KEY (`tc`);

--
-- Indexes for table `sorular`
--
ALTER TABLE `sorular`
  ADD PRIMARY KEY (`soru_id`);

--
-- Indexes for table `soru_cevaplari`
--
ALTER TABLE `soru_cevaplari`
  ADD KEY `soru_id` (`soru_id`),
  ADD KEY `tc` (`tc`);

--
-- Indexes for table `uroloji_testi`
--
ALTER TABLE `uroloji_testi`
  ADD KEY `tc` (`tc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departmanlar`
--
ALTER TABLE `departmanlar`
  MODIFY `departman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doktorlar`
--
ALTER TABLE `doktorlar`
  MODIFY `doktor_ıd` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sorular`
--
ALTER TABLE `sorular`
  MODIFY `soru_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOSAnalizi`
--
ALTER TABLE `BOSAnalizi`
  ADD CONSTRAINT `bosanalizi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dahiliye_testi`
--
ALTER TABLE `dahiliye_testi`
  ADD CONSTRAINT `dahiliye_testi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `doktorlar`
--
ALTER TABLE `doktorlar`
  ADD CONSTRAINT `doktorlar_ibfk_1` FOREIGN KEY (`departman`) REFERENCES `departmanlar` (`departman_adı`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `doktorlar_ibfk_2` FOREIGN KEY (`hastane`) REFERENCES `hastane` (`hastane`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `D_vitamini`
--
ALTER TABLE `D_vitamini`
  ADD CONSTRAINT `d_vitamini_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `genelcerrahitesti`
--
ALTER TABLE `genelcerrahitesti`
  ADD CONSTRAINT `genelcerrahitesti_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `görüntüleme`
--
ALTER TABLE `görüntüleme`
  ADD CONSTRAINT `görüntüleme_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `hastaliklar`
--
ALTER TABLE `hastaliklar`
  ADD CONSTRAINT `hastaliklar_ibfk_1` FOREIGN KEY (`departman_adı`) REFERENCES `departmanlar` (`departman_adı`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `hemogram`
--
ALTER TABLE `hemogram`
  ADD CONSTRAINT `hemogram_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `hıvtest`
--
ALTER TABLE `hıvtest`
  ADD CONSTRAINT `hıvtest_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kadındogum`
--
ALTER TABLE `kadındogum`
  ADD CONSTRAINT `kadındogum_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kangazı`
--
ALTER TABLE `kangazı`
  ADD CONSTRAINT `kangazı_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `KardiyolojiTestleri`
--
ALTER TABLE `KardiyolojiTestleri`
  ADD CONSTRAINT `kardiyolojitestleri_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kisisel_bilgiler`
--
ALTER TABLE `kisisel_bilgiler`
  ADD CONSTRAINT `kisisel_bilgiler_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`);

--
-- Constraints for table `randevular`
--
ALTER TABLE `randevular`
  ADD CONSTRAINT `randevular_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `randevular_ibfk_2` FOREIGN KEY (`doktor_ıd`) REFERENCES `doktorlar` (`doktor_ıd`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `soru_cevaplari`
--
ALTER TABLE `soru_cevaplari`
  ADD CONSTRAINT `soru_cevaplari_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `soru_cevaplari_ibfk_2` FOREIGN KEY (`soru_id`) REFERENCES `sorular` (`soru_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `uroloji_testi`
--
ALTER TABLE `uroloji_testi`
  ADD CONSTRAINT `uroloji_testi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
