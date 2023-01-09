-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_cut
-- ------------------------------------------------------
-- Server version	8.0.29

DROP DATABASE IF EXISTS smart_cut;
CREATE DATABASE smart_cut;
use smart_cut;

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
-- Table structure for table `agree_info`
--

DROP TABLE IF EXISTS `agree_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agree_info` (
  `user_id` int NOT NULL,
  `AGREE_YN` char(1) DEFAULT NULL,
  `AGREE_TYPE` char(1) DEFAULT NULL,
  `AGREE_DATE` date DEFAULT NULL,
  `EXPIRE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `agree_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agree_info`
--

LOCK TABLES `agree_info` WRITE;
/*!40000 ALTER TABLE `agree_info` DISABLE KEYS */;
INSERT INTO `agree_info` VALUES (1,'Y','A','2022-12-22','2024-12-22'),(2,'Y','A','2022-12-22','2024-12-22'),(3,'Y','A','2022-12-22','2024-12-22'),(4,'Y','A','2022-12-22','2024-12-22'),(5,'Y','O','2022-12-22','2024-12-22'),(6,'Y','A','2022-12-22','2024-12-22'),(7,'Y','A','2022-12-26','2024-12-26'),(8,'Y','A','2022-12-27','2024-12-27'),(9,'Y','A','2022-12-27','2024-12-27'),(10,'Y','O','2022-12-27','2024-12-27'),(11,'Y','A','2022-12-27','2024-12-27'),(12,'Y','A','2022-12-27','2024-12-27'),(13,'Y','A','2022-12-27','2024-12-27'),(14,'Y','A','2022-12-27','2024-12-27'),(15,'Y','A','2022-12-27','2024-12-27'),(16,'Y','A','2022-12-27','2024-12-27'),(17,'Y','A','2022-12-27','2024-12-27'),(18,'Y','A','2022-12-27','2024-12-27'),(19,'Y','A','2022-12-27','2024-12-27'),(20,'Y','A','2022-12-27','2024-12-27'),(21,'Y','A','2022-12-27','2024-12-27'),(22,'Y','O','2022-12-27','2024-12-27');
/*!40000 ALTER TABLE `agree_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add board',1,'add_board'),(2,'Can change board',1,'change_board'),(3,'Can delete board',1,'delete_board'),(4,'Can view board',1,'view_board'),(5,'Can add board file',2,'add_boardfile'),(6,'Can change board file',2,'change_boardfile'),(7,'Can delete board file',2,'delete_boardfile'),(8,'Can view board file',2,'view_boardfile'),(9,'Can add chat room',3,'add_chatroom'),(10,'Can change chat room',3,'change_chatroom'),(11,'Can delete chat room',3,'delete_chatroom'),(12,'Can view chat room',3,'view_chatroom'),(13,'Can add code master',4,'add_codemaster'),(14,'Can change code master',4,'change_codemaster'),(15,'Can delete code master',4,'delete_codemaster'),(16,'Can view code master',4,'view_codemaster'),(17,'Can add designer',5,'add_designer'),(18,'Can change designer',5,'change_designer'),(19,'Can delete designer',5,'delete_designer'),(20,'Can view designer',5,'view_designer'),(21,'Can add model',6,'add_model'),(22,'Can change model',6,'change_model'),(23,'Can delete model',6,'delete_model'),(24,'Can view model',6,'view_model'),(25,'Can add reservation',7,'add_reservation'),(26,'Can change reservation',7,'change_reservation'),(27,'Can delete reservation',7,'delete_reservation'),(28,'Can view reservation',7,'view_reservation'),(29,'Can add shop',8,'add_shop'),(30,'Can change shop',8,'change_shop'),(31,'Can delete shop',8,'delete_shop'),(32,'Can view shop',8,'view_shop'),(33,'Can add userinfo',9,'add_userinfo'),(34,'Can change userinfo',9,'change_userinfo'),(35,'Can delete userinfo',9,'delete_userinfo'),(36,'Can view userinfo',9,'view_userinfo'),(37,'Can add userinfo detail',10,'add_userinfodetail'),(38,'Can change userinfo detail',10,'change_userinfodetail'),(39,'Can delete userinfo detail',10,'delete_userinfodetail'),(40,'Can view userinfo detail',10,'view_userinfodetail'),(41,'Can add agree info',11,'add_agreeinfo'),(42,'Can change agree info',11,'change_agreeinfo'),(43,'Can delete agree info',11,'delete_agreeinfo'),(44,'Can view agree info',11,'view_agreeinfo'),(45,'Can add board review',12,'add_boardreview'),(46,'Can change board review',12,'change_boardreview'),(47,'Can delete board review',12,'delete_boardreview'),(48,'Can view board review',12,'view_boardreview'),(49,'Can add chat detail',13,'add_chatdetail'),(50,'Can change chat detail',13,'change_chatdetail'),(51,'Can delete chat detail',13,'delete_chatdetail'),(52,'Can view chat detail',13,'view_chatdetail'),(53,'Can add code detail',14,'add_codedetail'),(54,'Can change code detail',14,'change_codedetail'),(55,'Can delete code detail',14,'delete_codedetail'),(56,'Can view code detail',14,'view_codedetail'),(57,'Can add priceinfo',15,'add_priceinfo'),(58,'Can change priceinfo',15,'change_priceinfo'),(59,'Can delete priceinfo',15,'delete_priceinfo'),(60,'Can view priceinfo',15,'view_priceinfo'),(61,'Can add recommend hair',16,'add_recommendhair'),(62,'Can change recommend hair',16,'change_recommendhair'),(63,'Can delete recommend hair',16,'delete_recommendhair'),(64,'Can view recommend hair',16,'view_recommendhair'),(65,'Can add reserv review',17,'add_reservreview'),(66,'Can change reserv review',17,'change_reservreview'),(67,'Can delete reserv review',17,'delete_reservreview'),(68,'Can view reserv review',17,'view_reservreview'),(69,'Can add face',18,'add_face'),(70,'Can change face',18,'change_face'),(71,'Can delete face',18,'delete_face'),(72,'Can view face',18,'view_face'),(73,'Can add shop file',19,'add_shopfile'),(74,'Can change shop file',19,'change_shopfile'),(75,'Can delete shop file',19,'delete_shopfile'),(76,'Can view shop file',19,'view_shopfile'),(77,'Can add auth group',20,'add_authgroup'),(78,'Can change auth group',20,'change_authgroup'),(79,'Can delete auth group',20,'delete_authgroup'),(80,'Can view auth group',20,'view_authgroup'),(81,'Can add auth group permissions',21,'add_authgrouppermissions'),(82,'Can change auth group permissions',21,'change_authgrouppermissions'),(83,'Can delete auth group permissions',21,'delete_authgrouppermissions'),(84,'Can view auth group permissions',21,'view_authgrouppermissions'),(85,'Can add auth permission',22,'add_authpermission'),(86,'Can change auth permission',22,'change_authpermission'),(87,'Can delete auth permission',22,'delete_authpermission'),(88,'Can view auth permission',22,'view_authpermission'),(89,'Can add authtoken token',23,'add_authtokentoken'),(90,'Can change authtoken token',23,'change_authtokentoken'),(91,'Can delete authtoken token',23,'delete_authtokentoken'),(92,'Can view authtoken token',23,'view_authtokentoken'),(93,'Can add auth user',24,'add_authuser'),(94,'Can change auth user',24,'change_authuser'),(95,'Can delete auth user',24,'delete_authuser'),(96,'Can view auth user',24,'view_authuser'),(97,'Can add auth user groups',25,'add_authusergroups'),(98,'Can change auth user groups',25,'change_authusergroups'),(99,'Can delete auth user groups',25,'delete_authusergroups'),(100,'Can view auth user groups',25,'view_authusergroups'),(101,'Can add auth user user permissions',26,'add_authuseruserpermissions'),(102,'Can change auth user user permissions',26,'change_authuseruserpermissions'),(103,'Can delete auth user user permissions',26,'delete_authuseruserpermissions'),(104,'Can view auth user user permissions',26,'view_authuseruserpermissions'),(105,'Can add django admin log',27,'add_djangoadminlog'),(106,'Can change django admin log',27,'change_djangoadminlog'),(107,'Can delete django admin log',27,'delete_djangoadminlog'),(108,'Can view django admin log',27,'view_djangoadminlog'),(109,'Can add django content type',28,'add_djangocontenttype'),(110,'Can change django content type',28,'change_djangocontenttype'),(111,'Can delete django content type',28,'delete_djangocontenttype'),(112,'Can view django content type',28,'view_djangocontenttype'),(113,'Can add django migrations',29,'add_djangomigrations'),(114,'Can change django migrations',29,'change_djangomigrations'),(115,'Can delete django migrations',29,'delete_djangomigrations'),(116,'Can view django migrations',29,'view_djangomigrations'),(117,'Can add django session',30,'add_djangosession'),(118,'Can change django session',30,'change_djangosession'),(119,'Can delete django session',30,'delete_djangosession'),(120,'Can view django session',30,'view_djangosession'),(121,'Can add log entry',31,'add_logentry'),(122,'Can change log entry',31,'change_logentry'),(123,'Can delete log entry',31,'delete_logentry'),(124,'Can view log entry',31,'view_logentry'),(125,'Can add permission',32,'add_permission'),(126,'Can change permission',32,'change_permission'),(127,'Can delete permission',32,'delete_permission'),(128,'Can view permission',32,'view_permission'),(129,'Can add group',33,'add_group'),(130,'Can change group',33,'change_group'),(131,'Can delete group',33,'delete_group'),(132,'Can view group',33,'view_group'),(133,'Can add user',34,'add_user'),(134,'Can change user',34,'change_user'),(135,'Can delete user',34,'delete_user'),(136,'Can view user',34,'view_user'),(137,'Can add content type',35,'add_contenttype'),(138,'Can change content type',35,'change_contenttype'),(139,'Can delete content type',35,'delete_contenttype'),(140,'Can view content type',35,'view_contenttype'),(141,'Can add session',36,'add_session'),(142,'Can change session',36,'change_session'),(143,'Can delete session',36,'delete_session'),(144,'Can view session',36,'view_session'),(145,'Can add Token',37,'add_token'),(146,'Can change Token',37,'change_token'),(147,'Can delete Token',37,'delete_token'),(148,'Can view Token',37,'view_token'),(149,'Can add token',38,'add_tokenproxy'),(150,'Can change token',38,'change_tokenproxy'),(151,'Can delete token',38,'delete_tokenproxy'),(152,'Can view token',38,'view_tokenproxy'),(153,'Can add hairstyle',39,'add_hairstyle'),(154,'Can change hairstyle',39,'change_hairstyle'),(155,'Can delete hairstyle',39,'delete_hairstyle'),(156,'Can view hairstyle',39,'view_hairstyle');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$5JqUTX50XihqLjPRJPd6eB$dPrIJgYgJFqKXOtovqQ61WkA+Vi1AcVQtPQp1iv3hKY=','2022-12-29 05:51:01.934528',1,'admin','','','',1,1,'2022-12-29 05:50:55.271254');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_detail`
--

DROP TABLE IF EXISTS `chat_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_detail` (
  `room_id` int NOT NULL,
  `seq` int NOT NULL,
  `writer` varchar(30) DEFAULT NULL,
  `message` text,
  `writedatetime` datetime DEFAULT NULL,
  `chat_type` tinyint(1) DEFAULT NULL,
  `img` mediumtext,
  PRIMARY KEY (`room_id`,`seq`),
  CONSTRAINT `chat_detail_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `chat_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_detail`
