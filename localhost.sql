-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 22 Nis 2024, 09:03:59
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `database_390`
--
CREATE DATABASE IF NOT EXISTS `database_390` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database_390`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `BOSAnalizi`
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
-- Tablo için tablo yapısı `dahiliye_testi`
--

CREATE TABLE `dahiliye_testi` (
  `tc` bigint(20) DEFAULT NULL,
  `HbA1c` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departmanlar`
--

CREATE TABLE `departmanlar` (
  `departman_id` int(11) NOT NULL,
  `departman_adı` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `departmanlar`
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
-- Tablo için tablo yapısı `doktorlar`
--

CREATE TABLE `doktorlar` (
  `doktor_ıd` int(20) NOT NULL,
  `doktor_isim` varchar(255) DEFAULT NULL,
  `departman` varchar(255) DEFAULT NULL,
  `hastane` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `doktorlar`
--

INSERT INTO `doktorlar` (`doktor_ıd`, `doktor_isim`, `departman`, `hastane`) VALUES
(5, 'Dr. Ali Yılmaz', 'Kardiyoloji', 'Ankara Şehir Hastanesi'),
(6, 'Dr. Selma Kaya', 'Göğüs Hastalıkları', 'Ankara Şehir Hastanesi'),
(7, 'Dr. Mustafa Karagöz', 'Üroloji', 'Ankara Şehir Hastanesi'),
(8, 'Dr. Fatma Yılmaz', 'Kadın Doğum', 'Ankara Şehir Hastanesi'),
(9, 'Dr. Murat Aksoy', 'Nöroloji', 'Ankara Şehir Hastanesi'),
(10, 'Dr. Ahmet Yıldız', 'Ortopedi', 'Ankara Şehir Hastanesi'),
(11, 'Dr. Ayşe Yıldız', 'Dahiliye', 'Ankara Şehir Hastanesi'),
(12, 'Dr. Mehmet Kaya', 'Enfeksiyon Hastalıkları', 'Ankara Şehir Hastanesi'),
(13, 'Dr. Deniz Yıldız', 'Genel Cerrahi', 'Ankara Şehir Hastanesi'),
(14, 'Dr. Fatma Kaya', 'Kalp ve Damar Cerrahisi', 'Ankara Şehir Hastanesi'),
(15, 'Dr. Mehmet Yılmaz', 'Kardiyoloji', 'Ankara Memorial Hospital'),
(16, 'Dr. Aylin Kaya', 'Göğüs Hastalıkları', 'Ankara Memorial Hospital'),
(17, 'Dr. Selim Karagöz', 'Üroloji', 'Ankara Memorial Hospital'),
(18, 'Dr. Zeynep Yıldız', 'Kadın Doğum', 'Ankara Memorial Hospital'),
(19, 'Dr. Emre Aksoy', 'Nöroloji', 'Ankara Memorial Hospital'),
(20, 'Dr. Nazlı Yıldız', 'Ortopedi', 'Ankara Memorial Hospital'),
(21, 'Dr. Murat Yıldız', 'Dahiliye', 'Ankara Memorial Hospital'),
(22, 'Dr. Elif Kaya', 'Enfeksiyon Hastalıkları', 'Ankara Memorial Hospital'),
(23, 'Dr. Mehmet Karagöz', 'Genel Cerrahi', 'Ankara Memorial Hospital'),
(24, 'Dr. Ayşe Yılmaz', 'Kalp ve Damar Cerrahisi', 'Ankara Memorial Hospital'),
(25, 'Dr. Elif Yıldız', 'Kardiyoloji', 'Ankara Üniversite Hastanesi'),
(26, 'Dr. Mehmet Kaya', 'Göğüs Hastalıkları', 'Ankara Üniversite Hastanesi'),
(27, 'Dr. Aylin Demir', 'Üroloji', 'Ankara Üniversite Hastanesi'),
(28, 'Dr. Ahmet Arslan', 'Kadın Doğum', 'Ankara Üniversite Hastanesi'),
(29, 'Dr. Zeynep Yılmaz', 'Nöroloji', 'Ankara Üniversite Hastanesi'),
(30, 'Dr. Selim Demir', 'Ortopedi', 'Ankara Üniversite Hastanesi'),
(31, 'Dr. Fatma Arslan', 'Dahiliye', 'Ankara Üniversite Hastanesi'),
(32, 'Dr. Murat Yıldırım', 'Enfeksiyon Hastalıkları', 'Ankara Üniversite Hastanesi'),
(33, 'Dr. Nazlı Kaya', 'Genel Cerrahi', 'Ankara Üniversite Hastanesi'),
(34, 'Dr. Mehmet Demir', 'Kalp ve Damar Cerrahisi', 'Ankara Üniversite Hastanesi'),
(35, 'Dr. Selim Yıldız', 'Kardiyoloji', 'Antalya Şehir Hastanesi'),
(36, 'Dr. Ayşe Kaya', 'Göğüs Hastalıkları', 'Antalya Şehir Hastanesi'),
(37, 'Dr. Mustafa Arslan', 'Üroloji', 'Antalya Şehir Hastanesi'),
(38, 'Dr. Zeynep Yıldırım', 'Kadın Doğum', 'Antalya Şehir Hastanesi'),
(39, 'Dr. Fatma Demir', 'Nöroloji', 'Antalya Şehir Hastanesi'),
(40, 'Dr. Mehmet Arslan', 'Ortopedi', 'Antalya Şehir Hastanesi'),
(41, 'Dr. Aylin Yıldırım', 'Dahiliye', 'Antalya Şehir Hastanesi'),
(42, 'Dr. Ahmet Kaya', 'Enfeksiyon Hastalıkları', 'Antalya Şehir Hastanesi'),
(43, 'Dr. Elif Yıldırım', 'Genel Cerrahi', 'Antalya Şehir Hastanesi'),
(44, 'Dr. Murat Arslan', 'Kalp ve Damar Cerrahisi', 'Antalya Şehir Hastanesi'),
(45, 'Dr. Aylin Yıldız', 'Kardiyoloji', 'Medical Center Hastanesi'),
(46, 'Dr. Selim Arslan', 'Göğüs Hastalıkları', 'Medical Center Hastanesi'),
(47, 'Dr. Zeynep Kaya', 'Üroloji', 'Medical Center Hastanesi'),
(48, 'Dr. Mehmet Yıldırım', 'Kadın Doğum', 'Medical Center Hastanesi'),
(49, 'Dr. Ayşe Arslan', 'Nöroloji', 'Medical Center Hastanesi'),
(50, 'Dr. Murat Yıldız', 'Ortopedi', 'Medical Center Hastanesi'),
(51, 'Dr. Elif Arslan', 'Dahiliye', 'Medical Center Hastanesi'),
(52, 'Dr. Mustafa Kaya', 'Enfeksiyon Hastalıkları', 'Medical Center Hastanesi'),
(53, 'Dr. Nazlı Yıldırım', 'Genel Cerrahi', 'Medical Center Hastanesi'),
(54, 'Dr. Fatma Kaya', 'Kalp ve Damar Cerrahisi', 'Medical Center Hastanesi'),
(55, 'Dr. Zeynep Arslan', 'Kardiyoloji', 'Antalya Üniversite Hastanesi'),
(56, 'Dr. Mehmet Kaya', 'Göğüs Hastalıkları', 'Antalya Üniversite Hastanesi'),
(57, 'Dr. Aylin Yıldız', 'Üroloji', 'Antalya Üniversite Hastanesi'),
(58, 'Dr. Selim Arslan', 'Kadın Doğum', 'Antalya Üniversite Hastanesi'),
(59, 'Dr. Ayşe Yıldırım', 'Nöroloji', 'Antalya Üniversite Hastanesi'),
(60, 'Dr. Murat Kaya', 'Ortopedi', 'Antalya Üniversite Hastanesi'),
(61, 'Dr. Elif Yıldız', 'Dahiliye', 'Antalya Üniversite Hastanesi'),
(62, 'Dr. Mustafa Arslan', 'Enfeksiyon Hastalıkları', 'Antalya Üniversite Hastanesi'),
(63, 'Dr. Nazlı Kaya', 'Genel Cerrahi', 'Antalya Üniversite Hastanesi'),
(64, 'Dr. Fatma Yıldırım', 'Kalp ve Damar Cerrahisi', 'Antalya Üniversite Hastanesi'),
(65, 'Dr. Mehmet Yıldırım', 'Kardiyoloji', 'Liv Hospital'),
(66, 'Dr. Aylin Arslan', 'Göğüs Hastalıkları', 'Liv Hospital'),
(67, 'Dr. Murat Kaya', 'Üroloji', 'Liv Hospital'),
(68, 'Dr. Elif Yıldız', 'Kadın Doğum', 'Liv Hospital'),
(69, 'Dr. Selim Arslan', 'Nöroloji', 'Liv Hospital'),
(70, 'Dr. Nazlı Yıldırım', 'Ortopedi', 'Liv Hospital'),
(71, 'Dr. Mehmet Arslan', 'Dahiliye', 'Liv Hospital'),
(72, 'Dr. Ayşe Yıldız', 'Enfeksiyon Hastalıkları', 'Liv Hospital'),
(73, 'Dr. Zeynep Kaya', 'Genel Cerrahi', 'Liv Hospital'),
(74, 'Dr. Mustafa Yıldırım', 'Kalp ve Damar Cerrahisi', 'Liv Hospital'),
(75, 'Dr. Zeynep Yıldırım', 'Kardiyoloji', 'Acıbadem Hastanesi'),
(76, 'Dr. Mehmet Arslan', 'Göğüs Hastalıkları', 'Acıbadem Hastanesi'),
(77, 'Dr. Ayşe Yıldız', 'Üroloji', 'Acıbadem Hastanesi'),
(78, 'Dr. Murat Kaya', 'Kadın Doğum', 'Acıbadem Hastanesi'),
(79, 'Dr. Selim Arslan', 'Nöroloji', 'Acıbadem Hastanesi'),
(80, 'Dr. Elif Yıldız', 'Ortopedi', 'Acıbadem Hastanesi'),
(81, 'Dr. Nazlı Kaya', 'Dahiliye', 'Acıbadem Hastanesi'),
(82, 'Dr. Mehmet Yıldırım', 'Enfeksiyon Hastalıkları', 'Acıbadem Hastanesi'),
(83, 'Dr. Aylin Arslan', 'Genel Cerrahi', 'Acıbadem Hastanesi'),
(84, 'Dr. Mustafa Yıldırım', 'Kalp ve Damar Cerrahisi', 'Acıbadem Hastanesi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `D_vitamini`
--

CREATE TABLE `D_vitamini` (
  `tc` bigint(20) DEFAULT NULL,
  `OH_Kalsiferol` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `genelcerrahitesti`
--

CREATE TABLE `genelcerrahitesti` (
  `tc` bigint(20) DEFAULT NULL,
  `GGT` float DEFAULT NULL,
  `Bilirubin` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `görüntüleme`
--

CREATE TABLE `görüntüleme` (
  `tc` bigint(20) DEFAULT NULL,
  `görününtÜ` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastaliklar`
--

CREATE TABLE `hastaliklar` (
  `hastalik_adi` varchar(255) NOT NULL,
  `departman_adı` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `hastaliklar`
--

INSERT INTO `hastaliklar` (`hastalik_adi`, `departman_adı`) VALUES
('Diabetes Mellitus', 'Dahiliye'),
('Hepatit B', 'Enfeksiyon Hastalıkları'),
('Kolelitiasis', 'Genel Cerrahi'),
('Metabolik Alkaloz', 'Göğüs Hastalıkları'),
('Metabolik Asidoz', 'Göğüs Hastalıkları'),
('Gebelik', 'Kadın Doğum'),
('Hemofili', 'Kalp ve Damar Cerrahisi'),
('Myokard Enfarktüsü', 'Kardiyoloji'),
('Menenjit', 'Nöroloji'),
('Osteoporoz', 'Ortopedi'),
('Ürolitiasis', 'Üroloji');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastane`
--

CREATE TABLE `hastane` (
  `sehir` varchar(255) DEFAULT NULL,
  `hastane` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `hastane`
--

INSERT INTO `hastane` (`sehir`, `hastane`) VALUES
('Bursa', 'Acıbadem Hastanesi'),
('Ankara', 'Ankara Memorial Hospital'),
('Ankara', 'Ankara Şehir Hastanesi'),
('Ankara', 'Ankara Üniversite Hastanesi'),
('Antalya', 'Antalya Şehir Hastanesi'),
('Antalya', 'Antalya Üniversite Hastanesi'),
('Samsun', 'Atasam Hastanesi'),
('Bursa', 'Bursa Şehir Hastanesi'),
('Samsun', 'Gazi Devlet Hastanesi'),
('İstanbul', 'İstanbul İstinye Hastanesi'),
('İstanbul', 'İstanbul Medical Park Hastanesi'),
('İstanbul', 'İstanbul Şehir Hastanesi'),
('Bursa', 'Liv Hospital'),
('Antalya', 'Medical Center Hastanesi'),
('Samsun', 'Samsun Eğitim Araştırma Hastanesi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hemogram`
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
-- Tablo için tablo yapısı `hıvtest`
--

CREATE TABLE `hıvtest` (
  `tc` bigint(20) DEFAULT NULL,
  `AntiHIV` varchar(255) DEFAULT NULL,
  `HBsAg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kadındogum`
--

CREATE TABLE `kadındogum` (
  `tc` bigint(20) DEFAULT NULL,
  `bHCG` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kangazı`
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
-- Tablo için tablo yapısı `KardiyolojiTestleri`
--

CREATE TABLE `KardiyolojiTestleri` (
  `tc` bigint(20) DEFAULT NULL,
  `TroponinI` float DEFAULT NULL,
  `TroponinT` float DEFAULT NULL,
  `CK_MB` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kisisel_bilgiler`
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
-- Tablo döküm verisi `kisisel_bilgiler`
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
-- Tablo için tablo yapısı `randevular`
--

CREATE TABLE `randevular` (
  `tc` bigint(20) DEFAULT NULL,
  `doktor_ıd` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `randevular`
--

INSERT INTO `randevular` (`tc`, `doktor_ıd`) VALUES
(12345678900, 80);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `register_info`
--

CREATE TABLE `register_info` (
  `tc` bigint(20) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `register_info`
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
-- Tablo için tablo yapısı `sorular`
--

CREATE TABLE `sorular` (
  `soru_id` bigint(20) NOT NULL,
  `soru_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru_cevaplari`
--

CREATE TABLE `soru_cevaplari` (
  `tc` bigint(20) DEFAULT NULL,
  `soru_id` bigint(20) DEFAULT NULL,
  `soru_icerik` text DEFAULT NULL,
  `soru_cevap_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uroloji_testi`
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
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `BOSAnalizi`
--
ALTER TABLE `BOSAnalizi`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `dahiliye_testi`
--
ALTER TABLE `dahiliye_testi`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `departmanlar`
--
ALTER TABLE `departmanlar`
  ADD PRIMARY KEY (`departman_adı`),
  ADD KEY `departman_id` (`departman_id`);

--
-- Tablo için indeksler `doktorlar`
--
ALTER TABLE `doktorlar`
  ADD PRIMARY KEY (`doktor_ıd`),
  ADD KEY `departman` (`departman`),
  ADD KEY `hastane` (`hastane`);

--
-- Tablo için indeksler `D_vitamini`
--
ALTER TABLE `D_vitamini`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `genelcerrahitesti`
--
ALTER TABLE `genelcerrahitesti`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `görüntüleme`
--
ALTER TABLE `görüntüleme`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `hastaliklar`
--
ALTER TABLE `hastaliklar`
  ADD PRIMARY KEY (`hastalik_adi`),
  ADD KEY `departman_adı` (`departman_adı`);

--
-- Tablo için indeksler `hastane`
--
ALTER TABLE `hastane`
  ADD PRIMARY KEY (`hastane`);

--
-- Tablo için indeksler `hemogram`
--
ALTER TABLE `hemogram`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `hıvtest`
--
ALTER TABLE `hıvtest`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `kadındogum`
--
ALTER TABLE `kadındogum`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `kangazı`
--
ALTER TABLE `kangazı`
  ADD KEY `tc` (`tc`),
  ADD KEY `tc_2` (`tc`);

--
-- Tablo için indeksler `KardiyolojiTestleri`
--
ALTER TABLE `KardiyolojiTestleri`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `kisisel_bilgiler`
--
ALTER TABLE `kisisel_bilgiler`
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `randevular`
--
ALTER TABLE `randevular`
  ADD KEY `tc` (`tc`),
  ADD KEY `doktor_ıd` (`doktor_ıd`);

--
-- Tablo için indeksler `register_info`
--
ALTER TABLE `register_info`
  ADD PRIMARY KEY (`tc`);

--
-- Tablo için indeksler `sorular`
--
ALTER TABLE `sorular`
  ADD PRIMARY KEY (`soru_id`);

--
-- Tablo için indeksler `soru_cevaplari`
--
ALTER TABLE `soru_cevaplari`
  ADD KEY `soru_id` (`soru_id`),
  ADD KEY `tc` (`tc`);

--
-- Tablo için indeksler `uroloji_testi`
--
ALTER TABLE `uroloji_testi`
  ADD KEY `tc` (`tc`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `departmanlar`
--
ALTER TABLE `departmanlar`
  MODIFY `departman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `doktorlar`
--
ALTER TABLE `doktorlar`
  MODIFY `doktor_ıd` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Tablo için AUTO_INCREMENT değeri `sorular`
--
ALTER TABLE `sorular`
  MODIFY `soru_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `BOSAnalizi`
--
ALTER TABLE `BOSAnalizi`
  ADD CONSTRAINT `bosanalizi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `dahiliye_testi`
--
ALTER TABLE `dahiliye_testi`
  ADD CONSTRAINT `dahiliye_testi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `doktorlar`
--
ALTER TABLE `doktorlar`
  ADD CONSTRAINT `doktorlar_ibfk_1` FOREIGN KEY (`departman`) REFERENCES `departmanlar` (`departman_adı`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `doktorlar_ibfk_2` FOREIGN KEY (`hastane`) REFERENCES `hastane` (`hastane`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `D_vitamini`
--
ALTER TABLE `D_vitamini`
  ADD CONSTRAINT `d_vitamini_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `genelcerrahitesti`
--
ALTER TABLE `genelcerrahitesti`
  ADD CONSTRAINT `genelcerrahitesti_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `görüntüleme`
--
ALTER TABLE `görüntüleme`
  ADD CONSTRAINT `görüntüleme_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `hastaliklar`
--
ALTER TABLE `hastaliklar`
  ADD CONSTRAINT `hastaliklar_ibfk_1` FOREIGN KEY (`departman_adı`) REFERENCES `departmanlar` (`departman_adı`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `hemogram`
--
ALTER TABLE `hemogram`
  ADD CONSTRAINT `hemogram_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `hıvtest`
--
ALTER TABLE `hıvtest`
  ADD CONSTRAINT `hıvtest_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `kadındogum`
--
ALTER TABLE `kadındogum`
  ADD CONSTRAINT `kadındogum_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `kangazı`
--
ALTER TABLE `kangazı`
  ADD CONSTRAINT `kangazı_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `KardiyolojiTestleri`
--
ALTER TABLE `KardiyolojiTestleri`
  ADD CONSTRAINT `kardiyolojitestleri_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `kisisel_bilgiler`
--
ALTER TABLE `kisisel_bilgiler`
  ADD CONSTRAINT `kisisel_bilgiler_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`);

--
-- Tablo kısıtlamaları `randevular`
--
ALTER TABLE `randevular`
  ADD CONSTRAINT `randevular_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `randevular_ibfk_2` FOREIGN KEY (`doktor_ıd`) REFERENCES `doktorlar` (`doktor_ıd`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `soru_cevaplari`
--
ALTER TABLE `soru_cevaplari`
  ADD CONSTRAINT `soru_cevaplari_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `soru_cevaplari_ibfk_2` FOREIGN KEY (`soru_id`) REFERENCES `sorular` (`soru_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `uroloji_testi`
--
ALTER TABLE `uroloji_testi`
  ADD CONSTRAINT `uroloji_testi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
