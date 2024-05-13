-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 13 May 2024, 14:41:18
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
(84, 'Dr. Mustafa Yıldırım', 'Kalp ve Damar Cerrahisi', 'Acıbadem Hastanesi'),
(445, 'Dr. Berkcan Aksoy', 'Kardiyoloji', 'Liv Hospital'),
(446, 'Dr. Büşra Kaya', 'Kardiyoloji', 'Liv Hospital'),
(447, 'Dr. Canberk Yılmaz', 'Kardiyoloji', 'Liv Hospital'),
(448, 'Dr. Defne Demir', 'Göğüs Hastalıkları', 'Liv Hospital'),
(449, 'Dr. Emirhan Arıkan', 'Göğüs Hastalıkları', 'Liv Hospital'),
(450, 'Dr. Esra Taşkın', 'Göğüs Hastalıkları', 'Liv Hospital'),
(451, 'Dr. Furkan Kocaman', 'Üroloji', 'Liv Hospital'),
(452, 'Dr. İrem Arslan', 'Üroloji', 'Liv Hospital'),
(453, 'Dr. Kaan Yılmaz', 'Üroloji', 'Liv Hospital'),
(454, 'Dr. Melis Şahin', 'Kadın Doğum', 'Liv Hospital'),
(455, 'Dr. Onur Demirhan', 'Kadın Doğum', 'Liv Hospital'),
(456, 'Dr. Selin Aydın', 'Kadın Doğum', 'Liv Hospital'),
(457, 'Dr. Baran Yıldırım', 'Nöroloji', 'Liv Hospital'),
(458, 'Dr. Zeynep Korkmaz', 'Nöroloji', 'Liv Hospital'),
(459, 'Dr. Alp Tekin', 'Nöroloji', 'Liv Hospital'),
(460, 'Dr. Aylin Yıldız', 'Ortopedi', 'Liv Hospital'),
(461, 'Dr. Cemre Çetin', 'Ortopedi', 'Liv Hospital'),
(462, 'Dr. Deniz Kaya', 'Ortopedi', 'Liv Hospital'),
(463, 'Dr. Ege Taş', 'Dahiliye', 'Liv Hospital'),
(464, 'Dr. Gizem Arıkan', 'Dahiliye', 'Liv Hospital'),
(465, 'Dr. İlayda Yılmaz', 'Dahiliye', 'Liv Hospital'),
(466, 'Dr. Mert Akın', 'Enfeksiyon Hastalıkları', 'Liv Hospital'),
(467, 'Dr. Nisanur Erdoğan', 'Enfeksiyon Hastalıkları', 'Liv Hospital'),
(468, 'Dr. Selim Yıldırım', 'Enfeksiyon Hastalıkları', 'Liv Hospital'),
(469, 'Dr. Berfin Aksoy', 'Genel Cerrahi', 'Liv Hospital'),
(470, 'Dr. Can Yılmaz', 'Genel Cerrahi', 'Liv Hospital'),
(471, 'Dr. Derya Kaya', 'Genel Cerrahi', 'Liv Hospital'),
(472, 'Dr. Emre Yılmaz', 'Kalp ve Damar Cerrahisi', 'Liv Hospital'),
(473, 'Dr. Gözde Demir', 'Kalp ve Damar Cerrahisi', 'Liv Hospital'),
(474, 'Dr. İrem Yılmaz', 'Kalp ve Damar Cerrahisi', 'Liv Hospital'),
(475, 'Dr. İrem Can', 'Kardiyoloji', 'Bursa Şehir Hastanesi'),
(476, 'Dr. Emre Şen', 'Kardiyoloji', 'Bursa Şehir Hastanesi'),
(477, 'Dr. Selin Yıldırım', 'Kardiyoloji', 'Bursa Şehir Hastanesi'),
(478, 'Dr. Baran Kaya', 'Göğüs Hastalıkları', 'Bursa Şehir Hastanesi'),
(479, 'Dr. Zehra Yılmaz', 'Göğüs Hastalıkları', 'Bursa Şehir Hastanesi'),
(480, 'Dr. Alperen Şahin', 'Göğüs Hastalıkları', 'Bursa Şehir Hastanesi'),
(481, 'Dr. Esra Demir', 'Üroloji', 'Bursa Şehir Hastanesi'),
(482, 'Dr. Berkay Arslan', 'Üroloji', 'Bursa Şehir Hastanesi'),
(483, 'Dr. Ece Tekin', 'Üroloji', 'Bursa Şehir Hastanesi'),
(484, 'Dr. Furkan Yıldız', 'Kadın Doğum', 'Bursa Şehir Hastanesi'),
(485, 'Dr. Ceren Çelik', 'Kadın Doğum', 'Bursa Şehir Hastanesi'),
(486, 'Dr. Deniz Aktaş', 'Kadın Doğum', 'Bursa Şehir Hastanesi'),
(487, 'Dr. Onur Kılıç', 'Nöroloji', 'Bursa Şehir Hastanesi'),
(488, 'Dr. Elif Doğan', 'Nöroloji', 'Bursa Şehir Hastanesi'),
(489, 'Dr. Mert Aksoy', 'Nöroloji', 'Bursa Şehir Hastanesi'),
(490, 'Dr. Ezgi Korkmaz', 'Ortopedi', 'Bursa Şehir Hastanesi'),
(491, 'Dr. Kaan Öztürk', 'Ortopedi', 'Bursa Şehir Hastanesi'),
(492, 'Dr. Melis Çetin', 'Ortopedi', 'Bursa Şehir Hastanesi'),
(493, 'Dr. Burak Demirci', 'Dahiliye', 'Bursa Şehir Hastanesi'),
(494, 'Dr. Aylin Şimşek', 'Dahiliye', 'Bursa Şehir Hastanesi'),
(495, 'Dr. Defne Yıldız', 'Dahiliye', 'Bursa Şehir Hastanesi'),
(496, 'Dr. Emirhan Yılmaz', 'Enfeksiyon Hastalıkları', 'Bursa Şehir Hastanesi'),
(497, 'Dr. İlayda Koca', 'Enfeksiyon Hastalıkları', 'Bursa Şehir Hastanesi'),
(498, 'Dr. Gizem Akın', 'Enfeksiyon Hastalıkları', 'Bursa Şehir Hastanesi'),
(499, 'Dr. Alp Arıkan', 'Genel Cerrahi', 'Bursa Şehir Hastanesi'),
(500, 'Dr. Yasemin Şen', 'Genel Cerrahi', 'Bursa Şehir Hastanesi'),
(501, 'Dr. Ege Yıldırım', 'Genel Cerrahi', 'Bursa Şehir Hastanesi'),
(502, 'Dr. Tuğçe Arslan', 'Kalp ve Damar Cerrahisi', 'Bursa Şehir Hastanesi'),
(503, 'Dr. Barış Demiröz', 'Kalp ve Damar Cerrahisi', 'Bursa Şehir Hastanesi'),
(504, 'Dr. Sude Yılmaz', 'Kalp ve Damar Cerrahisi', 'Bursa Şehir Hastanesi'),
(505, 'Dr. Aylin Demir', 'Kardiyoloji', 'Acıbadem Hastanesi'),
(506, 'Dr. Burak Yılmaz', 'Kardiyoloji', 'Acıbadem Hastanesi'),
(507, 'Dr. Elif Can', 'Kardiyoloji', 'Acıbadem Hastanesi'),
(508, 'Dr. Mert Özdemir', 'Göğüs Hastalıkları', 'Acıbadem Hastanesi'),
(509, 'Dr. Zeynep Kılıç', 'Göğüs Hastalıkları', 'Acıbadem Hastanesi'),
(510, 'Dr. Emre Yılmaz', 'Göğüs Hastalıkları', 'Acıbadem Hastanesi'),
(511, 'Dr. Gizem Arslan', 'Üroloji', 'Acıbadem Hastanesi'),
(512, 'Dr. Barış Ay', 'Üroloji', 'Acıbadem Hastanesi'),
(513, 'Dr. İrem Tekin', 'Üroloji', 'Acıbadem Hastanesi'),
(514, 'Dr. Berkay Yıldız', 'Kadın Doğum', 'Acıbadem Hastanesi'),
(515, 'Dr. Büşra Yılmaz', 'Kadın Doğum', 'Acıbadem Hastanesi'),
(516, 'Dr. Can Kaya', 'Kadın Doğum', 'Acıbadem Hastanesi'),
(517, 'Dr. Defne Kara', 'Nöroloji', 'Acıbadem Hastanesi'),
(518, 'Dr. Emirhan Korkmaz', 'Nöroloji', 'Acıbadem Hastanesi'),
(519, 'Dr. Selin Demirci', 'Nöroloji', 'Acıbadem Hastanesi'),
(520, 'Dr. Efe Şahin', 'Ortopedi', 'Acıbadem Hastanesi'),
(521, 'Dr. Esra Yıldırım', 'Ortopedi', 'Acıbadem Hastanesi'),
(522, 'Dr. Furkan Aydoğan', 'Ortopedi', 'Acıbadem Hastanesi'),
(523, 'Dr. İlayda Şen', 'Dahiliye', 'Acıbadem Hastanesi'),
(524, 'Dr. Kaan Erdoğan', 'Dahiliye', 'Acıbadem Hastanesi'),
(525, 'Dr. Melis Aslan', 'Dahiliye', 'Acıbadem Hastanesi'),
(526, 'Dr. Onur Taş', 'Enfeksiyon Hastalıkları', 'Acıbadem Hastanesi'),
(527, 'Dr. Sude Kocaman', 'Enfeksiyon Hastalıkları', 'Acıbadem Hastanesi'),
(528, 'Dr. Tuğçe Yıldız', 'Enfeksiyon Hastalıkları', 'Acıbadem Hastanesi'),
(529, 'Dr. Yasin Aktaş', 'Genel Cerrahi', 'Acıbadem Hastanesi'),
(530, 'Dr. Elif Arıkan', 'Genel Cerrahi', 'Acıbadem Hastanesi'),
(531, 'Dr. Mehmet Kılıç', 'Genel Cerrahi', 'Acıbadem Hastanesi'),
(532, 'Dr. Yasemin Ay', 'Kalp ve Damar Cerrahisi', 'Acıbadem Hastanesi'),
(533, 'Dr. Berkant Yıldırım', 'Kalp ve Damar Cerrahisi', 'Acıbadem Hastanesi'),
(534, 'Dr. İrem Çetinkaya', 'Kalp ve Damar Cerrahisi', 'Acıbadem Hastanesi'),
(535, 'Dr. Kerem Arslan', 'Kardiyoloji', 'İstanbul İstinye Hastanesi'),
(536, 'Dr. Melike Demir', 'Kardiyoloji', 'İstanbul İstinye Hastanesi'),
(537, 'Dr. Onur Yıldırım', 'Kardiyoloji', 'İstanbul İstinye Hastanesi'),
(538, 'Dr. Selin Kaya', 'Göğüs Hastalıkları', 'İstanbul İstinye Hastanesi'),
(539, 'Dr. Barış Çelik', 'Göğüs Hastalıkları', 'İstanbul İstinye Hastanesi'),
(540, 'Dr. Zeynep Aksoy', 'Göğüs Hastalıkları', 'İstanbul İstinye Hastanesi'),
(541, 'Dr. Canberk Yıldız', 'Üroloji', 'İstanbul İstinye Hastanesi'),
(542, 'Dr. Defne Yılmaz', 'Üroloji', 'İstanbul İstinye Hastanesi'),
(543, 'Dr. Emirhan Demirci', 'Üroloji', 'İstanbul İstinye Hastanesi'),
(544, 'Dr. Esra Aydın', 'Kadın Doğum', 'İstanbul İstinye Hastanesi'),
(545, 'Dr. Furkan Yılmaz', 'Kadın Doğum', 'İstanbul İstinye Hastanesi'),
(546, 'Dr. İlayda Demir', 'Kadın Doğum', 'İstanbul İstinye Hastanesi'),
(547, 'Dr. Kaan Şahin', 'Nöroloji', 'İstanbul İstinye Hastanesi'),
(548, 'Dr. Melis Yıldırım', 'Nöroloji', 'İstanbul İstinye Hastanesi'),
(549, 'Dr. Onur Korkmaz', 'Nöroloji', 'İstanbul İstinye Hastanesi'),
(550, 'Dr. Selin Şimşek', 'Ortopedi', 'İstanbul İstinye Hastanesi'),
(551, 'Dr. Baran Arslan', 'Ortopedi', 'İstanbul İstinye Hastanesi'),
(552, 'Dr. Zeynep Kılınç', 'Ortopedi', 'İstanbul İstinye Hastanesi'),
(553, 'Dr. Cem Yılmaz', 'Dahiliye', 'İstanbul İstinye Hastanesi'),
(554, 'Dr. Deniz Yıldırım', 'Dahiliye', 'İstanbul İstinye Hastanesi'),
(555, 'Dr. Ege Yılmaz', 'Dahiliye', 'İstanbul İstinye Hastanesi'),
(556, 'Dr. Gizem Arslan', 'Enfeksiyon Hastalıkları', 'İstanbul İstinye Hastanesi'),
(557, 'Dr. İrem Yıldız', 'Enfeksiyon Hastalıkları', 'İstanbul İstinye Hastanesi'),
(558, 'Dr. Mert Demir', 'Enfeksiyon Hastalıkları', 'İstanbul İstinye Hastanesi'),
(559, 'Dr. Nisanur Yılmaz', 'Genel Cerrahi', 'İstanbul İstinye Hastanesi'),
(560, 'Dr. Selim Yılmaz', 'Genel Cerrahi', 'İstanbul İstinye Hastanesi'),
(561, 'Dr. Berfin Yıldırım', 'Genel Cerrahi', 'İstanbul İstinye Hastanesi'),
(562, 'Dr. Can Yıldırım', 'Kalp ve Damar Cerrahisi', 'İstanbul İstinye Hastanesi'),
(563, 'Dr. Derya Yılmaz', 'Kalp ve Damar Cerrahisi', 'İstanbul İstinye Hastanesi'),
(564, 'Dr. Emre Kılıç', 'Kalp ve Damar Cerrahisi', 'İstanbul İstinye Hastanesi'),
(565, 'Dr. Selin Demir', 'Kardiyoloji', 'İstanbul Medical Park Hastanesi'),
(566, 'Dr. Barış Yıldız', 'Kardiyoloji', 'İstanbul Medical Park Hastanesi'),
(567, 'Dr. Zeynep Demirci', 'Kardiyoloji', 'İstanbul Medical Park Hastanesi'),
(568, 'Dr. Canberk Arslan', 'Göğüs Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(569, 'Dr. Defne Kaya', 'Göğüs Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(570, 'Dr. Emirhan Yıldırım', 'Göğüs Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(571, 'Dr. Esra Yılmaz', 'Üroloji', 'İstanbul Medical Park Hastanesi'),
(572, 'Dr. Furkan Arslan', 'Üroloji', 'İstanbul Medical Park Hastanesi'),
(573, 'Dr. İrem Demirhan', 'Üroloji', 'İstanbul Medical Park Hastanesi'),
(574, 'Dr. Kaan Kocaman', 'Kadın Doğum', 'İstanbul Medical Park Hastanesi'),
(575, 'Dr. Melis Aksoy', 'Kadın Doğum', 'İstanbul Medical Park Hastanesi'),
(576, 'Dr. Onur Tekin', 'Kadın Doğum', 'İstanbul Medical Park Hastanesi'),
(577, 'Dr. Selin Yıldız', 'Nöroloji', 'İstanbul Medical Park Hastanesi'),
(578, 'Dr. Baran Yılmaz', 'Nöroloji', 'İstanbul Medical Park Hastanesi'),
(579, 'Dr. Zeynep Arıkan', 'Nöroloji', 'İstanbul Medical Park Hastanesi'),
(580, 'Dr. Cem Yıldırım', 'Ortopedi', 'İstanbul Medical Park Hastanesi'),
(581, 'Dr. Deniz Arslan', 'Ortopedi', 'İstanbul Medical Park Hastanesi'),
(582, 'Dr. Ege Çelik', 'Ortopedi', 'İstanbul Medical Park Hastanesi'),
(583, 'Dr. Gizem Yılmaz', 'Dahiliye', 'İstanbul Medical Park Hastanesi'),
(584, 'Dr. İrem Korkmaz', 'Dahiliye', 'İstanbul Medical Park Hastanesi'),
(585, 'Dr. Mert Yıldırım', 'Dahiliye', 'İstanbul Medical Park Hastanesi'),
(586, 'Dr. Nisanur Yıldız', 'Enfeksiyon Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(587, 'Dr. Selim Arıkan', 'Enfeksiyon Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(588, 'Dr. Berfin Arslan', 'Enfeksiyon Hastalıkları', 'İstanbul Medical Park Hastanesi'),
(589, 'Dr. Can Arslan', 'Genel Cerrahi', 'İstanbul Medical Park Hastanesi'),
(590, 'Dr. Derya Yıldız', 'Genel Cerrahi', 'İstanbul Medical Park Hastanesi'),
(591, 'Dr. Emir Yılmaz', 'Genel Cerrahi', 'İstanbul Medical Park Hastanesi'),
(592, 'Dr. Gözde Yıldırım', 'Kalp ve Damar Cerrahisi', 'İstanbul Medical Park Hastanesi'),
(593, 'Dr. İrem Arslan', 'Kalp ve Damar Cerrahisi', 'İstanbul Medical Park Hastanesi'),
(594, 'Dr. Kerem Yıldız', 'Kalp ve Damar Cerrahisi', 'İstanbul Medical Park Hastanesi'),
(595, 'Dr. Melike Yılmaz', 'Kardiyoloji', 'İstanbul Şehir Hastanesi'),
(596, 'Dr. Onur Arslan', 'Kardiyoloji', 'İstanbul Şehir Hastanesi'),
(597, 'Dr. Selin Kılıç', 'Kardiyoloji', 'İstanbul Şehir Hastanesi'),
(598, 'Dr. Barış Demirci', 'Göğüs Hastalıkları', 'İstanbul Şehir Hastanesi'),
(599, 'Dr. Zeynep Yıldız', 'Göğüs Hastalıkları', 'İstanbul Şehir Hastanesi'),
(600, 'Dr. Canberk Demir', 'Göğüs Hastalıkları', 'İstanbul Şehir Hastanesi'),
(601, 'Dr. Defne Arslan', 'Üroloji', 'İstanbul Şehir Hastanesi'),
(602, 'Dr. Emirhan Kaya', 'Üroloji', 'İstanbul Şehir Hastanesi'),
(603, 'Dr. Esra Yıldırım', 'Üroloji', 'İstanbul Şehir Hastanesi'),
(604, 'Dr. Furkan Aydın', 'Kadın Doğum', 'İstanbul Şehir Hastanesi'),
(605, 'Dr. İrem Şimşek', 'Kadın Doğum', 'İstanbul Şehir Hastanesi'),
(606, 'Dr. Kaan Kaya', 'Kadın Doğum', 'İstanbul Şehir Hastanesi'),
(607, 'Dr. Melis Yıldız', 'Nöroloji', 'İstanbul Şehir Hastanesi'),
(608, 'Dr. Onur Yılmaz', 'Nöroloji', 'İstanbul Şehir Hastanesi'),
(609, 'Dr. Selin Demirhan', 'Nöroloji', 'İstanbul Şehir Hastanesi'),
(610, 'Dr. Baran Arıkan', 'Ortopedi', 'İstanbul Şehir Hastanesi'),
(611, 'Dr. Zeynep Yılmaz', 'Ortopedi', 'İstanbul Şehir Hastanesi'),
(612, 'Dr. Canberk Korkmaz', 'Ortopedi', 'İstanbul Şehir Hastanesi'),
(613, 'Dr. Defne Yılmaz', 'Dahiliye', 'İstanbul Şehir Hastanesi'),
(614, 'Dr. Emirhan Kılıç', 'Dahiliye', 'İstanbul Şehir Hastanesi'),
(615, 'Dr. Esra Demirhan', 'Dahiliye', 'İstanbul Şehir Hastanesi'),
(616, 'Dr. Furkan Yıldırım', 'Enfeksiyon Hastalıkları', 'İstanbul Şehir Hastanesi'),
(617, 'Dr. İrem Aydın', 'Enfeksiyon Hastalıkları', 'İstanbul Şehir Hastanesi'),
(618, 'Dr. Kaan Arıkan', 'Enfeksiyon Hastalıkları', 'İstanbul Şehir Hastanesi'),
(619, 'Dr. Melis Yılmaz', 'Genel Cerrahi', 'İstanbul Şehir Hastanesi'),
(620, 'Dr. Onur Yıldız', 'Genel Cerrahi', 'İstanbul Şehir Hastanesi'),
(621, 'Dr. Selin Korkmaz', 'Genel Cerrahi', 'İstanbul Şehir Hastanesi'),
(622, 'Dr. Baran Yıldırım', 'Kalp ve Damar Cerrahisi', 'İstanbul Şehir Hastanesi'),
(623, 'Dr. Zeynep Arıkan', 'Kalp ve Damar Cerrahisi', 'İstanbul Şehir Hastanesi'),
(624, 'Dr. Canberk Yılmaz', 'Kalp ve Damar Cerrahisi', 'İstanbul Şehir Hastanesi'),
(625, 'Dr. Selin Çelik', 'Kardiyoloji', 'Ankara Memorial Hospital'),
(626, 'Dr. Kaan Çetin', 'Kardiyoloji', 'Ankara Memorial Hospital'),
(627, 'Dr. Defne Tekin', 'Göğüs Hastalıkları', 'Ankara Memorial Hospital'),
(628, 'Dr. Emre Korkmaz', 'Göğüs Hastalıkları', 'Ankara Memorial Hospital'),
(629, 'Dr. Zehra Şahin', 'Üroloji', 'Ankara Memorial Hospital'),
(630, 'Dr. Burak Yıldırım', 'Üroloji', 'Ankara Memorial Hospital'),
(631, 'Dr. Ece Aktaş', 'Kadın Doğum', 'Ankara Memorial Hospital'),
(632, 'Dr. Caner Demir', 'Kadın Doğum', 'Ankara Memorial Hospital'),
(633, 'Dr. Ayşenur Güneş', 'Nöroloji', 'Ankara Memorial Hospital'),
(634, 'Dr. Barış Öztürk', 'Nöroloji', 'Ankara Memorial Hospital'),
(635, 'Dr. Ceren Yılmaz', 'Ortopedi', 'Ankara Memorial Hospital'),
(636, 'Dr. Koray Atalay', 'Ortopedi', 'Ankara Memorial Hospital'),
(637, 'Dr. Elif Duran', 'Dahiliye', 'Ankara Memorial Hospital'),
(638, 'Dr. Umut Ateş', 'Dahiliye', 'Ankara Memorial Hospital'),
(639, 'Dr. Şirin Erdoğan', 'Enfeksiyon Hastalıkları', 'Ankara Memorial Hospital'),
(640, 'Dr. Tolga Taşkın', 'Enfeksiyon Hastalıkları', 'Ankara Memorial Hospital'),
(641, 'Dr. Yasemin Yılmaz', 'Genel Cerrahi', 'Ankara Memorial Hospital'),
(642, 'Dr. Mert Saraçoğlu', 'Genel Cerrahi', 'Ankara Memorial Hospital'),
(643, 'Dr. İrem Çınar', 'Kalp ve Damar Cerrahisi', 'Ankara Memorial Hospital'),
(644, 'Dr. Furkan Aslan', 'Kalp ve Damar Cerrahisi', 'Ankara Memorial Hospital'),
(645, 'Dr. Melike Toprak', 'Kardiyoloji', 'Ankara Şehir Hastanesi'),
(646, 'Dr. Onur Çelik', 'Kardiyoloji', 'Ankara Şehir Hastanesi'),
(647, 'Dr. Selma Yıldırım', 'Göğüs Hastalıkları', 'Ankara Şehir Hastanesi'),
(648, 'Dr. Deniz Doğan', 'Göğüs Hastalıkları', 'Ankara Şehir Hastanesi'),
(649, 'Dr. Emirhan Bulut', 'Üroloji', 'Ankara Şehir Hastanesi'),
(650, 'Dr. Zeynep Kocaman', 'Üroloji', 'Ankara Şehir Hastanesi'),
(651, 'Dr. Baran Yıldız', 'Kadın Doğum', 'Ankara Şehir Hastanesi'),
(652, 'Dr. Esra Şimşek', 'Kadın Doğum', 'Ankara Şehir Hastanesi'),
(653, 'Dr. Alperen Demir', 'Nöroloji', 'Ankara Şehir Hastanesi'),
(654, 'Dr. İlayda Aydın', 'Nöroloji', 'Ankara Şehir Hastanesi'),
(655, 'Dr. Berfin Kara', 'Ortopedi', 'Ankara Şehir Hastanesi'),
(656, 'Dr. Can Yavuz', 'Ortopedi', 'Ankara Şehir Hastanesi'),
(657, 'Dr. Ebru Yılmaz', 'Dahiliye', 'Ankara Şehir Hastanesi'),
(658, 'Dr. Kaan Demirci', 'Dahiliye', 'Ankara Şehir Hastanesi'),
(659, 'Dr. Gizem Arı', 'Enfeksiyon Hastalıkları', 'Ankara Şehir Hastanesi'),
(660, 'Dr. Mert Durmuş', 'Enfeksiyon Hastalıkları', 'Ankara Şehir Hastanesi'),
(661, 'Dr. Elif Aslan', 'Genel Cerrahi', 'Ankara Şehir Hastanesi'),
(662, 'Dr. Yusuf Eren', 'Genel Cerrahi', 'Ankara Şehir Hastanesi'),
(663, 'Dr. Aylin Erdoğan', 'Kalp ve Damar Cerrahisi', 'Ankara Şehir Hastanesi'),
(664, 'Dr. Umut Güler', 'Kalp ve Damar Cerrahisi', 'Ankara Şehir Hastanesi'),
(665, 'Dr. Cemre Yılmaz', 'Kardiyoloji', 'Ankara Üniversite Hastanesi'),
(666, 'Dr. Emre Çetin', 'Kardiyoloji', 'Ankara Üniversite Hastanesi'),
(667, 'Dr. Elif Şahin', 'Göğüs Hastalıkları', 'Ankara Üniversite Hastanesi'),
(668, 'Dr. Kerem Güneş', 'Göğüs Hastalıkları', 'Ankara Üniversite Hastanesi'),
(669, 'Dr. Esra Yavuz', 'Üroloji', 'Ankara Üniversite Hastanesi'),
(670, 'Dr. Barış Özdemir', 'Üroloji', 'Ankara Üniversite Hastanesi'),
(671, 'Dr. Sude Kılıç', 'Kadın Doğum', 'Ankara Üniversite Hastanesi'),
(672, 'Dr. Berkay Şimşek', 'Kadın Doğum', 'Ankara Üniversite Hastanesi'),
(673, 'Dr. Zehra Öztürk', 'Nöroloji', 'Ankara Üniversite Hastanesi'),
(674, 'Dr. Mert Caner', 'Nöroloji', 'Ankara Üniversite Hastanesi'),
(675, 'Dr. İlayda Korkmaz', 'Ortopedi', 'Ankara Üniversite Hastanesi'),
(676, 'Dr. Ege Akın', 'Ortopedi', 'Ankara Üniversite Hastanesi'),
(677, 'Dr. Defne Duran', 'Dahiliye', 'Ankara Üniversite Hastanesi'),
(678, 'Dr. Onur Demir', 'Dahiliye', 'Ankara Üniversite Hastanesi'),
(679, 'Dr. Selin Koç', 'Enfeksiyon Hastalıkları', 'Ankara Üniversite Hastanesi'),
(680, 'Dr. Alp Yıldız', 'Enfeksiyon Hastalıkları', 'Ankara Üniversite Hastanesi'),
(681, 'Dr. İrem Avcı', 'Genel Cerrahi', 'Ankara Üniversite Hastanesi'),
(682, 'Dr. Furkan Efe', 'Genel Cerrahi', 'Ankara Üniversite Hastanesi'),
(683, 'Dr. Yasemin Toprak', 'Kalp ve Damar Cerrahisi', 'Ankara Üniversite Hastanesi'),
(684, 'Dr. Berfin Aksoy', 'Kalp ve Damar Cerrahisi', 'Ankara Üniversite Hastanesi'),
(685, 'Dr. Ayşe Kara', 'Kardiyoloji', 'Antalya Şehir Hastanesi'),
(686, 'Dr. Berkant Demir', 'Kardiyoloji', 'Antalya Şehir Hastanesi'),
(687, 'Dr. Ebru Çelik', 'Göğüs Hastalıkları', 'Antalya Şehir Hastanesi'),
(688, 'Dr. Canberk Yılmaz', 'Göğüs Hastalıkları', 'Antalya Şehir Hastanesi'),
(689, 'Dr. Defne Yavuz', 'Üroloji', 'Antalya Şehir Hastanesi'),
(690, 'Dr. Emirhan Durmuş', 'Üroloji', 'Antalya Şehir Hastanesi'),
(691, 'Dr. Zeynep Erdoğan', 'Kadın Doğum', 'Antalya Şehir Hastanesi'),
(692, 'Dr. Baran Arıkan', 'Kadın Doğum', 'Antalya Şehir Hastanesi'),
(693, 'Dr. Elif Taş', 'Nöroloji', 'Antalya Şehir Hastanesi'),
(694, 'Dr. Selim Çetin', 'Nöroloji', 'Antalya Şehir Hastanesi'),
(695, 'Dr. Deniz Yalçın', 'Ortopedi', 'Antalya Şehir Hastanesi'),
(696, 'Dr. Esra Karadeniz', 'Ortopedi', 'Antalya Şehir Hastanesi'),
(697, 'Dr. Furkan Doğan', 'Dahiliye', 'Antalya Şehir Hastanesi'),
(698, 'Dr. İrem Kılıç', 'Dahiliye', 'Antalya Şehir Hastanesi'),
(699, 'Dr. Kaan Kaya', 'Enfeksiyon Hastalıkları', 'Antalya Şehir Hastanesi'),
(700, 'Dr. Melike Şahin', 'Enfeksiyon Hastalıkları', 'Antalya Şehir Hastanesi'),
(701, 'Dr. Onur Demirhan', 'Genel Cerrahi', 'Antalya Şehir Hastanesi'),
(702, 'Dr. Selin Kocabaş', 'Genel Cerrahi', 'Antalya Şehir Hastanesi'),
(703, 'Dr. Burak Şimşek', 'Kalp ve Damar Cerrahisi', 'Antalya Şehir Hastanesi'),
(704, 'Dr. Ceren Aydın', 'Kalp ve Damar Cerrahisi', 'Antalya Şehir Hastanesi'),
(705, 'Dr. Alper Arslan', 'Kardiyoloji', 'Antalya Üniversite Hastanesi'),
(706, 'Dr. Aylin Yılmaz', 'Kardiyoloji', 'Antalya Üniversite Hastanesi'),
(707, 'Dr. Berkay Tekin', 'Göğüs Hastalıkları', 'Antalya Üniversite Hastanesi'),
(708, 'Dr. Cemre Aydoğan', 'Göğüs Hastalıkları', 'Antalya Üniversite Hastanesi'),
(709, 'Dr. Deniz Kılıç', 'Üroloji', 'Antalya Üniversite Hastanesi'),
(710, 'Dr. Emre Şahin', 'Üroloji', 'Antalya Üniversite Hastanesi'),
(711, 'Dr. Esra Yıldız', 'Kadın Doğum', 'Antalya Üniversite Hastanesi'),
(712, 'Dr. Furkan Korkmaz', 'Kadın Doğum', 'Antalya Üniversite Hastanesi'),
(713, 'Dr. Gizem Öztürk', 'Nöroloji', 'Antalya Üniversite Hastanesi'),
(714, 'Dr. İrem Şen', 'Nöroloji', 'Antalya Üniversite Hastanesi'),
(715, 'Dr. Kaan Kocaman', 'Ortopedi', 'Antalya Üniversite Hastanesi'),
(716, 'Dr. Melis Bulut', 'Ortopedi', 'Antalya Üniversite Hastanesi'),
(717, 'Dr. Onur Doğan', 'Dahiliye', 'Antalya Üniversite Hastanesi'),
(718, 'Dr. Selin Avcı', 'Dahiliye', 'Antalya Üniversite Hastanesi'),
(719, 'Dr. Barış Demir', 'Enfeksiyon Hastalıkları', 'Antalya Üniversite Hastanesi'),
(720, 'Dr. Zeynep Eren', 'Enfeksiyon Hastalıkları', 'Antalya Üniversite Hastanesi'),
(721, 'Dr. Burak Yıldız', 'Genel Cerrahi', 'Antalya Üniversite Hastanesi'),
(722, 'Dr. Can Yavuz', 'Genel Cerrahi', 'Antalya Üniversite Hastanesi'),
(723, 'Dr. Defne Çetin', 'Kalp ve Damar Cerrahisi', 'Antalya Üniversite Hastanesi'),
(724, 'Dr. Ege Aydemir', 'Kalp ve Damar Cerrahisi', 'Antalya Üniversite Hastanesi'),
(725, 'Dr. Elif Güneş', 'Kardiyoloji', 'Medical Center Hastanesi'),
(726, 'Dr. Emirhan Yılmaz', 'Kardiyoloji', 'Medical Center Hastanesi'),
(727, 'Dr. Selin Yıldırım', 'Göğüs Hastalıkları', 'Medical Center Hastanesi'),
(728, 'Dr. Barış Aksoy', 'Göğüs Hastalıkları', 'Medical Center Hastanesi'),
(729, 'Dr. Zeynep Arslan', 'Üroloji', 'Medical Center Hastanesi'),
(730, 'Dr. Canberk Demirci', 'Üroloji', 'Medical Center Hastanesi'),
(731, 'Dr. Defne Özdemir', 'Kadın Doğum', 'Medical Center Hastanesi'),
(732, 'Dr. Berkay Yavuz', 'Kadın Doğum', 'Medical Center Hastanesi'),
(733, 'Dr. Esra Aydın', 'Nöroloji', 'Medical Center Hastanesi'),
(734, 'Dr. Furkan Şahin', 'Nöroloji', 'Medical Center Hastanesi'),
(735, 'Dr. İrem Kaya', 'Ortopedi', 'Medical Center Hastanesi'),
(736, 'Dr. Kaan Durmuş', 'Ortopedi', 'Medical Center Hastanesi'),
(737, 'Dr. Melis Tekin', 'Dahiliye', 'Medical Center Hastanesi'),
(738, 'Dr. Onur Kılıç', 'Dahiliye', 'Medical Center Hastanesi'),
(739, 'Dr. Selin Demir', 'Enfeksiyon Hastalıkları', 'Medical Center Hastanesi'),
(740, 'Dr. Burak Arıkan', 'Enfeksiyon Hastalıkları', 'Medical Center Hastanesi'),
(741, 'Dr. Deniz Erdoğan', 'Genel Cerrahi', 'Medical Center Hastanesi'),
(742, 'Dr. Ebru Yıldız', 'Genel Cerrahi', 'Medical Center Hastanesi'),
(743, 'Dr. Alp Kocabaş', 'Kalp ve Damar Cerrahisi', 'Medical Center Hastanesi'),
(744, 'Dr. Aylin Karadeniz', 'Kalp ve Damar Cerrahisi', 'Medical Center Hastanesi'),
(745, 'Dr. Cemal Atalay', 'Kardiyoloji', 'Samsun Eğitim Araştırma Hastanesi'),
(746, 'Dr. Ayşenur Güneş', 'Kardiyoloji', 'Samsun Eğitim Araştırma Hastanesi'),
(747, 'Dr. Burak Çelik', 'Kardiyoloji', 'Samsun Eğitim Araştırma Hastanesi'),
(748, 'Dr. Şule Erdoğany', 'Göğüs Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(749, 'Dr. Kaan Arslan', 'Göğüs Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(750, 'Dr. Dilara Yıldız', 'Göğüs Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(751, 'Dr. Tolga Karadeniz', 'Üroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(752, 'Dr. Pelin Çetin', 'Üroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(753, 'Dr. Emre Demir', 'Üroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(754, 'Dr. Ege Yılmaz', 'Kadın Doğum', 'Samsun Eğitim Araştırma Hastanesi'),
(755, 'Dr. İrem Şahin', 'Kadın Doğum', 'Samsun Eğitim Araştırma Hastanesi'),
(756, 'Dr. Büşra Öztürk', 'Kadın Doğum', 'Samsun Eğitim Araştırma Hastanesi'),
(757, 'Dr. Barış Kılıç', 'Nöroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(758, 'Dr. Zehra Doğan', 'Nöroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(759, 'Dr. Deniz Şimşek', 'Nöroloji', 'Samsun Eğitim Araştırma Hastanesi'),
(760, 'Dr. Berkay Yılmaz', 'Ortopedi', 'Samsun Eğitim Araştırma Hastanesi'),
(761, 'Dr. Melike Aksoy', 'Ortopedi', 'Samsun Eğitim Araştırma Hastanesi'),
(762, 'Dr. Alperen Özdemir', 'Ortopedi', 'Samsun Eğitim Araştırma Hastanesi'),
(763, 'Dr. Esra Yılmaz', 'Dahiliye', 'Samsun Eğitim Araştırma Hastanesi'),
(764, 'Dr. Onur Kaya', 'Dahiliye', 'Samsun Eğitim Araştırma Hastanesi'),
(765, 'Dr. Sude Taşkın', 'Dahiliye', 'Samsun Eğitim Araştırma Hastanesi'),
(766, 'Dr. Eren Aktaş', 'Enfeksiyon Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(767, 'Dr. Gizem Toprak', 'Enfeksiyon Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(768, 'Dr. Serkan Aydın', 'Enfeksiyon Hastalıkları', 'Samsun Eğitim Araştırma Hastanesi'),
(769, 'Dr. Damla Ay', 'Genel Cerrahi', 'Samsun Eğitim Araştırma Hastanesi'),
(770, 'Dr. Umut Avcı', 'Genel Cerrahi', 'Samsun Eğitim Araştırma Hastanesi'),
(771, 'Dr. Ecem Ertürk', 'Genel Cerrahi', 'Samsun Eğitim Araştırma Hastanesi'),
(772, 'Dr. Emirhan Başaran', 'Kalp ve Damar Cerrahisi', 'Samsun Eğitim Araştırma Hastanesi'),
(773, 'Dr. Ece Güler', 'Kalp ve Damar Cerrahisi', 'Samsun Eğitim Araştırma Hastanesi'),
(774, 'Dr. Alp Kocaman', 'Kalp ve Damar Cerrahisi', 'Samsun Eğitim Araştırma Hastanesi'),
(775, 'Dr. Selin Şahin', 'Kardiyoloji', 'Gazi Devlet Hastanesi'),
(776, 'Dr. Berkcan Sarı', 'Kardiyoloji', 'Gazi Devlet Hastanesi'),
(777, 'Dr. Buse Karaman', 'Kardiyoloji', 'Gazi Devlet Hastanesi'),
(778, 'Dr. Kaan Yıldırım', 'Göğüs Hastalıkları', 'Gazi Devlet Hastanesi'),
(779, 'Dr. Beste Erdoğan', 'Göğüs Hastalıkları', 'Gazi Devlet Hastanesi'),
(780, 'Dr. Arda Çetin', 'Göğüs Hastalıkları', 'Gazi Devlet Hastanesi'),
(781, 'Dr. İrem Gündoğdu', 'Üroloji', 'Gazi Devlet Hastanesi'),
(782, 'Dr. Alara Çelik', 'Üroloji', 'Gazi Devlet Hastanesi'),
(783, 'Dr. Efe Durmuş', 'Üroloji', 'Gazi Devlet Hastanesi'),
(784, 'Dr. Yağmur Şen', 'Kadın Doğum', 'Gazi Devlet Hastanesi'),
(785, 'Dr. Kadir Kayaç', 'Kadın Doğum', 'Gazi Devlet Hastanesi'),
(786, 'Dr. Elif Naz Akın', 'Kadın Doğum', 'Gazi Devlet Hastanesi'),
(787, 'Dr. Mert Can', 'Nöroloji', 'Gazi Devlet Hastanesi'),
(788, 'Dr. İrem Topçu', 'Nöroloji', 'Gazi Devlet Hastanesi'),
(789, 'Dr. Koray Aydın', 'Nöroloji', 'Gazi Devlet Hastanesi'),
(790, 'Dr. Rümeysa Demirci', 'Ortopedi', 'Gazi Devlet Hastanesi'),
(791, 'Dr.  Emirhan Kara', 'Ortopedi', 'Gazi Devlet Hastanesi'),
(792, 'Dr. Zeynep Uçar', 'Ortopedi', 'Gazi Devlet Hastanesi'),
(793, 'Dr. Berkay Öztürk', 'Dahiliye', 'Gazi Devlet Hastanesi'),
(794, 'Dr. İpek Aslan', 'Dahiliye', 'Gazi Devlet Hastanesi'),
(795, 'Dr. Canan Şahin', 'Dahiliye', 'Gazi Devlet Hastanesi'),
(796, 'Dr. Murat Yaman', 'Enfeksiyon Hastalıkları', 'Gazi Devlet Hastanesi'),
(797, 'Dr. Tuğba Arıkan', 'Enfeksiyon Hastalıkları', 'Gazi Devlet Hastanesi'),
(798, 'Dr. Burak Sönmez', 'Enfeksiyon Hastalıkları', 'Gazi Devlet Hastanesi'),
(799, 'Dr. Ezgi Aktaş', 'Genel Cerrahi', 'Gazi Devlet Hastanesi'),
(800, 'Dr. Batuhan Çetin', 'Genel Cerrahi', 'Gazi Devlet Hastanesi'),
(801, 'Dr. Elif Su Yılmaz', 'Genel Cerrahi', 'Gazi Devlet Hastanesi'),
(802, 'Dr. Furkan Taş', 'Kalp ve Damar Cerrahisi', 'Gazi Devlet Hastanesi'),
(803, 'Dr. Melis Ateş', 'Kalp ve Damar Cerrahisi', 'Gazi Devlet Hastanesi'),
(804, 'Dr. Berk Atalay', 'Kalp ve Damar Cerrahisi', 'Gazi Devlet Hastanesi'),
(805, 'Dr. İrem Kılıç', 'Kardiyoloji', 'Atasam Hastanesi'),
(806, 'Dr. Kaan Yıldız', 'Kardiyoloji', 'Atasam Hastanesi'),
(807, 'Dr. Selen Ay', 'Kardiyoloji', 'Atasam Hastanesi'),
(808, 'Dr. Baran Şahin', 'Göğüs Hastalıkları', 'Atasam Hastanesi'),
(809, 'Dr. Aslıhan Kocabaş', 'Göğüs Hastalıkları', 'Atasam Hastanesi'),
(810, 'Dr. Emre Arslan', 'Göğüs Hastalıkları', 'Atasam Hastanesi'),
(811, 'Dr. Ceren Özdemir', 'Üroloji', 'Atasam Hastanesi'),
(812, 'Dr. Ece Durak', 'Üroloji', 'Atasam Hastanesi'),
(813, 'Dr. Kerem Özkan', 'Üroloji', 'Atasam Hastanesi'),
(814, 'Dr. Aslı Korkmaz', 'Kadın Doğum', 'Atasam Hastanesi'),
(815, 'Dr. Emir Demirci', 'Kadın Doğum', 'Atasam Hastanesi'),
(816, 'Dr. Zeynep Güler', 'Kadın Doğum', 'Atasam Hastanesi'),
(817, 'Dr. Arda Tekin', 'Nöroloji', 'Atasam Hastanesi'),
(818, 'Dr. Selin Yılmaz', 'Nöroloji', 'Atasam Hastanesi'),
(819, 'Dr. Caner Erdoğan', 'Nöroloji', 'Atasam Hastanesi'),
(820, 'Dr. İrem Taşkın', 'Ortopedi', 'Atasam Hastanesi'),
(821, 'Dr. Barış Aydın', 'Ortopedi', 'Atasam Hastanesi'),
(822, 'Dr. Ceren Çetin', 'Ortopedi', 'Atasam Hastanesi'),
(823, 'Dr. Berkay Yıldırım', 'Dahiliye', 'Atasam Hastanesi'),
(824, 'Dr. Melis Alkan', 'Dahiliye', 'Atasam Hastanesi'),
(825, 'Dr. Umut Çakır', 'Dahiliye', 'Atasam Hastanesi'),
(826, 'Dr. Elif Şen', 'Enfeksiyon Hastalıkları', 'Atasam Hastanesi'),
(827, 'Dr. Furkan Ertürk', 'Enfeksiyon Hastalıkları', 'Atasam Hastanesi'),
(828, 'Dr. Sude Yıldız', 'Enfeksiyon Hastalıkları', 'Atasam Hastanesi'),
(829, 'Dr. Onur Demir', 'Genel Cerrahi', 'Atasam Hastanesi'),
(830, 'Dr. Büşra Taş', 'Genel Cerrahi', 'Atasam Hastanesi'),
(831, 'Dr. Deniz Doğan', 'Genel Cerrahi', 'Atasam Hastanesi'),
(832, 'Dr. Berkcan Yılmaz', 'Kalp ve Damar Cerrahisi', 'Atasam Hastanesi'),
(833, 'Dr. Ezgi Kaya', 'Kalp ve Damar Cerrahisi', 'Atasam Hastanesi'),
(834, 'Dr. Ege Arslan', 'Kalp ve Damar Cerrahisi', 'Atasam Hastanesi');

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
(11123456789, '', '', 'Erkek', 'A Rh+', '', ''),
(19178530790, 'şevval', 'kıdık', 'Erkek', 'B Rh-', 'balkiraz mahallesi', 'Eyyüpcan işler'),
(11111111112, '', '', 'Erkek', 'A Rh+', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevular`
--

CREATE TABLE `randevular` (
  `tc` bigint(20) DEFAULT NULL,
  `doktor_ıd` int(20) DEFAULT NULL,
  `randevu_id` int(11) NOT NULL,
  `tarih` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `randevular`
--

INSERT INTO `randevular` (`tc`, `doktor_ıd`, `randevu_id`, `tarih`) VALUES
(12345678900, 652, 1, '2024-05-17'),
(12345678900, 629, 4, '2024-05-23'),
(12345678900, 35, 5, '2024-05-13');

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
(11111111112, '1234', '2024-05-06 09:59:18'),
(11123456789, '1234', '2024-04-01 10:50:56'),
(12345678900, '1234', '2024-03-26 21:13:06'),
(12345678927, '2727', '2024-03-30 17:17:30'),
(12345678931, '1234', '2024-03-30 17:12:13'),
(12345678941, '5566', '2024-03-30 15:06:40'),
(12345678955, '5566', '2024-03-26 21:18:35'),
(19178530778, '12345', '2024-05-06 09:45:56'),
(19178530790, '12345', '2024-05-06 09:46:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sorular`
--

CREATE TABLE `sorular` (
  `soru_id` bigint(20) NOT NULL,
  `soru_icerik` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `sorular`
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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru_cevaplari`
--

CREATE TABLE `soru_cevaplari` (
  `tc` bigint(20) DEFAULT NULL,
  `soru_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `soru_cevaplari`
--

INSERT INTO `soru_cevaplari` (`tc`, `soru_id`) VALUES
(12345678900, 1);

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
  ADD PRIMARY KEY (`randevu_id`);

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
  MODIFY `doktor_ıd` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;

--
-- Tablo için AUTO_INCREMENT değeri `randevular`
--
ALTER TABLE `randevular`
  MODIFY `randevu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `sorular`
--
ALTER TABLE `sorular`
  MODIFY `soru_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Tablo kısıtlamaları `soru_cevaplari`
--
ALTER TABLE `soru_cevaplari`
  ADD CONSTRAINT `soru_cevaplari_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `uroloji_testi`
--
ALTER TABLE `uroloji_testi`
  ADD CONSTRAINT `uroloji_testi_ibfk_1` FOREIGN KEY (`tc`) REFERENCES `register_info` (`tc`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