--

LOCK TABLES `chat_detail` WRITE;
/*!40000 ALTER TABLE `chat_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `designer_id` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `user_id` (`user_id`),
  KEY `designer_id` (`designer_id`),
  CONSTRAINT `chat_room_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chat_room_ibfk_2` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`designer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designer`
--

DROP TABLE IF EXISTS `designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designer` (
  `designer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `designer` varchar(100) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `hp` varchar(100) NOT NULL,
  `remark` text,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`designer_id`),
  KEY `user_id` (`user_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `designer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `designer_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer`
--

LOCK TABLES `designer` WRITE;
/*!40000 ALTER TABLE `designer` DISABLE KEYS */;
INSERT INTO `designer` VALUES (5,3,1,'동빈 디자이너','designer_img/s1d1.jpg','000-0000-0000','미용사 종합 면허증 취득\r\n미용사 국가자격증(일반) 취득\r\n교원능력자격증 취득\r\n한국업스타일전문가 2급자격증 취득\r\n한국업스타일전문가 3급자격증 취득\r\nLKJ Mans cut 수료\r\nLKJ Basic cut 수료\r\nSHISIDO 컬리키 수료\r\nDEMI DIPLOMA 수료\r\nZONE AND SECTION DIPLOMA  수료','2022-12-27 04:52:56',NULL),(6,6,1,'서호 디자이너','designer_img/s1d2.jpg','000-0000-0000','The namgim basic cut교육이수\r\nThe namgim 맨즈 cut 수료\r\nThe namgim advance cut 교육이수\r\n더배움 c클래스(man cut)수료\r\n더배움 a 클래스 (cs / 마인드교육) 수료\r\nLoreal color 수료\r\nDemi color수료\r\n한국업스타일 자격증 수료\r\n동의과학대학교 미용계열 졸업','2022-12-27 04:56:04',NULL),(7,6,1,'하얀 부원장','designer_img/s1d3.jpg','000-0000-0000','고객한분 한분께 맞는 니즈를 찾아 드리겠습니다,\r\n\r\nLKJ ACADEMY 교육 이수\r\nLKJ up style 교육 이수\r\nVLDAL sassson abc컷 수료 \r\nThe Namgim cut 컷수료\r\nSHIED colrorist 교육수료\r\nLoreal  colrorist 교육수료 \r\nDEMI colorst교육이수 \r\nDermaheal 두피관리자격수료 \r\nLAKEME 두피관리자격수료 대한두피자격수료','2022-12-27 04:57:08',NULL),(8,9,1,'해나 점장','designer_img/s1d4.jpg','000-0000-0000','1:1헤어컨설팅 / 라이프스타일과 원하시는 디자인에 맞춰 고객님만의 인생머리를 제안하고 완성해드리겠습니다!','2022-12-27 05:12:07',NULL),(9,10,2,'배상민 원장','designer_img/s2d1.jpg','000-0000-0000','감사합니다.드라포레 광복점 원장 배상민 입니다.','2022-12-27 05:27:24',NULL),(10,11,2,'엄지 디자이너','designer_img/s2d2.jpg','000-0000-0000','- 편안함과 섬세함으로 고객님의 하루를 디자인해드리겠습니다.\r\n\r\n- WELLA COLOR DIPLOMA\r\n- IMAGE DESIGN COPYING CUT DIPLOMA\r\n- PINION BASIC CUT/PINION\r\n- DESIGN CUT DIPLOMA\r\n\r\n[격주 수,목/수,일 휴무]','2022-12-27 05:28:06',NULL),(11,12,2,'영민 디자이너','designer_img/s2d3.jpg','000-0000-0000','반갑습니다! 디자이너 영민입니다\r\n\r\n따뜻한 공간에서 진심을 다해 상담하고 꼼꼼이 시술해드립니다:)\r\n\r\nLOREAL COLOR DIPLOMA\r\nGIAN\'S COLOR POINT MASTER CLASS DIPLOMA\r\nPIVOT POINT BASIC CUT DIPLOMA\r\n에코레비 1급 모발 및 두피 전문가 과정 수료\r\n\r\n[매주 월요일 휴무]','2022-12-27 05:29:11',NULL),(12,13,3,'선우 디자이너','designer_img/s3d1.jpg','000-0000-0000','디테일한 상담으로 원하는 디자인을 찾아 드리겠습니다.\r\n근무 시간 AM 11:00 ~ PM 20:00','2022-12-27 05:36:58',NULL),(13,14,3,'지니 디자이너','designer_img/s3d2.jpg','000-0000-0000','지니 디자이너  매주 수요일 휴무\r\n근무시간  10:00 ~ 18:00\r\n\r\n고객 만족에 중심을 두어 고객님 한분한분 최선을 다하겠습니다.','2022-12-27 05:37:45',NULL),(14,15,3,'민지 디자이너','designer_img/s3d3.jpg','000-0000-0000','민지 디자이너 매주 월요일 휴무입니다.\r\n근무시간 PM 12:00 ~ PM 8:00\r\n\r\n당신이 예뻐지고 싶은만큼 저도 함께 고민하겠습니다.','2022-12-27 05:38:31',NULL),(15,16,3,'은지 부원장','designer_img/s3d4.jpg','000-0000-0000','은지 부원장  근무 시간  AM 10:00 ~ PM 19:00\r\n휴무   첫째 주 셋째 주 - 토요일 / 일요일 휴무\r\n           둘째 주 넷째 주 - 화요일 / 일요일 휴무\r\n\r\n고객님의 숨어있는 아름다움을 찾아드리겠습니다','2022-12-27 05:39:39',NULL),(16,17,4,'실장 주미','designer_img/s4d1.jpg','000-0000-0000','시선이 머무는 디자인을 선사해드릴 [실장 주미]\r\n\r\n작은차이로 다가오는 날들이 더 아름다울 수 있도록, 오늘 당신의 모습을 책임져 드리겠습니다','2022-12-27 05:43:15',NULL),(17,18,4,'점장 서우','designer_img/s4d2.jpg','000-0000-0000','\'2021 KCA한국소비자평가 우수헤어디자이너 선정\'\r\n\r\n인연을 소중히 여기며 신뢰를 바탕으로 소통하고 공감하는 [점장 서우]\r\n\r\n섬세한 감성을 담아 고객님만을 위한 트렌디한 디자인으로 최상의 스타일과 아름다움을 선사하겠습니다','2022-12-27 05:44:24',NULL),(18,19,5,'No.28 원장 헤라','designer_img/s5d1.jpg','000-0000-0000','탈색및디자인염색은 컬러리스트에게~~\r\n\r\n3D, 옴브레발레아쥬 블랙빼기전문디자이너^^\r\n염색은 하면 할수록 쉬워져야 합니다 ^^','2022-12-27 05:49:47',NULL),(19,20,5,'No. 58 바다','designer_img/s5d2.jpg','000-0000-0000','꼼꼼한상담을 통해 고객님께 꼭 맞는 디자인을 해드립니다:) \r\n※1pm~9pm 근무중 :)\r\n※매주 목요일 off\r\n※매주 화요일 pm6~교육일정으로 예약 X :)','2022-12-27 05:50:45',NULL),(20,21,5,'No.109 가을','designer_img/s5d3.jpg','000-0000-0000','야간 9시까지 근무 중 !\r\n1:1 맞춤 시술로 처음부터 끝까지 도와드리겠습니다 :)\r\n\r\n예약,시술,금액 문의는 카톡 -> 가을쌤 검색 :)\r\n\r\n예약창이 닫혀있으면 카톡이나 본점으로 전화주시면\r\n감사하겠습니다!','2022-12-27 05:51:40',NULL),(21,22,5,'No.1001 루비','designer_img/s5d4.jpg','000-0000-0000','▶사랑합니다 고객님 루비 디자이너입니다!\r\n    매순간 정성을 다하겠습니다.\r\n    매출을위한 불필요한시술은 하지않겠습니다.\r\n▶예약해주셔서 감사합니다^^\r\n\r\n▶예약창이 닫혀있을땐 인스타 DM 혹은 본점으로 문의 부탁드립니다.\r\nhwamiju.ruby 인스타그램*','2022-12-27 05:52:50',NULL);
/*!40000 ALTER TABLE `designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (31,'admin','logentry'),(11,'api','agreeinfo'),(20,'api','authgroup'),(21,'api','authgrouppermissions'),(22,'api','authpermission'),(23,'api','authtokentoken'),(24,'api','authuser'),(25,'api','authusergroups'),(26,'api','authuseruserpermissions'),(1,'api','board'),(2,'api','boardfile'),(12,'api','boardreview'),(13,'api','chatdetail'),(3,'api','chatroom'),(14,'api','codedetail'),(4,'api','codemaster'),(5,'api','designer'),(27,'api','djangoadminlog'),(28,'api','djangocontenttype'),(29,'api','djangomigrations'),(30,'api','djangosession'),(18,'api','face'),(39,'api','hairstyle'),(6,'api','model'),(15,'api','priceinfo'),(16,'api','recommendhair'),(7,'api','reservation'),(17,'api','reservreview'),(8,'api','shop'),(19,'api','shopfile'),(9,'api','userinfo'),(10,'api','userinfodetail'),(33,'auth','group'),(32,'auth','permission'),(34,'auth','user'),(37,'authtoken','token'),(38,'authtoken','tokenproxy'),(35,'contenttypes','contenttype'),(36,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-29 05:49:52.311371'),(2,'auth','0001_initial','2022-12-29 05:49:53.055353'),(3,'admin','0001_initial','2022-12-29 05:49:53.219914'),(4,'admin','0002_logentry_remove_auto_add','2022-12-29 05:49:53.231615'),(5,'admin','0003_logentry_add_action_flag_choices','2022-12-29 05:49:53.240614'),(6,'api','0001_initial','2022-12-29 05:49:53.411657'),(7,'api','0002_face_shopfile','2022-12-29 05:49:53.421713'),(8,'api','0003_authtokentoken','2022-12-29 05:49:53.428695'),(9,'api','0004_auto_20221221_2227','2022-12-29 05:49:53.438696'),(10,'api','0005_authgroup_authgrouppermissions_authpermission_authtokentoken_authuser_authusergroups_authuseruserper','2022-12-29 05:49:53.455716'),(11,'api','0006_auto_20221222_0029','2022-12-29 05:49:53.471696'),(12,'api','0007_auto_20221226_1348','2022-12-29 05:49:53.496324'),(13,'contenttypes','0002_remove_content_type_name','2022-12-29 05:49:53.606920'),(14,'auth','0002_alter_permission_name_max_length','2022-12-29 05:49:53.683487'),(15,'auth','0003_alter_user_email_max_length','2022-12-29 05:49:53.713505'),(16,'auth','0004_alter_user_username_opts','2022-12-29 05:49:53.725507'),(17,'auth','0005_alter_user_last_login_null','2022-12-29 05:49:53.805476'),(18,'auth','0006_require_contenttypes_0002','2022-12-29 05:49:53.810475'),(19,'auth','0007_alter_validators_add_error_messages','2022-12-29 05:49:53.823478'),(20,'auth','0008_alter_user_username_max_length','2022-12-29 05:49:53.905274'),(21,'auth','0009_alter_user_last_name_max_length','2022-12-29 05:49:53.998330'),(22,'auth','0010_alter_group_name_max_length','2022-12-29 05:49:54.024321'),(23,'auth','0011_update_proxy_permissions','2022-12-29 05:49:54.057323'),(24,'auth','0012_alter_user_first_name_max_length','2022-12-29 05:49:54.153356'),(25,'authtoken','0001_initial','2022-12-29 05:49:54.260197'),(26,'authtoken','0002_auto_20160226_1747','2022-12-29 05:49:54.290191'),(27,'authtoken','0003_tokenproxy','2022-12-29 05:49:54.297195'),(28,'sessions','0001_initial','2022-12-29 05:49:54.355195'),(29,'api','0008_auto_20221229_1458','2022-12-29 05:59:49.008778'),(30,'api','0009_alter_userinfo_table','2022-12-29 06:03:17.279089'),(31,'api','0008_auto_20221229_1428','2023-01-01 03:52:12.801697'),(32,'api','0009_userinfodetail','2023-01-01 03:52:12.814694'),(33,'api','0010_alter_userinfo_table','2023-01-01 03:52:12.827693'),(34,'api','0011_hairstyle','2023-01-01 03:52:12.836697');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hairstyle`
--

DROP TABLE IF EXISTS `hairstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hairstyle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(1) DEFAULT NULL,
  `hair` varchar(20) DEFAULT NULL,
  `content` text,
  `tags` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hairstyle`
--

LOCK TABLES `hairstyle` WRITE;
/*!40000 ALTER TABLE `hairstyle` DISABLE KEYS */;
INSERT INTO `hairstyle` VALUES (1,'F','하트형','하트형은 넓은 이마와 뾰족한 턱을 가지고 있습니다.','이마가 넓은 하트 얼굴'),(2,'F','긴형','좁고 긴 얼굴형은 가로 길이가 평균보다 짧고 세로 길이는 긴 얼굴입니다.','좁고 긴 얼굴'),(3,'F','둥근형','둥근 얼굴형은 얼굴의 가로와 세로가 비슷하고 둥근 턱 라인이 특징입니다.','볼살 많은 둥근 얼굴'),(4,'F','각진형','광대가 발달한 각진 얼굴은 아래 턱 부분이 넓게 벌어졌다는 것이 특징입니다.','광대가 있는 각진 얼굴'),(5,'F','계란형','달걀모양처럼 위에는 둥글고 턱 쪽으로 내려오면서 갸름하게 V라인이 되는 얼굴형입니다.','완벽한 얼굴형'),(6,'F','엘리자벳펌','가슴 위 기장의 솔리드한 롱헤어 퍼머로, 선명한 실루엣이 특징이며 우아하고 고급스러운 이미지를 강조하는 스타일입니다.','#롱헤어 #우아한 #고급스러운'),(7,'F','베베컷','앞머리가 있는 라운드한 형태의 단발머리로 중성적이면서 귀여운 이미지의 스타일입니다.','#단발 #중성적 #귀여운'),(8,'F','페이퍼컷','가벼운 형태의 레이어드 스타일로 얼굴선을 감싸는 얇고 부드러운 끝 선들이 시크하면서 유니크한 무드를 강조해줍니다.','#레이어드 #시크 #유니크'),(9,'F','윈드펌','윈드컷에서 끝이 뻗치는 형태의 퍼머로 중단발을 가장 내추럴하면서 감각적으로 즐길 수 있는 스타일입니다.','#중단발 #윈드컷 #네추럴 #감각적'),(10,'F','미로펌','턱 선 기장의 솔리드 한 단발머리로 눈썹 선상의 컬리한 라운드 뱅이 있는 스타일입니다.\n겉 단에 흐르는 듯한 자연스러운 웨이브가 특징인 퍼머이며 블런트한 라인과 내추럴한 웨이브가 공존하여 시크한 무드를 만들어내는 스타일입니다!','#단발 #블런트·네추럴 #시크'),(11,'F','미스티펌','웨이브의 흐름만 미세하게 느껴지는 퍼머로 가장 내추럴하며 세련된 롱헤어 퍼머 스타일입니다.','#롱헤어 #웨이브 #네추럴 #세련'),(12,'F','볼륨매직','파마머리나 반곱슬·곱슬머리를 펴주면서 윤기가 나도록 해주는 작업을 볼륨매직이라고 합니다.\n볼륨매직은 뿌리 쪽이 매직보다 덜 달라붙고 끝이 살짝 휘거나 안으로 훅 들어가서 손질이 편합니다!','#반곱슬.곱슬 #윤기 #손질편함'),(13,'F','리프컷','턱 선 기장의 귀를 덮는 오버 가르마의 숏컷입니다.\n직선의 라인이 턱 선을 감싸고 옆얼굴을 커버하여 시크하고 이지적인 무드를 만들어줍니다!','#숏컷 #얼굴외곽커버 #시크 #이지적'),(14,'F','프릴펌','프릴컷에 자연스러운 웨이브를 가미한 퍼머로, 포멀하면서 내추럴한 룩을 완성할 수 있는 스타일입니다!','#롱헤어 #포멀 #네추럴'),(15,'F','보니펌','보니컷에서 C컬을 가미한 스타일로 룩에 따라 발랄하게도, 이지적으로도 연출할 수 있는 스타일입니다.','#단발 #C컬 #보니컷 #발랄 #이지적'),(16,'F','캔디펌','쇄골 기장의 미디움 헤어로 무겁지 않은 레이어드 텍스처에 바깥쪽으로 흐르는 짧은 앞머리와 뿌리부터 흐르는 컬리한 웨이브가 사랑스러우면서 트렌디한 느낌을 줍니다!','#미디움기장 #컬리한웨이브 #사랑스러운 #트렌디'),(17,'F','S컬 레이어드 펌','S컬펌은 C컬보다 조금 더 많은 컬이 형성된 스타일이다.\n여성스럽고 고급스러운 느낌을 연출해주며 과하지 않은 성숙한 이미지를 강조해줍니다!','#롱헤어 #여성스러운 #고급스러운 #성숙한'),(18,'F','포니테일','머리카락을 뒤통수 위쪽 부근에서 한번 끈으로 묶어주고, 나머지 잔머리는 자연스럽게 두고 볼륨감을 살려주세요.\n머리 기장감에 따라 귀여운 이미지 또는 성숙한 이미지로 연출이 가능합니다!','#묶은머리 #자연스러운 #귀여운 #성숙한'),(19,'F','레이어드 컷','층과 층 사이가 겉에서 보기에 거의 느껴지지 않고 안쪽으로 층을 낸 스타일을 보통 레이어드컷이라고 얘기합니다.\n레이어드컷은 질감(texture)과 볼륨감을 살려주어 얼굴이 작아 보이는 효과를 줍니다!','#볼륨감 #질감 #얼굴소멸'),(20,'F','블럭컷','부드러운 커트라인에 구조적인 블록 포인트가 시크하고 특별한 매력을 더해줍니다.','#롱헤어 #옆머리 #포인트 #시크'),(21,'F','로우번','로우번 헤어 스타일은 말 그대로 머리를 낮게 묶어 연출하는 헤어 스타일링 중 하나입니다.\n머리를 아래로 느슨하게 묶어 최대한 자연스럽게 연출해 좀 더 내추럴하고 분위기 있는 스타일을 표현할 수 있습니다!','#묶은머리 #자연스러운 #분위기있는'),(22,'F','단발 6:4 가르마','단발머리일 때는 5:5 정 가르마를 타게 되면 얼굴형이 오히려 강조될 수 있어 6:4 가르마를 추천해 드려요.\n정 가르마보다 안정적이고 자연스러운 느낌을 연출해줍니다!','#단발 #가르마 #안정적 #자연스러운'),(23,'F','긴머리 5:5 가르마','긴 머리일 때 5:5 가르마를 주게 되면 얼굴형을 조금 더 계란형으로 만들어 줍니다.\n이목구비가 강조되고 이마가 좁아 보이는 효과를 줄 수 있습니다!','#롱헤어 #가르마 #이목구비강조'),(24,'F','글램펌','글램펌은 굵은 웨이브가 들어간 펌으로, 굵직한 S라인 아웃컬이 특징입니다.\n컬이 밖으로 말리는 펌이므로, 내츄럴하고 성숙, 섹시, 발랄한 이미지를 줄 수 있습니다!','#롱헤어 #굵은웨이브 #S컬 #네츄럴 #성숙·섹시 #발랄'),(25,'F','빌드컷','쇄골 기장의 블런트한 미디움 헤어로 옆얼굴을 슬림하게 잡아주어 시크함과 세련된 이미지를 만들어줍니다!','#미디움기장 #얼굴외곽커버 #시크 #세련'),(26,'F','S컬 펌','C컬과 다르게 S컬은 컬이 하나만 둥글게 잡히는 것이 아니라 위아래로 상반되는 컬이 있는 것을 말합니다.\n물결 파마 같은 느낌이 들기도 하지만, 굵기가 크거나 아래에만 살짝 넣으면 너무 볼륨감이 커지지 않는 내추럴한 느낌을 만들 수 있습니다!','#롱헤어 #볼륨감 #네추럴'),(27,'F','제인펌','완만한 레이어의 롱헤어 스타일에 자연스러운 웨이브와 스틱뱅 포인트가 자유로우면서 내츄럴한 무드를 완성해줍니다.','#롱헤어 #옆머리 #자연스러운 #웨이브'),(28,'F','허쉬컷','가벼운 형태의 레이어드 스타일로 끝이 얇고 부드럽게 표현되는 것이 특징이며, 룩에 따라 시크하면서 유니크한 무드를 강조할 수 있습니다!','#가벼운 #레이어드 #시크 #유니크'),(29,'F','페이스라인 컷','얼굴선을 따라 흐르도록 옆머리를 내어, 묶어도 풀어도 예쁘게 연출이 가능합니다.\n얼굴형을 보완해주며 여리여리하고 여성스러운 느낌을 줍니다!','#옆머리 #얼굴형보완 #여리여리한 #여성스러운'),(30,'F','시스루 뱅','속이 다 비치는 이란 뜻의 시스루(see-through)라는 단어가 뜻하듯이 앞머리의 숱이 많지 않아 이마가 살짝 보이는 스타일입니다.\n풀뱅보다 시원해 보이고 어려 보이는 느낌을 낼 수 있습니다!','#앞머리 #어려보이는 #귀여운'),(31,'F','사이드 뱅','사이드뱅은 이마를 덮지 않고, 옆으로 넘기는 옆머리 스타일입니다.\n광대 라인부터 얼굴 턱선까지 떨어지게 라인을 잡아서 얼굴이 작아 보이는 효과가 있습니다!','#옆머리 #광대커버 #얼굴소멸'),(32,'F','커튼 뱅','커튼 뱅은 자연스럽게 갈라지는 앞머리가 특징입니다.\n중간에서 분리돼 옆머리로 자연스럽게 흐르는 커튼 뱅은 필요에 따라 옆으로 넘겨서 없앨 수도 있습니다.\n단발이나 긴 머리 모두 잘 어울리는 뱅 스타일로 머리를 묶은 뒤 자연스럽게 얼굴선을 따라 흐르는 연출법으로 여성미를 극대화할 수 있습니다!','#옆머리 #자연스러운 #여성미'),(33,'F','보브컷','정갈하게 가르마를 탄 후 턱 또는 입술 선 부근에서 길이를 마무리하는 단발모양 컷입니다.\n모발의 끝을 안쪽으로 동그랗게 말아 볼륨을 더하고 옆머리와 뒷머리를 같은 길이로 유지하는 형태를 보브컷이라고 한다','#단발 #똑단발 #볼륨'),(34,'F','네추럴업','머리카락을 한쪽으로 모아서 꼰 후 동그랗게 꼬아 묶는 헤어스타일입니다.\n얼굴선 주위를 비벼주며 잔머리를 자연스럽게 내주면 귀엽고 네추럴한 스타일로 연출이 가능합니다!','#묶은머리 #귀여운 #네추럴'),(35,'F','허그펌','허그컷에 볼드한 C컬을 가미한 퍼머입니다.\n가볍고 부드러운 형태로 페미닌한 무드를 극대화하는 스타일입니다!','#롱헤어 #C컬 #가벼운 #부드러운 #페미닌'),(36,'F','S컬 웨이브 펌','C컬과 다르게 S컬은 컬이 하나만 둥글게 잡히는 것이 아니라 위아래로 상반되는 컬이 있는 걸 말합니다.\n물결 파마 같은 느낌이 들기도 하지만, 굵기가 크거나 아래에만 살짝 넣으면 너무 볼륨감이 커지지 않는 내추럴한 느낌을 만들 수 있습니다!','#롱헤어 #볼륨감 #네추럴'),(37,'M','웨이브펌','이마를 까는 게 부담스러울 때, 부드러운 이미지를 위한 웨이브펌을 추천해 드립니다.\n정수리쪽 볼륨을 살려주고 옆머리 부분을 깔끔하게 정리해주면 얼굴형을 보완해주는 효과가 있습니다!','#펌 #볼륨 #부드러운 #깔끔 #얼굴형커버'),(38,'M','투블럭','앞머리와 윗머리는 남기고 옆·뒷머리를 짧게 치는 헤어스타일로 머리가 두 부분으로 나뉜다고 해서 투블럭이라고 합니다.\n옆라인이 깔끔하게 연출되어 슬림한 느낌을 부각해줍니다!','#커트 #깔끔 #슬림'),(39,'M','소프트포마드','반듯한 이마를 보여주면서 머리를 양 옆으로 넘긴 형태로 남성적인 미를 뽐내기도 적합하고 어른스러움과 섹시함 등을 함께 표현할 수 있습니다.\n또한 클래식함을 보여주고 있으므로 정장과도 잘 어울리는 깔끔한 스타입니다.','#남성적 #성숙 #섹시 #클래식 #깔끔'),(40,'M','쉐도우펌','쉐도우펌은 댄디한 스타일의 펌 스타일입니다.\n다른 펌들에 비해 부스스함이 덜하고 부드러운 이미지를 주기 좋은 스타일입니다!','#펌 #댄디 #부드러운'),(41,'M','리젠트펌','리젠트펌은 젠틀하고 깔끔한 이미지를 만들어주는 펌입니다.\n앞머리를 짧게 올리고 싶거나 볼륨감이 적은 경우 손질하기 편하게 만들어주는 펌입니다.','#펌 #젠틀 #깔끔 #손질편함'),(42,'M','아이비리그컷','짧게 사이드포인트에 맞춰 올려 치는 형태의 커트로 앞머리를 올리기 쉽게 앞머리에 층을 많이 내는 커트입니다.\n윗머리는 누르고 앞머리는 전체적으로 뒤로 넘어가듯 스퀘어 형태로 올려 남성미를 조금 더 살릴 수 있는 커트입니다!','#커트 #짧은머리 #남성미'),(43,'M','가일컷','가일 컷은 우리가 흔히 알고 있는 가르마 머리에서 변형된 스타일입니다.\n가르마 스타일이 부드러운 이미지를 강조하는 디자인이라면, 가일은 조금 더 날카롭고, 샤프한 분위기를 주는 스타일입니다!','#커트 #가르마 #날카로운 #샤프한'),(44,'M','베이비펌','귀여운 이미지를 만들어주는 남자펌입니다.\n컬의 흐름이 강하기 때문에 펑키하고 귀여운 인상을 줄 수 있습니다!','#펌 #귀여운 #펑키한 #동그란두상'),(45,'M','애즈펌','애즈펌은 모발의 방향성이 조금 앞으로 쏠리게 하기 때문에, 조금 더 자연스러운 느낌을 줄 수 있습니다.\n얼핏 보면 가르마펌과 비슷한 느낌이지만 다른 점은 앞머리를 내리고 5:5 또는 6:4로 갈라지게 하여 자연스러운 느낌을 줍니다!','#펌 #자연스러운 #앞머리'),(46,'M','투블럭울프컷','옆머리를 최대한 자연스럽게 해서 소프트 투블럭을 해주고 뒷머리와 자연스럽게 연출합니다.\n최대한 옆머리를 가볍게 해주면서 뒷머리를 길러서 조금 더 세련된 이미지를 연출할 수 있습니다.','#커트 #소프트투블럭 #뒷머리 #세련'),(47,'M','소프트모히칸','짧은 머리에 포인트를 주고 싶을 때 시원하게 변화를 줄 수 있는 소프트모히칸 스타일을 추천해 드립니다.\n세팅이 간편하고 깔끔하면서 센스 있는 인상을 줄 수 있습니다!','#짧은머리 #포인트 #간편 #깔끔 #센스있는'),(48,'M','스킨페이드컷','페이드는 서서히 사라지다 라는 뜻으로 모발의 길이가 아래로 내려갈수록 점차 짧아지는 특징이 있습니다.\n스킨페이드는 두상의 중간부에서 목덜미 부분까지 깔끔하게 면도를 하는 스타일로 개성 있는 스타일을 연출할 수 있습니다!','#커트 #짧은머리 #바버샵 #개성있는'),(49,'M','세미크롭','앞머리의 형태가 짧고 윗머리가 좀더 긴 스타일이며, 앞머리를 딱 붙게끔 하여 좀 더 날렵하고 남성다운 느낌을 주는 남자 짧은 머리의 대표적인 헤어스타일입니다.','#커트 #짧은머리 #날렵한 #남성적'),(50,'M','리젠트컷','짧은 윗머리에 앞머리를 세운 스타일입니다.\n특유한 단정함과 더불어 이마를 깐 디자인을 가지고 있어서 신뢰감을 주고 깔끔한 인상을 줄 수 있습니다!','#커트 #짧은머리 #단정 #신뢰감 #깔끔'),(51,'M','볼륨펌','깔끔하고 단정하며 살짝 부드러운 느낌을 손쉽게 표현해주는 대표적인 남자펌입니다.\n모발이 얇고 생머리일 경우 볼륨감을 만들어 주면 너무 직선으로 뻗는 모발을 살짝 곡선으로 바꾸어 주기 때문에 부드러운 이미지로 표현이 가능합니다!','#펌 #깔끔 #단정 #부드러운 #볼륨감'),(52,'M','소프트투블럭','옆머리 길이를 너무 짧게 자르지 않고 뒷머리를 자연스럽게 연결시켜주어, 인위적인 느낌이 덜하고 경계가 부드럽게 가려지는 스타일입니다.\n기본적인 커트 스타일로 다른 스타일로의 변화가 자유롭다는 장점이 있습니다!','#커트 #자연스러운 #기본적인'),(53,'M','가르마펌','가르마펌은 애즈펌에 비해 비교적 이마가 더 많이 보이고, 지적인 분위기를 연출할 수 있습니다.\n또한 이마가 절반정도 보이기 때문에 시원한 느낌을 준다는 장점이 있습니다!','#펌 #지적인 #시원한느낌'),(54,'M','리프펌','가르마 느낌으로 자연스럽게 넘어가도록 연출하는 스타일이 매력적인 머리입니다.\n손으로 빗어 주기만 해도 볼륨감이 살아서 관리가 간편하다는 장점이 있습니다!','#펌 #장발 #가르마 #관리간편'),(55,'M','리프컷','나뭇잎의 옆라인처럼 둥글게 이마를 커버하면서 귀로 넘기는 스타일입니다.\n중성적인 느낌은 주는 스타일로 무거움과 가벼움이 공존하는 세련된 헤어스타일입니다!','#커트 #장발 #중성적 #세련된'),(56,'M','댄디펌','완만한 C컬 형태로 자연스럽게 흐름을 주는 볼륨펌입니다.\n머리의 부피감을 줄이고 차분한 이미지 연출할 수 있습니다!','#펌 #C컬 #볼륨펌 #차분한'),(57,'M','스핀스왈로펌','너무 구불거리지 않고 시크하고 샤프한 느낌을 잘 표현해주는 남자펌입니다.\n펌의 흐름이 일정하지 않고 랜덤하게 뻗기 때문에 인위적인 펌의 느낌이 싫고 조금 색다른 남자 이미지를 원하신다면 추천해 드립니다!','#펌 #시크·샤프 #색다른'),(58,'M','히피펌','풍성한 컬과 발랄해 보이는 실루엣이 생기 있어 보이는 분위기를 만들어 줍니다.\n상대적으로 얼굴을 작아 보이게 하는 효과도 있습니다!','#펌 #생기발랄 #얼굴소멸');
/*!40000 ALTER TABLE `hairstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_hair`
--

DROP TABLE IF EXISTS `recommend_hair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend_hair` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `Heart` float DEFAULT NULL,
  `Oblong` float DEFAULT NULL,
  `Round` float DEFAULT NULL,
  `Square` float DEFAULT NULL,
  `Oval` float DEFAULT NULL,
  `user_faceshape` varchar(30) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `crop_image` varchar(255) DEFAULT NULL,
  `hair1` varchar(255) DEFAULT NULL,
  `hair2` varchar(255) DEFAULT NULL,
  `hair3` varchar(255) DEFAULT NULL,
  `hair4` varchar(255) DEFAULT NULL,
  `hair5` varchar(255) DEFAULT NULL,
  `remark` text,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`seq`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `recommend_hair_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_hair`
--

LOCK TABLES `recommend_hair` WRITE;
/*!40000 ALTER TABLE `recommend_hair` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_hair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserv_review`
--

DROP TABLE IF EXISTS `reserv_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserv_review` (
  `reserv_id` int NOT NULL,
  `shop_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `star` float DEFAULT NULL,
  `content` text,
  `writer` varchar(3) DEFAULT NULL,
  `remark` text,
  `photo` varchar(255) DEFAULT NULL,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`reserv_id`),
  KEY `user_id` (`user_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `reserv_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserv_review_ibfk_2` FOREIGN KEY (`reserv_id`) REFERENCES `reservation` (`reserv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserv_review_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserv_review`
--

LOCK TABLES `reserv_review` WRITE;
/*!40000 ALTER TABLE `reserv_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserv_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reserv_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `designer_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `reserv_date` varchar(10) DEFAULT NULL,
  `reserv_time` varchar(10) DEFAULT NULL,
  `cut` varchar(20) DEFAULT NULL,
  `perm` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `clinic` varchar(20) DEFAULT NULL,
  `remark` text,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`reserv_id`),
  KEY `user_id` (`user_id`),
  KEY `designer_id` (`designer_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`designer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `bizno` varchar(100) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `sub_name` varchar(25) DEFAULT NULL,
  `ceo` varchar(5) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `score` float DEFAULT '0',
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `addr` varchar(200) NOT NULL,
  `addr_det` varchar(200) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `startdate` date DEFAULT NULL,
  `remark` text,
  `event_name` varchar(100) DEFAULT NULL,
  `event_price` varchar(20) DEFAULT NULL,
  `pay_type` varchar(200) DEFAULT NULL,
  `oper_time` varchar(200) DEFAULT NULL,
  `oper_day` varchar(200) DEFAULT NULL,
  `break_day` varchar(200) DEFAULT NULL,
  `break_time` varchar(200) DEFAULT NULL,
  `holiday` varchar(200) DEFAULT NULL,
  `holiday_time` varchar(200) DEFAULT NULL,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  `heart` int DEFAULT '0',
  `oblong` int DEFAULT '0',
  `oval` int DEFAULT '0',
  `round` int DEFAULT '0',
  `square` int DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'1283840382','이가자헤어비스','부산광복점','김헤어','512303',5.5,'35.0995','129.031459','부산광역시 중구 광복중앙로 2','건물 1층','05199403321','2010-12-19','언제나 고객님을 웃는 얼굴로, 최고의 서비스로 반갑게 맞아하며 고객님의 만족도를 향상시키려 노력하고 있습니다. 완벽한 아름다움을 연출할 뿐만 아니라 마음까지 편안하게 만들어주는 마끼에 by 이가자헤어비스 부산광복점에서 최상의 서비스를 만나보세요.','커트 할인 이벤트!!','15%','지역화폐(카드), 제로페이','7:30 - 11:30 AM','월요일 - 금요일','점심시간','12:00 - 12:30 AM','토요일','7:30 - 09:30 PM',NULL,NULL,0,0,1,0,0),(2,'382810233','조희미용실','1호점','조희진','513303',0,'35.119878','129.040062','부산광역시 동구 초량2동 143-2','부산은행 건물','0514680211','2010-12-19','조희 미용실은 언제나 고객에게 좋은 서비스를 고객님께 최고의 서비스를 제공 드립니다.','커트 할인 이벤트!!','5%','지역화폐(카드), 현금','10:30 - 18:30','월요일 - 금요일','점심시간','12:30 - 14:30 AM','일요일','10:30 - 06:30 PM',NULL,NULL,0,0,0,0,0),(3,'7941231','헤어케슬','초량점','박호영','513522',0,'35.119878','129.040062','부산광역시 동구 초량2동 811-3','건물 1층','0514645245','2012-12-23','저희 헤어케슬은 두피 탈모 관리 전문 미용실이며 고객님께 두피를 최상의 상태로 만들어줍니다.','커트 할인 이벤트!!','5%','지역화폐(카드), 제로페이','10:30 - 18:30','월요일 - 금요일','점심시간','12:30 - 14:30 AM','일요일','10:30 - 06:30 PM',NULL,NULL,0,0,0,0,0),(4,'3123019','이철헤어커커','광복점','이철','521902',0,'35.097968','129.036081','부산광역시 중구 중앙동7가 20-1','롯데마트 4층','0512442326','2016-12-19','이철헤어커커는 언제나 고객에게 좋은 서비스를 고객님께 최고의 서비스를 제공 드립니다.','펌 할인 이벤트!','10%','지역화폐(카드), 제로페이','10:30 - 18:00','월요일 - 일요일','점심시간','12:30 - 13:30 AM','셋째주 일요일','휴무',NULL,NULL,0,0,0,0,0),(5,'4894833','화미주헤어','광복본점','김헤라','48948',0,'35.09979','129.03016','부산 중구 광복로55번길 5 2','3층 화미주헤어 광복본점','051-245-2655','2021-11-04','광복동미용실 남포동미용실 부산미용실\r\n가을에도 겨울에도! 화미주헤어 광복본점에서 예뻐지세요 *^ㅡ^*','전 고객 아로마 마사지 제공!','35%','지역화폐(지류,카드,모바일)','10:00 - 21:00','월요일 - 일요일','점심시간','12:30 - 13:30 PM','연중무휴','연중무휴','2022-12-26 12:43:52',NULL,0,0,1,0,0);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_file`
--

DROP TABLE IF EXISTS `shop_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_file` (
  `shop_id` int NOT NULL,
  `main_img` varchar(250) DEFAULT NULL,
  `img1` varchar(250) DEFAULT NULL,
  `img2` varchar(250) DEFAULT NULL,
  `img3` varchar(250) DEFAULT NULL,
  `img4` varchar(250) DEFAULT NULL,
  `img5` varchar(250) DEFAULT NULL,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  CONSTRAINT `shop_file_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_file`
--

LOCK TABLES `shop_file` WRITE;
/*!40000 ALTER TABLE `shop_file` DISABLE KEYS */;
INSERT INTO `shop_file` VALUES (1,'shop_img/Igaza.jpg','shop_img/s1_6.jpg','shop_img/s1_2.jpg','shop_img/s1_3.jpg','shop_img/s1_lvMc58j.jpg','shop_img/s1_5.jpg','2022-12-26 12:29:28','2022-12-28 06:16:18'),(2,'shop_img/JoHee.jpg','shop_img/s2_1.jpg','shop_img/s2_2.jpg','shop_img/s2_3.jpg','shop_img/s2_4.jpg','shop_img/s2_5.jpg','2022-12-26 12:29:48',NULL),(3,'shop_img/HairCastle.jpg','shop_img/s3_1.png','shop_img/s3_3.jpg','shop_img/s3_2.jpg','shop_img/s3_4.jpg','shop_img/s3_5.jpg','2022-12-26 12:44:42',NULL),(4,'shop_img/Leechul.jpg','shop_img/s4_1.jpg','shop_img/s4_2.jpg','shop_img/s4_3.jpg','shop_img/s4_4.jpg','shop_img/s4_5.jpg','2022-12-26 12:44:56',NULL),(5,'shop_img/Hwamiju.jpg','shop_img/s5_1.jpg','shop_img/s5-2.jpeg','shop_img/s5_3.jpg','shop_img/s5_4.jpeg','shop_img/s5_5.jpg','2022-12-26 12:45:37',NULL);
/*!40000 ALTER TABLE `shop_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_pw` varchar(255) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `age` varchar(10) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hp` varchar(100) NOT NULL,
  `thumbnail` varchar(255) DEFAULT 'profile_thumbnail/profile.png',
  `user_type` tinyint(1) DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'$2b$12$XnLCILar7n8XZ7uveTFsOe/uvDD24DzGGLm5ogeiopatTEMB8FEyO','마지혜','20001012','F','ma@a.com','01033333333','profile_thumbnail/루피.jpg',1,0,NULL),(2,'$2b$12$k6cXHlb9lgDA544WyYg83eB3bGxWGXzBAHi7u6yjMte0nGy3b7oZa','이유옥','19961013','F','lee@a.com','01033333333','profile_thumbnail/profile_3UpAcGc.png',1,0,NULL),(3,'$2b$12$LkIM.iHfvs1aV8A4FjKjYubc0RSQhKbUmR7/yGWvM3/inwrGJfb9a','김동빈','19901010','M','kim@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(4,'$2b$12$KcUISPsHkSNC65doivfusOCFomqiQHecdyfUbCfhUybagqaixSZ16','이준혁','19920109','M','leejh@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(5,'$2b$12$iuKLLXlB2SDtSgUL03OA7uPLdb2BWs2EFjuBuz6Qf6EtHCeeUfXmy','문성균','1994-07-21','M','moon@a.com','0','profile_thumbnail/profile.png',1,0,NULL),(6,'$2b$12$55CCcUWBoFYeMkRYoO5GU.Vun1r0251n8qjQeF4gdCng1/Zd0I3TS','김하얀','19900912','F','white@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(7,'$2b$12$hpnUCZI7mvJdVoWliaABE.K8SjeNLQh5HZ5nlEm5nJEexOXZmpCO.','마지혜','2000-02-14','F','majh02@naver.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(8,'$2b$12$/JqGVo7GN.1a9haN1ecZq.WUNqSbEtCXjvjrTDYVmC11oMDNrfGN.','김서호','1990-10-12','M','ksh@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(9,'$2b$12$nKSzNyUBTUQTuOFWlTpRJ.WHVrAbScT2dw3/nqqhPEOhUzJCe1a..','김해나','2000-09-09','F','khn@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(10,'$2b$12$6ruvgtE.qdiDfKYv2XVimOkH.QK0pHMzAsVDfaDXwWumSoWnpo1lK','배상민','1985-10-12','M','bsm@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(11,'$2b$12$O/63ri729VHQtImX.ush/.SQhZDBVoKiG/IjoLCut.fjq9KrAX3Ky','김엄지','1990-10-06','F','kuj@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(12,'$2b$12$5TNPtxmz.Xwwm1nkoKp7Weyjq3b3aHBPEEgWTs8t9xlivKB9glXVS','김영민','2000-10-08','M','kym@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(13,'$2b$12$het5NLf0I.TL7eYf5Fuz2eQOiGNKrrL2qAiZigh1rP09cm2KI7aEK','김선우','1998-10-10','M','ksw@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(14,'$2b$12$CIFes94ooP.aiPlVtc0aJ.5dGFP.Zz3h06bqUvGPf4oCIr1faWFJG','김지니','2000-03-02','F','kjn@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(15,'$2b$12$ghNWOYdEjx8iwgPr5K4.7OlXFxUykj9Fr5.R0z550H/ZpSLq0rycu','김민지','1995-08-08','F','kmj@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(16,'$2b$12$j3Y.MPG2ketCU1aKjxcXMeV3XmnuTD8TLhOsszpLh4gRFuOmC2RQe','김은지','1990-05-11','F','kej@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(17,'$2b$12$ZooJBAXdA95Ji9zvxXovBuuAx3pVsuA9HGo0wHY/wmnINY9AvvS6q','김주미','1997-09-11','F','kjm@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(18,'$2b$12$rnYVFx4gjyv1Z7Dv1CSQMOh3OiQY0WTnjHdtOE/.yAGZH3yNuo5WO','김서우','1997-08-10','F','ksw@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(19,'$2b$12$heybuVVdOuNmmVbgWayNzucesDaoPJLK2YEYfAIktwQLuuXuKq6UC','김헤라','1980-09-10','F','khr@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(20,'$2b$12$qz6Zj2YSLmThbxX7tOl.pOPrlboGeG212Ol4GbsKT7ZyJS0NX6WhS','김바다','1976-07-09','F','kbd@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(21,'$2b$12$Kd1w9v6GITZfJsKJ079aq.bjgRh80Tzywn1aE.vmA/oRj/iBmxpH6','김가을','1990-05-09','F','kge@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL),(22,'$2b$12$S.mAM1rHIArOkAlRbY2.3.l4NWc3hrnM5ASChXOjUhUl9.VuuHPAK','김루비','2000-05-08','F','krb@a.com','01033333333','profile_thumbnail/profile.png',1,0,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo_detail`
--

DROP TABLE IF EXISTS `userinfo_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo_detail` (
  `user_id` int NOT NULL,
  `skin_condition` varchar(10) DEFAULT NULL,
  `hair_bold` varchar(10) DEFAULT NULL,
  `curl` varchar(10) DEFAULT NULL,
  `hair_condition` varchar(10) DEFAULT NULL,
  `thick_hair` varchar(10) DEFAULT NULL,
  `hair_age` varchar(10) DEFAULT NULL,
  `remark` text,
  `regdatetime` datetime DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `userinfo_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo_detail`
--

LOCK TABLES `userinfo_detail` WRITE;
/*!40000 ALTER TABLE `userinfo_detail` DISABLE KEYS */;
INSERT INTO `userinfo_detail` VALUES (5,'건성','','','','','','','2022-12-29 15:18:05','2022-12-29 15:18:05');
/*!40000 ALTER TABLE `userinfo_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smart_cut'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_chatroom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_chatroom`(
	IN _user_id int,
    IN _designer_id int
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
		@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
        ROLLBACK;
        
        INSERT INTO sql_error_log(sp_name, return_sql, message, dt) values('check_chatroom', @p1, @p2, now());
        SELECT -9 as 'state';
		RESIGNAL;
	END;
    
	START TRANSACTION;
    
    IF NOT EXISTS(SELECT room_id FROM chat_room WHERE user_id = _user_id AND designer_id = _designer_id) THEN
		INSERT INTO chat_room(user_id, designer_id)
						VALUE(_user_id, _designer_id);
    END IF;
		
    SELECT room_id FROM chat_room WHERE user_id = _user_id AND designer_id = _designer_id;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_userinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_userinfo`(
	IN _user_id int
)
BEGIN
	SELECT u.user_id, u.user_pw, u.user_name, u.email, u.age, u.gender, u.hp, u.thumbnail
			, d.skin_condition, d.hair_bold, d.curl, d.hair_condition, d.thick_hair, d.hair_age
    FROM userinfo as u
    LEFT JOIN userinfo_detail as d
	ON u.user_id = d.user_id
    WHERE u.user_id = _user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_chatlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_chatlist`(
	IN _user_id int
)
BEGIN
	SELECT c.room_id, u.user_id, u.user_name, u.thumbnail, d.designer_id, d.designer, d.photo
			, (select cd.message from chat_detail cd where cd.room_id = c.room_id order by cd.seq DESC limit 1) as message
    FROM userinfo u, chat_room c, designer d
    WHERE u.user_id = c.user_id
    AND c.designer_id = d.designer_id
    AND (c.user_id = _user_id OR c.designer_id = _user_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_chat_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_chat_detail`(
	IN _room_id int,
    IN _writer varchar(30),
    IN _message text,
    IN _img MEDIUMTEXT,
    IN _chat_type TINYINT(1)
)
BEGIN
	DECLARE _seq int default 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
		@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
        ROLLBACK;
        
        INSERT INTO sql_error_log(sp_name, return_sql, message, dt) values('set_chat_detail', @p1, @p2, now());
        SELECT -9 as 'state';
		RESIGNAL;
	END;
    
    SET _seq = (SELECT COALESCE(MAX(seq),0) + 1 FROM chat_detail WHERE room_id = _room_id);
    
    START TRANSACTION;
    
    INSERT INTO chat_detail(room_id, seq, writer, message, writedatetime, chat_type, img)
						VALUES(_room_id, _seq, _writer, _message, now(), _chat_type, _img);
                        
    SELECT 0 as 'state';
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_userinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_userinfo`(
	IN _user_id int,
    IN _age varchar(10),
    IN _hp varchar(20),
    IN _gender varchar(5),
    IN _skin_condition varchar(10),
    IN _hair_bold varchar(10),
    IN _curl varchar(10),
    IN _hair_condition varchar(10),
    IN _thick_hair varchar(10),
    IN _hair_age varchar(10),
    IN _thumbnail varchar(255)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
		@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
        ROLLBACK;
        
        INSERT INTO sql_error_log(sp_name, return_sql, message, dt) values('set_userinfo', @p1, @p2, now());
        SELECT -9 as 'state';
		RESIGNAL;
	END;
    
	START TRANSACTION;
    
    UPDATE userinfo SET age = _age
						, hp = _hp
						, gender = _gender
                        , thumbnail = _thumbnail
						-- , updatedatetime = NOW()
					WHERE user_id = _user_id;
    
    IF EXISTS(select user_id from userinfo_detail where user_id = _user_id) THEN
		UPDATE userinfo_detail SET skin_condition = _skin_condition
									, hair_bold = _hair_bold
                                    , curl = _curl
                                    , hair_condition = _hair_condition
                                    , thick_hair = _thick_hair
                                    , hair_age = _hair_age
                                    , updatedatetime = NOW()
								WHERE user_id = _user_id;
		
        
    ELSE
		INSERT INTO userinfo_detail(user_id, skin_condition, hair_bold, curl, hair_condition, thick_hair, hair_age, remark, regdatetime, updatedatetime)
								VALUE(_user_id, _skin_condition, _hair_bold, _curl, _hair_condition, _thick_hair, _hair_age, '', NOW(), NOW());
    END IF;
    
    SELECT 0 as 'state';
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-02 13:48:13
