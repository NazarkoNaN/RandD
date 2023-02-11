-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql9.freesqldatabase.com
-- Generation Time: Feb 11, 2023 at 03:25 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql9597159`
--

-- --------------------------------------------------------

--
-- Table structure for table `Hostel`
--

CREATE TABLE `Hostel` (
  `Name` char(16) NOT NULL,
  `Location` char(255) NOT NULL,
  `Phone` char(14) NOT NULL,
  `Email` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Room2`
--

CREATE TABLE `Room2` (
  `RoomID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Student1` char(8) DEFAULT NULL,
  `Student2` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Room3`
--

CREATE TABLE `Room3` (
  `RoomID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Student1` char(8) DEFAULT NULL,
  `Student2` char(8) DEFAULT NULL,
  `Student3` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Room4`
--

CREATE TABLE `Room4` (
  `RoomID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Student1` char(8) DEFAULT NULL,
  `Student2` char(8) DEFAULT NULL,
  `Student3` char(8) DEFAULT NULL,
  `Student4` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RoomInfo`
--

CREATE TABLE `RoomInfo` (
  `HostelName` char(16) NOT NULL,
  `Number` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `FirsName` char(16) NOT NULL,
  `LastName` char(16) NOT NULL,
  `Gender` char(1) NOT NULL,
  `ID` char(8) NOT NULL,
  `AverageScore` float DEFAULT NULL,
  `Email` char(64) NOT NULL,
  `RoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Hostel`
--
ALTER TABLE `Hostel`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `Room2`
--
ALTER TABLE `Room2`
  ADD KEY `R2_RID_FK` (`RoomID`),
  ADD KEY `R2_S1_FK` (`Student1`),
  ADD KEY `R2_S2_FK` (`Student2`);

--
-- Indexes for table `Room3`
--
ALTER TABLE `Room3`
  ADD KEY `R3_RID_FK` (`RoomID`),
  ADD KEY `R3_S1_FK` (`Student1`),
  ADD KEY `R3_S2_FK` (`Student2`),
  ADD KEY `R3_S3_FK` (`Student3`);

--
-- Indexes for table `Room4`
--
ALTER TABLE `Room4`
  ADD KEY `R4_RID_FK` (`RoomID`),
  ADD KEY `R4_S1_FK` (`Student1`),
  ADD KEY `R4_S2_FK` (`Student2`),
  ADD KEY `R4_S3_FK` (`Student3`),
  ADD KEY `R4_S4_FK` (`Student4`);

--
-- Indexes for table `RoomInfo`
--
ALTER TABLE `RoomInfo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RI_HostelName_FK` (`HostelName`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `StudentEmail` (`Email`),
  ADD UNIQUE KEY `SRoomID` (`RoomID`),
  ADD KEY `ID` (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Room2`
--
ALTER TABLE `Room2`
  ADD CONSTRAINT `R2_S2_FK` FOREIGN KEY (`Student2`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R2_RID_FK` FOREIGN KEY (`RoomID`) REFERENCES `RoomInfo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `R2_S1_FK` FOREIGN KEY (`Student1`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Room3`
--
ALTER TABLE `Room3`
  ADD CONSTRAINT `R3_S3_FK` FOREIGN KEY (`Student3`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R3_RID_FK` FOREIGN KEY (`RoomID`) REFERENCES `RoomInfo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `R3_S1_FK` FOREIGN KEY (`Student1`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R3_S2_FK` FOREIGN KEY (`Student2`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Room4`
--
ALTER TABLE `Room4`
  ADD CONSTRAINT `R4_S4_FK` FOREIGN KEY (`Student4`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R4_RID_FK` FOREIGN KEY (`RoomID`) REFERENCES `RoomInfo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `R4_S1_FK` FOREIGN KEY (`Student1`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R4_S2_FK` FOREIGN KEY (`Student2`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `R4_S3_FK` FOREIGN KEY (`Student3`) REFERENCES `Student` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `RoomInfo`
--
ALTER TABLE `RoomInfo`
  ADD CONSTRAINT `RI_HostelName_FK` FOREIGN KEY (`HostelName`) REFERENCES `Hostel` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `S_RoomInfo_FK` FOREIGN KEY (`RoomID`) REFERENCES `RoomInfo` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
