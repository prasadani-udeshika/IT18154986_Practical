-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 04:46 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Id` varchar(30) NOT NULL,
  `DoctorId` varchar(50) NOT NULL,
  `Scheule` varchar(20) NOT NULL,
  `time` varchar(15) NOT NULL,
  `token` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Id`, `DoctorId`, `Scheule`, `time`, `token`) VALUES
('A010', 'DC001', 'Morning', '12:00:00', 1),
('A012', 'DC09', 'Morning', '12:00:00', 23);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userId` int(12) NOT NULL,
  `userN` varchar(30) NOT NULL,
  `passW` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userId`, `userN`, `passW`, `email`) VALUES
(1, 'NewSunil', 'Nsunil098', 'su@gmail.com'),
(6, 'Hiran', 'hiran111', 'hi@gamil.com'),
(3, 'nimal', 'nimal987', 'ni@gmail.com'),
(4, 'gihan', 'gihan876', 'gi@gmail.com'),
(8, 'prasadani', '234pa', 'pa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pappointment`
--

CREATE TABLE `pappointment` (
  `NoAppoint` varchar(50) NOT NULL,
  `DoctorN` varchar(50) NOT NULL,
  `HospitalN` varchar(30) NOT NULL,
  `userPhon` varchar(10) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pappointment`
--

INSERT INTO `pappointment` (`NoAppoint`, `DoctorN`, `HospitalN`, `userPhon`, `Date`, `time`) VALUES
('A001', 'Dr.Gayani', 'Browns', '0112264312', '17-04-2020', '13:00:00'),
('A006', 'Dr. W,P.Silva', 'ASIRI Hospital', '775543987', '16-04-2020', '14:30:00'),
('B001', 'Dr. A.U. Pilipitiya', 'Lanka Hospital', '775532412', '19-04-2020', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `paymentp`
--

CREATE TABLE `paymentp` (
  `PaymentN` int(50) NOT NULL,
  `NoAppoint` varchar(50) NOT NULL,
  `PaymentTy` varchar(20) NOT NULL,
  `Date` varchar(15) NOT NULL,
  `userId` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regist`
--

CREATE TABLE `regist` (
  `UCode` int(100) NOT NULL,
  `UName` varchar(100) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `userPhon` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `passw` varchar(20) NOT NULL,
  `cpass` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regist`
--

INSERT INTO `regist` (`UCode`, `UName`, `NIC`, `userPhon`, `email`, `passw`, `cpass`) VALUES
(51, 'Samadhi Kamari ', '971234512V', '0112251287', 'sama@gmail.com', '123poi', '123poi'),
(52, 'Kumara Lochana', '971234512V', '0112251287', 'lo@gmail.com', '123poi', '123poi'),
(53, 'Gayani Jayamaha', '9312345671V', '0111234523', 'ga@gmail.com', 'qw124', 'qw124'),
(27, 'Nimal Harin', '9412345768V', '0112242687', 'n@gmail.com', '1234as', '1234as'),
(33, 'Pushpa Nimali', '912345678V', '0112245678', 'pp@gmail.com', '123yt', '123yt'),
(35, 'binura Dilan', '912345678V', '0112245678', 'er@gmail.com', '123drt', '123drt'),
(54, 'Sunimal Lasith', '9312345671V', '0111245678', 'su@gmail.com', 'qw124', 'qw124');

-- --------------------------------------------------------

--
-- Table structure for table `registerpd`
--

CREATE TABLE `registerpd` (
  `UName` varchar(40) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `userPhon` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `creditNo` varchar(16) NOT NULL,
  `passW` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registerpd`
--

INSERT INTO `registerpd` (`UName`, `NIC`, `userPhon`, `email`, `Address`, `creditNo`, `passW`) VALUES
('Nimal Silva', '914327654V', '0115543265', 'ni@gmail.com', '33/C ,wattala', '1234565432134', 'mi432'),
('Nirma Liyanage', '911265423V', '0727764987', 'li@gmail.com', '55/A/1 , Ja-ela', '1234567812345678', 'li987'),
('Vishmi Madu', '901234567V', '0763386534', 'vi@gmail.com', '77/D/a, Kadana', '0987654312345678', 'vi432'),
(' Roy Jayamaha', '912765432V', '0113356789', 'ro@gmail.com', '11/5/3, Ja-ela', '098734561234875', 'rou987');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `pappointment`
--
ALTER TABLE `pappointment`
  ADD PRIMARY KEY (`NoAppoint`);

--
-- Indexes for table `paymentp`
--
ALTER TABLE `paymentp`
  ADD PRIMARY KEY (`PaymentN`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `regist`
--
ALTER TABLE `regist`
  ADD PRIMARY KEY (`UCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `paymentp`
--
ALTER TABLE `paymentp`
  MODIFY `PaymentN` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regist`
--
ALTER TABLE `regist`
  MODIFY `UCode` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
