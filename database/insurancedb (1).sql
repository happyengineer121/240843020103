CREATE DATABASE  IF NOT EXISTS `insurancedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `insurancedb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: insurancedb
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim` (
  `ClaimID` int NOT NULL AUTO_INCREMENT,
  `Cstatus` varchar(255) NOT NULL,
  `CID` int DEFAULT NULL,
  `TID` varchar(255) DEFAULT NULL,
  `PolicyID` int DEFAULT NULL,
  PRIMARY KEY (`ClaimID`),
  KEY `FK_Claim_Customer` (`CID`),
  KEY `FK_Claim_Transaction` (`TID`),
  KEY `FK_Claim_Policy` (`PolicyID`),
  CONSTRAINT `FK_Claim_Customer` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  CONSTRAINT `FK_Claim_Policy` FOREIGN KEY (`PolicyID`) REFERENCES `policy` (`PolicyID`),
  CONSTRAINT `FK_Claim_Transaction` FOREIGN KEY (`TID`) REFERENCES `transaction` (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim`
--

LOCK TABLES `claim` WRITE;
/*!40000 ALTER TABLE `claim` DISABLE KEYS */;
INSERT INTO `claim` VALUES (1,'Approved',1,'TXN001',1),(2,'Pending',2,'TXN002',2);
/*!40000 ALTER TABLE `claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `Cname` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Aadhar` varchar(255) NOT NULL,
  `Pan_no` varchar(255) NOT NULL,
  `ContactNo` varchar(255) NOT NULL,
  `UID` int DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `FK_Customer_User` (`UID`),
  CONSTRAINT `FK_Customer_User` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ashish Hambir','1990-05-15','123456789012','ABCPH1234D','9876543210',2),(2,'Vaibhav Andure','1985-08-20','123456789013','XYSOP1234X','9876543211',3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurer`
--

DROP TABLE IF EXISTS `insurer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurer` (
  `I_ID` int NOT NULL AUTO_INCREMENT,
  `I_name` varchar(255) NOT NULL,
  `LicenseNO` varchar(255) DEFAULT NULL,
  `UID` int DEFAULT NULL,
  PRIMARY KEY (`I_ID`),
  KEY `FK_Insurer_IRDAI` (`LicenseNO`),
  KEY `FK_Insurer_User` (`UID`),
  CONSTRAINT `FK_Insurer_IRDAI` FOREIGN KEY (`LicenseNO`) REFERENCES `irdai` (`LicenseNO`),
  CONSTRAINT `FK_Insurer_User` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurer`
--

LOCK TABLES `insurer` WRITE;
/*!40000 ALTER TABLE `insurer` DISABLE KEYS */;
INSERT INTO `insurer` VALUES (1,'Star Health Insurance Co.','IRDAI12345',NULL),(2,'Tata AIG Insurance Co.','IRDAI67890',NULL);
/*!40000 ALTER TABLE `insurer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irdai`
--

DROP TABLE IF EXISTS `irdai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irdai` (
  `LicenseNO` varchar(255) NOT NULL,
  `IRID` int NOT NULL,
  PRIMARY KEY (`LicenseNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irdai`
--

LOCK TABLES `irdai` WRITE;
/*!40000 ALTER TABLE `irdai` DISABLE KEYS */;
INSERT INTO `irdai` VALUES ('IRDAI12345',101),('IRDAI67890',102);
/*!40000 ALTER TABLE `irdai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `NID` int NOT NULL AUTO_INCREMENT,
  `Message` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`NID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Your claim has been approved!','2023-12-15'),(2,'Premium payment successful.','2023-12-05');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `PolicyID` int NOT NULL AUTO_INCREMENT,
  `P_name` varchar(255) NOT NULL,
  `Premium` varchar(255) NOT NULL,
  `Terms` varchar(255) NOT NULL,
  `I_ID` int DEFAULT NULL,
  PRIMARY KEY (`PolicyID`),
  KEY `FK_Policy_Insurer` (`I_ID`),
  CONSTRAINT `FK_Policy_Insurer` FOREIGN KEY (`I_ID`) REFERENCES `insurer` (`I_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (1,'Health Shield Plan','5000 INR','5 years',1),(2,'Term Life Insurance','3000 INR','10 years',2);
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TID` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `Date` date NOT NULL,
  `CID` int DEFAULT NULL,
  `PolicyID` int DEFAULT NULL,
  PRIMARY KEY (`TID`),
  KEY `FK_Transaction_Customer` (`CID`),
  KEY `FK_Transaction_Policy` (`PolicyID`),
  CONSTRAINT `FK_Transaction_Customer` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  CONSTRAINT `FK_Transaction_Policy` FOREIGN KEY (`PolicyID`) REFERENCES `policy` (`PolicyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('TXN001',5000,'2023-12-01',1,1),('TXN002',3000,'2023-12-05',2,2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `Role` varchar(255) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES ('Admin','Administrator'),('Customer','Policy Holder'),('Insurer','Insurance Company');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `Uname` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `FK_Users_Types` (`Role`),
  CONSTRAINT `FK_Users_Types` FOREIGN KEY (`Role`) REFERENCES `types` (`Role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Abhay Tambe','password123','abhay.tambe@example.in','10/5, Sector 12, Pune, Maharashtra','Admin'),(2,'Ashish Hambir','ashishpassword','ashish.hambir@example.in','Flat 102, Satyam Residency, Thane, Maharashtra','Customer'),(3,'Vaibhav Andure','vaibhavpass','vaibhav.andure@example.in','Shivaji Nagar, Aurangabad, Maharashtra','Customer'),(4,'Star Health Insurance Co.','starhealth123','contact@starhealth.com','Head Office, Chennai, Tamil Nadu','Insurer'),(5,'Tata AIG Insurance Co.','tataaig123','contact@tataaig.com','Corporate Office, Mumbai, Maharashtra','Insurer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-24 19:07:21
