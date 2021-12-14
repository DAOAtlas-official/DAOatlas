-- CREATE DATABASE `dao_collection` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: dao_collection
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `group` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dao_post`
--

DROP TABLE IF EXISTS `dao_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dao_post` (
  `pid` int NOT NULL,
  `start_time` int NOT NULL DEFAULT '0',
  `name` varchar(500) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `members` varchar(500) DEFAULT NULL,
  `key_contributors` varchar(500) DEFAULT NULL,
  `token_name` varchar(500) DEFAULT NULL,
  `token_link` varchar(500) DEFAULT NULL,
  `token_holders` int DEFAULT NULL,
  `treasury` varchar(500) DEFAULT NULL,
  `AUM` int DEFAULT NULL,
  `voting` varchar(500) DEFAULT NULL,
  `goal` varchar(500) DEFAULT NULL,
  `activities` varchar(500) DEFAULT NULL,
  `forum` varchar(500) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `twitter` varchar(500) DEFAULT NULL,
  `discord` varchar(500) DEFAULT NULL,
  `wiki` varchar(500) DEFAULT NULL,
  `how_to_join` text DEFAULT NULL,
  `introduction` text DEFAULT NULL,
  UNIQUE KEY `pid_UNIQUE` (`pid`),
  KEY `pid_index_dao` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dao_post`
--

-- LOCK TABLES `dao_post` WRITE;
-- /*!40000 ALTER TABLE `dao_post` DISABLE KEYS */;
-- INSERT INTO `dao_post` VALUES (3,0,'EOS','','jeck','jskdj','EOS','eos1',56,'',34,'voting','','website','https://www.weitter.com','','wiki','huobi'),(4,0,'阿道夫','','阿道夫','42423223','阿道夫','2323',2,'2323',1,'阿道夫','阿道夫','','阿道夫','阿道夫','阿道夫','阿斯蒂芬'),(5,0,'阿道夫','','闪电贷','阿道夫 ','盛世嫡妃','啊',39,'速达非',22,'安抚安德','点对点','阿道夫','阿萨德','阿萨德','阿斯蒂芬','阿斯蒂芬');
-- /*!40000 ALTER TABLE `dao_post` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `tid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid_index` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章标签隐射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cate` tinyint NOT NULL,
  `use_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (6,'haoha',2,0),(7,'BTC',2,0),(8,'EOS',2,0),(9,'通用',1,0),(10,'ETH',2,0);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tps`
--

DROP TABLE IF EXISTS `tps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` smallint DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tps`
--

LOCK TABLES `tps` WRITE;
/*!40000 ALTER TABLE `tps` DISABLE KEYS */;
INSERT INTO `tps` VALUES (1,'简介',0,'第一个分类','1'),(2,'新DAO',3,'new dao','1');
/*!40000 ALTER TABLE `tps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dao-admin',0,0,'90f12a1bb74d4ed8e0c000b6000b823d');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` bigint unsigned DEFAULT NULL,
  `updated_at` bigint unsigned DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `typeid` smallint DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `click` smallint DEFAULT NULL,
  `tuijian` tinyint DEFAULT NULL,
  `swiper` tinyint DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `content` varchar(500) DEFAULT NULL,
  `body` varchar(20000) DEFAULT NULL,
  `scenes` tinyint NOT NULL DEFAULT '1',
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_views_deleted_at` (`deleted_at`),
  KEY `scenes_index_view` (`scenes`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,1638620394,1638620394,NULL,1,'欢迎使用DAO list ',0,0,0,'',1,'欢迎使用DAO list','欢迎使用DAO list',1,NULL),(2,1638635584,1638635764,NULL,1,'标题党哈哈哈',0,1,0,'',1,'就是快递费积分电风扇','<p>就是快递费积分电风扇</p>',1,'Dao,EOS'),(3,1638636041,1638688296,NULL,1,'Dao 文章标题',0,1,0,'',1,'haohshdj 安徽省到付件','<p>haohshdj 安徽省到付件</p>',2,'10#ETH'),(4,1638702537,1638702596,NULL,2,'我的dao',0,0,0,'/static/upload/images/20211205/1638702450543.png',1,'打发打发看开始开始打发第三方','<p>打发打发看开始开始<mip-img src=\"/static/upload/images/20211205/1638702450543.png\"></mip-img></p><p>打发第三方</p>',2,''),(5,1639025961,1639025974,NULL,2,'12-9 test again我的测试',0,1,0,'/static/upload/images/20211209/1639025914834.png',1,'阿斯顿发的发的发的','<p><br/></p><p>阿斯顿发的发的发的</p><p><mip-img src=\"/static/upload/images/20211209/1639025914834.png\"></mip-img></p>',2,'');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 13:01:55
