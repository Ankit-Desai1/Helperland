-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 05:45 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helperland`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email_id` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Firstname` varchar(30) NOT NULL,
  `Lastname` varchar(30) NOT NULL,
  `Email_id` varchar(30) NOT NULL,
  `Phone_no` varchar(15) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `ID` int(11) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `House_no` int(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Postal_code` varchar(10) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Phone_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Service_provider_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Rating_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Service_provider_ID` int(11) NOT NULL,
  `Service_id` int(11) NOT NULL,
  `Rating` float NOT NULL,
  `Comment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `Service_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Service_provider_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Start_time` time NOT NULL,
  `Duration` time NOT NULL,
  `Extra_service` varchar(50) DEFAULT NULL,
  `Comment` varchar(50) DEFAULT NULL,
  `Pet` bit(1) NOT NULL,
  `Total_price` float NOT NULL,
  `Address_id` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

CREATE TABLE `service_provider` (
  `ID` int(11) NOT NULL,
  `Firstname` varchar(30) NOT NULL,
  `Lastname` varchar(30) NOT NULL,
  `Email_id` varchar(30) NOT NULL,
  `Phone_no` varchar(15) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `Nationality` varchar(10) DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `Avtar` mediumblob DEFAULT NULL,
  `House_no` int(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Postal_code` varchar(10) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Radius` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email_id` (`Email_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email_id` (`Email_id`),
  ADD UNIQUE KEY `Phone_no` (`Phone_no`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_customer` (`customer_ID`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_customers_id` (`Customer_ID`),
  ADD KEY `FK_Serviceproviderid` (`Service_provider_ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Rating_ID`),
  ADD KEY `FK_Service_providerid` (`Service_provider_ID`),
  ADD KEY `FK_customersid` (`Customer_ID`),
  ADD KEY `FK_Serviceid` (`Service_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Service_ID`),
  ADD KEY `FK_Customer_id` (`Customer_ID`),
  ADD KEY `FK_Service_provider` (`Service_provider_ID`),
  ADD KEY `FK_address` (`Address_id`),
  ADD KEY `FK_status` (`Status`);

--
-- Indexes for table `service_provider`
--
ALTER TABLE `service_provider`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email_id` (`Email_id`),
  ADD UNIQUE KEY `Phone_no` (`Phone_no`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `Rating_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `Service_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_provider`
--
ALTER TABLE `service_provider`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `FK_Serviceproviderid` FOREIGN KEY (`Service_provider_ID`) REFERENCES `service_provider` (`ID`),
  ADD CONSTRAINT `FK_customers_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_Service_providerid` FOREIGN KEY (`Service_provider_ID`) REFERENCES `service_provider` (`ID`),
  ADD CONSTRAINT `FK_Serviceid` FOREIGN KEY (`Service_id`) REFERENCES `service` (`Service_ID`),
  ADD CONSTRAINT `FK_customersid` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_Customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `FK_Service_provider` FOREIGN KEY (`Service_provider_ID`) REFERENCES `service_provider` (`ID`),
  ADD CONSTRAINT `FK_address` FOREIGN KEY (`Address_id`) REFERENCES `customer_address` (`ID`),
  ADD CONSTRAINT `FK_status` FOREIGN KEY (`Status`) REFERENCES `status` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
