-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Ara 2021, 04:59:55
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `schoolmanagement`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSubject` (IN `sid` TEXT)  DELETE FROM subject WHERE subject.sid = sid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubject` ()  SELECT *
FROM subject$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSubject` (IN `SubName` VARCHAR(255))  INSERT INTO subject (subjectname) VALUES (SubName)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTeacher` (IN `name` VARCHAR(255), IN `surname` VARCHAR(255), IN `qual` VARCHAR(255), IN `salary` INT(11), IN `phone` INT(11), IN `email` VARCHAR(255), IN `id` TEXT)  UPDATE teacher
SET name = name, surname = surname, qual = qual, salary = salary, phone = phone, email = email
WHERE teacher.id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `class`
--

CREATE TABLE `class` (
  `cid` int(11) NOT NULL,
  `classname` varchar(255) NOT NULL,
  `floor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `class`
--

INSERT INTO `class` (`cid`, `classname`, `floor`) VALUES
(1, '9 - A', 'Floor 1'),
(2, '9 - B', 'Floor 1'),
(3, '9 - C', 'Floor 1'),
(4, '10 - A', 'Floor 1'),
(5, '10 - B', 'Floor 2'),
(6, '10 - C', 'Floor 2'),
(7, '11 - A', 'Floor 2'),
(8, '11 - B', 'Floor 2'),
(9, '11 - C', 'Floor 3'),
(10, '12 - A', 'Floor 3');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exam`
--

CREATE TABLE `exam` (
  `eid` int(11) NOT NULL,
  `ename` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `exam`
--

INSERT INTO `exam` (`eid`, `ename`, `term`, `date`, `class`, `subject`) VALUES
(1, 'Computer Second Exam', 'First Term', '2021-12-30', '9 - A', 'Computer'),
(2, 'Math Second Exam', 'First Term', '2022-01-03', '12 - A', 'Math');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `stname` varchar(255) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `student`
--

INSERT INTO `student` (`id`, `stname`, `pname`, `dob`, `gender`, `address`, `class`) VALUES
(1, 'Ogulcan', 'Isleyen', '2000-05-26', 'Male', 'Ankara Demetevler', '9 - A'),
(2, 'Mert', 'Olgun', '2000-07-01', 'Male', 'Ankara Sincan', '10 - B'),
(3, 'Enes Faruk', 'Keskin', '1999-05-07', 'Male', 'Ankara Batıkent', '11 - C');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subject`
--

CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `subjectname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `subject`
--

INSERT INTO `subject` (`sid`, `subjectname`) VALUES
(1, 'Computer'),
(2, 'Math'),
(3, 'Physics');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `qual` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `surname`, `qual`, `salary`, `phone`, `email`) VALUES
(1, 'Shadi', 'Alshebabi', 'Computer', 10000, 2222, 'shadi.alshehabi@ceng.thk.edu.tr'),
(2, 'Sinem', 'Seyrek Ceran', 'Math', 8000, 3333, 'ssceran@thk.edu.tr'),
(3, 'Ibrahim Ugur', 'Aba', 'Physics', 8000, 4444, 'iuaba@thk.edu.tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `phone`, `uname`, `password`, `utype`) VALUES
(1, 'Hasan', 'Erbay', 1111, 'herbay', '1234', 'Manager'),
(2, 'admin', 'admin', 0, 'admin', 'admin', 'Admin');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cid`,`classname`),
  ADD KEY `classname` (`classname`);

--
-- Tablo için indeksler `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `class` (`class`,`subject`),
  ADD KEY `subject` (`subject`);

--
-- Tablo için indeksler `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class` (`class`);

--
-- Tablo için indeksler `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sid`,`subjectname`),
  ADD KEY `subjectname` (`subjectname`);

--
-- Tablo için indeksler `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `class`
--
ALTER TABLE `class`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `exam`
--
ALTER TABLE `exam`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `subject`
--
ALTER TABLE `subject`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`classname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `subject` (`subjectname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`classname`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
