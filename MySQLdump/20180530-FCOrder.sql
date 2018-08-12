-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: FCOrder
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `account_list`
--

DROP TABLE IF EXISTS `account_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_list` (
  `account` varchar(30) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `crt_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lud_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_list`
--

LOCK TABLES `account_list` WRITE;
/*!40000 ALTER TABLE `account_list` DISABLE KEYS */;
INSERT INTO `account_list` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,'vRDN8RjQp8aOBfzhBjfWSXUojrtn2VXC','2018-04-05 22:29:47','2018-04-20 18:29:54'),('D0123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-05 20:54:51','2018-04-05 20:54:51'),('D0449763',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-05 20:54:51','2018-04-05 20:54:51'),('OAuth01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-05 20:54:51','2018-04-05 20:54:51'),('T03291',NULL,NULL,NULL,NULL,NULL,NULL,'yt3wrGtmqM88DvmLqIT1qqXwfwPTYLox','2018-04-05 20:54:51','2018-04-20 18:31:18'),('T123456789',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-05 20:54:51','2018-04-05 20:54:51'),('test001','7b81014bf034f9a6d7b676ef7ab990984f3277ee33ea93bb49efc25287d79875','黃聖堯','D0341522','1996-09-10',NULL,NULL,'test1234','2018-04-05 20:54:51','2018-04-05 21:31:07'),('test002','0d84de13f19fb6055df810eebb2e2eb2bbbecd3a674df0d28be185566c642731','汪尚霆','D0342567','1996-01-11',NULL,NULL,NULL,'2018-04-05 20:54:51','2018-04-05 20:54:51');
/*!40000 ALTER TABLE `account_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `manufacturerId` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturerName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manufacturerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'快餐便當'),(2,'金豹便當店'),(3,'慶記燒臘'),(4,'白飯專賣店');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`productId`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `order_list` (`orderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product_list` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,1,1),(3,4,1),(4,6,2),(4,10,1),(5,4,1),(6,1,3),(6,4,4),(6,6,1),(7,3,1),(8,3,1),(9,1,1),(10,3,1),(11,10,1),(12,10,1),(13,10,1),(14,10,1),(15,10,1),(16,10,1),(17,10,1),(18,10,1),(19,2,1),(20,10,1),(21,10,1),(22,10,1),(23,10,1),(24,10,1),(25,10,1),(26,10,1),(27,3,1),(28,10,1),(29,8,3),(29,10,2),(30,1,2),(30,5,1),(31,10,1),(32,6,2),(32,9,1),(32,10,1),(33,6,2),(33,9,1),(33,10,1),(34,4,1),(35,10,1),(36,10,1),(37,10,1),(38,3,1),(39,9,1),(40,10,1),(41,10,2),(42,10,2),(43,9,1),(44,10,2),(45,5,1),(46,3,1),(47,5,1),(48,3,1),(49,3,5),(50,6,1),(50,8,2),(51,9,1),(52,3,1),(52,7,1),(52,9,1),(53,4,9),(54,10,1),(55,3,1),(55,4,4),(56,5,1),(57,10,1),(58,10,3),(59,10,3),(60,10,4),(61,10,2),(62,10,3),(63,10,3),(64,10,1),(65,1,1),(66,1,1),(67,1,1),(68,1,1),(69,1,1),(70,1,1),(71,1,1),(72,10,1),(73,10,1),(74,10,1),(75,1,1),(76,1,1),(86,1,5),(86,4,4),(86,7,3),(86,9,4),(87,1,5),(87,4,4),(87,7,3),(87,9,4),(88,1,5),(88,4,4),(88,7,3),(88,9,4),(89,1,5),(89,4,4),(89,7,3),(89,9,4),(90,1,5),(90,4,4),(90,7,3),(90,9,4),(91,1,5),(91,4,4),(91,7,3),(91,9,4),(92,1,5),(92,4,4),(92,7,3),(92,9,4),(93,1,5),(93,4,4),(93,7,3),(93,10,4),(94,1,5),(94,4,4),(94,7,3),(94,9,4),(95,1,1),(96,1,1),(97,3,1),(98,10,1),(99,10,1),(100,10,1),(101,10,1),(102,10,1),(103,10,1),(104,10,1),(105,10,1),(106,10,1),(107,10,1),(108,10,1),(109,10,1),(110,10,1),(111,10,1),(112,10,1),(113,10,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_list` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `memo` varchar(20) DEFAULT NULL,
  `orderDate` char(15) NOT NULL,
  `clientPaid` int(11) NOT NULL DEFAULT '0',
  `serverPaid` int(11) NOT NULL DEFAULT '0',
  `emailPaid` int(11) NOT NULL DEFAULT '0',
  `pickup` tinyint(1) NOT NULL DEFAULT '0',
  `payment` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `crt_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lud_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `orderToken` varchar(45) NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderToken_UNIQUE` (`orderToken`),
  KEY `payment_idx` (`payment`),
  KEY `status_idx` (`status`),
  KEY `orderToken` (`orderToken`),
  CONSTRAINT `payment` FOREIGN KEY (`payment`) REFERENCES `product_list` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `order_status` (`statusId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (2,'test001',100,'1','','20171026121151',1,0,0,0,1,3,'2018-03-24 19:06:26','2018-03-25 10:26:07','20171026121151test001100'),(3,'test001',120,'1','','20171026123941',1,27637,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171026123941test001120'),(4,'test001',210,'1','','20171026143830',27638,27638,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171026143830test001210'),(5,'test001',120,'1','','20171026144004',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171026144004test001120'),(6,'test001',880,'1','','20171102152623',27648,27648,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171102152623test001880'),(7,'test001',80,'1','','20171107164530',27657,27657,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171107164530test00180'),(8,'test001',80,'1','','20171115230647',27670,27670,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171115230647test00180'),(9,'test001',100,'1','','20171116110708',27671,27671,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171116110708test001100'),(10,'test002',80,'1','','20171116110850',27672,27672,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171116110850test00280'),(11,'test001',10,'1','','20171116152310',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116152310test00110'),(12,'test001',10,'1','','20171116153025',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116153025test00110'),(13,'test001',10,'1','','20171116153352',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116153352test00110'),(14,'test001',10,'1','','20171116154921',27674,27674,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171116154921test00110'),(15,'test001',10,'1','','20171116155101',27675,27675,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171116155101test00110'),(16,'test001',10,'1','','20171116162105',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116162105test00110'),(17,'test001',10,'1','','20171116162155',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116162155test00110'),(18,'test001',10,'1','','20171116162346',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171116162346test00110'),(19,'test001',100,'1','','20171122184516',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171122184516test001100'),(20,'test001',10,'1','','20171123152801',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171123152801test00110'),(21,'test001',10,'1','','20171123153142',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171123153142test00110'),(22,'test001',10,'1','','20171123153426',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171123153426test00110'),(23,'test001',10,'1','','20171123153608',27680,27680,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123153608test00110'),(24,'test001',10,'1','','20171123153936',27681,27681,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123153936test00110'),(25,'test001',10,'1','','20171123154416',27682,27682,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123154416test00110'),(26,'test001',10,'1','','20171123154542',27683,27683,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123154542test00110'),(27,'test001',80,'1','','20171123154650',27684,27684,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123154650test00180'),(28,'test001',10,'1','','20171123154927',27685,27685,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171123154927test00110'),(29,'test001',320,'4','','20171123172309',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171123172309test001320'),(30,'test001',300,'1','','20171123174514',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171123174514test001300'),(31,'test001',10,'1','','20171129231729',27711,27711,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171129231729test00110'),(32,'test001',360,'1','','20171130180115',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171130180115test001360'),(33,'test001',360,'1','','20171130180141',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171130180141test001360'),(34,'test002',120,'1','','20171205124447',27736,27736,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171205124447test002120'),(35,'test001',10,'1','','20171206142220',27762,27762,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171206142220test00110'),(36,'test001',10,'1','','20171206205244',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171206205244test00110'),(37,'test001',10,'1','','20171207161504',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171207161504test00110'),(38,'test001',80,'1','','20171207162554',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171207162554test00180'),(39,'test001 ',150,'1','','20171207164604',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171207164604test001 150'),(40,'test001',10,'1','','20171208072206',27772,27772,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208072206test00110'),(41,'test002 ',20,'1','','20171208090908',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208090908test002 20'),(42,'test002 ',20,'1','','20171208090942',27774,27774,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208090942test002 20'),(43,'test001',150,'1','','20171208114903',27776,27776,0,1,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208114903test001150'),(44,'test001 ',20,'4','','20171208133453',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208133453test001 20'),(45,'test001 ',100,'1','','20171208134822',27777,27777,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208134822test001 100'),(46,'test001 ',80,'1','','20171208135452',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208135452test001 80'),(47,'test001 ',100,'1','','20171208135518',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208135518test001 100'),(48,'test001 ',80,'1','','20171208140408',27778,27778,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208140408test001 80'),(49,'test001 ',400,'1','','20171208141639',27779,27779,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208141639test001 400'),(50,'test001 ',300,'3','','20171208142928',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208142928test001 300'),(51,'test001 ',150,'1','','20171208144933',27780,27780,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208144933test001 150'),(52,'test001',330,'1','','20171208152828',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20171208152828test001330'),(53,'test001',1080,'1','','20171208155452',27781,27781,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20171208155452test0011080'),(54,'T03291',10,'1','','20180118125620',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180118125620T0329110'),(55,'D0123456',560,'1','','20180119140148',28146,28146,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180119140148D0123456560'),(56,'T03291',100,'1','','20180131142118',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180131142118T03291100'),(57,'T03291',10,'1','','20180208200848',28335,28335,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180208200848T0329110'),(58,'T03291',30,'1','','20180208202811',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180208202811T0329130'),(59,'T03291',30,'2','','20180208203219',28336,28336,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180208203219T0329130'),(60,'T03291',40,'1','','20180208204813',28337,28337,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180208204813T0329140'),(61,'T03291',20,'1','','20180208213644',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180208213644T0329120'),(62,'T03291',30,'1','','20180208220615',28338,28338,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180208220615T0329130'),(63,'T03291',30,'1','','20180208221646',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180208221646T0329130'),(64,'T03291',10,'1','','20180208222242',28339,28339,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180208222242T0329110'),(65,'T03291',100,'1','','20180212144323',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212144323T03291100'),(66,'T03291',100,'1','','20180212144418',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212144418T03291100'),(67,'T03291',100,'1','','20180212144825',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212144825T03291100'),(68,'T03291',100,'1','','20180212145005',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212145005T03291100'),(69,'T03291',100,'1','','20180212145101',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212145101T03291100'),(70,'T03291',100,'1','','20180212145211',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212145211T03291100'),(71,'T03291',100,'1','','20180212145217',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212145217T03291100'),(72,'T03291',10,'1','','20180212145241',28374,28374,0,0,1,4,'2018-03-24 19:06:26','2018-03-25 10:26:34','20180212145241T0329110'),(73,'T03291',10,'1','','20180212145245',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180212145245T0329110'),(74,'D0123456',10,'1','','20180308163538',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180308163538D012345610'),(75,'T03291',100,'1','','20180309144712',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180309144712T03291100'),(76,'T03291',100,'0','','20180309220049',0,0,0,0,1,1,'2018-03-24 19:06:26','2018-03-25 09:21:10','20180309220049T03291100'),(77,'test123',100,'1','','20180324190820',0,0,0,0,1,2,'2018-03-24 19:08:58','2018-03-25 09:21:10','20180324190820test123100'),(78,'123',100,'1','','20180324221020',0,0,0,0,1,2,'2018-03-24 22:25:10','2018-03-25 09:21:10','20180324221020123100'),(79,'T03291',0,'0','','20180324222755',0,0,0,0,1,2,'2018-03-24 22:27:55','2018-03-25 09:21:10','20180324222755T032910'),(80,'T03291',0,'0','','20180324222833',0,0,0,0,1,2,'2018-03-24 22:28:33','2018-03-25 09:21:10','20180324222833T032910'),(81,'T03291',0,'0','','20180324222934',0,0,0,0,1,2,'2018-03-24 22:29:34','2018-03-25 09:21:10','20180324222934T032910'),(82,'T03291',1880,'0','','20180324223010',0,0,0,0,1,2,'2018-03-24 22:30:10','2018-03-25 09:21:10','20180324223010T032911880'),(83,'T03291',1880,'0','','20180324231359',0,0,0,0,1,2,'2018-03-24 23:13:59','2018-03-25 09:21:10','20180324231359T032911880'),(84,'T03291',1880,'0','','20180324231508',0,0,0,0,1,2,'2018-03-24 23:15:08','2018-03-25 09:21:10','20180324231508T032911880'),(85,'T03291',1880,'0','','20180324233445',0,0,0,0,1,2,'2018-03-24 23:34:45','2018-03-25 09:21:10','20180324233445T032911880'),(86,'T03291',1880,'0','','20180325014955',0,0,0,0,1,2,'2018-03-25 01:49:55','2018-03-25 09:21:10','20180325014955T032911880'),(87,'T03291',1880,'0','','20180325021536',0,0,0,0,1,2,'2018-03-25 02:15:37','2018-03-25 09:21:10','20180325021536T032911880'),(88,'T03291',1880,'0','','20180325021554',0,0,0,0,1,2,'2018-03-25 02:15:54','2018-03-25 09:21:10','20180325021554T032911880'),(89,'T03291',1880,'0','','20180325023101',0,0,0,0,1,2,'2018-03-25 02:31:01','2018-03-25 09:21:10','20180325023101T032911880'),(90,'T03291',1880,'0','','20180325030934',0,0,0,0,1,2,'2018-03-25 03:09:34','2018-03-25 09:21:10','20180325030934T032911880'),(91,'T03291',1880,'0','','20180325034542',0,0,0,0,1,2,'2018-03-25 03:45:42','2018-03-25 09:21:10','20180325034542T032911880'),(92,'T03291',1880,'0','','20180325034624',9999,9999,0,1,1,4,'2018-03-25 03:46:24','2018-03-25 19:52:52','20180325034624T032911880'),(93,'T03291',1880,'0','','20180325034732',9999,9999,0,1,1,4,'2018-03-25 03:47:32','2018-03-25 19:50:54','20180325034732T032911880'),(94,'T03291',1880,'0','','20180325035103',0,0,0,0,1,2,'2018-03-25 03:51:03','2018-03-25 09:21:10','20180325035103T032911880'),(95,'T03291',100,'0','','20180325043439',0,0,0,0,1,2,'2018-03-25 04:34:39','2018-03-25 09:21:10','20180325043439T03291100'),(96,'T03291',100,'0','','20180325043545',0,0,0,0,1,2,'2018-03-25 04:35:45','2018-03-25 09:21:10','20180325043545T03291100'),(97,'T03291',80,'0','','20180325043729',0,0,0,0,1,2,'2018-03-25 04:37:29','2018-03-25 09:21:10','20180325043729T0329180'),(98,'T03291',10,'0','','20180326205703',0,0,0,0,1,1,'2018-03-26 20:57:03','2018-03-26 12:57:03','f26f3301f8c723b00c5516b9d0513e76'),(99,'T03291',10,'0','','20180326212925',0,0,0,0,1,1,'2018-03-26 21:29:25','2018-03-26 13:29:25','d2c99465d4e4dd6f7294381a13e6b7de'),(100,'T03291',10,'0','','20180326213008',0,0,0,0,1,1,'2018-03-26 21:30:08','2018-03-26 13:30:08','fc340073839ba6a74cb0b0759cf9e65d'),(101,'T03291',10,'0','','20180326213054',0,0,0,0,1,1,'2018-03-26 21:30:54','2018-03-26 13:30:54','40fe6a8e8e0ec05a6784eefd44572986'),(102,'T03291',10,'0','','20180326213145',0,0,0,0,1,1,'2018-03-26 21:31:45','2018-03-26 13:31:45','c6fbc0a54bea1a8b4773a2fd80b772a8'),(103,'T03291',10,'0','','20180326213444',0,0,0,0,1,1,'2018-03-26 21:34:44','2018-03-26 13:34:44','cfd3a9a12bc8c2c20476ca5b4fa93d4d'),(104,'T03291',10,'0','','20180326213603',0,0,0,0,1,1,'2018-03-26 21:36:03','2018-03-26 13:36:03','f1f3bc68825b264c1e0b066e8d39d981'),(105,'T03291',10,'0','','20180413115622',0,0,0,0,1,1,'2018-04-13 11:56:22','2018-04-13 03:56:22','b04f178ab390aeeaf4efb5548e3ed052'),(106,'T03291',10,'0','','20180413121133',0,0,0,0,1,1,'2018-04-13 12:11:33','2018-04-13 04:11:33','b1c17e6491a6fbdfe9452474215da508'),(107,'T03291',10,'0','','20180413121146',0,0,0,0,1,1,'2018-04-13 12:11:46','2018-04-13 04:11:46','c6bcf025eba19eb7eb4ae6ff5b007305'),(108,'T03291',10,'0','','20180413121216',0,0,0,0,1,1,'2018-04-13 12:12:16','2018-04-13 04:12:16','8705d59020b824216f44f8943ef515ce'),(109,'T03291',10,'0','','20180413121311',0,0,0,0,1,1,'2018-04-13 12:13:11','2018-04-13 04:13:11','0deb2098405fc6f0524daba02f37b152'),(110,'T03291',10,'0','','20180413121338',0,0,0,0,1,1,'2018-04-13 12:13:38','2018-04-13 04:13:38','a92ca01073119ee945e7fcc0ec2f296d'),(111,'T03291',10,'0','','20180413121354',0,0,0,0,1,1,'2018-04-13 12:13:54','2018-04-13 04:13:54','ec43fbab745ca59172ecf2eb806e52be'),(112,'T03291',10,'0','','20180413121436',0,0,0,0,1,1,'2018-04-13 12:14:36','2018-04-13 04:14:36','6ee1ccddea89a14a16f89e2a4c924bf9'),(113,'T03291',10,'0','','20180413123330',0,0,0,0,1,1,'2018-04-13 12:33:30','2018-04-13 04:33:30','f52a41fbe23d6fd92f13c2dc47d7412a');
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`statusId`),
  UNIQUE KEY `status_id_UNIQUE` (`statusId`),
  UNIQUE KEY `status_name_UNIQUE` (`statusName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (2,'cancelled'),(4,'completed'),(1,'pending'),(3,'waiting verification');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `paymentName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `payment_name_UNIQUE` (`paymentName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'iSunny'),(2,'KOKO'),(3,'LinePay');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_list` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `productPrice` int(11) NOT NULL,
  `manufacturerId` int(11) NOT NULL,
  `introduction` varchar(30) CHARACTER SET utf8 NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `weekday` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productId`),
  KEY `manufacturerId_idx` (`manufacturerId`),
  CONSTRAINT `manufacturerId` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_list`
--

LOCK TABLES `product_list` WRITE;
/*!40000 ALTER TABLE `product_list` DISABLE KEYS */;
INSERT INTO `product_list` VALUES (1,'雞腿飯',100,1,'出餐快',1,1),(2,'排骨飯',100,1,'出餐快',1,2),(3,'合菜飯',80,1,'出餐快',1,3),(4,'雞腿飯',120,2,'金豹',1,1),(5,'叉燒飯',100,3,'台中名產',1,2),(6,'燒鴨飯',100,3,'台中名產',1,3),(7,'油雞飯',100,3,'台中名產',1,4),(8,'燒肉飯',100,3,'台中名產',1,5),(9,'三寶飯',150,3,'台中名產',1,5),(10,'白飯',10,4,'單純白飯',1,5);
/*!40000 ALTER TABLE `product_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-30 11:25:26
