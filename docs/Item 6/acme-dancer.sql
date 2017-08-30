start transaction;

drop database if exists `Acme-Dancer`;
create database `Acme-Dancer`;

use `Acme-Dancer`;

grant select, insert, update, delete on `Acme-Dancer`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter,
	create temporary tables, lock tables, create view, create routine,
	alter routine, execute, trigger, show view on `Acme-Dancer`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Dancer
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `academy`
--

DROP TABLE IF EXISTS `academy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `commercialName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ae6mrfke5ikqsinq6dx38dy8m` (`userAccount_id`),
  CONSTRAINT `FK_ae6mrfke5ikqsinq6dx38dy8m` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy`
--

LOCK TABLES `academy` WRITE;
/*!40000 ALTER TABLE `academy` DISABLE KEYS */;
INSERT INTO `academy` VALUES (248,0,'Juan Carlos','41100','jc@hotmail.com','+34 (777) 1234','Lopez',242,'Academia Juan Carlos'),(249,0,'Laura','41100','laura@hotmail.com','+34 (777) 1224','Padial',243,'Laurita academy'),(250,0,'Karli','41109','jc@hotmail.com','+34 (666) 1234','Lopez',245,'Academia Sabor de Amor');
/*!40000 ALTER TABLE `academy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_banner`
--

DROP TABLE IF EXISTS `academy_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_banner` (
  `Academy_id` int(11) NOT NULL,
  `banners_id` int(11) NOT NULL,
  UNIQUE KEY `UK_lahg23ueepullvs1igqp3scx9` (`banners_id`),
  KEY `FK_qmutlbyura1nlmsbj3g2ak2fu` (`Academy_id`),
  CONSTRAINT `FK_qmutlbyura1nlmsbj3g2ak2fu` FOREIGN KEY (`Academy_id`) REFERENCES `academy` (`id`),
  CONSTRAINT `FK_lahg23ueepullvs1igqp3scx9` FOREIGN KEY (`banners_id`) REFERENCES `banner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_banner`
--

LOCK TABLES `academy_banner` WRITE;
/*!40000 ALTER TABLE `academy_banner` DISABLE KEYS */;
INSERT INTO `academy_banner` VALUES (248,323),(248,324),(248,325),(249,326),(249,327),(249,328),(250,329);
/*!40000 ALTER TABLE `academy_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_course`
--

DROP TABLE IF EXISTS `academy_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_course` (
  `Academy_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  UNIQUE KEY `UK_mwbdkqt1xbqbewvr01k9ktbvi` (`courses_id`),
  KEY `FK_kpu3gjcj1eydy48pysg1j4jam` (`Academy_id`),
  CONSTRAINT `FK_kpu3gjcj1eydy48pysg1j4jam` FOREIGN KEY (`Academy_id`) REFERENCES `academy` (`id`),
  CONSTRAINT `FK_mwbdkqt1xbqbewvr01k9ktbvi` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_course`
--

LOCK TABLES `academy_course` WRITE;
/*!40000 ALTER TABLE `academy_course` DISABLE KEYS */;
INSERT INTO `academy_course` VALUES (248,275),(248,276),(248,279),(249,277),(249,280),(250,278);
/*!40000 ALTER TABLE `academy_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_tutorial`
--

DROP TABLE IF EXISTS `academy_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_tutorial` (
  `Academy_id` int(11) NOT NULL,
  `tutorials_id` int(11) NOT NULL,
  UNIQUE KEY `UK_5wh59a9xjdfn5ibje8l1scedf` (`tutorials_id`),
  KEY `FK_qh8m6xqdmaidosxqfb9yl36s8` (`Academy_id`),
  CONSTRAINT `FK_qh8m6xqdmaidosxqfb9yl36s8` FOREIGN KEY (`Academy_id`) REFERENCES `academy` (`id`),
  CONSTRAINT `FK_5wh59a9xjdfn5ibje8l1scedf` FOREIGN KEY (`tutorials_id`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_tutorial`
--

LOCK TABLES `academy_tutorial` WRITE;
/*!40000 ALTER TABLE `academy_tutorial` DISABLE KEYS */;
INSERT INTO `academy_tutorial` VALUES (248,262),(248,263),(249,264),(250,267);
/*!40000 ALTER TABLE `academy_tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_actor`
--

DROP TABLE IF EXISTS `actor_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_actor` (
  `Actor_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_actor`
--

LOCK TABLES `actor_actor` WRITE;
/*!40000 ALTER TABLE `actor_actor` DISABLE KEYS */;
INSERT INTO `actor_actor` VALUES (247,249),(247,251),(247,252),(248,249),(248,251),(248,252),(249,251),(249,252),(251,249),(252,249),(252,251);
/*!40000 ALTER TABLE `actor_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_chirp`
--

DROP TABLE IF EXISTS `actor_chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_chirp` (
  `Actor_id` int(11) NOT NULL,
  `chirps_id` int(11) NOT NULL,
  UNIQUE KEY `UK_csf50bdxyeca2437u2c85o9mn` (`chirps_id`),
  CONSTRAINT `FK_csf50bdxyeca2437u2c85o9mn` FOREIGN KEY (`chirps_id`) REFERENCES `chirp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_chirp`
--

LOCK TABLES `actor_chirp` WRITE;
/*!40000 ALTER TABLE `actor_chirp` DISABLE KEYS */;
INSERT INTO `actor_chirp` VALUES (248,254),(249,255),(250,256),(251,257),(248,258),(249,259),(251,260),(252,261);
/*!40000 ALTER TABLE `actor_chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_folder`
--

DROP TABLE IF EXISTS `actor_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_folder` (
  `Actor_id` int(11) NOT NULL,
  `folders_id` int(11) NOT NULL,
  UNIQUE KEY `UK_dp573h40udupcm5m1kgn2bc2r` (`folders_id`),
  CONSTRAINT `FK_dp573h40udupcm5m1kgn2bc2r` FOREIGN KEY (`folders_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_folder`
--

LOCK TABLES `actor_folder` WRITE;
/*!40000 ALTER TABLE `actor_folder` DISABLE KEYS */;
INSERT INTO `actor_folder` VALUES (247,291),(251,292),(252,293),(253,294),(248,295),(249,296),(250,297),(247,298),(251,299),(252,300),(253,301),(248,302),(249,303),(250,304),(247,305),(251,306),(252,307),(253,308),(248,309),(249,310),(250,311),(247,312),(251,313),(252,314),(253,315),(248,316),(249,317),(250,318);
/*!40000 ALTER TABLE `actor_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (247,0,'Laura','41109','lp@hotmail.com','+34 (666) 1234','Padial',239);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `createMoment` datetime DEFAULT NULL,
  `roleValue` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `curricula_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2dsdgecqprpt2vqv2vym1esi3` (`course_id`),
  KEY `FK_fbe3c252r9i843hdydofp6kra` (`curricula_id`),
  CONSTRAINT `FK_fbe3c252r9i843hdydofp6kra` FOREIGN KEY (`curricula_id`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_2dsdgecqprpt2vqv2vym1esi3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (281,1,'2018-04-08 00:12:00','TEACHER','PENDING',275,345),(282,1,'2018-04-08 13:00:00','TEACHER','ACCEPTED',276,346),(283,1,'2018-04-08 20:00:00','TEACHER','REJECTED',277,346),(284,1,'2018-05-08 08:12:12','STUDENT','PENDING',278,347),(285,1,'2018-05-08 08:13:13','STUDENT','ACCEPTED',278,345),(286,1,'2018-05-08 08:20:00','TEACHER','REJECTED',278,346);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `academy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4c8ibnscs71wcywr8o0h9qo45` (`academy_id`),
  CONSTRAINT `FK_4c8ibnscs71wcywr8o0h9qo45` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (323,0,'http://dancingboulevard.com',248),(324,0,'http://dancingboulevard.com',248),(325,0,'http://dancingboulevard.com',248),(326,0,'http://dancingboulevard.com',249),(327,0,'http://dancingboulevard.com',249),(328,0,'http://dancingboulevard.com',249),(329,0,'http://dancingboulevard.com',250);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `momentWritten` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (254,0,'2018-04-08 00:00:12','Hello world!',248),(255,0,'2018-04-08 00:00:15','How are you?',249),(256,0,'2018-04-08 00:00:20','This is great!',250),(257,0,'2018-04-08 00:00:21','I was train a lot',251),(258,0,'2018-05-08 08:00:00','Good morning',248),(259,0,'2018-05-08 08:01:00','What\'s happen in the morning\'',249),(260,0,'2018-05-08 08:02:00','Today we start hard!',251),(261,0,'2018-05-08 08:03:00','Woww I appoint!',252);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dayWeek` varchar(255) DEFAULT NULL,
  `end` date DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `courseValue` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `academy_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bc9ifd1hhxpnv9se06pofu6sx` (`academy_id`),
  KEY `FK_rlcfhfpi6xh26k29e7jieulxx` (`style_id`),
  CONSTRAINT `FK_rlcfhfpi6xh26k29e7jieulxx` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`),
  CONSTRAINT `FK_bc9ifd1hhxpnv9se06pofu6sx` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (275,0,'Monday','2018-04-12','BEGINNER','ORGANISING','2018-04-08','2000-01-01 20:00:00','Bachata lessons',248,268),(276,0,'Tuesday','2019-04-12','INTERMEDIATE','ORGANISING','2018-04-08','2000-01-01 17:00:00','course salsa latina',248,269),(277,0,'Thursday','2019-04-10','ADVANCED','ORGANISING','2018-04-08','2000-01-01 20:00:00','Pachanga lessons',249,270),(278,0,'Wednesday','2020-01-06','BEGINNER','DELIVERING','2018-03-09','2000-01-01 16:00:00','Cha-chá lessons',250,271),(279,0,'Tuesday','2019-04-06','INTERMEDIATE','DELIVERING','2019-04-01','2000-01-01 17:00:00','Rumba lessons',248,272),(280,0,'Friday','2019-04-06','ADVANCED','DELIVERING','2019-04-03','2000-01-01 20:00:00','Kizomba lessons',249,273);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_application`
--

DROP TABLE IF EXISTS `course_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_application` (
  `Course_id` int(11) NOT NULL,
  `applications_id` int(11) NOT NULL,
  UNIQUE KEY `UK_j4mvdqvqg6kxmtskxo018qpl2` (`applications_id`),
  KEY `FK_mginfqgiumbqmsshu4a04molr` (`Course_id`),
  CONSTRAINT `FK_mginfqgiumbqmsshu4a04molr` FOREIGN KEY (`Course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_j4mvdqvqg6kxmtskxo018qpl2` FOREIGN KEY (`applications_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_application`
--

LOCK TABLES `course_application` WRITE;
/*!40000 ALTER TABLE `course_application` DISABLE KEYS */;
INSERT INTO `course_application` VALUES (275,281),(276,282),(277,283),(278,284),(278,285),(278,286);
/*!40000 ALTER TABLE `course_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula`
--

DROP TABLE IF EXISTS `curricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `personalRecord_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sb69tfhsf51vub0mq9n3kyeuy` (`personalRecord_id`),
  CONSTRAINT `FK_sb69tfhsf51vub0mq9n3kyeuy` FOREIGN KEY (`personalRecord_id`) REFERENCES `personalrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (345,0,330),(346,0,331),(347,0,332);
/*!40000 ALTER TABLE `curricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_customrecord`
--

DROP TABLE IF EXISTS `curricula_customrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_customrecord` (
  `Curricula_id` int(11) NOT NULL,
  `customRecord_id` int(11) NOT NULL,
  UNIQUE KEY `UK_4twba4pefmylndsgtsmsktkcl` (`customRecord_id`),
  KEY `FK_b2kfq23lwd2ylcfcpy9seevtf` (`Curricula_id`),
  CONSTRAINT `FK_b2kfq23lwd2ylcfcpy9seevtf` FOREIGN KEY (`Curricula_id`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_4twba4pefmylndsgtsmsktkcl` FOREIGN KEY (`customRecord_id`) REFERENCES `customrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_customrecord`
--

LOCK TABLES `curricula_customrecord` WRITE;
/*!40000 ALTER TABLE `curricula_customrecord` DISABLE KEYS */;
INSERT INTO `curricula_customrecord` VALUES (345,337),(346,338),(347,339);
/*!40000 ALTER TABLE `curricula_customrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_endorserrecord`
--

DROP TABLE IF EXISTS `curricula_endorserrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_endorserrecord` (
  `Curricula_id` int(11) NOT NULL,
  `endorserRecord_id` int(11) NOT NULL,
  UNIQUE KEY `UK_gxkxbifj0x3vqe6igpik2dt69` (`endorserRecord_id`),
  KEY `FK_9t3mmgy847vqc8upl8mv706mt` (`Curricula_id`),
  CONSTRAINT `FK_9t3mmgy847vqc8upl8mv706mt` FOREIGN KEY (`Curricula_id`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_gxkxbifj0x3vqe6igpik2dt69` FOREIGN KEY (`endorserRecord_id`) REFERENCES `endorserrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_endorserrecord`
--

LOCK TABLES `curricula_endorserrecord` WRITE;
/*!40000 ALTER TABLE `curricula_endorserrecord` DISABLE KEYS */;
INSERT INTO `curricula_endorserrecord` VALUES (345,333),(345,334),(346,335),(347,336);
/*!40000 ALTER TABLE `curricula_endorserrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_stylerecord`
--

DROP TABLE IF EXISTS `curricula_stylerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_stylerecord` (
  `Curricula_id` int(11) NOT NULL,
  `styleRecord_id` int(11) NOT NULL,
  UNIQUE KEY `UK_rkhhhb0361vjascejdithkgwr` (`styleRecord_id`),
  KEY `FK_dit0em8iypwgl9a4kfu8d4ajw` (`Curricula_id`),
  CONSTRAINT `FK_dit0em8iypwgl9a4kfu8d4ajw` FOREIGN KEY (`Curricula_id`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_rkhhhb0361vjascejdithkgwr` FOREIGN KEY (`styleRecord_id`) REFERENCES `stylerecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_stylerecord`
--

LOCK TABLES `curricula_stylerecord` WRITE;
/*!40000 ALTER TABLE `curricula_stylerecord` DISABLE KEYS */;
INSERT INTO `curricula_stylerecord` VALUES (345,340),(345,341),(346,342),(347,343),(347,344);
/*!40000 ALTER TABLE `curricula_stylerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customrecord`
--

DROP TABLE IF EXISTS `customrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customrecord` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customrecord`
--

LOCK TABLES `customrecord` WRITE;
/*!40000 ALTER TABLE `customrecord` DISABLE KEYS */;
INSERT INTO `customrecord` VALUES (337,0,'Soy bailarin','hola'),(338,0,'Soy bailarin 2','hola'),(339,0,'Soy bailarin 2','hola');
/*!40000 ALTER TABLE `customrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customrecord_links`
--

DROP TABLE IF EXISTS `customrecord_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customrecord_links` (
  `CustomRecord_id` int(11) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  KEY `FK_e48x7k2lq1jjgsyntbuplbkfl` (`CustomRecord_id`),
  CONSTRAINT `FK_e48x7k2lq1jjgsyntbuplbkfl` FOREIGN KEY (`CustomRecord_id`) REFERENCES `customrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customrecord_links`
--

LOCK TABLES `customrecord_links` WRITE;
/*!40000 ALTER TABLE `customrecord_links` DISABLE KEYS */;
INSERT INTO `customrecord_links` VALUES (337,'\n					https://usercontent2.hubstatic.com/12161217_f520.jpg\n				'),(338,'\n					https://usercontent2.hubstatic.com/12161217_f520.jpg\n				'),(339,'\n					https://usercontent2.hubstatic.com/12161217_f520.jpg\n				');
/*!40000 ALTER TABLE `customrecord_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dancer`
--

DROP TABLE IF EXISTS `dancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ns7fscvc0od1jrlgncofm8d0d` (`userAccount_id`),
  CONSTRAINT `FK_ns7fscvc0od1jrlgncofm8d0d` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancer`
--

LOCK TABLES `dancer` WRITE;
/*!40000 ALTER TABLE `dancer` DISABLE KEYS */;
INSERT INTO `dancer` VALUES (251,0,'Juan Jose','41100','jj@hotmail.com','+34 (777) 1524','Valle',240),(252,0,'Adrian','41100','adrian@hotmail.com','+34 (777) 2524','Sanchez',241),(253,0,'Pepito','41108','pegri@hotmail.com','+34 (777) 4343','Grillo',246);
/*!40000 ALTER TABLE `dancer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dancer_application`
--

DROP TABLE IF EXISTS `dancer_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancer_application` (
  `Dancer_id` int(11) NOT NULL,
  `applications_id` int(11) NOT NULL,
  UNIQUE KEY `UK_chj0gmip096k0gosslfcurlkt` (`applications_id`),
  KEY `FK_mor4ei7r7qagbid6lgikdoikl` (`Dancer_id`),
  CONSTRAINT `FK_mor4ei7r7qagbid6lgikdoikl` FOREIGN KEY (`Dancer_id`) REFERENCES `dancer` (`id`),
  CONSTRAINT `FK_chj0gmip096k0gosslfcurlkt` FOREIGN KEY (`applications_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancer_application`
--

LOCK TABLES `dancer_application` WRITE;
/*!40000 ALTER TABLE `dancer_application` DISABLE KEYS */;
INSERT INTO `dancer_application` VALUES (251,281),(251,282),(252,283);
/*!40000 ALTER TABLE `dancer_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dancer_curricula`
--

DROP TABLE IF EXISTS `dancer_curricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancer_curricula` (
  `Dancer_id` int(11) NOT NULL,
  `curriculas_id` int(11) NOT NULL,
  UNIQUE KEY `UK_gqhd9x8k5vj4320pqlxxkn4ln` (`curriculas_id`),
  KEY `FK_ryoi8kn0t73v2jc9lf6nwxwua` (`Dancer_id`),
  CONSTRAINT `FK_ryoi8kn0t73v2jc9lf6nwxwua` FOREIGN KEY (`Dancer_id`) REFERENCES `dancer` (`id`),
  CONSTRAINT `FK_gqhd9x8k5vj4320pqlxxkn4ln` FOREIGN KEY (`curriculas_id`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancer_curricula`
--

LOCK TABLES `dancer_curricula` WRITE;
/*!40000 ALTER TABLE `dancer_curricula` DISABLE KEYS */;
INSERT INTO `dancer_curricula` VALUES (251,345),(252,346),(253,347);
/*!40000 ALTER TABLE `dancer_curricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endorserrecord`
--

DROP TABLE IF EXISTS `endorserrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endorserrecord` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endorserrecord`
--

LOCK TABLES `endorserrecord` WRITE;
/*!40000 ALTER TABLE `endorserrecord` DISABLE KEYS */;
INSERT INTO `endorserrecord` VALUES (333,0,'pg@gmail.com','Pepito Grillo'),(334,0,'658747452','Mulan'),(335,0,'658747452','Pocahonta'),(336,0,'658747432','Sora');
/*!40000 ALTER TABLE `endorserrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `folderName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (291,0,'inbox'),(292,0,'inbox'),(293,0,'inbox'),(294,0,'inbox'),(295,0,'inbox'),(296,0,'inbox'),(297,0,'inbox'),(298,0,'outbox'),(299,0,'outbox'),(300,0,'outbox'),(301,0,'outbox'),(302,0,'outbox'),(303,0,'outbox'),(304,0,'outbox'),(305,0,'trashbox'),(306,0,'trashbox'),(307,0,'trashbox'),(308,0,'trashbox'),(309,0,'trashbox'),(310,0,'trashbox'),(311,0,'trashbox'),(312,0,'spambox'),(313,0,'spambox'),(314,0,'spambox'),(315,0,'spambox'),(316,0,'spambox'),(317,0,'spambox'),(318,0,'spambox');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_mailmessage`
--

DROP TABLE IF EXISTS `folder_mailmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder_mailmessage` (
  `Folder_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  UNIQUE KEY `UK_t0swyuobr7225xnposfuu8ixm` (`messages_id`),
  KEY `FK_rys3vi5853dyhptvldu6nn09l` (`Folder_id`),
  CONSTRAINT `FK_rys3vi5853dyhptvldu6nn09l` FOREIGN KEY (`Folder_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK_t0swyuobr7225xnposfuu8ixm` FOREIGN KEY (`messages_id`) REFERENCES `mailmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_mailmessage`
--

LOCK TABLES `folder_mailmessage` WRITE;
/*!40000 ALTER TABLE `folder_mailmessage` DISABLE KEYS */;
INSERT INTO `folder_mailmessage` VALUES (295,321),(296,319),(303,320),(316,322);
/*!40000 ALTER TABLE `folder_mailmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailmessage`
--

DROP TABLE IF EXISTS `mailmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailmessage` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailmessage`
--

LOCK TABLES `mailmessage` WRITE;
/*!40000 ALTER TABLE `mailmessage` DISABLE KEYS */;
INSERT INTO `mailmessage` VALUES (319,0,'it is a mesage important','HIGH','2017-11-07 00:00:00','urgent',249,248),(320,0,'it is a mesage important','NEUTRAL','2017-11-07 00:00:00','hello',248,249),(321,0,'it is a mesage important','LOW','2017-11-07 00:00:00','hello world',248,251),(322,0,'sex','HIGH','2017-11-07 00:00:00','urgent',249,248);
/*!40000 ALTER TABLE `mailmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalrecord`
--

DROP TABLE IF EXISTS `personalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalrecord` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `linkedln` varchar(255) DEFAULT NULL,
  `numWhatsapp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalrecord`
--

LOCK TABLES `personalrecord` WRITE;
/*!40000 ALTER TABLE `personalrecord` DISABLE KEYS */;
INSERT INTO `personalrecord` VALUES (330,0,'jj@gmail.com','Juan Jose Valle Zarza','https://www.linkedin.com/antonio','658475414'),(331,0,'adri@gmail.com','Adrian Sanchez Reyes','https://www.linkedin.com/adrian','658475414'),(332,0,'pg@gmail.com','Pepito Grillo','https://www.linkedin.com/pepito','658475414');
/*!40000 ALTER TABLE `personalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spamword`
--

DROP TABLE IF EXISTS `spamword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spamword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spamword`
--

LOCK TABLES `spamword` WRITE;
/*!40000 ALTER TABLE `spamword` DISABLE KEYS */;
INSERT INTO `spamword` VALUES (287,0,'viagra'),(288,0,'cialis'),(289,0,'sex'),(290,0,'love');
/*!40000 ALTER TABLE `spamword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (268,0,'Latin dance','Bachata'),(269,0,'Cuban dance','Salsa'),(270,0,'Cuban dance, mix between salsa and merengue','Pachanga'),(271,0,'Cuban dance','Chá-chá'),(272,0,'Flamenco','Rumba'),(273,0,'African dance very sensual','Kizomba'),(274,0,'Latin dance, very funny','Mambo');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_course`
--

DROP TABLE IF EXISTS `style_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_course` (
  `Style_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  UNIQUE KEY `UK_f0ay07dvoeahg99s8gqodq13a` (`courses_id`),
  KEY `FK_8i25ot42nldw5gavjvjbnkktg` (`Style_id`),
  CONSTRAINT `FK_8i25ot42nldw5gavjvjbnkktg` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`),
  CONSTRAINT `FK_f0ay07dvoeahg99s8gqodq13a` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_course`
--

LOCK TABLES `style_course` WRITE;
/*!40000 ALTER TABLE `style_course` DISABLE KEYS */;
INSERT INTO `style_course` VALUES (268,275),(269,276),(270,277),(271,278),(272,279),(273,280);
/*!40000 ALTER TABLE `style_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_pictures`
--

DROP TABLE IF EXISTS `style_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_pictures` (
  `Style_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_c8ig4n8ltumwgswyluh26mf07` (`Style_id`),
  CONSTRAINT `FK_c8ig4n8ltumwgswyluh26mf07` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_pictures`
--

LOCK TABLES `style_pictures` WRITE;
/*!40000 ALTER TABLE `style_pictures` DISABLE KEYS */;
INSERT INTO `style_pictures` VALUES (268,'\n					http://dancingboulevard.com/wp-content/uploads/2015/10/bachata-2.jpg\n				'),(269,'\n					https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGMDP_uW6sXGUhK5bqtuQQg4ChyOiqqb3C6G0IE-6eQsd7OKwRIQ\n				'),(270,'\n					http://1.bp.blogspot.com/_A_JOA4qbTsw/TJax4_-RvbI/AAAAAAAAFbs/hWs7xfoGvLU/s400/DSC_0312.JPG\n				'),(271,'\n					https://usercontent2.hubstatic.com/12161217_f520.jpg\n				'),(272,'\n					http://www.universogaditano.com/sites/default/files/imagecache/400xY/flamenco.jpg\n				'),(273,'http://static.guide.supereva.it/guide/guida_tango/tangobiancoenero.jpg'),(274,'\n					https://inspirationanddance.files.wordpress.com/2012/04/mabo.jpg\n				');
/*!40000 ALTER TABLE `style_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_videos`
--

DROP TABLE IF EXISTS `style_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_videos` (
  `Style_id` int(11) NOT NULL,
  `videos` varchar(255) DEFAULT NULL,
  KEY `FK_2q2oun1en7hmp604m9k61nxtt` (`Style_id`),
  CONSTRAINT `FK_2q2oun1en7hmp604m9k61nxtt` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_videos`
--

LOCK TABLES `style_videos` WRITE;
/*!40000 ALTER TABLE `style_videos` DISABLE KEYS */;
INSERT INTO `style_videos` VALUES (268,'https://www.youtube.com/watch?v=PQSaof3b_aE'),(269,'https://www.youtube.com/watch?v=Gj-evaqUzeA'),(270,'https://www.youtube.com/watch?v=BwjN0t7eFPU'),(271,'https://www.youtube.com/watch?v=xKeUpU446Xg'),(272,'https://www.youtube.com/watch?v=Use9r0ywn-Y'),(273,'https://www.youtube.com/watch?v=a15gEeLzT2E'),(274,'https://www.youtube.com/watch?v=FdhPgVMdIqo');
/*!40000 ALTER TABLE `style_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylerecord`
--

DROP TABLE IF EXISTS `stylerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stylerecord` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `numYear` int(11) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gu2hojp3httuj98rwfi2aphw3` (`style_id`),
  CONSTRAINT `FK_gu2hojp3httuj98rwfi2aphw3` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stylerecord`
--

LOCK TABLES `stylerecord` WRITE;
/*!40000 ALTER TABLE `stylerecord` DISABLE KEYS */;
INSERT INTO `stylerecord` VALUES (340,0,3,268),(341,0,1,269),(342,0,1,270),(343,0,1,271),(344,0,9,272);
/*!40000 ALTER TABLE `stylerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial`
--

DROP TABLE IF EXISTS `tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `numShows` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (262,0,'How dancer pachanga',6,'Pachanga','https://www.youtube.com/watch?v=BwjN0t7eFPU'),(263,0,'How dancer salsa latina',10,'salsa latina','https://www.youtube.com/watch?v=Z7rFasnFCHw'),(264,0,'How dancer popping',20,'popping dancer','https://www.youtube.com/watch?v=ExfzIXHh_i8'),(265,0,'La salsa más movida',6,'41 Pasos de Salsa Cubana','https://www.youtube.com/watch?v=Gj-evaqUzeA'),(266,0,'Daniel y Desiree (Luis fonsi - Despacito)',10,'Bachata sensual','https://www.youtube.com/watch?v=K0NGLAAlxCk'),(267,0,'How dancer twerk?',20,'Twerk','https://www.youtube.com/watch?v=Mn4orvxIeBg');
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (239,0,'200ceb26807d6bf99fd6f4f0d1ca54d4','administrator'),(240,0,'932f3b9f35d20f6202d5181db55358aa','dancer1'),(241,0,'c2b207fa4f0fd315eeae2a7643c7a791','dancer2'),(242,0,'2867dc13a84476546c069b33dc859bc7','academy1'),(243,0,'86cbff988e1e889653b316f6695e5e6b','academy2'),(244,0,'1b3231655cebb7a1f783eddf27d254ca','super'),(245,0,'526c4e886de557da4a11880c41fe3c0f','academy3'),(246,0,'e1af577da725228139aa987d4c3dacb4','dancer3');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (239,'ADMINISTRATOR'),(240,'DANCER'),(241,'DANCER'),(242,'ACADEMY'),(243,'ACADEMY'),(244,'ADMINISTRATOR'),(244,'DANCER'),(244,'ACADEMY'),(245,'ACADEMY'),(246,'DANCER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-30 15:10:34

commit;