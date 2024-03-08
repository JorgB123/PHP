-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 02:16 AM
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
-- Database: `bisu_supply`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Password` varchar(12) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role` varchar(15) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `EmployeeID`, `FirstName`, `LastName`, `Password`, `Email`, `Role`, `image`) VALUES
(1, 524025, 'Aurelia', 'Bongcac', 'bongcacBisu0', 'aurelia.bongcac@bisu.edu.ph', 'Supply Officer', ''),
(4, 524025, 'Nicole', 'Palwa', '$2y$10$dCKbq', 'nicole.palwa@bisu.edu.ph', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `damageditems`
--

CREATE TABLE `damageditems` (
  `DamagedItemID` int(11) NOT NULL,
  `PropertyID` int(11) DEFAULT NULL,
  `ReportedDate` date DEFAULT NULL,
  `Details` varchar(255) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `Department` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `Department`) VALUES
(1, 'Department of Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `fund`
--

CREATE TABLE `fund` (
  `FundID` int(11) NOT NULL,
  `FundName` varchar(225) NOT NULL,
  `FundYear` year(4) NOT NULL,
  `AmountAllocated` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fund`
--

INSERT INTO `fund` (`FundID`, `FundName`, `FundYear`, `AmountAllocated`) VALUES
(1, 'GAA', '1990', 1000000.00),
(2, 'STF', '1998', 1200000.00),
(6, 'GAA', '2023', 2000001.00),
(7, 'GAA', '2024', 2000001.00);

-- --------------------------------------------------------

--
-- Table structure for table `fundused`
--

CREATE TABLE `fundused` (
  `FundUsedID` int(11) NOT NULL,
  `FundID` int(11) NOT NULL,
  `AmountUsed` int(11) NOT NULL,
  `DateUsed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fundused`
--

INSERT INTO `fundused` (`FundUsedID`, `FundID`, `AmountUsed`, `DateUsed`) VALUES
(12, 1, 0, 2024),
(13, 1, 0, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `MaintenanceID` int(11) NOT NULL,
  `PropertyID` int(11) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `particulars`
--

CREATE TABLE `particulars` (
  `ParticularID` int(11) NOT NULL,
  `Particulars` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `particulars`
--

INSERT INTO `particulars` (`ParticularID`, `Particulars`) VALUES
(3, 'Land'),
(4, 'Land improvement'),
(5, 'Office Building');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `PropertyID` int(11) NOT NULL,
  `PropertyNumber` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `DateAcquired` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Unit` varchar(255) DEFAULT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  `StockAvailable` int(11) DEFAULT NULL,
  `Supplier` varchar(255) DEFAULT NULL,
  `Particular` varchar(255) DEFAULT NULL,
  `PropertyStatus` varchar(50) DEFAULT NULL,
  `WhereAbout` varchar(255) DEFAULT NULL,
  `SourceFund` varchar(10) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`PropertyID`, `PropertyNumber`, `Description`, `DateAcquired`, `Unit`, `UnitCost`, `StockAvailable`, `Supplier`, `Particular`, `PropertyStatus`, `WhereAbout`, `SourceFund`, `Image`) VALUES
(357, 123455, 'Notebook PC Asus E203M Black 12\"', '2024-01-24 16:00:00', 'piece', 1234556.00, NULL, 'Bela Tech', '', NULL, NULL, NULL, NULL),
(358, 23456, 'Laptop Asus E203M Black 14\"', '2024-01-24 16:00:00', 'piece', 25600.50, NULL, 'Bela Tech', '', NULL, NULL, NULL, NULL),
(359, 24586, 'BT Mouse Belaquip BT123 White 3.94 in (100 mm) x  2.28 in (58 mm)', '2024-01-25 03:30:44', 'piece', 3510.15, NULL, 'Bela Tech', '', NULL, NULL, 'STF', NULL),
(360, 56787, 'Pencil Mongol 2  ', '2024-01-28 16:00:00', 'pax', 88.00, 1, 'National Bookstore', NULL, NULL, NULL, 'STF', NULL),
(361, 0, 'Typewriter Olivetti   15\" carriage', '1999-01-26 16:00:00', 'unit', 111000.00, 1, '', 'Office Equipment', NULL, NULL, 'GAA', NULL),
(362, 123456, 'Condura 2HP   ', '1999-01-29 13:34:00', 'unit', 100000.00, 1, '', 'Office Equipment', NULL, NULL, 'GAA', NULL),
(381, 20240306, 'molr', '0000-00-00 00:00:00', 'Piece', 55.00, 99999, 'gg', 'Land', 'Usable', 'cccc', 'STF', 'item_images/20240306_111322.jpg'),
(382, 20240306, 'jiji', '0000-00-00 00:00:00', 'Piece', 6.00, 45, 'gg', 'Library and Other Books', 'Not Usable', 'f', 'STF', 'item_images/20240306_112934.jpg'),
(384, 20240306, '', '2024-03-06 04:01:00', 'Piece', 0.00, 0, '', 'Land', 'Usable', '', 'STF', 'item_images/20240306_120135.jpg'),
(385, 20240308, 'ohhh', '2024-03-08 00:56:00', 'Unit', 233.00, 334, 'Jorge', 'Disaster Response and Rescue Equipment', 'Usable', 'BISU', 'GAA', 'item_images/20240308_085551.jpg'),
(386, 20240308, 'try', '2024-03-08 01:09:00', 'Piece', 1.00, 1, 'gyg', 'Land', 'Usable', 'vv', 'STF', 'http://192.168.1.14/item_images/20240308_090853.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `ReportID` int(11) NOT NULL,
  `ReportFile` varchar(225) NOT NULL,
  `ReportDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ReportType` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requestitems`
--

CREATE TABLE `requestitems` (
  `RequestItemID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PropertyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnitems`
--

CREATE TABLE `returnitems` (
  `ReturnID` int(11) NOT NULL,
  `PropertyID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `DateReturn` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settingID` int(11) NOT NULL,
  `image` int(11) NOT NULL,
  `words` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transferreditems`
--

CREATE TABLE `transferreditems` (
  `TransferID` int(11) NOT NULL,
  `RequestItemID` int(11) DEFAULT NULL,
  `PropertyID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TransferDate` date DEFAULT NULL,
  `TransferredTo` varchar(255) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `UserTransferID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int(11) NOT NULL,
  `Unit` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `Unit`) VALUES
(1, 'meter'),
(2, 'piece'),
(3, 'rem'),
(4, 'inches');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Role` varchar(25) NOT NULL,
  `ConfirmStatus` varchar(25) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `Password`, `Email`, `Department`, `Role`, `ConfirmStatus`, `image`) VALUES
(8, 'Nicole', 'Palwa', '$2y$10$SBQ2M8GnSkb5KmmISZhcTeV.L8dQxQS3bDURrPCetBNk2dpfPJYuC', 'nicole.palwa@bisu.edu.ph', 'Department of Computer Science', 'Faculty', 'Requesting', ''),
(9, 'Nicole', 'Palwa', '$2y$10$M81Z8Hz7osQyeYYxjrdos.BELREJ3ccqYQIpm5aeqoOx1WoFo/A5.', 'nicole.palwa@bisu.edu.ph', 'Department of Computer Science', 'Faculty', 'Requesting', ''),
(11, 'Glenn Cyril', 'Garidos', '$2y$10$hLzwvnXkehJgs7jXR4MJhevWU.g5iQd5GeWzv8URLcWdTpOv0KoB2', 'odagirimioxaoyama@gmail.com', NULL, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `damageditems`
--
ALTER TABLE `damageditems`
  ADD PRIMARY KEY (`DamagedItemID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `PropertyID` (`PropertyID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `fund`
--
ALTER TABLE `fund`
  ADD PRIMARY KEY (`FundID`);

--
-- Indexes for table `fundused`
--
ALTER TABLE `fundused`
  ADD PRIMARY KEY (`FundUsedID`),
  ADD KEY `FundID` (`FundID`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`MaintenanceID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `PropertyID` (`PropertyID`);

--
-- Indexes for table `particulars`
--
ALTER TABLE `particulars`
  ADD PRIMARY KEY (`ParticularID`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`PropertyID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `requestitems`
--
ALTER TABLE `requestitems`
  ADD PRIMARY KEY (`RequestItemID`),
  ADD KEY `PropertyID` (`PropertyID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `returnitems`
--
ALTER TABLE `returnitems`
  ADD PRIMARY KEY (`ReturnID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `PropertyID` (`PropertyID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transferreditems`
--
ALTER TABLE `transferreditems`
  ADD PRIMARY KEY (`TransferID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `RequestItemID` (`RequestItemID`),
  ADD KEY `PropertyID` (`PropertyID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `UserTransferID` (`UserTransferID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `damageditems`
--
ALTER TABLE `damageditems`
  MODIFY `DamagedItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fund`
--
ALTER TABLE `fund`
  MODIFY `FundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fundused`
--
ALTER TABLE `fundused`
  MODIFY `FundUsedID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `MaintenanceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `particulars`
--
ALTER TABLE `particulars`
  MODIFY `ParticularID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `PropertyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `damageditems`
--
ALTER TABLE `damageditems`
  ADD CONSTRAINT `damageditems_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`),
  ADD CONSTRAINT `damageditems_ibfk_4` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  ADD CONSTRAINT `damageditems_ibfk_5` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`),
  ADD CONSTRAINT `maintenance_ibfk_3` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`);

--
-- Constraints for table `requestitems`
--
ALTER TABLE `requestitems`
  ADD CONSTRAINT `requestitems_ibfk_2` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  ADD CONSTRAINT `requestitems_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `returnitems`
--
ALTER TABLE `returnitems`
  ADD CONSTRAINT `returnitems_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`),
  ADD CONSTRAINT `returnitems_ibfk_3` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  ADD CONSTRAINT `returnitems_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `transferreditems`
--
ALTER TABLE `transferreditems`
  ADD CONSTRAINT `transferreditems_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`),
  ADD CONSTRAINT `transferreditems_ibfk_3` FOREIGN KEY (`RequestItemID`) REFERENCES `requestitems` (`RequestItemID`),
  ADD CONSTRAINT `transferreditems_ibfk_6` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  ADD CONSTRAINT `transferreditems_ibfk_7` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `transferreditems_ibfk_8` FOREIGN KEY (`UserTransferID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
