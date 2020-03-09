-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2020 at 11:54 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ballistic`
--

-- --------------------------------------------------------

--
-- Table structure for table `ballistic_data`
--

CREATE TABLE `ballistic_data` (
  `refID` varchar(100) NOT NULL,
  `cartridge` varchar(100) NOT NULL,
  `bullet` varchar(100) NOT NULL,
  `wt` varchar(10) NOT NULL,
  `velocity` varchar(100) NOT NULL,
  `energy` varchar(100) NOT NULL,
  `trajectory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ballistic_data`
--

INSERT INTO `ballistic_data` (`refID`, `cartridge`, `bullet`, `wt`, `velocity`, `energy`, `trajectory`) VALUES
('17Mach2', '17 Mach 2', '15.5 gr. NTX', '1.00', '625', '196', '-5.0'),
('17HMR', '17 HMR', '15.5 gr. NTX', '1.00', '770', '298', '-5.0'),
('17Hornet', '17 Hornet', '20 gr. V-MAX', '1.30', '1113', '802', '-5.0'),
('204Ruger', '204 Ruger', '45 gr. SP (26\" Bbl)', '2.92', '1105', '1780', '-5.0');

-- --------------------------------------------------------

--
-- Table structure for table `ballistic_searches`
--

CREATE TABLE `ballistic_searches` (
  `cart` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ballistic_searches`
--

INSERT INTO `ballistic_searches` (`cart`, `username`) VALUES
('17Mach2', 'csciarrino'),
('17Mach2', 'csciarrino'),
('204Ruger', 'csciarrino'),
('17Hornet', 'csciarrino'),
('17Mach2', 'bobross'),
('204Ruger', 'bobross');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `fname`, `lname`, `username`, `password`) VALUES
(1, 'Crystal', 'Sciarrino', 'csciarrino', '1234'),
(2, 'Bob', 'Ross', 'bobross', 'trees');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
