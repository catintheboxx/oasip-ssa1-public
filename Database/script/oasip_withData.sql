-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: oasip
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- -----------------------------------------------------
-- Creaet database oasip
-- -----------------------------------------------------
create database if not exists oasip;
use oasip;

--
-- Table structure for table `eventcategories`
--

DROP TABLE IF EXISTS `eventCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventCategories` (
  `eventCategoryId` int NOT NULL AUTO_INCREMENT,
  `eventCategoryName` varchar(100) NOT NULL,
  `eventCategoryDescription` varchar(500) DEFAULT NULL,
  `eventDuration` int NOT NULL,
  `imagePath` varchar(250) NOT NULL,
  PRIMARY KEY (`eventCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventcategories`
--

LOCK TABLES `eventCategories` WRITE;
/*!40000 ALTER TABLE `eventcategories` DISABLE KEYS */;
INSERT INTO `eventCategories` VALUES (1,'Project Management Clinic',' ตารางนัดหมายนี้ใช้สําหรับนัดหมาย project management clinic ในวิชา INT221 integrated project I ให้นักศึกษาเตรียมเอกสารที่เกี่ยวข้องเพื่อแสดง ระหว่างขอคําปรึกษา',30,'/ssa1/images/project-management.png'),(2,'DevOps/Infra Clinic','Use this event category for DevOps/Infra clinic.',20,'/ssa1/images/dev-ops.png'),(3,'Database Clinic','ตารางนัดหมายนี้ใช้สําหรับนัดหมาย database clinic ใน วิชา INT221 integrated project I',15,'/ssa1/images/database.png'),(4,'Client-side Clinic','ตารางนัดหมายนี้ใช้สําหรับนัดหมาย client-side clinic ใน วิชา INT221 integrated project I',30,'/ssa1/images/front-end.png'),(5,'Server-side Clinic','',30,'/ssa1/images/back-end.png');
/*!40000 ALTER TABLE `eventcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `bookingId` int NOT NULL AUTO_INCREMENT,
  `bookingName` varchar(100) NOT NULL,
  `bookingEmail` varchar(100) NOT NULL,
  `eventDate` date NOT NULL,
  `eventStartTime` time NOT NULL,
  `eventEndTime` time NOT NULL,
  `eventDuration` int NOT NULL,
  `eventNotes` varchar(500) DEFAULT NULL,
  `eventCategoryId` int NOT NULL,
  `statusId` int NOT NULL,
  PRIMARY KEY (`bookingId`),
  KEY `fk_event_eventCategory_idx` (`eventCategoryId`),
  KEY `fk_events_status1_idx` (`statusId`),
  CONSTRAINT `fk_event_eventCategory` FOREIGN KEY (`eventCategoryId`) REFERENCES `eventCategories` (`eventCategoryId`),
  CONSTRAINT `fk_events_status1` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Somchai Jaidee (OR-7)','somchai.jai@mail.kmutt.ac.th','2022-05-23','13:30:00','14:00:00',30,'',2,3),(2,'Somsri Rakdee (SJ-3)','somsri.rak@mail.kmutt.ac.th','2022-04-27','09:30:00','10:00:00',30,'ขอปรึกษาปัญหาเพื่อนไม่ช่วยงาน',1,1),(3,'สมเกียรติ ขยันเรียน  (TT-4)','somkiat.kay@kmutt.ac.th','2022-05-23','16:30:00','17:00:00',15,'',3,3);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(50) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'ENDED'),(2,'ONGOING'),(3,'UPCOMING');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08  2:06:50
