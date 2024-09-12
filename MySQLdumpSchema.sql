-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: creditcardrecords
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bank` (
  `BankID` int NOT NULL AUTO_INCREMENT,
  `BankName` varchar(255) NOT NULL,
  PRIMARY KEY (`BankID`),
  UNIQUE KEY `BankName` (`BankName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cards`
--

DROP TABLE IF EXISTS `Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cards` (
  `CardID` int NOT NULL AUTO_INCREMENT,
  `CardName` varchar(255) NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `BankID` int NOT NULL,
  `PointsTypeID` int NOT NULL,
  PRIMARY KEY (`CardID`),
  KEY `BankID` (`BankID`),
  KEY `PointsTypeID` (`PointsTypeID`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`BankID`) REFERENCES `Bank` (`BankID`),
  CONSTRAINT `cards_ibfk_2` FOREIGN KEY (`PointsTypeID`) REFERENCES `PointsType` (`PointsTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PointsEarningRates`
--

DROP TABLE IF EXISTS `PointsEarningRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PointsEarningRates` (
  `CardID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `PointsPerDollar` decimal(10,2) NOT NULL,
  `PointsTypeID` int NOT NULL,
  PRIMARY KEY (`CardID`,`CategoryID`,`PointsTypeID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `PointsTypeID` (`PointsTypeID`),
  CONSTRAINT `pointsearningrates_ibfk_1` FOREIGN KEY (`CardID`) REFERENCES `Cards` (`CardID`),
  CONSTRAINT `pointsearningrates_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`),
  CONSTRAINT `pointsearningrates_ibfk_3` FOREIGN KEY (`PointsTypeID`) REFERENCES `PointsType` (`PointsTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PointsType`
--

DROP TABLE IF EXISTS `PointsType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PointsType` (
  `PointsTypeID` int NOT NULL AUTO_INCREMENT,
  `PointsTypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`PointsTypeID`),
  UNIQUE KEY `PointsTypeName` (`PointsTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `Description` text,
  `Amount` double DEFAULT NULL,
  `Address` text,
  `City` text,
  `State` text,
  `Zip_Code` text,
  `Country` text,
  `CardID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CardID` (`CardID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`CardID`) REFERENCES `Cards` (`CardID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=896 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 11:44:30
