-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 10:48 AM
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
-- Database: `p003`
--

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `id_klant` int(10) NOT NULL,
  `naam` varchar(25) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefoonnummer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `qtg` varchar(50) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retour`
--

CREATE TABLE `retour` (
  `id_retour` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `id_order` int(10) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revieuw`
--

CREATE TABLE `revieuw` (
  `id_revieuw` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `revieuw` varchar(50) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`id_klant`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_klant` (`id_klant`);

--
-- Indexes for table `retour`
--
ALTER TABLE `retour`
  ADD PRIMARY KEY (`id_retour`),
  ADD KEY `id_klant` (`id_klant`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `revieuw`
--
ALTER TABLE `revieuw`
  ADD PRIMARY KEY (`id_revieuw`),
  ADD KEY `id_klant` (`id_klant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klant`
--
ALTER TABLE `klant`
  MODIFY `id_klant` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retour`
--
ALTER TABLE `retour`
  MODIFY `id_retour` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revieuw`
--
ALTER TABLE `revieuw`
  MODIFY `id_revieuw` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klant`
--
ALTER TABLE `klant`
  ADD CONSTRAINT `klant_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `order` (`id_klant`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `retour` (`id_order`);

--
-- Constraints for table `retour`
--
ALTER TABLE `retour`
  ADD CONSTRAINT `retour_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `klant` (`id_klant`);

--
-- Constraints for table `revieuw`
--
ALTER TABLE `revieuw`
  ADD CONSTRAINT `revieuw_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `klant` (`id_klant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
