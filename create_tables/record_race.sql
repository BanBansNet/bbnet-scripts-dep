-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: teeworlds
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `record_race`
--

DROP TABLE IF EXISTS `record_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_race` (
  `Map` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `Name` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Time` float NOT NULL DEFAULT '0',
  `Server` char(4) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `cp1` float NOT NULL DEFAULT '0',
  `cp2` float NOT NULL DEFAULT '0',
  `cp3` float NOT NULL DEFAULT '0',
  `cp4` float NOT NULL DEFAULT '0',
  `cp5` float NOT NULL DEFAULT '0',
  `cp6` float NOT NULL DEFAULT '0',
  `cp7` float NOT NULL DEFAULT '0',
  `cp8` float NOT NULL DEFAULT '0',
  `cp9` float NOT NULL DEFAULT '0',
  `cp10` float NOT NULL DEFAULT '0',
  `cp11` float NOT NULL DEFAULT '0',
  `cp12` float NOT NULL DEFAULT '0',
  `cp13` float NOT NULL DEFAULT '0',
  `cp14` float NOT NULL DEFAULT '0',
  `cp15` float NOT NULL DEFAULT '0',
  `cp16` float NOT NULL DEFAULT '0',
  `cp17` float NOT NULL DEFAULT '0',
  `cp18` float NOT NULL DEFAULT '0',
  `cp19` float NOT NULL DEFAULT '0',
  `cp20` float NOT NULL DEFAULT '0',
  `cp21` float NOT NULL DEFAULT '0',
  `cp22` float NOT NULL DEFAULT '0',
  `cp23` float NOT NULL DEFAULT '0',
  `cp24` float NOT NULL DEFAULT '0',
  `cp25` float NOT NULL DEFAULT '0',
  `GameID` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `Map` (`Map`,`Name`,`Time`,`Timestamp`,`Server`),
  KEY `Map_2` (`Map`,`Name`),
  KEY `Name` (`Name`,`Timestamp`),
  KEY `Server` (`Server`),
  KEY `MapTimestamp` (`Map`,`Timestamp`),
  KEY `Timestamp` (`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_race`
--
