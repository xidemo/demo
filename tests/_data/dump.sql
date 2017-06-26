-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: symfony_test
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Current Database: `symfony_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `symfony_test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `symfony_test`;

--
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
INSERT INTO `acl_classes` VALUES (4,'AppBundle\\Admin\\CategoryAdmin'),(5,'AppBundle\\Admin\\ProductAdmin'),(6,'AppBundle\\Admin\\ProductImageAdmin'),(3,'AppBundle\\Admin\\SolutionAdmin'),(1,'AppBundle\\Entity\\Category'),(2,'AppBundle\\Entity\\Product'),(9,'AppBundle\\Entity\\Solution'),(10,'Application\\Sonata\\UserBundle\\Entity\\User'),(8,'Sonata\\UserBundle\\Admin\\Entity\\GroupAdmin'),(7,'Sonata\\UserBundle\\Admin\\Entity\\UserAdmin');
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
INSERT INTO `acl_entries` VALUES (1,1,NULL,1,NULL,0,64,1,'all',0,0),(2,1,NULL,2,NULL,1,32,1,'all',0,0),(3,1,NULL,3,NULL,2,4,1,'all',0,0),(4,1,NULL,4,NULL,3,1,1,'all',0,0),(6,2,NULL,6,NULL,0,64,1,'all',0,0),(7,2,NULL,7,NULL,1,32,1,'all',0,0),(8,2,NULL,8,NULL,2,4,1,'all',0,0),(9,2,NULL,9,NULL,3,1,1,'all',0,0),(11,3,NULL,10,NULL,0,64,1,'all',0,0),(12,3,NULL,11,NULL,1,8224,1,'all',0,0),(13,3,NULL,12,NULL,2,4098,1,'all',0,0),(14,3,NULL,13,NULL,3,4096,1,'all',0,0),(15,4,NULL,1,NULL,0,64,1,'all',0,0),(16,4,NULL,2,NULL,1,8224,1,'all',0,0),(17,4,NULL,3,NULL,2,4098,1,'all',0,0),(18,4,NULL,4,NULL,3,4096,1,'all',0,0),(19,5,NULL,6,NULL,0,64,1,'all',0,0),(20,5,NULL,7,NULL,1,8224,1,'all',0,0),(21,5,NULL,8,NULL,2,4098,1,'all',0,0),(22,5,NULL,9,NULL,3,4096,1,'all',0,0),(23,6,NULL,14,NULL,0,64,1,'all',0,0),(24,6,NULL,15,NULL,1,8224,1,'all',0,0),(25,6,NULL,16,NULL,2,4098,1,'all',0,0),(26,6,NULL,17,NULL,3,4096,1,'all',0,0),(27,7,NULL,18,NULL,0,64,1,'all',0,0),(28,7,NULL,19,NULL,1,8224,1,'all',0,0),(29,7,NULL,20,NULL,2,4098,1,'all',0,0),(30,7,NULL,21,NULL,3,4096,1,'all',0,0),(31,8,NULL,22,NULL,0,64,1,'all',0,0),(32,8,NULL,23,NULL,1,8224,1,'all',0,0),(33,8,NULL,24,NULL,2,4098,1,'all',0,0),(34,8,NULL,25,NULL,3,4096,1,'all',0,0),(35,9,NULL,10,NULL,0,64,1,'all',0,0),(36,9,NULL,11,NULL,1,32,1,'all',0,0),(37,9,NULL,12,NULL,2,4,1,'all',0,0),(38,9,NULL,13,NULL,3,1,1,'all',0,0),(39,10,NULL,18,NULL,0,64,1,'all',0,0),(40,10,NULL,19,NULL,1,32,1,'all',0,0),(41,10,NULL,20,NULL,2,4,1,'all',0,0),(42,10,NULL,21,NULL,3,1,1,'all',0,0);
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
INSERT INTO `acl_object_identities` VALUES (3,NULL,3,'app.admin.solution',1),(4,NULL,4,'app.admin.category',1),(5,NULL,5,'app.admin.product',1),(6,NULL,6,'app.admin.product_image',1),(7,NULL,7,'sonata.user.admin.user',1),(8,NULL,8,'sonata.user.admin.group',1),(9,NULL,9,'5',1),(10,NULL,9,'6',1),(11,NULL,9,'7',1),(12,NULL,9,'8',1),(13,NULL,1,'6',1),(14,NULL,1,'7',1),(15,NULL,1,'8',1),(16,NULL,1,'9',1),(17,NULL,2,'102',1),(18,NULL,2,'103',1),(19,NULL,2,'104',1),(20,NULL,2,'105',1),(21,NULL,2,'106',1),(22,NULL,2,'107',1),(23,NULL,2,'108',1),(24,NULL,2,'109',1),(25,NULL,2,'110',1),(26,NULL,2,'111',1),(27,NULL,2,'112',1),(28,NULL,2,'113',1),(29,NULL,2,'114',1),(30,NULL,2,'115',1),(31,NULL,2,'116',1),(32,NULL,2,'117',1),(33,NULL,2,'118',1),(34,NULL,2,'119',1),(35,NULL,2,'120',1),(36,NULL,2,'121',1),(37,NULL,2,'122',1),(38,NULL,2,'123',1),(39,NULL,2,'124',1),(40,NULL,2,'125',1),(41,NULL,2,'126',1),(42,NULL,2,'127',1),(43,NULL,2,'128',1),(44,NULL,2,'129',1),(45,NULL,2,'130',1),(46,NULL,2,'131',1),(47,NULL,2,'132',1),(48,NULL,2,'133',1),(49,NULL,2,'134',1),(50,NULL,2,'135',1),(51,NULL,2,'136',1),(52,NULL,2,'137',1),(53,NULL,2,'138',1),(54,NULL,2,'139',1),(55,NULL,2,'140',1),(56,NULL,2,'141',1),(57,NULL,2,'142',1),(58,NULL,2,'143',1),(59,NULL,2,'144',1),(60,NULL,2,'145',1),(61,NULL,2,'146',1),(62,NULL,2,'147',1),(63,NULL,2,'148',1),(64,NULL,2,'149',1),(65,NULL,2,'150',1),(66,NULL,2,'151',1),(67,NULL,2,'152',1),(68,NULL,2,'153',1),(69,NULL,2,'154',1),(70,NULL,2,'155',1),(71,NULL,2,'156',1),(72,NULL,2,'157',1),(73,NULL,2,'158',1),(74,NULL,2,'159',1),(75,NULL,2,'160',1),(76,NULL,2,'161',1),(77,NULL,2,'162',1),(78,NULL,2,'163',1),(79,NULL,2,'164',1),(80,NULL,2,'165',1),(81,NULL,2,'166',1),(82,NULL,2,'167',1),(83,NULL,2,'168',1),(84,NULL,2,'169',1),(85,NULL,2,'170',1),(86,NULL,2,'171',1),(87,NULL,2,'172',1),(88,NULL,2,'173',1),(89,NULL,2,'174',1),(90,NULL,2,'175',1),(91,NULL,2,'176',1),(92,NULL,2,'177',1),(93,NULL,2,'178',1),(94,NULL,2,'179',1),(95,NULL,2,'180',1),(96,NULL,2,'181',1),(97,NULL,2,'182',1),(98,NULL,2,'183',1),(99,NULL,2,'184',1),(100,NULL,2,'185',1),(101,NULL,2,'186',1),(102,NULL,2,'187',1),(103,NULL,2,'188',1),(104,NULL,2,'189',1),(105,NULL,2,'190',1),(106,NULL,2,'191',1),(107,NULL,2,'192',1),(108,NULL,2,'193',1),(109,NULL,2,'194',1),(110,NULL,2,'195',1),(111,NULL,2,'196',1),(112,NULL,2,'197',1),(113,NULL,2,'198',1),(114,NULL,2,'199',1),(115,NULL,2,'200',1),(116,NULL,2,'201',1),(117,NULL,10,'5',1),(118,NULL,10,'6',1),(119,NULL,10,'7',1),(120,NULL,10,'8',1);
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
INSERT INTO `acl_object_identity_ancestors` VALUES (3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120);
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
INSERT INTO `acl_security_identities` VALUES (5,'Application\\Sonata\\UserBundle\\Entity\\User-ryan',1),(1,'ROLE_APP_ADMIN_CATEGORY_ADMIN',0),(2,'ROLE_APP_ADMIN_CATEGORY_EDITOR',0),(4,'ROLE_APP_ADMIN_CATEGORY_GUEST',0),(3,'ROLE_APP_ADMIN_CATEGORY_STAFF',0),(6,'ROLE_APP_ADMIN_PRODUCT_ADMIN',0),(7,'ROLE_APP_ADMIN_PRODUCT_EDITOR',0),(9,'ROLE_APP_ADMIN_PRODUCT_GUEST',0),(14,'ROLE_APP_ADMIN_PRODUCT_IMAGE_ADMIN',0),(15,'ROLE_APP_ADMIN_PRODUCT_IMAGE_EDITOR',0),(17,'ROLE_APP_ADMIN_PRODUCT_IMAGE_GUEST',0),(16,'ROLE_APP_ADMIN_PRODUCT_IMAGE_STAFF',0),(8,'ROLE_APP_ADMIN_PRODUCT_STAFF',0),(10,'ROLE_APP_ADMIN_SOLUTION_ADMIN',0),(11,'ROLE_APP_ADMIN_SOLUTION_EDITOR',0),(13,'ROLE_APP_ADMIN_SOLUTION_GUEST',0),(12,'ROLE_APP_ADMIN_SOLUTION_STAFF',0),(22,'ROLE_SONATA_USER_ADMIN_GROUP_ADMIN',0),(23,'ROLE_SONATA_USER_ADMIN_GROUP_EDITOR',0),(25,'ROLE_SONATA_USER_ADMIN_GROUP_GUEST',0),(24,'ROLE_SONATA_USER_ADMIN_GROUP_STAFF',0),(18,'ROLE_SONATA_USER_ADMIN_USER_ADMIN',0),(19,'ROLE_SONATA_USER_ADMIN_USER_EDITOR',0),(21,'ROLE_SONATA_USER_ADMIN_USER_GUEST',0),(20,'ROLE_SONATA_USER_ADMIN_USER_STAFF',0);
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (6,'Industrial & Environmental','industrial-environmental'),(7,'Entertainment & Display','entertainment-display'),(8,'Agriculture & Horticultural','agriculture-horticultural'),(9,'Intelligent Light Sources','intelligent-light-sources');
/*!40000 ALTER TABLE `app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_product`
--

DROP TABLE IF EXISTS `app_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3E1784E012469DE2` (`category_id`),
  CONSTRAINT `FK_3E1784E012469DE2` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (102,7,'Officiis eius qui eaque doloribus.','officiis-eius-qui-eaque-doloribus',467.00,'Veritatis eum molestiae voluptatibus esse occaecati consequatur voluptatem modi. Aut veritatis impedit ut est tempore. Atque quam et impedit illum consequuntur. Reprehenderit quasi et quae quod ea.','2017-06-26 19:35:30',17),(103,9,'Dolorum omnis nostrum quia ut qui modi est.','dolorum-omnis-nostrum-quia-ut-qui-modi-est',874.00,'Omnis voluptas provident beatae aperiam labore error velit. Et non possimus voluptas beatae. Eos qui soluta fugiat excepturi atque. Esse ipsum iusto corrupti libero est.','2017-06-26 19:35:30',72),(104,9,'Architecto animi ut et ut provident.','architecto-animi-ut-et-ut-provident',212.00,'Et ipsum laboriosam fugit est vitae. Fuga neque enim nostrum consequatur. Expedita suscipit et et.','2017-06-26 19:35:30',27),(105,8,'Omnis fugiat qui cumque quia.','omnis-fugiat-qui-cumque-quia',559.00,'Est dicta dolore velit impedit. Deserunt quia id voluptatem omnis magni. Impedit quasi soluta sunt harum.','2017-06-26 19:35:30',66),(106,8,'Et sapiente perspiciatis sunt numquam qui maiores.','et-sapiente-perspiciatis-sunt-numquam-qui-maiores',972.00,'Voluptatem molestiae odio saepe et ut quis. Sit et et ipsa animi facere voluptatum et et. Est quasi aspernatur voluptatem et cupiditate molestiae explicabo.','2017-06-26 19:35:30',76),(107,8,'Laboriosam aut quis nihil quo tempore cum.','laboriosam-aut-quis-nihil-quo-tempore-cum',342.00,'Sit aut quasi soluta minus. Et voluptas quasi expedita quia. Quas ut at magnam. Quidem aliquid aut ducimus velit dolorum ad. Non ex aliquid eveniet harum temporibus.','2017-06-26 19:35:30',66),(108,8,'Aperiam molestiae odit corrupti odio earum esse.','aperiam-molestiae-odit-corrupti-odio-earum-esse',86.00,'Nulla culpa est velit et. Laboriosam explicabo praesentium aliquid est dicta velit voluptatem. Cupiditate voluptate natus sint qui.','2017-06-26 19:35:30',5),(109,6,'Ex repellat quasi dolor aut et.','ex-repellat-quasi-dolor-aut-et',119.00,'Dignissimos sequi voluptatem perferendis repudiandae numquam occaecati dolor. Eum sit ut aut enim in. Omnis et consequatur aut necessitatibus ipsam. A consequatur perferendis alias sit minus at et.','2017-06-26 19:35:30',20),(110,8,'Voluptatum eum et et nihil exercitationem doloremque.','voluptatum-eum-et-et-nihil-exercitationem-doloremque',406.00,'Ipsa minus nostrum atque dolor ab. Harum repellat rerum vel sit illum et laboriosam. Totam iure eum et autem.','2017-06-26 19:35:30',37),(111,8,'Recusandae eos atque ullam.','recusandae-eos-atque-ullam',825.00,'Et suscipit fugiat ullam provident in. Laborum sapiente deserunt libero placeat rem ut voluptas. Fugiat esse quasi in aspernatur. Ipsa explicabo aut recusandae quas sit possimus molestias.','2017-06-26 19:35:30',26),(112,8,'Ut aliquam cumque nihil itaque corrupti dolorem quisquam iusto.','ut-aliquam-cumque-nihil-itaque-corrupti-dolorem-quisquam-iusto',178.00,'Architecto inventore quasi quis id. Harum laborum cumque molestiae nostrum corporis hic sit. Soluta veniam illum qui voluptatibus. Labore assumenda eveniet ad officia.','2017-06-26 19:35:30',87),(113,9,'Laborum molestiae consequatur error est.','laborum-molestiae-consequatur-error-est',327.00,'Quis magnam labore non ratione quas. Non corrupti delectus dolorum porro voluptas et. Assumenda id ut quis quis velit.','2017-06-26 19:35:30',6),(114,8,'Qui veniam eligendi enim asperiores dolore saepe.','qui-veniam-eligendi-enim-asperiores-dolore-saepe',747.00,'Earum sunt accusamus nihil odit provident est nemo. Amet voluptatem enim ipsam. Omnis id nostrum nobis.','2017-06-26 19:35:30',90),(115,7,'Aliquam sit numquam fuga reprehenderit et.','aliquam-sit-numquam-fuga-reprehenderit-et',334.00,'Beatae esse aut et consequatur similique corrupti nisi. Cupiditate quae repellendus eaque et itaque. Eveniet enim laborum autem. Et dignissimos rem ea similique enim vitae exercitationem.','2017-06-26 19:35:30',20),(116,6,'Dolorem saepe officia quis vel.','dolorem-saepe-officia-quis-vel',27.00,'Voluptatem aut aut autem accusantium voluptatem. Molestias quam consequatur maxime velit molestiae. Eos iure dolor error odit. Consectetur aut exercitationem cupiditate ullam tempore nesciunt cum.','2017-06-26 19:35:30',23),(117,7,'Nihil fugiat et et occaecati facilis quis magni.','nihil-fugiat-et-et-occaecati-facilis-quis-magni',984.00,'Laborum necessitatibus aut sed est. Eaque iusto labore vel quo eligendi mollitia. Sit iste magnam quidem nihil dignissimos. Facere aliquid doloremque corrupti quia non vel ut. Id cupiditate corrupti aut.','2017-06-26 19:35:30',65),(118,7,'Blanditiis officia doloribus id et expedita ut.','blanditiis-officia-doloribus-id-et-expedita-ut',271.00,'Est nam ipsa ut accusantium assumenda et fugit. Rem aut ipsa dolorem corrupti eligendi error consequuntur. Velit reiciendis voluptas voluptatem magni sunt consequatur sit. Ad aliquam ut omnis velit ad excepturi.','2017-06-26 19:35:30',5),(119,7,'Rerum nulla iste rerum officiis exercitationem.','rerum-nulla-iste-rerum-officiis-exercitationem',424.00,'Non maxime quos minima blanditiis et earum. Quo dolorum molestiae aspernatur ullam accusantium corrupti nihil. Est debitis soluta consequatur nihil. Rerum consequatur mollitia sint et esse aliquam in esse. Aperiam sit velit accusantium hic minima nisi.','2017-06-26 19:35:30',17),(120,9,'Qui inventore sapiente recusandae ipsam voluptas odio.','qui-inventore-sapiente-recusandae-ipsam-voluptas-odio',867.00,'Nam in id ea cumque sunt. Et et temporibus iste atque sit necessitatibus voluptates. Aspernatur saepe veritatis non id eos facere.','2017-06-26 19:35:30',16),(121,8,'Sunt exercitationem optio quo qui nulla quis autem ipsa.','sunt-exercitationem-optio-quo-qui-nulla-quis-autem-ipsa',766.00,'Consectetur quo reiciendis voluptatem et veniam in provident. Ipsam ut quibusdam recusandae ad. Architecto tempore adipisci impedit deleniti totam. Ut neque magnam qui.','2017-06-26 19:35:30',60),(122,9,'Nostrum deserunt doloremque blanditiis nisi.','nostrum-deserunt-doloremque-blanditiis-nisi',591.00,'Exercitationem repudiandae nihil quia ut aspernatur recusandae amet. Sunt tempore et accusantium sapiente voluptatum sint. Quae sapiente omnis harum maxime quae.','2017-06-26 19:35:30',42),(123,9,'Quia perferendis neque facere reiciendis vero.','quia-perferendis-neque-facere-reiciendis-vero',609.00,'Necessitatibus hic sit voluptatem temporibus magni ratione quasi. Voluptatibus quia velit et officiis. Non nisi laborum tempore ipsa autem velit et. Quos vero sint eius est. Sit minima qui saepe quos dolorum consequatur fuga.','2017-06-26 19:35:30',54),(124,9,'Nostrum earum sunt numquam ducimus facilis tempora.','nostrum-earum-sunt-numquam-ducimus-facilis-tempora',848.00,'Distinctio eum in libero omnis veritatis. Enim voluptas aut voluptatibus ut sint eos. Expedita aut voluptatem sapiente earum. Sed quis aperiam ut consequatur error dolorem neque.','2017-06-26 19:35:30',45),(125,7,'Ut omnis aspernatur consectetur rerum.','ut-omnis-aspernatur-consectetur-rerum',199.00,'Asperiores facilis est qui nihil ipsum. Esse pariatur vero quos in impedit ipsam. Magnam quam officiis similique quo ut sed earum.','2017-06-26 19:35:30',41),(126,8,'Saepe hic quam consequuntur officiis perspiciatis.','saepe-hic-quam-consequuntur-officiis-perspiciatis',747.00,'Non unde nam sit. Ipsa dolorem reprehenderit voluptates alias soluta odit sint. Voluptas sunt aut est aliquam itaque. Quam repudiandae consequatur necessitatibus.','2017-06-26 19:35:30',29),(127,8,'Voluptas sequi dolorem corrupti vero et nam ab.','voluptas-sequi-dolorem-corrupti-vero-et-nam-ab',147.00,'Doloremque vel doloribus laudantium ea ut maxime qui. Natus sed quod qui enim qui nisi. Nihil quia ad aut. Nihil sit dolore enim et ut error quas.','2017-06-26 19:35:30',51),(128,6,'Doloremque rem sint est maxime placeat.','doloremque-rem-sint-est-maxime-placeat',723.00,'Consequatur deleniti dolorem doloremque vitae numquam. Ullam ullam commodi repellat non dignissimos. Nemo nam numquam illum vel magnam reiciendis. Dicta voluptates saepe autem at odio nemo delectus. Itaque rem ut aut culpa et mollitia.','2017-06-26 19:35:30',7),(129,7,'Voluptate nesciunt incidunt laboriosam nam.','voluptate-nesciunt-incidunt-laboriosam-nam',105.00,'Aut placeat quidem voluptatem dolores quasi quae eos. Culpa autem laborum commodi. Sequi accusantium quisquam nostrum sed incidunt optio ut. Qui neque quis reiciendis in et.','2017-06-26 19:35:30',50),(130,8,'Ut aut rerum nobis in quidem dignissimos ut nesciunt.','ut-aut-rerum-nobis-in-quidem-dignissimos-ut-nesciunt',565.00,'Sunt provident accusantium eius quo impedit deserunt fugiat voluptate. Modi omnis odio natus quis. Voluptas vero dolore aut est repudiandae optio qui.','2017-06-26 19:35:30',9),(131,7,'Ipsa nulla doloribus consequatur voluptas accusamus.','ipsa-nulla-doloribus-consequatur-voluptas-accusamus',221.00,'Aut voluptatum repellat odio. Enim quisquam perferendis nobis voluptatum enim veritatis fuga. Nostrum deserunt corrupti autem voluptas maiores. Sint harum dignissimos similique minus animi quos.','2017-06-26 19:35:30',21),(132,6,'Qui hic fuga quasi exercitationem.','qui-hic-fuga-quasi-exercitationem',893.00,'Omnis aliquam quia qui voluptas inventore non eum. Ut sunt dolor sit minus eius dolorum ut. Ut aperiam voluptatibus ut esse consequatur.','2017-06-26 19:35:30',32),(133,8,'Nesciunt facere vitae eum neque est.','nesciunt-facere-vitae-eum-neque-est',863.00,'Expedita ut omnis facilis quis velit deserunt id recusandae. At asperiores illo nam cupiditate corrupti sed.','2017-06-26 19:35:30',61),(134,8,'Maiores ex molestiae veniam at aut qui omnis.','maiores-ex-molestiae-veniam-at-aut-qui-omnis',455.00,'Delectus voluptatem numquam est quis sunt sequi. Et qui nam voluptatem. Assumenda ratione nostrum minus voluptatem consequatur dolore.','2017-06-26 19:35:30',76),(135,6,'Eum sint voluptatum pariatur aliquam et aut quasi.','eum-sint-voluptatum-pariatur-aliquam-et-aut-quasi',369.00,'Dolores soluta molestiae veritatis eos laudantium iusto beatae. Eos inventore veritatis voluptatem nemo. Numquam itaque ut molestiae quis. Iste dolorem id veritatis voluptatem reiciendis quam possimus et. Voluptas molestiae ipsa in amet.','2017-06-26 19:35:30',30),(136,6,'Nihil fugiat placeat aspernatur alias.','nihil-fugiat-placeat-aspernatur-alias',722.00,'Omnis voluptatibus in et voluptatem laboriosam recusandae. Architecto ducimus cupiditate mollitia fugit quam nisi deleniti. Nisi perferendis magnam dolor consequatur corporis voluptatem corporis.','2017-06-26 19:35:30',7),(137,7,'Esse dicta sed soluta quod vel libero quasi.','esse-dicta-sed-soluta-quod-vel-libero-quasi',270.00,'Repudiandae at exercitationem suscipit autem labore at. Et saepe laudantium provident quaerat voluptatem assumenda deserunt. Quidem debitis autem aliquam explicabo placeat molestiae nobis.','2017-06-26 19:35:30',62),(138,9,'Omnis sit qui nam.','omnis-sit-qui-nam',506.00,'Ut reprehenderit vel sequi non expedita. Provident perspiciatis doloremque iure magnam perferendis. Dolorum quis quia vel ut aut ipsam.','2017-06-26 19:35:30',99),(139,9,'Et natus quod ab est.','et-natus-quod-ab-est',446.00,'Molestias adipisci amet nobis facere corrupti ducimus rerum. Placeat quae aut ea labore quis voluptatum. Error eum laudantium dolores dolorum tempora non vitae. Eum nobis aperiam dolorem.','2017-06-26 19:35:30',55),(140,6,'Ut et voluptas deleniti delectus quos nam.','ut-et-voluptas-deleniti-delectus-quos-nam',738.00,'Minima ut qui dolor est porro eligendi. Accusamus molestias harum animi neque minima. Nam unde magni illum porro assumenda.','2017-06-26 19:35:30',95),(141,8,'Quis eius sunt dicta assumenda rerum nobis vero.','quis-eius-sunt-dicta-assumenda-rerum-nobis-vero',962.00,'Modi vel cumque vel ut. Quis nam impedit ut possimus quidem ipsam. Eos veniam eaque ullam animi. Modi eaque aperiam est nobis.','2017-06-26 19:35:30',70),(142,9,'Neque nostrum eum consequatur iste debitis laboriosam.','neque-nostrum-eum-consequatur-iste-debitis-laboriosam',872.00,'Cumque voluptate beatae fugiat sed aliquid. Tempora nesciunt nostrum id quisquam delectus soluta possimus. Asperiores sunt ut repellat molestiae ut.','2017-06-26 19:35:30',61),(143,9,'Ut repellat delectus sequi natus rerum.','ut-repellat-delectus-sequi-natus-rerum',365.00,'Occaecati facere velit molestiae sapiente reprehenderit tenetur. Ut non ducimus voluptatem voluptatum. Consequuntur quasi fugiat et iste eius. Id aut sunt ut dolore consequatur.','2017-06-26 19:35:30',12),(144,9,'Aut optio quisquam enim laudantium.','aut-optio-quisquam-enim-laudantium',596.00,'Similique nemo labore fuga atque. Sequi asperiores aut unde expedita molestias eos sint eveniet. Alias est est odit tempora itaque saepe est aliquam.','2017-06-26 19:35:30',41),(145,6,'Mollitia ut hic saepe natus est excepturi.','mollitia-ut-hic-saepe-natus-est-excepturi',65.00,'Nesciunt incidunt qui quasi. Asperiores molestiae sapiente ab delectus sit consectetur. Omnis quasi commodi eum nobis id temporibus.','2017-06-26 19:35:30',56),(146,6,'Quibusdam aliquid dolores voluptatibus iste autem enim vel.','quibusdam-aliquid-dolores-voluptatibus-iste-autem-enim-vel',981.00,'Sint eveniet magni excepturi ab maiores eum veniam. Delectus voluptatem omnis laudantium voluptatem.','2017-06-26 19:35:30',86),(147,8,'Iure exercitationem veritatis laudantium veritatis.','iure-exercitationem-veritatis-laudantium-veritatis',973.00,'Voluptas ad explicabo iure similique fuga sit dolores excepturi. Quia fugiat consequatur nihil molestias. Nostrum eos ut reiciendis dolore ut nulla repellat eum.','2017-06-26 19:35:30',75),(148,6,'Qui aut minus qui ut.','qui-aut-minus-qui-ut',36.00,'Harum veritatis earum totam modi quaerat voluptate eligendi. Deleniti nulla officiis modi omnis soluta. Enim sunt inventore neque odio molestias consequuntur. Modi aut quae id aut.','2017-06-26 19:35:30',97),(149,9,'Velit itaque magnam magnam.','velit-itaque-magnam-magnam',77.00,'Eos ab deleniti saepe velit similique ullam. Excepturi blanditiis natus a qui minus. Sit et commodi debitis ut quasi. Est eos odio dolores ipsa nostrum maiores.','2017-06-26 19:35:30',26),(150,7,'Neque dolor nesciunt sequi nam a voluptas.','neque-dolor-nesciunt-sequi-nam-a-voluptas',660.00,'Est distinctio hic unde voluptas. Cum aut dolore consequatur ut assumenda sint. Voluptas qui nesciunt ipsum voluptas.','2017-06-26 19:35:30',87),(151,6,'Quos voluptate ipsam vel placeat voluptate possimus et.','quos-voluptate-ipsam-vel-placeat-voluptate-possimus-et',228.00,'Sed facere alias odio magnam. Aliquid vel dolor amet quisquam. Id dolores non ad cum fugiat sed. Voluptas quasi qui dolorem quia unde.','2017-06-26 19:35:30',28),(152,6,'Dolores omnis in impedit eum vel tenetur.','dolores-omnis-in-impedit-eum-vel-tenetur',857.00,'Nihil soluta sint voluptatem ullam vero. Aut delectus nisi non vitae sint. Voluptatum dolore deleniti id et ad illum. Debitis non porro sunt aut illo. Qui similique voluptatem non laboriosam doloribus veritatis.','2017-06-26 19:35:30',61),(153,9,'Qui incidunt minima culpa pariatur magni.','qui-incidunt-minima-culpa-pariatur-magni',488.00,'Qui doloremque libero minus nam deleniti quae. Natus ratione dolore quo temporibus nisi quis. Nesciunt sunt neque esse corporis et et nobis. Voluptate laboriosam consectetur aut quia.','2017-06-26 19:35:30',59),(154,8,'Vel autem hic harum eos nostrum voluptatem.','vel-autem-hic-harum-eos-nostrum-voluptatem',162.00,'Et recusandae occaecati aut quis fugit repellat. Quaerat totam possimus aut et. Sed exercitationem expedita rerum et. Qui quis debitis placeat odio facere blanditiis.','2017-06-26 19:35:30',32),(155,7,'Nihil dolorem mollitia sit quia minima.','nihil-dolorem-mollitia-sit-quia-minima',33.00,'Qui alias voluptatem nemo voluptates et. Deleniti magni cupiditate quibusdam repellendus soluta dolorem. Vel officia est pariatur ut.','2017-06-26 19:35:30',39),(156,8,'Eligendi qui consequuntur sunt voluptatum neque.','eligendi-qui-consequuntur-sunt-voluptatum-neque',175.00,'Ut minus quia vel aliquid. Sed aut impedit atque sequi odit quos sit. Omnis cupiditate harum quidem ut qui voluptatem porro.','2017-06-26 19:35:30',77),(157,9,'Voluptatem in at ducimus qui impedit.','voluptatem-in-at-ducimus-qui-impedit',681.00,'Similique et nisi praesentium rerum ut ut. In placeat molestiae assumenda fugiat rerum qui nam quae. Libero error voluptatibus aspernatur corrupti temporibus quam expedita. Distinctio quos praesentium mollitia rem repellat impedit eos.','2017-06-26 19:35:30',39),(158,8,'Ex et et vel similique architecto.','ex-et-et-vel-similique-architecto',915.00,'Eum aut provident impedit dolores. Minus voluptatum ut repellendus perferendis omnis et. Eos voluptatibus eligendi voluptas. Saepe impedit et delectus occaecati sapiente qui et.','2017-06-26 19:35:30',21),(159,8,'Inventore distinctio non at aut molestiae nihil.','inventore-distinctio-non-at-aut-molestiae-nihil',557.00,'Iure sequi optio eaque voluptatem incidunt repellat voluptate id. Enim sit necessitatibus consequatur minus. Illo iure repellat eveniet sunt nihil blanditiis.','2017-06-26 19:35:30',29),(160,8,'Facilis quasi quaerat in sed.','facilis-quasi-quaerat-in-sed',999.00,'Vitae est architecto modi dolores. Voluptatem et in quae porro qui doloremque molestiae. Minus nulla iste aut magnam sit. Sint non rerum alias eum et tenetur.','2017-06-26 19:35:30',12),(161,8,'Aperiam voluptas rerum reiciendis qui.','aperiam-voluptas-rerum-reiciendis-qui',987.00,'Nam tenetur et iste sed. Enim non nam eveniet iste iure. Inventore odio ut sed rerum minima.','2017-06-26 19:35:30',93),(162,9,'Repudiandae corrupti laboriosam praesentium accusantium nulla cumque.','repudiandae-corrupti-laboriosam-praesentium-accusantium-nulla-cumque',934.00,'Cumque laborum et officia temporibus voluptatibus non. Rerum sunt voluptas iste dolor. Non incidunt veritatis cupiditate.','2017-06-26 19:35:30',99),(163,8,'Modi voluptatem sed sit iusto.','modi-voluptatem-sed-sit-iusto',694.00,'Repellendus sed cupiditate autem soluta magnam quod ducimus. Qui amet numquam cupiditate vel laudantium rerum. Aperiam eveniet qui est et ipsam. Ea earum in corrupti in quisquam similique.','2017-06-26 19:35:30',44),(164,7,'Assumenda quas id qui optio sit.','assumenda-quas-id-qui-optio-sit',564.00,'Libero dignissimos eveniet eos optio ut illo voluptatem totam. Aspernatur libero et optio libero et hic. Id aut natus nostrum ut temporibus tempore aut. Blanditiis assumenda tenetur natus voluptas.','2017-06-26 19:35:30',97),(165,9,'Consequatur animi vel quisquam dolorem quos animi nulla.','consequatur-animi-vel-quisquam-dolorem-quos-animi-nulla',957.00,'Vel ea amet exercitationem qui possimus distinctio natus pariatur. Id magnam animi odio vero ab modi ut animi. Et velit et voluptatibus. Cum veniam soluta iusto.','2017-06-26 19:35:30',62),(166,6,'Nihil cum magnam temporibus quos expedita.','nihil-cum-magnam-temporibus-quos-expedita',646.00,'Amet est officiis delectus. Et quo nihil ipsa mollitia ratione nihil harum.','2017-06-26 19:35:30',79),(167,9,'Voluptate sit cupiditate qui et nisi quis.','voluptate-sit-cupiditate-qui-et-nisi-quis',495.00,'Accusantium tempora sed excepturi. Optio iste et quis earum quaerat. Eum officia unde temporibus officiis est deserunt. Rerum beatae aliquid explicabo molestias dolore officiis.','2017-06-26 19:35:30',54),(168,7,'In vel facere et amet quisquam doloremque incidunt.','in-vel-facere-et-amet-quisquam-doloremque-incidunt',654.00,'Qui sit perspiciatis temporibus ad dolorem. Hic ullam hic dolores blanditiis. Provident aut porro rem aut hic id. Facere dolore explicabo esse ratione consequatur ratione. Maxime et autem quos commodi id quaerat cupiditate dignissimos.','2017-06-26 19:35:30',11),(169,9,'Aperiam et molestias labore aliquam facilis.','aperiam-et-molestias-labore-aliquam-facilis',499.00,'Dicta reprehenderit quo cupiditate optio quae repudiandae quis ut. Ullam sit quia dignissimos deleniti ut vel optio. Alias voluptatem omnis perspiciatis asperiores.','2017-06-26 19:35:30',24),(170,6,'Sunt ut et delectus optio ut.','sunt-ut-et-delectus-optio-ut',334.00,'Accusantium officiis ut rerum distinctio. Fugit saepe et aut velit eius laboriosam. Neque aliquam sint nisi nulla aut vel.','2017-06-26 19:35:30',23),(171,6,'Natus eaque deleniti optio et est.','natus-eaque-deleniti-optio-et-est',623.00,'Voluptas unde quasi assumenda. Quia a est magni iure. Molestiae et quis esse sint placeat ducimus. Aut quia accusantium qui temporibus qui nihil.','2017-06-26 19:35:30',14),(172,8,'Unde adipisci et mollitia.','unde-adipisci-et-mollitia',917.00,'Qui voluptatem aspernatur laboriosam doloremque reprehenderit praesentium occaecati. Labore quia voluptatibus omnis rerum asperiores perspiciatis sit. Alias nisi cupiditate rerum.','2017-06-26 19:35:30',19),(173,6,'Nihil consequatur quidem eligendi ut.','nihil-consequatur-quidem-eligendi-ut',133.00,'Voluptatem ex asperiores atque qui. Consequatur pariatur itaque ab deserunt labore eius aspernatur. Voluptas minima recusandae explicabo consectetur. Illum nam nobis velit consequatur quos voluptate recusandae.','2017-06-26 19:35:30',22),(174,8,'Tempore omnis quod quas amet.','tempore-omnis-quod-quas-amet',283.00,'Cumque earum et quas enim neque aliquam. Quia ducimus non quia rerum delectus qui. Quis ut aut dignissimos nisi aut eos quis impedit. Reiciendis libero delectus et et voluptas eveniet ut excepturi.','2017-06-26 19:35:30',18),(175,6,'Assumenda animi molestias tempora ullam earum.','assumenda-animi-molestias-tempora-ullam-earum',991.00,'Explicabo quia voluptatem ea. Impedit rerum labore omnis rerum enim. Aut in velit molestiae numquam. Dolore maxime quasi molestiae error voluptatem. Eum corporis maxime distinctio velit ut aut ratione.','2017-06-26 19:35:30',71),(176,8,'Quod dolorem quo dolorem fugiat non minus.','quod-dolorem-quo-dolorem-fugiat-non-minus',938.00,'Quia dolorem consequatur itaque est labore molestiae. Officia inventore sit voluptates reiciendis libero. Blanditiis rerum sit sint voluptas laboriosam tempora rem.','2017-06-26 19:35:30',39),(177,7,'Placeat dolorum laborum architecto alias iure.','placeat-dolorum-laborum-architecto-alias-iure',566.00,'Laboriosam placeat accusantium ut corrupti facilis sit. Repellat aut eaque nobis. Dolores esse enim sunt nemo. Corporis id voluptatem rerum mollitia et quisquam voluptatem. Provident accusantium rerum error nihil.','2017-06-26 19:35:30',7),(178,9,'Asperiores voluptatem in et est sint quae voluptas.','asperiores-voluptatem-in-et-est-sint-quae-voluptas',98.00,'Commodi sit qui molestias. Reprehenderit voluptatum qui labore molestias. Voluptatem corrupti aut beatae hic facere.','2017-06-26 19:35:30',6),(179,7,'Laboriosam dolorum voluptatem qui ut non accusamus et.','laboriosam-dolorum-voluptatem-qui-ut-non-accusamus-et',333.00,'Sit ipsa odio consequatur adipisci eos. Necessitatibus rerum voluptas enim quia. Itaque expedita et ullam suscipit minus.','2017-06-26 19:35:30',65),(180,6,'Quia totam odio sed aspernatur soluta voluptas veniam.','quia-totam-odio-sed-aspernatur-soluta-voluptas-veniam',815.00,'Architecto sapiente laborum voluptate iusto. Possimus laboriosam quis rerum sapiente inventore accusantium ipsum. Omnis tempora omnis ut maiores aperiam. Dolore sint quo esse est qui nulla.','2017-06-26 19:35:30',87),(181,8,'Aut aut quam occaecati ut.','aut-aut-quam-occaecati-ut',429.00,'Et ab asperiores qui quos vero. Aperiam reiciendis consectetur nisi labore molestias. Quas ea et corporis temporibus delectus quisquam sed. Ut nisi minus illo iure.','2017-06-26 19:35:30',7),(182,8,'Beatae rerum quos occaecati sequi quia.','beatae-rerum-quos-occaecati-sequi-quia',885.00,'Eligendi quo sed tempore rerum quos. Voluptatem sed et laborum assumenda voluptas corrupti voluptatem. Ut velit porro fugit enim harum aut nihil. Unde voluptatem maxime voluptatibus accusantium ut.','2017-06-26 19:35:30',33),(183,7,'Id minus harum et itaque officiis similique.','id-minus-harum-et-itaque-officiis-similique',282.00,'Consectetur iusto et dolor. Perspiciatis perferendis id consequatur est illo. Veritatis molestiae qui id iusto molestiae quis dolore.','2017-06-26 19:35:30',56),(184,9,'Dolor sed inventore ut ut adipisci est earum.','dolor-sed-inventore-ut-ut-adipisci-est-earum',328.00,'Eos totam et aut assumenda quod. Magni quam eaque nihil officiis. Et illum dolor facilis facere.','2017-06-26 19:35:30',30),(185,7,'Facilis doloremque occaecati quod minima ex vero perspiciatis.','facilis-doloremque-occaecati-quod-minima-ex-vero-perspiciatis',936.00,'Rem inventore qui eum officiis pariatur. Inventore in aut possimus aperiam velit molestias. Quia similique laborum qui autem voluptatem omnis quos. Rem nostrum molestias ut ea.','2017-06-26 19:35:30',44),(186,7,'Eaque quam nam velit ut.','eaque-quam-nam-velit-ut',681.00,'Debitis eos in nisi quos maxime maiores qui dolore. Consequatur et ipsam et et iusto molestiae rem. Cumque fugiat in voluptas omnis quod. Maiores explicabo minus quia consequatur.','2017-06-26 19:35:30',53),(187,7,'Dolorem et et ullam reprehenderit.','dolorem-et-et-ullam-reprehenderit',50.00,'Voluptas eligendi facere dicta voluptatem sed voluptate. Error id et sed incidunt eum reprehenderit eos. Ipsam incidunt sit aut minima dolore.','2017-06-26 19:35:30',58),(188,7,'Voluptas velit praesentium qui laborum ut officiis.','voluptas-velit-praesentium-qui-laborum-ut-officiis',408.00,'Minima nulla accusamus quo sit asperiores. Veritatis rerum et ex hic. Eaque eum ut nostrum cum et dignissimos velit. Sit qui debitis minus qui.','2017-06-26 19:35:30',37),(189,9,'Exercitationem eos animi provident corporis.','exercitationem-eos-animi-provident-corporis',551.00,'Optio et et officia ipsam architecto id. Fuga incidunt aut quos debitis ut aut sequi. Esse iusto consequatur et facilis eius delectus possimus. Corrupti magnam asperiores dolores.','2017-06-26 19:35:30',57),(190,8,'Eos iste aut laudantium expedita provident enim sunt.','eos-iste-aut-laudantium-expedita-provident-enim-sunt',470.00,'Commodi sit incidunt cupiditate voluptates eum voluptatem. Reprehenderit vel libero voluptatum consequatur dolores est. Quas suscipit laboriosam modi aperiam.','2017-06-26 19:35:30',77),(191,8,'Deleniti odio deserunt temporibus.','deleniti-odio-deserunt-temporibus',860.00,'Ratione illo assumenda possimus omnis. Consequatur ea repudiandae dicta exercitationem.','2017-06-26 19:35:30',30),(192,6,'Nesciunt ipsam excepturi nesciunt neque quas.','nesciunt-ipsam-excepturi-nesciunt-neque-quas',677.00,'Modi et qui dignissimos non. Dolor et omnis enim nobis doloremque rerum. Dolores ut blanditiis debitis autem quae nam animi. Molestiae culpa officiis ut unde est unde.','2017-06-26 19:35:30',48),(193,8,'Laudantium aut eum porro esse natus enim.','laudantium-aut-eum-porro-esse-natus-enim',723.00,'Dolores praesentium et autem sit perspiciatis. Minima ut nemo officia officiis vitae maiores. Dignissimos animi est dignissimos blanditiis minus sequi voluptates est.','2017-06-26 19:35:30',49),(194,8,'Dolorum voluptas ducimus repellendus id.','dolorum-voluptas-ducimus-repellendus-id',252.00,'Voluptas cumque quia quae est rerum dolor molestias. Consequatur itaque ut quia. Fugit cum voluptatum voluptatem quis repudiandae.','2017-06-26 19:35:30',67),(195,6,'Rerum magnam eum magni libero sunt.','rerum-magnam-eum-magni-libero-sunt',938.00,'Inventore quia ipsam error fugiat. Nostrum fugit amet culpa qui quo est. Aut deleniti distinctio minus tempore. Quia voluptatem exercitationem est ducimus.','2017-06-26 19:35:30',7),(196,9,'Adipisci consequatur dolore aut laudantium aut eligendi sunt quo.','adipisci-consequatur-dolore-aut-laudantium-aut-eligendi-sunt-quo',37.00,'Aut laborum rerum aut et sed sunt magnam. Voluptas reprehenderit voluptatum libero consequatur sint non. Tenetur omnis voluptatum saepe doloremque.','2017-06-26 19:35:30',60),(197,7,'Magni corporis repudiandae aut totam molestias.','magni-corporis-repudiandae-aut-totam-molestias',838.00,'Quo enim doloribus et quam rerum. Qui quos a vel repellat fuga. Magnam quasi sit illum occaecati a.','2017-06-26 19:35:30',13),(198,7,'Ad magnam laborum dolores vel ratione.','ad-magnam-laborum-dolores-vel-ratione',397.00,'Et pariatur sed et. Molestias quis quo consectetur. Sed consectetur quos voluptas. Incidunt ut et voluptates doloremque temporibus dolorem voluptatem.','2017-06-26 19:35:30',16),(199,7,'Et odit est ea ut.','et-odit-est-ea-ut',482.00,'Sed voluptatum beatae saepe aspernatur. Quibusdam possimus aperiam fugit qui in. Alias aut velit natus rem reprehenderit.','2017-06-26 19:35:30',96),(200,8,'Amet nihil et dignissimos consequuntur eius explicabo doloremque.','amet-nihil-et-dignissimos-consequuntur-eius-explicabo-doloremque',268.00,'Eligendi perspiciatis dolorem labore quaerat esse sapiente ut. Et aut architecto totam ut. Aut saepe blanditiis sed ipsa ut reprehenderit. Veniam tempora quae odit voluptatibus.','2017-06-26 19:35:30',49),(201,9,'Pariatur dolores nam quod ab voluptatem error.','pariatur-dolores-nam-quod-ab-voluptatem-error',171.00,'Omnis a est similique error. Voluptatem voluptatem enim quis quae est fugit.','2017-06-26 19:35:30',65);
/*!40000 ALTER TABLE `app_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_group`
--

DROP TABLE IF EXISTS `fos_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_group`
--

LOCK TABLES `fos_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user`
--

DROP TABLE IF EXISTS `fos_user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user`
--

LOCK TABLES `fos_user_user` WRITE;
/*!40000 ALTER TABLE `fos_user_user` DISABLE KEYS */;
INSERT INTO `fos_user_user` VALUES (5,'tom','tom','t@t.net','t@t.net',1,NULL,'$2y$13$OhF0VOaxW2RPTDldM3rNgOQXrVvAxG5wpnaORat6ndtCe.1ROcmJ.',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'2017-06-26 19:35:30','2017-06-26 19:35:30',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(6,'lili','lili','l@l.net','l@l.net',1,NULL,'$2y$13$indo7Sh433iR9ZAwIqT4kuM7gLHWFiZMTJjyo3GS/Bj3m.RFI4sdq','2017-06-26 19:35:48',0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_STAFF\";}',0,NULL,'2017-06-26 19:35:30','2017-06-26 19:35:48',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(7,'alice','alice','a@a.net','a@a.net',1,NULL,'$2y$13$lQVJjEmyHV55MTkjMl9WZufUpbOV.CBRAuB2b8q5bJtbOjc8eCG/y','2017-06-26 19:41:36',0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_ADMIN\";}',0,NULL,'2017-06-26 19:35:31','2017-06-26 19:41:36',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(8,'ryan','ryan','s@s.net','s@s.net',1,NULL,'$2y$13$W4sD9bB9/gPEPscLYgGfOe8y/C.8hOl5mONf8sy4ifB6mwQTN6Vo6',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,'2017-06-26 19:35:31','2017-06-26 19:35:31',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL);
/*!40000 ALTER TABLE `fos_user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user_group`
--

DROP TABLE IF EXISTS `fos_user_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`),
  CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user_group`
--

LOCK TABLES `fos_user_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20160726222633'),('20160726225442'),('20160727022501'),('20160727233231'),('20160812040225'),('20160812040540'),('20160908003519'),('20170621154248'),('20170626160623');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64617F034584665A` (`product_id`),
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_solutions`
--

DROP TABLE IF EXISTS `products_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_solutions` (
  `solution_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`solution_id`,`product_id`),
  KEY `IDX_58ED14581C0BE183` (`solution_id`),
  KEY `IDX_58ED14584584665A` (`product_id`),
  CONSTRAINT `FK_58ED14581C0BE183` FOREIGN KEY (`solution_id`) REFERENCES `app_product` (`id`),
  CONSTRAINT `FK_58ED14584584665A` FOREIGN KEY (`product_id`) REFERENCES `solution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_solutions`
--

LOCK TABLES `products_solutions` WRITE;
/*!40000 ALTER TABLE `products_solutions` DISABLE KEYS */;
INSERT INTO `products_solutions` VALUES (102,7),(103,6),(104,7),(105,7),(106,8),(107,8),(108,5),(109,5),(110,7),(111,5),(112,5),(113,6),(114,7),(115,6),(116,7),(117,6),(118,5),(119,6),(120,8),(121,6),(122,6),(123,5),(124,8),(125,8),(126,7),(127,8),(128,7),(129,7),(130,7),(131,7),(132,6),(133,7),(134,7),(135,5),(136,5),(137,8),(138,5),(139,6),(140,8),(141,5),(142,8),(143,7),(144,8),(145,8),(146,8),(147,5),(148,7),(149,6),(150,6),(151,6),(152,5),(153,5),(154,7),(155,6),(156,7),(157,8),(158,5),(159,5),(160,8),(161,6),(162,8),(163,7),(164,5),(165,6),(166,6),(167,6),(168,7),(169,6),(170,7),(171,6),(172,6),(173,5),(174,5),(175,7),(176,6),(177,8),(178,8),(179,8),(180,7),(181,6),(182,5),(183,7),(184,6),(185,5),(186,8),(187,8),(188,6),(189,7),(190,8),(191,5),(192,7),(193,7),(194,6),(195,5),(196,6),(197,8),(198,8),(199,5),(200,6),(201,8);
/*!40000 ALTER TABLE `products_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9F3329DB5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (5,'Industrial','industrial','Ut fuga non quibusdam itaque ut quia. Quia quibusdam commodi fugiat debitis voluptatum occaecati. Quam quaerat ipsum earum vel qui itaque voluptatem. Numquam dicta accusamus non laboriosam ad eius tempore error. Et autem sint laboriosam et. Ipsum possimus consequuntur aliquam fugiat sit ratione. Aut aut necessitatibus adipisci nihil.'),(6,'Cinema','cinema','Aliquid sint aut iure voluptates fuga libero. Laudantium itaque non enim enim cumque quasi. Impedit porro ab adipisci vitae alias. Et consequatur enim excepturi quo dolor et officiis. Et consequatur earum aut consectetur cupiditate quae. Sit illo facilis accusamus ex. Et eveniet nemo voluptatibus necessitatibus.'),(7,'Agriculture','agriculture','Odit ducimus consequuntur voluptatem. Quod pariatur distinctio quis suscipit. Aut repellat qui alias et ad ab. Cupiditate vitae dolores et rem est ipsam voluptatem. Ut quibusdam voluptas dicta voluptatem. Soluta aut inventore non dolores ut in sit. Sit veniam non perspiciatis totam et blanditiis corrupti.'),(8,'Data Center','data-center','Nihil voluptas et ea repellat. Velit ex id sint quia velit nihil. Est et corrupti commodi ab. Quos perspiciatis tempora aut alias. Voluptas atque nulla necessitatibus magni consequatur nihil quis non. Veniam dolores quod perspiciatis placeat possimus veniam. Dignissimos optio ab ut dignissimos.');
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-26 19:55:00
