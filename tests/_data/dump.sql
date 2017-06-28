-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: symfony
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
INSERT INTO `acl_classes` VALUES (2,'AppBundle\\Admin\\CategoryAdmin'),(3,'AppBundle\\Admin\\ProductAdmin'),(4,'AppBundle\\Admin\\ProductImageAdmin'),(1,'AppBundle\\Admin\\SolutionAdmin'),(8,'AppBundle\\Entity\\Category'),(9,'AppBundle\\Entity\\Product'),(10,'AppBundle\\Entity\\ProductImage'),(7,'AppBundle\\Entity\\Solution'),(11,'Application\\Sonata\\UserBundle\\Entity\\User'),(6,'Sonata\\UserBundle\\Admin\\Entity\\GroupAdmin'),(5,'Sonata\\UserBundle\\Admin\\Entity\\UserAdmin');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
INSERT INTO `acl_entries` VALUES (1,1,NULL,1,NULL,0,64,1,'all',0,0),(2,1,NULL,2,NULL,1,8224,1,'all',0,0),(3,1,NULL,3,NULL,2,4098,1,'all',0,0),(4,1,NULL,4,NULL,3,4096,1,'all',0,0),(5,2,NULL,5,NULL,0,64,1,'all',0,0),(6,2,NULL,6,NULL,1,8224,1,'all',0,0),(7,2,NULL,7,NULL,2,4098,1,'all',0,0),(8,2,NULL,8,NULL,3,4096,1,'all',0,0),(9,3,NULL,9,NULL,0,64,1,'all',0,0),(10,3,NULL,10,NULL,1,8224,1,'all',0,0),(11,3,NULL,11,NULL,2,4098,1,'all',0,0),(12,3,NULL,12,NULL,3,4096,1,'all',0,0),(13,4,NULL,13,NULL,0,64,1,'all',0,0),(14,4,NULL,14,NULL,1,8224,1,'all',0,0),(15,4,NULL,15,NULL,2,4098,1,'all',0,0),(16,4,NULL,16,NULL,3,4096,1,'all',0,0),(17,5,NULL,17,NULL,0,64,1,'all',0,0),(18,5,NULL,18,NULL,1,8224,1,'all',0,0),(19,5,NULL,19,NULL,2,4098,1,'all',0,0),(20,5,NULL,20,NULL,3,4096,1,'all',0,0),(21,6,NULL,21,NULL,0,64,1,'all',0,0),(22,6,NULL,22,NULL,1,8224,1,'all',0,0),(23,6,NULL,23,NULL,2,4098,1,'all',0,0),(24,6,NULL,24,NULL,3,4096,1,'all',0,0),(25,7,NULL,1,NULL,0,64,1,'all',0,0),(26,7,NULL,2,NULL,1,32,1,'all',0,0),(27,7,NULL,3,NULL,2,4,1,'all',0,0),(28,7,NULL,4,NULL,3,1,1,'all',0,0),(29,8,NULL,5,NULL,0,64,1,'all',0,0),(30,8,NULL,6,NULL,1,32,1,'all',0,0),(31,8,NULL,7,NULL,2,4,1,'all',0,0),(32,8,NULL,8,NULL,3,1,1,'all',0,0),(33,9,NULL,9,NULL,0,64,1,'all',0,0),(34,9,NULL,10,NULL,1,32,1,'all',0,0),(35,9,NULL,11,NULL,2,4,1,'all',0,0),(36,9,NULL,12,NULL,3,1,1,'all',0,0),(37,10,NULL,13,NULL,0,64,1,'all',0,0),(38,10,NULL,14,NULL,1,32,1,'all',0,0),(39,10,NULL,15,NULL,2,4,1,'all',0,0),(40,10,NULL,16,NULL,3,1,1,'all',0,0),(41,11,NULL,17,NULL,0,64,1,'all',0,0),(42,11,NULL,18,NULL,1,32,1,'all',0,0),(43,11,NULL,19,NULL,2,4,1,'all',0,0),(44,11,NULL,20,NULL,3,1,1,'all',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
INSERT INTO `acl_object_identities` VALUES (1,NULL,1,'app.admin.solution',1),(2,NULL,2,'app.admin.category',1),(3,NULL,3,'app.admin.product',1),(4,NULL,4,'app.admin.product_image',1),(5,NULL,5,'sonata.user.admin.user',1),(6,NULL,6,'sonata.user.admin.group',1),(7,NULL,7,'25',1),(8,NULL,7,'26',1),(9,NULL,7,'27',1),(10,NULL,7,'28',1),(11,NULL,8,'25',1),(12,NULL,8,'26',1),(13,NULL,8,'27',1),(14,NULL,8,'28',1),(15,NULL,9,'601',1),(16,NULL,9,'602',1),(17,NULL,9,'603',1),(18,NULL,9,'604',1),(19,NULL,9,'605',1),(20,NULL,9,'606',1),(21,NULL,9,'607',1),(22,NULL,9,'608',1),(23,NULL,9,'609',1),(24,NULL,9,'610',1),(25,NULL,9,'611',1),(26,NULL,9,'612',1),(27,NULL,9,'613',1),(28,NULL,9,'614',1),(29,NULL,9,'615',1),(30,NULL,9,'616',1),(31,NULL,9,'617',1),(32,NULL,9,'618',1),(33,NULL,9,'619',1),(34,NULL,9,'620',1),(35,NULL,9,'621',1),(36,NULL,9,'622',1),(37,NULL,9,'623',1),(38,NULL,9,'624',1),(39,NULL,9,'625',1),(40,NULL,9,'626',1),(41,NULL,9,'627',1),(42,NULL,9,'628',1),(43,NULL,9,'629',1),(44,NULL,9,'630',1),(45,NULL,9,'631',1),(46,NULL,9,'632',1),(47,NULL,9,'633',1),(48,NULL,9,'634',1),(49,NULL,9,'635',1),(50,NULL,9,'636',1),(51,NULL,9,'637',1),(52,NULL,9,'638',1),(53,NULL,9,'639',1),(54,NULL,9,'640',1),(55,NULL,9,'641',1),(56,NULL,9,'642',1),(57,NULL,9,'643',1),(58,NULL,9,'644',1),(59,NULL,9,'645',1),(60,NULL,9,'646',1),(61,NULL,9,'647',1),(62,NULL,9,'648',1),(63,NULL,9,'649',1),(64,NULL,9,'650',1),(65,NULL,9,'651',1),(66,NULL,9,'652',1),(67,NULL,9,'653',1),(68,NULL,9,'654',1),(69,NULL,9,'655',1),(70,NULL,9,'656',1),(71,NULL,9,'657',1),(72,NULL,9,'658',1),(73,NULL,9,'659',1),(74,NULL,9,'660',1),(75,NULL,9,'661',1),(76,NULL,9,'662',1),(77,NULL,9,'663',1),(78,NULL,9,'664',1),(79,NULL,9,'665',1),(80,NULL,9,'666',1),(81,NULL,9,'667',1),(82,NULL,9,'668',1),(83,NULL,9,'669',1),(84,NULL,9,'670',1),(85,NULL,9,'671',1),(86,NULL,9,'672',1),(87,NULL,9,'673',1),(88,NULL,9,'674',1),(89,NULL,9,'675',1),(90,NULL,9,'676',1),(91,NULL,9,'677',1),(92,NULL,9,'678',1),(93,NULL,9,'679',1),(94,NULL,9,'680',1),(95,NULL,9,'681',1),(96,NULL,9,'682',1),(97,NULL,9,'683',1),(98,NULL,9,'684',1),(99,NULL,9,'685',1),(100,NULL,9,'686',1),(101,NULL,9,'687',1),(102,NULL,9,'688',1),(103,NULL,9,'689',1),(104,NULL,9,'690',1),(105,NULL,9,'691',1),(106,NULL,9,'692',1),(107,NULL,9,'693',1),(108,NULL,9,'694',1),(109,NULL,9,'695',1),(110,NULL,9,'696',1),(111,NULL,9,'697',1),(112,NULL,9,'698',1),(113,NULL,9,'699',1),(114,NULL,9,'700',1),(115,NULL,10,'601',1),(116,NULL,10,'602',1),(117,NULL,10,'603',1),(118,NULL,10,'604',1),(119,NULL,10,'605',1),(120,NULL,10,'606',1),(121,NULL,10,'607',1),(122,NULL,10,'608',1),(123,NULL,10,'609',1),(124,NULL,10,'610',1),(125,NULL,10,'611',1),(126,NULL,10,'612',1),(127,NULL,10,'613',1),(128,NULL,10,'614',1),(129,NULL,10,'615',1),(130,NULL,10,'616',1),(131,NULL,10,'617',1),(132,NULL,10,'618',1),(133,NULL,10,'619',1),(134,NULL,10,'620',1),(135,NULL,10,'621',1),(136,NULL,10,'622',1),(137,NULL,10,'623',1),(138,NULL,10,'624',1),(139,NULL,10,'625',1),(140,NULL,10,'626',1),(141,NULL,10,'627',1),(142,NULL,10,'628',1),(143,NULL,10,'629',1),(144,NULL,10,'630',1),(145,NULL,10,'631',1),(146,NULL,10,'632',1),(147,NULL,10,'633',1),(148,NULL,10,'634',1),(149,NULL,10,'635',1),(150,NULL,10,'636',1),(151,NULL,10,'637',1),(152,NULL,10,'638',1),(153,NULL,10,'639',1),(154,NULL,10,'640',1),(155,NULL,10,'641',1),(156,NULL,10,'642',1),(157,NULL,10,'643',1),(158,NULL,10,'644',1),(159,NULL,10,'645',1),(160,NULL,10,'646',1),(161,NULL,10,'647',1),(162,NULL,10,'648',1),(163,NULL,10,'649',1),(164,NULL,10,'650',1),(165,NULL,10,'651',1),(166,NULL,10,'652',1),(167,NULL,10,'653',1),(168,NULL,10,'654',1),(169,NULL,10,'655',1),(170,NULL,10,'656',1),(171,NULL,10,'657',1),(172,NULL,10,'658',1),(173,NULL,10,'659',1),(174,NULL,10,'660',1),(175,NULL,10,'661',1),(176,NULL,10,'662',1),(177,NULL,10,'663',1),(178,NULL,10,'664',1),(179,NULL,10,'665',1),(180,NULL,10,'666',1),(181,NULL,10,'667',1),(182,NULL,10,'668',1),(183,NULL,10,'669',1),(184,NULL,10,'670',1),(185,NULL,10,'671',1),(186,NULL,10,'672',1),(187,NULL,10,'673',1),(188,NULL,10,'674',1),(189,NULL,10,'675',1),(190,NULL,10,'676',1),(191,NULL,10,'677',1),(192,NULL,10,'678',1),(193,NULL,10,'679',1),(194,NULL,10,'680',1),(195,NULL,10,'681',1),(196,NULL,10,'682',1),(197,NULL,10,'683',1),(198,NULL,10,'684',1),(199,NULL,10,'685',1),(200,NULL,10,'686',1),(201,NULL,10,'687',1),(202,NULL,10,'688',1),(203,NULL,10,'689',1),(204,NULL,10,'690',1),(205,NULL,10,'691',1),(206,NULL,10,'692',1),(207,NULL,10,'693',1),(208,NULL,10,'694',1),(209,NULL,10,'695',1),(210,NULL,10,'696',1),(211,NULL,10,'697',1),(212,NULL,10,'698',1),(213,NULL,10,'699',1),(214,NULL,10,'700',1),(215,NULL,11,'25',1),(216,NULL,11,'26',1),(217,NULL,11,'27',1),(218,NULL,11,'28',1);
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
INSERT INTO `acl_object_identity_ancestors` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131),(132,132),(133,133),(134,134),(135,135),(136,136),(137,137),(138,138),(139,139),(140,140),(141,141),(142,142),(143,143),(144,144),(145,145),(146,146),(147,147),(148,148),(149,149),(150,150),(151,151),(152,152),(153,153),(154,154),(155,155),(156,156),(157,157),(158,158),(159,159),(160,160),(161,161),(162,162),(163,163),(164,164),(165,165),(166,166),(167,167),(168,168),(169,169),(170,170),(171,171),(172,172),(173,173),(174,174),(175,175),(176,176),(177,177),(178,178),(179,179),(180,180),(181,181),(182,182),(183,183),(184,184),(185,185),(186,186),(187,187),(188,188),(189,189),(190,190),(191,191),(192,192),(193,193),(194,194),(195,195),(196,196),(197,197),(198,198),(199,199),(200,200),(201,201),(202,202),(203,203),(204,204),(205,205),(206,206),(207,207),(208,208),(209,209),(210,210),(211,211),(212,212),(213,213),(214,214),(215,215),(216,216),(217,217),(218,218);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
INSERT INTO `acl_security_identities` VALUES (5,'ROLE_APP_ADMIN_CATEGORY_ADMIN',0),(6,'ROLE_APP_ADMIN_CATEGORY_EDITOR',0),(8,'ROLE_APP_ADMIN_CATEGORY_GUEST',0),(7,'ROLE_APP_ADMIN_CATEGORY_STAFF',0),(9,'ROLE_APP_ADMIN_PRODUCT_ADMIN',0),(10,'ROLE_APP_ADMIN_PRODUCT_EDITOR',0),(12,'ROLE_APP_ADMIN_PRODUCT_GUEST',0),(13,'ROLE_APP_ADMIN_PRODUCT_IMAGE_ADMIN',0),(14,'ROLE_APP_ADMIN_PRODUCT_IMAGE_EDITOR',0),(16,'ROLE_APP_ADMIN_PRODUCT_IMAGE_GUEST',0),(15,'ROLE_APP_ADMIN_PRODUCT_IMAGE_STAFF',0),(11,'ROLE_APP_ADMIN_PRODUCT_STAFF',0),(1,'ROLE_APP_ADMIN_SOLUTION_ADMIN',0),(2,'ROLE_APP_ADMIN_SOLUTION_EDITOR',0),(4,'ROLE_APP_ADMIN_SOLUTION_GUEST',0),(3,'ROLE_APP_ADMIN_SOLUTION_STAFF',0),(21,'ROLE_SONATA_USER_ADMIN_GROUP_ADMIN',0),(22,'ROLE_SONATA_USER_ADMIN_GROUP_EDITOR',0),(24,'ROLE_SONATA_USER_ADMIN_GROUP_GUEST',0),(23,'ROLE_SONATA_USER_ADMIN_GROUP_STAFF',0),(17,'ROLE_SONATA_USER_ADMIN_USER_ADMIN',0),(18,'ROLE_SONATA_USER_ADMIN_USER_EDITOR',0),(20,'ROLE_SONATA_USER_ADMIN_USER_GUEST',0),(19,'ROLE_SONATA_USER_ADMIN_USER_STAFF',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (25,'Industrial & Environmental','industrial-environmental'),(26,'Entertainment & Display','entertainment-display'),(27,'Agriculture & Horticultural','agriculture-horticultural'),(28,'Intelligent Light Sources','intelligent-light-sources');
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
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3E1784E012469DE2` (`category_id`),
  CONSTRAINT `FK_3E1784E012469DE2` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (601,28,'Projection Lamps for Optical Inspection 25000 watts','projection-lamps-for-optical-inspection-25000-watts',138.00,'Delectus earum autem ipsum ut veritatis. Molestiae voluptatibus esse occaecati consequatur voluptatem modi. Aut veritatis impedit ut est tempore.','2017-06-28 10:35:40',211),(602,28,'Mercury Xenon Short Arc Lamps 24000 watts','mercury-xenon-short-arc-lamps-24000-watts',314.00,'Reprehenderit quasi et quae quod ea. Est voluptas dolorum omnis nostrum quia ut qui. Est ab impedit rerum velit.','2017-06-28 10:35:40',189),(603,25,'Mercury Xenon Short Arc Lamps 17000 watts','mercury-xenon-short-arc-lamps-17000-watts',63.00,'Velit maxime et non possimus voluptas. Quaerat eos qui soluta fugiat excepturi. Qui esse ipsum iusto corrupti libero est atque accusamus.','2017-06-28 10:35:40',175),(604,28,'Mercury Xenon Short Arc Lamps 23000 watts','mercury-xenon-short-arc-lamps-23000-watts',347.00,'Et sit corrupti voluptas et ipsum. Fugit est vitae hic fuga neque enim nostrum. Perspiciatis expedita suscipit et et ex repudiandae.','2017-06-28 10:35:40',182),(605,26,'Long Arc UV Lamps for Curing/Coating 4500 watts','long-arc-uv-lamps-for-curing-coating-4500-watts',122.00,'Delectus saepe doloremque est dicta dolore. Impedit eum deserunt quia id. Omnis magni ullam impedit.','2017-06-28 10:35:40',227),(606,27,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',322.00,'Sapiente perspiciatis sunt numquam qui maiores adipisci magni. Animi praesentium voluptatem molestiae odio. Et ut quis enim sit et et ipsa. Facere voluptatum et et ex est quasi aspernatur.','2017-06-28 10:35:40',187),(607,28,'Film/Stage Xenon Lamps 9700 watts','film-stage-xenon-lamps-9700-watts',538.00,'Laboriosam aut quis nihil quo tempore cum. Quasi qui cum quos sit.','2017-06-28 10:35:40',9),(608,28,'Film/Stage Xenon Lamps 700 watts','film-stage-xenon-lamps-700-watts',741.00,'Expedita quia veritatis quas ut at magnam est quidem. Aut ducimus velit dolorum ad fugiat non ex. Eveniet harum temporibus voluptatem et eligendi aperiam.','2017-06-28 10:35:40',153),(609,27,'DE HPS Lamps 1700 watts','de-hps-lamps-1700-watts',673.00,'Distinctio velit quos nulla culpa est velit et. Laboriosam explicabo praesentium aliquid est dicta velit voluptatem. Cupiditate voluptate natus sint qui.','2017-06-28 10:35:40',152),(610,25,'Projection Lamps for Optical Inspection 31000 watts','projection-lamps-for-optical-inspection-31000-watts',579.00,'Et sunt praesentium ullam minus iure. Sequi voluptatem perferendis repudiandae numquam occaecati dolor ipsum eum. Ut aut enim in aperiam omnis et. Aut necessitatibus ipsam numquam a consequatur perferendis.','2017-06-28 10:35:40',147),(611,25,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',11.00,'Voluptatum eum et et nihil exercitationem doloremque. Vel quasi aut qui ipsa minus nostrum. Dolor ab consequuntur harum. Rerum vel sit illum et.','2017-06-28 10:35:40',230),(612,28,'Mercury Xenon Short Arc Lamps 10000 watts','mercury-xenon-short-arc-lamps-10000-watts',400.00,'Odit dolorum recusandae eos atque ullam. Omnis consequatur et nostrum. Suscipit fugiat ullam provident. Est laborum sapiente deserunt libero placeat rem ut voluptas.','2017-06-28 10:35:40',57),(613,25,'Mercury Xenon Short Arc Lamps 20000 watts','mercury-xenon-short-arc-lamps-20000-watts',436.00,'Explicabo aut recusandae quas sit possimus molestias. Nemo inventore ut aliquam cumque. Itaque corrupti dolorem quisquam iusto. Et vel porro et architecto inventore.','2017-06-28 10:35:40',216),(614,25,'CDI-190S Single-table Scan Laser Direct Imaging System ','cdi-190s-single-table-scan-laser-direct-imaging-system',322.00,'Nostrum corporis hic sit sit soluta veniam illum. Voluptatibus ducimus labore assumenda eveniet ad officia. Eos blanditiis laborum molestiae consequatur error. Odio rerum rerum fugit.','2017-06-28 10:35:40',175),(615,25,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',144.00,'Non corrupti delectus dolorum porro voluptas et. Assumenda id ut quis quis velit. Qui deserunt qui veniam eligendi enim asperiores dolore saepe. Natus voluptas quo qui earum sunt accusamus. Odit provident est nemo vel.','2017-06-28 10:35:40',37),(616,27,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',645.00,'Nobis doloribus recusandae ut aliquam sit numquam fuga. Et et esse quia voluptatem. Beatae esse aut et consequatur similique corrupti nisi.','2017-06-28 10:35:40',6),(617,26,'Germicidal Lamps for UV/O3 Cleaning 200 watts','germicidal-lamps-for-uv-o3-cleaning-200-watts',484.00,'Eveniet enim laborum autem. Et dignissimos rem ea similique enim vitae exercitationem. Et magnam dolorem saepe officia quis vel tenetur. Iure nihil et voluptatem aut aut autem.','2017-06-28 10:35:40',254),(618,27,'Germicidal Lamps for UV/O3 Cleaning 50 watts','germicidal-lamps-for-uv-o3-cleaning-50-watts',217.00,'Molestiae sunt eos iure dolor. Odit occaecati consectetur aut exercitationem cupiditate ullam. Nesciunt cum non labore minima. Fugiat et et occaecati facilis quis magni ab.','2017-06-28 10:35:40',257),(619,28,'Germicidal Lamps for UV/O3 Cleaning 120 watts','germicidal-lamps-for-uv-o3-cleaning-120-watts',388.00,'Est amet eaque iusto labore vel quo. Mollitia est sit iste magnam quidem nihil. Libero facere aliquid doloremque corrupti quia non. Ut quia id cupiditate corrupti.','2017-06-28 10:35:40',121),(620,25,'Long Arc UV Lamps for Curing/Coating 17500 watts','long-arc-uv-lamps-for-curing-coating-17500-watts',516.00,'Et expedita ut esse tenetur. In praesentium est nam. Ut accusantium assumenda et fugit vel rem. Ipsa dolorem corrupti eligendi error consequuntur dicta.','2017-06-28 10:35:40',180),(621,27,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',778.00,'Dolorem ad aliquam ut omnis velit ad. Dolores fugiat molestiae rerum nulla. Rerum officiis exercitationem veniam ut. Cumque maiores non maxime quos. Blanditiis et earum quia quo dolorum molestiae aspernatur ullam.','2017-06-28 10:35:40',206),(622,28,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',950.00,'Nihil vel rerum consequatur mollitia sint et. Aliquam in esse omnis aperiam sit. Accusantium hic minima nisi est.','2017-06-28 10:35:40',123),(623,25,'Film/Stage Xenon Lamps 4700 watts','film-stage-xenon-lamps-4700-watts',555.00,'Odio neque aut quisquam. Id nam in id ea cumque. Reprehenderit et et temporibus iste atque sit.','2017-06-28 10:35:40',30),(624,25,'Long Arc UV Lamps for Exposure 350 watts','long-arc-uv-lamps-for-exposure-350-watts',696.00,'Eos facere quae dolor fuga sunt exercitationem. Quo qui nulla quis autem. Earum earum quia inventore illo. Quo reiciendis voluptatem et veniam.','2017-06-28 10:35:40',195),(625,26,'DE HPS Lamps 600 watts','de-hps-lamps-600-watts',837.00,'Reiciendis architecto tempore adipisci impedit deleniti totam non. Neque magnam qui ipsum ut qui. Deserunt doloremque blanditiis nisi ex reiciendis dolores laborum quo. Repudiandae nihil quia ut aspernatur recusandae amet laborum.','2017-06-28 10:35:40',44),(626,28,'Long Arc UV Lamps for Curing/Coating 13500 watts','long-arc-uv-lamps-for-curing-coating-13500-watts',212.00,'Quae sapiente omnis harum maxime quae. Rerum sed quia perferendis neque facere reiciendis vero. Est fugiat fugiat molestias necessitatibus. Sit voluptatem temporibus magni ratione quasi perferendis.','2017-06-28 10:35:40',18),(627,27,'Mercury Xenon Short Arc Lamps 13000 watts','mercury-xenon-short-arc-lamps-13000-watts',262.00,'Laborum tempore ipsa autem velit. Inventore quos vero sint eius est ut sit. Qui saepe quos dolorum.','2017-06-28 10:35:40',154),(628,27,'DE HPS Lamps 500 watts','de-hps-lamps-500-watts',185.00,'Numquam ducimus facilis tempora nemo sunt ullam voluptatem. Distinctio eum in libero omnis veritatis. Enim voluptas aut voluptatibus ut sint eos. Expedita aut voluptatem sapiente earum.','2017-06-28 10:35:40',230),(629,27,'Mercury Xenon Short Arc Lamps 2000 watts','mercury-xenon-short-arc-lamps-2000-watts',395.00,'Neque sunt ipsam sunt ut omnis. Consectetur rerum nesciunt optio veniam ratione corporis. Facilis est qui nihil ipsum quia esse.','2017-06-28 10:35:40',85),(630,25,'Long Arc UV Lamps for Curing/Coating 5500 watts','long-arc-uv-lamps-for-curing-coating-5500-watts',156.00,'Quam officiis similique quo ut sed earum. Est autem saepe hic quam consequuntur officiis perspiciatis placeat. Sint veritatis dignissimos non unde. Sit sit ipsa dolorem reprehenderit voluptates alias soluta odit.','2017-06-28 10:35:40',210),(631,27,'Projection Lamps for Optical Inspection 24000 watts','projection-lamps-for-optical-inspection-24000-watts',115.00,'Dolor quam repudiandae consequatur. Adipisci ipsam temporibus voluptas sequi dolorem corrupti. Et nam ab eius qui.','2017-06-28 10:35:40',232),(632,26,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',734.00,'Ut maxime qui magnam natus sed quod qui. Qui nisi esse nihil quia ad aut mollitia. Sit dolore enim et ut error. Facilis nostrum odit doloremque rem.','2017-06-28 10:35:40',90),(633,27,'Film/Stage Xenon Lamps 5700 watts','film-stage-xenon-lamps-5700-watts',383.00,'Laborum consequatur deleniti dolorem doloremque vitae numquam aut ullam. Commodi repellat non dignissimos officia. Nam numquam illum vel magnam. Quo dicta voluptates saepe autem at. Nemo delectus commodi itaque rem ut aut culpa et.','2017-06-28 10:35:40',210),(634,25,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',768.00,'Nam praesentium recusandae voluptatem itaque qui aut. Quidem voluptatem dolores quasi quae eos alias culpa. Laborum commodi qui sequi.','2017-06-28 10:35:40',110),(635,28,'Germicidal Lamps for UV/O3 Cleaning 150 watts','germicidal-lamps-for-uv-o3-cleaning-150-watts',305.00,'Qui neque quis reiciendis in et. Dicta ad ut aut rerum nobis in quidem. Ut nesciunt ut vel nihil nulla aliquid.','2017-06-28 10:35:40',133),(636,26,'Projection Lamps for Optical Inspection 28000 watts','projection-lamps-for-optical-inspection-28000-watts',678.00,'Voluptate officiis modi omnis odio natus quis modi. Vero dolore aut est repudiandae. Qui deleniti molestiae suscipit ipsa nulla doloribus consequatur voluptas.','2017-06-28 10:35:40',6),(637,28,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',265.00,'Repellat odio ad enim quisquam. Nobis voluptatum enim veritatis. Numquam nostrum deserunt corrupti autem.','2017-06-28 10:35:40',168),(638,26,'Long Arc UV Lamps for Curing/Coating 12500 watts','long-arc-uv-lamps-for-curing-coating-12500-watts',587.00,'Animi quos fugit animi asperiores qui hic fuga quasi. Atque sed totam eos molestias omnis aliquam quia qui. Inventore non eum nihil ut sunt dolor sit.','2017-06-28 10:35:40',295),(639,25,'CDI-110S Single-table Scan Laser Direct Imaging System ','cdi-110s-single-table-scan-laser-direct-imaging-system',758.00,'Ut esse consequatur est omnis. Nesciunt facere vitae eum neque est. Similique tempore quidem dignissimos expedita ut omnis.','2017-06-28 10:35:40',183),(640,26,'Projection Lamps for Optical Inspection 35000 watts','projection-lamps-for-optical-inspection-35000-watts',943.00,'Asperiores illo nam cupiditate corrupti sed. Perspiciatis dolores maiores ex molestiae. At aut qui omnis architecto occaecati saepe. Ut delectus voluptatem numquam est quis.','2017-06-28 10:35:40',214),(641,26,'Long Arc UV Lamps for Curing/Coating 13500 watts','long-arc-uv-lamps-for-curing-coating-13500-watts',701.00,'Assumenda ratione nostrum minus voluptatem consequatur dolore. Ipsa doloremque eum sint voluptatum pariatur aliquam et. Quasi est qui magnam omnis.','2017-06-28 10:35:40',191),(642,25,'Projection Lamps for Optical Inspection 9000 watts','projection-lamps-for-optical-inspection-9000-watts',951.00,'Beatae dolorum eos inventore veritatis voluptatem. Quia numquam itaque ut molestiae quis qui.','2017-06-28 10:35:40',230),(643,28,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',684.00,'Et rerum voluptas molestiae ipsa. Amet ut aut qui nihil fugiat placeat. Alias voluptatum ipsum numquam similique. Omnis voluptatibus in et voluptatem laboriosam recusandae. Architecto ducimus cupiditate mollitia fugit quam nisi deleniti.','2017-06-28 10:35:40',298),(644,26,'Mercury Xenon Short Arc Lamps 34000 watts','mercury-xenon-short-arc-lamps-34000-watts',163.00,'Corporis laboriosam et quae esse. Sed soluta quod vel libero quasi molestiae quia quis. Eum repudiandae at exercitationem suscipit autem. At facilis et saepe laudantium provident quaerat voluptatem assumenda.','2017-06-28 10:35:40',269),(645,28,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',433.00,'Molestiae nobis quas illum odio. Sit qui nam non et et. Laboriosam ut reprehenderit vel sequi. Expedita sit provident perspiciatis doloremque iure magnam perferendis veritatis.','2017-06-28 10:35:40',296),(646,27,'DE HPS Lamps 700 watts','de-hps-lamps-700-watts',938.00,'Neque est et natus quod. Est ut dignissimos aut dolores dignissimos molestias. Amet nobis facere corrupti ducimus rerum consequatur placeat. Aut ea labore quis voluptatum dolorem.','2017-06-28 10:35:40',197),(647,28,'Mercury Xenon Short Arc Lamps 26000 watts','mercury-xenon-short-arc-lamps-26000-watts',520.00,'Animi eum nobis aperiam dolorem rerum explicabo deserunt. Et voluptas deleniti delectus quos nam vero. Alias sunt cupiditate minima ut qui.','2017-06-28 10:35:40',45),(648,27,'Long Arc UV Lamps for Curing/Coating 2500 watts','long-arc-uv-lamps-for-curing-coating-2500-watts',894.00,'Animi neque minima fugiat nam unde magni illum. Assumenda reprehenderit sint aut quis.','2017-06-28 10:35:40',261),(649,25,'Projection Lamps for Optical Inspection 32000 watts','projection-lamps-for-optical-inspection-32000-watts',386.00,'Omnis consequatur eligendi consequuntur modi vel cumque. Ut quaerat quis nam impedit. Possimus quidem ipsam repudiandae eos veniam.','2017-06-28 10:35:40',266),(650,25,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',634.00,'Nobis impedit quos et neque nostrum eum. Iste debitis laboriosam eaque maiores. Odio est cumque voluptate beatae fugiat.','2017-06-28 10:35:40',266),(651,28,'DE HPS Lamps 1000 watts','de-hps-lamps-1000-watts',119.00,'Delectus soluta possimus distinctio asperiores sunt ut repellat. Ut ut excepturi eum ut repellat delectus sequi. Rerum neque in dolorem itaque. Occaecati facere velit molestiae sapiente reprehenderit tenetur.','2017-06-28 10:35:40',251),(652,27,'Mercury Xenon Short Arc Lamps 18000 watts','mercury-xenon-short-arc-lamps-18000-watts',555.00,'Quasi fugiat et iste eius vitae id. Sunt ut dolore consequatur aliquid. Molestiae aut optio quisquam enim.','2017-06-28 10:35:40',261),(653,26,'Projection Lamps for Optical Inspection 28000 watts','projection-lamps-for-optical-inspection-28000-watts',913.00,'Labore fuga atque id sequi asperiores aut unde. Molestias eos sint eveniet tempore alias est est odit.','2017-06-28 10:35:40',145),(654,27,'DE HPS Lamps 1100 watts','de-hps-lamps-1100-watts',351.00,'Mollitia ut hic saepe natus est excepturi. Quam odit ut consequatur nesciunt incidunt qui. Deleniti asperiores molestiae sapiente ab delectus sit consectetur rerum. Quasi commodi eum nobis id temporibus nulla tenetur.','2017-06-28 10:35:40',39),(655,28,'Long Arc UV Lamps for Curing/Coating 16500 watts','long-arc-uv-lamps-for-curing-coating-16500-watts',882.00,'Vel minus eaque quia accusantium consequatur sint. Magni excepturi ab maiores eum. Quia delectus voluptatem omnis laudantium. Molestiae rerum et iure exercitationem veritatis.','2017-06-28 10:35:40',263),(656,25,'Projection Lamps for Optical Inspection 1000 watts','projection-lamps-for-optical-inspection-1000-watts',737.00,'Ad explicabo iure similique. Sit dolores excepturi ratione quia fugiat. Nihil molestias corrupti nostrum eos ut reiciendis. Ut nulla repellat eum ipsa eaque quasi qui. Minus qui ut quos maiores maxime.','2017-06-28 10:35:40',192),(657,28,'Projection Lamps for Optical Inspection 27000 watts','projection-lamps-for-optical-inspection-27000-watts',419.00,'Voluptate eligendi ut deleniti nulla officiis. Omnis soluta sed enim sunt inventore neque odio. Consequuntur cumque modi aut quae id aut optio.','2017-06-28 10:35:40',13),(658,25,'Long Arc UV Lamps for Curing/Coating 7500 watts','long-arc-uv-lamps-for-curing-coating-7500-watts',166.00,'Voluptatem nihil culpa eos ab deleniti. Velit similique ullam magni excepturi.','2017-06-28 10:35:40',176),(659,26,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',143.00,'Commodi debitis ut quasi occaecati est eos. Dolores ipsa nostrum maiores molestiae ut impedit neque. Nesciunt sequi nam a voluptas iure ea.','2017-06-28 10:35:40',190),(660,25,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',935.00,'Praesentium cum aut dolore consequatur ut assumenda sint. Voluptas qui nesciunt ipsum voluptas. Impedit perferendis quos voluptate ipsam vel placeat.','2017-06-28 10:35:40',76),(661,25,'Projection Lamps for Optical Inspection 2000 watts','projection-lamps-for-optical-inspection-2000-watts',228.00,'Sed facere alias odio magnam. Aliquid vel dolor amet quisquam. Id dolores non ad cum fugiat sed. Voluptas quasi qui dolorem quia unde.','2017-06-28 10:35:40',232),(662,28,'Mercury Xenon Short Arc Lamps 29000 watts','mercury-xenon-short-arc-lamps-29000-watts',47.00,'Vel tenetur rerum similique quaerat quia quisquam nihil soluta. Voluptatem ullam vero optio aut delectus. Non vitae sint ad voluptatum dolore deleniti id et.','2017-06-28 10:35:40',138),(663,26,'Germicidal Lamps for UV/O3 Cleaning 80 watts','germicidal-lamps-for-uv-o3-cleaning-80-watts',936.00,'Illo ex qui similique. Non laboriosam doloribus veritatis corrupti sed. Qui incidunt minima culpa pariatur magni.','2017-06-28 10:35:40',188),(664,25,'Projection Lamps for Optical Inspection 10000 watts','projection-lamps-for-optical-inspection-10000-watts',413.00,'Minus nam deleniti quae aut natus ratione. Quo temporibus nisi quis ut.','2017-06-28 10:35:40',226),(665,27,'Film/Stage Xenon Lamps 9700 watts','film-stage-xenon-lamps-9700-watts',260.00,'Officiis voluptate laboriosam consectetur aut. Eos aut ullam vel autem. Harum eos nostrum voluptatem asperiores veniam vel libero. Et recusandae occaecati aut quis fugit repellat.','2017-06-28 10:35:40',127),(666,27,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',371.00,'Exercitationem expedita rerum et suscipit qui. Debitis placeat odio facere blanditiis. Dicta repudiandae nihil dolorem mollitia.','2017-06-28 10:35:40',117),(667,26,'Germicidal Lamps for UV/O3 Cleaning 170 watts','germicidal-lamps-for-uv-o3-cleaning-170-watts',33.00,'Qui alias voluptatem nemo voluptates et. Deleniti magni cupiditate quibusdam repellendus soluta dolorem. Vel officia est pariatur ut.','2017-06-28 10:35:40',207),(668,26,'Film/Stage Xenon Lamps 1700 watts','film-stage-xenon-lamps-1700-watts',612.00,'Neque aliquam voluptatem deleniti rerum reprehenderit. Minus quia vel aliquid doloribus sed aut. Atque sequi odit quos sit autem. Cupiditate harum quidem ut qui voluptatem porro.','2017-06-28 10:35:40',211),(669,27,'CDI-190S Single-table Scan Laser Direct Imaging System ','cdi-190s-single-table-scan-laser-direct-imaging-system',504.00,'Impedit repellat optio excepturi debitis autem similique et. Praesentium rerum ut ut et in placeat molestiae. Fugiat rerum qui nam quae et libero.','2017-06-28 10:35:40',35),(670,27,'Projection Lamps for Optical Inspection 24000 watts','projection-lamps-for-optical-inspection-24000-watts',496.00,'Distinctio quos praesentium mollitia rem repellat impedit eos. Commodi et ex et et vel. Architecto perferendis eligendi rerum aut.','2017-06-28 10:35:40',66),(671,28,'Long Arc UV Lamps for Exposure 250 watts','long-arc-uv-lamps-for-exposure-250-watts',908.00,'Voluptatum ut repellendus perferendis omnis et. Eos voluptatibus eligendi voluptas. Saepe impedit et delectus occaecati sapiente qui et. Quas eveniet inventore distinctio.','2017-06-28 10:35:40',151),(672,26,'Germicidal Lamps for UV/O3 Cleaning 170 watts','germicidal-lamps-for-uv-o3-cleaning-170-watts',869.00,'Odio neque iure sequi optio. Voluptatem incidunt repellat voluptate id amet enim sit. Consequatur minus totam illo iure repellat eveniet sunt.','2017-06-28 10:35:40',186),(673,26,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',21.00,'In sed nihil rem vitae exercitationem aliquam vitae est. Modi dolores dolorum voluptatem et in quae porro qui. Molestiae harum minus nulla iste. Magnam sit nisi sint non rerum alias eum et.','2017-06-28 10:35:40',74),(674,27,'Projection Lamps for Optical Inspection 26000 watts','projection-lamps-for-optical-inspection-26000-watts',137.00,'Qui aperiam aspernatur distinctio nihil. Nam tenetur et iste sed. Enim non nam eveniet iste iure. Inventore odio ut sed rerum minima.','2017-06-28 10:35:40',298),(675,25,'Film/Stage Xenon Lamps 7700 watts','film-stage-xenon-lamps-7700-watts',428.00,'Nulla cumque exercitationem ipsam. Mollitia voluptatem cumque laborum et officia temporibus voluptatibus. Dolor rerum sunt voluptas iste.','2017-06-28 10:35:40',259),(676,27,'Long Arc UV Lamps for Curing/Coating 11500 watts','long-arc-uv-lamps-for-curing-coating-11500-watts',908.00,'Ea modi voluptatem sed sit. Possimus repudiandae itaque ut cumque. Sed cupiditate autem soluta magnam.','2017-06-28 10:35:40',211),(677,28,'Long Arc UV Lamps for Curing/Coating 3500 watts','long-arc-uv-lamps-for-curing-coating-3500-watts',205.00,'Laudantium rerum deleniti aperiam eveniet qui est. Ipsam placeat ea earum in. In quisquam similique ipsum reprehenderit quos assumenda.','2017-06-28 10:35:40',28),(678,26,'Film/Stage Xenon Lamps 2700 watts','film-stage-xenon-lamps-2700-watts',166.00,'Aperiam eos libero dignissimos eveniet eos. Ut illo voluptatem totam quas aspernatur libero et. Libero et hic laborum id aut. Nostrum ut temporibus tempore aut dicta blanditiis.','2017-06-28 10:35:40',209),(679,28,'Projection Lamps for Optical Inspection 26000 watts','projection-lamps-for-optical-inspection-26000-watts',384.00,'Animi vel quisquam dolorem quos animi. Id quia voluptatem aperiam illum vel. Amet exercitationem qui possimus distinctio. Pariatur molestias id magnam animi odio.','2017-06-28 10:35:40',181),(680,28,'Mercury Xenon Short Arc Lamps 15000 watts','mercury-xenon-short-arc-lamps-15000-watts',393.00,'Et voluptatibus assumenda cum veniam soluta. Esse iste neque nihil. Magnam temporibus quos expedita cum aspernatur. Eum dicta amet est officiis delectus nobis.','2017-06-28 10:35:40',138),(681,27,'DE HPS Lamps 1900 watts','de-hps-lamps-1900-watts',935.00,'Et quis ducimus voluptate sit cupiditate qui et. Quis consectetur recusandae voluptas vel. Accusantium tempora sed excepturi. Optio iste et quis earum quaerat.','2017-06-28 10:35:40',162),(682,26,'Germicidal Lamps for UV/O3 Cleaning 150 watts','germicidal-lamps-for-uv-o3-cleaning-150-watts',90.00,'Et rerum beatae aliquid explicabo molestias dolore. Commodi atque amet in vel facere et. Quisquam doloremque incidunt eius voluptatem atque aut et. Sit perspiciatis temporibus ad dolorem.','2017-06-28 10:35:40',137),(683,26,'Projection Lamps for Optical Inspection 12000 watts','projection-lamps-for-optical-inspection-12000-watts',250.00,'Aut porro rem aut hic. Totam facere dolore explicabo esse. Consequatur ratione sunt maxime et autem. Commodi id quaerat cupiditate dignissimos quis.','2017-06-28 10:35:40',227),(684,27,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',619.00,'Quae sed sint in odit dicta. Quo cupiditate optio quae repudiandae quis ut. Ullam sit quia dignissimos deleniti ut vel optio. Alias voluptatem omnis perspiciatis asperiores.','2017-06-28 10:35:40',215),(685,27,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',270.00,'Ut dicta earum enim velit quam accusantium officiis. Rerum distinctio exercitationem fugit saepe. Aut velit eius laboriosam aperiam neque.','2017-06-28 10:35:40',21),(686,25,'Long Arc UV Lamps for Curing/Coating 5500 watts','long-arc-uv-lamps-for-curing-coating-5500-watts',110.00,'Ut natus eaque deleniti optio et. Quidem iure et sed fugiat voluptas unde quasi. Sint quia a est magni. Eos molestiae et quis esse sint placeat ducimus.','2017-06-28 10:35:40',225),(687,25,'Projection Lamps for Optical Inspection 11000 watts','projection-lamps-for-optical-inspection-11000-watts',54.00,'Iusto aliquid a unde adipisci et mollitia quaerat. Quibusdam minus adipisci qui voluptatem aspernatur. Doloremque reprehenderit praesentium occaecati non. Quia voluptatibus omnis rerum asperiores perspiciatis sit blanditiis.','2017-06-28 10:35:40',254),(688,25,'DE HPS Lamps 1500 watts','de-hps-lamps-1500-watts',167.00,'Consequatur quidem eligendi ut porro aliquam distinctio sed. Voluptatem ex asperiores atque qui. Consequatur pariatur itaque ab deserunt labore eius aspernatur.','2017-06-28 10:35:40',190),(689,25,'Projection Lamps for Optical Inspection 27000 watts','projection-lamps-for-optical-inspection-27000-watts',580.00,'Nam nobis velit consequatur quos voluptate. Sint ipsum corrupti tempore omnis quod. Amet ex ut quaerat ducimus. Cumque earum et quas enim neque aliquam.','2017-06-28 10:35:40',4),(690,28,'Mercury Xenon Short Arc Lamps 19000 watts','mercury-xenon-short-arc-lamps-19000-watts',694.00,'Aspernatur quis ut aut dignissimos nisi. Eos quis impedit quos reiciendis libero. Et et voluptas eveniet ut excepturi quia fugit.','2017-06-28 10:35:40',181),(691,25,'Long Arc UV Lamps for Exposure 250 watts','long-arc-uv-lamps-for-exposure-250-watts',161.00,'At ad quasi nam explicabo. Voluptatem ea illum impedit rerum. Omnis rerum enim voluptate aut.','2017-06-28 10:35:40',61),(692,26,'CDI-90S Single-table Scan Laser Direct Imaging System ','cdi-90s-single-table-scan-laser-direct-imaging-system',612.00,'Molestiae error voluptatem iure eum corporis maxime distinctio. Ut aut ratione recusandae neque adipisci. Dolorem quo dolorem fugiat non minus. Nobis eveniet dicta dolor quia dolorem consequatur itaque.','2017-06-28 10:35:40',285),(693,25,'Germicidal Lamps for UV/O3 Cleaning 110 watts','germicidal-lamps-for-uv-o3-cleaning-110-watts',796.00,'Reiciendis libero ea blanditiis rerum sit. Voluptas laboriosam tempora rem nostrum. Dicta placeat dolorum laborum architecto alias iure.','2017-06-28 10:35:40',266),(694,28,'DE HPS Lamps 1700 watts','de-hps-lamps-1700-watts',626.00,'Ut corrupti facilis sit provident repellat aut. Nobis nesciunt dolores esse enim sunt nemo laborum. Id voluptatem rerum mollitia et.','2017-06-28 10:35:40',105),(695,27,'Long Arc UV Lamps for Curing/Coating 12500 watts','long-arc-uv-lamps-for-curing-coating-12500-watts',144.00,'Neque asperiores minima asperiores. In et est sint quae voluptas occaecati. Ut similique atque commodi.','2017-06-28 10:35:40',236),(696,26,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',122.00,'Molestias sed voluptatem corrupti aut. Hic facere omnis deleniti. Laboriosam dolorum voluptatem qui ut non accusamus et. Qui et enim et sit ipsa odio consequatur adipisci.','2017-06-28 10:35:40',44),(697,25,'Long Arc UV Lamps for Curing/Coating 15500 watts','long-arc-uv-lamps-for-curing-coating-15500-watts',440.00,'Itaque expedita et ullam suscipit minus. Debitis pariatur quia totam odio sed aspernatur. Voluptas veniam tempore sequi assumenda esse ut architecto. Laborum voluptate iusto optio possimus laboriosam quis rerum sapiente.','2017-06-28 10:35:40',231),(698,26,'DE HPS Lamps 1000 watts','de-hps-lamps-1000-watts',857.00,'Maiores aperiam deserunt dolore. Quo esse est qui nulla nisi. Tempora aut aut quam occaecati. Quas et voluptatum voluptates eaque et ab.','2017-06-28 10:35:40',211),(699,25,'Projection Lamps for Optical Inspection 29000 watts','projection-lamps-for-optical-inspection-29000-watts',380.00,'Nisi labore molestias sequi quas ea et corporis temporibus. Quisquam sed a ut nisi. Illo iure enim quo occaecati beatae.','2017-06-28 10:35:40',182),(700,25,'Film/Stage Xenon Lamps 2700 watts','film-stage-xenon-lamps-2700-watts',346.00,'Velit est eligendi quo sed. Rerum quos expedita voluptatem sed et laborum. Voluptas corrupti voluptatem ut ut. Porro fugit enim harum aut nihil.','2017-06-28 10:35:40',298);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user`
--

LOCK TABLES `fos_user_user` WRITE;
/*!40000 ALTER TABLE `fos_user_user` DISABLE KEYS */;
INSERT INTO `fos_user_user` VALUES (25,'tom','tom','t@t.net','t@t.net',1,NULL,'$2y$13$zvdwBP8Y7cSzT7xvgtlkSeg1cn862vhuZ1AQWa2E9dv4VPyl1XlV.',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'2017-06-28 10:35:40','2017-06-28 10:35:40',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(26,'lili','lili','l@l.net','l@l.net',1,NULL,'$2y$13$9Hq0MlJHewDvYgA/fGLhZu9kw9z/8XhT7spH2nPLQHNhUghnIBHTe',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_STAFF\";}',0,NULL,'2017-06-28 10:35:41','2017-06-28 10:35:41',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(27,'alice','alice','a@a.net','a@a.net',1,NULL,'$2y$13$NNdK2.IIJBEVSnFRwa7tHuGyukVmTDy08WVQ2S05o.ICq94Lxh7jq',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_ADMIN\";}',0,NULL,'2017-06-28 10:35:41','2017-06-28 10:35:41',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(28,'ryan','ryan','s@s.net','s@s.net',1,NULL,'$2y$13$ko1mo.DlHxaON4x4c9mmH.0bSt8B.wd2hfDheeUWxk8Q/KigTyp6y',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,'2017-06-28 10:35:41','2017-06-28 10:35:41',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL);
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
INSERT INTO `migration_versions` VALUES ('20160726222633'),('20160726225442'),('20160727022501'),('20160727233231'),('20160812040225'),('20160812040540'),('20160908003519'),('20170621154248'),('20170626160623'),('20170627171454');
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
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (601,601,'default/default_product_2.jpg','2017-06-28 10:35:40'),(602,602,'default/default_product_1.jpg','2017-06-28 10:35:40'),(603,603,'default/default_product_3.jpg','2017-06-28 10:35:40'),(604,604,'default/default_product_5.jpg','2017-06-28 10:35:40'),(605,605,'default/default_product_9.jpg','2017-06-28 10:35:40'),(606,606,'default/default_product_1.jpg','2017-06-28 10:35:40'),(607,607,'default/default_product_8.jpg','2017-06-28 10:35:40'),(608,608,'default/default_product_6.jpg','2017-06-28 10:35:40'),(609,609,'default/default_product_10.jpg','2017-06-28 10:35:40'),(610,610,'default/default_product_3.jpg','2017-06-28 10:35:40'),(611,611,'default/default_product_11.jpg','2017-06-28 10:35:40'),(612,612,'default/default_product_10.jpg','2017-06-28 10:35:40'),(613,613,'default/default_product_8.jpg','2017-06-28 10:35:40'),(614,614,'default/default_product_6.jpg','2017-06-28 10:35:40'),(615,615,'default/default_product_7.jpg','2017-06-28 10:35:40'),(616,616,'default/default_product_4.jpg','2017-06-28 10:35:40'),(617,617,'default/default_product_3.jpg','2017-06-28 10:35:40'),(618,618,'default/default_product_0.jpg','2017-06-28 10:35:40'),(619,619,'default/default_product_9.jpg','2017-06-28 10:35:40'),(620,620,'default/default_product_2.jpg','2017-06-28 10:35:40'),(621,621,'default/default_product_8.jpg','2017-06-28 10:35:40'),(622,622,'default/default_product_11.jpg','2017-06-28 10:35:40'),(623,623,'default/default_product_10.jpg','2017-06-28 10:35:40'),(624,624,'default/default_product_5.jpg','2017-06-28 10:35:40'),(625,625,'default/default_product_3.jpg','2017-06-28 10:35:40'),(626,626,'default/default_product_0.jpg','2017-06-28 10:35:40'),(627,627,'default/default_product_5.jpg','2017-06-28 10:35:40'),(628,628,'default/default_product_5.jpg','2017-06-28 10:35:40'),(629,629,'default/default_product_7.jpg','2017-06-28 10:35:40'),(630,630,'default/default_product_7.jpg','2017-06-28 10:35:40'),(631,631,'default/default_product_8.jpg','2017-06-28 10:35:40'),(632,632,'default/default_product_11.jpg','2017-06-28 10:35:40'),(633,633,'default/default_product_8.jpg','2017-06-28 10:35:40'),(634,634,'default/default_product_6.jpg','2017-06-28 10:35:40'),(635,635,'default/default_product_0.jpg','2017-06-28 10:35:40'),(636,636,'default/default_product_2.jpg','2017-06-28 10:35:40'),(637,637,'default/default_product_1.jpg','2017-06-28 10:35:40'),(638,638,'default/default_product_9.jpg','2017-06-28 10:35:40'),(639,639,'default/default_product_1.jpg','2017-06-28 10:35:40'),(640,640,'default/default_product_10.jpg','2017-06-28 10:35:40'),(641,641,'default/default_product_1.jpg','2017-06-28 10:35:40'),(642,642,'default/default_product_1.jpg','2017-06-28 10:35:40'),(643,643,'default/default_product_0.jpg','2017-06-28 10:35:40'),(644,644,'default/default_product_8.jpg','2017-06-28 10:35:40'),(645,645,'default/default_product_9.jpg','2017-06-28 10:35:40'),(646,646,'default/default_product_9.jpg','2017-06-28 10:35:40'),(647,647,'default/default_product_7.jpg','2017-06-28 10:35:40'),(648,648,'default/default_product_7.jpg','2017-06-28 10:35:40'),(649,649,'default/default_product_8.jpg','2017-06-28 10:35:40'),(650,650,'default/default_product_9.jpg','2017-06-28 10:35:40'),(651,651,'default/default_product_5.jpg','2017-06-28 10:35:40'),(652,652,'default/default_product_7.jpg','2017-06-28 10:35:40'),(653,653,'default/default_product_10.jpg','2017-06-28 10:35:40'),(654,654,'default/default_product_6.jpg','2017-06-28 10:35:40'),(655,655,'default/default_product_9.jpg','2017-06-28 10:35:40'),(656,656,'default/default_product_2.jpg','2017-06-28 10:35:40'),(657,657,'default/default_product_2.jpg','2017-06-28 10:35:40'),(658,658,'default/default_product_3.jpg','2017-06-28 10:35:40'),(659,659,'default/default_product_9.jpg','2017-06-28 10:35:40'),(660,660,'default/default_product_7.jpg','2017-06-28 10:35:40'),(661,661,'default/default_product_8.jpg','2017-06-28 10:35:40'),(662,662,'default/default_product_3.jpg','2017-06-28 10:35:40'),(663,663,'default/default_product_6.jpg','2017-06-28 10:35:40'),(664,664,'default/default_product_9.jpg','2017-06-28 10:35:40'),(665,665,'default/default_product_3.jpg','2017-06-28 10:35:40'),(666,666,'default/default_product_9.jpg','2017-06-28 10:35:40'),(667,667,'default/default_product_5.jpg','2017-06-28 10:35:40'),(668,668,'default/default_product_6.jpg','2017-06-28 10:35:40'),(669,669,'default/default_product_5.jpg','2017-06-28 10:35:40'),(670,670,'default/default_product_11.jpg','2017-06-28 10:35:40'),(671,671,'default/default_product_4.jpg','2017-06-28 10:35:40'),(672,672,'default/default_product_10.jpg','2017-06-28 10:35:40'),(673,673,'default/default_product_6.jpg','2017-06-28 10:35:40'),(674,674,'default/default_product_1.jpg','2017-06-28 10:35:40'),(675,675,'default/default_product_7.jpg','2017-06-28 10:35:40'),(676,676,'default/default_product_6.jpg','2017-06-28 10:35:40'),(677,677,'default/default_product_9.jpg','2017-06-28 10:35:40'),(678,678,'default/default_product_5.jpg','2017-06-28 10:35:40'),(679,679,'default/default_product_1.jpg','2017-06-28 10:35:40'),(680,680,'default/default_product_5.jpg','2017-06-28 10:35:40'),(681,681,'default/default_product_5.jpg','2017-06-28 10:35:40'),(682,682,'default/default_product_1.jpg','2017-06-28 10:35:40'),(683,683,'default/default_product_1.jpg','2017-06-28 10:35:40'),(684,684,'default/default_product_8.jpg','2017-06-28 10:35:40'),(685,685,'default/default_product_2.jpg','2017-06-28 10:35:40'),(686,686,'default/default_product_1.jpg','2017-06-28 10:35:40'),(687,687,'default/default_product_11.jpg','2017-06-28 10:35:40'),(688,688,'default/default_product_9.jpg','2017-06-28 10:35:40'),(689,689,'default/default_product_3.jpg','2017-06-28 10:35:40'),(690,690,'default/default_product_1.jpg','2017-06-28 10:35:40'),(691,691,'default/default_product_2.jpg','2017-06-28 10:35:40'),(692,692,'default/default_product_8.jpg','2017-06-28 10:35:40'),(693,693,'default/default_product_8.jpg','2017-06-28 10:35:40'),(694,694,'default/default_product_7.jpg','2017-06-28 10:35:40'),(695,695,'default/default_product_6.jpg','2017-06-28 10:35:40'),(696,696,'default/default_product_10.jpg','2017-06-28 10:35:40'),(697,697,'default/default_product_11.jpg','2017-06-28 10:35:40'),(698,698,'default/default_product_0.jpg','2017-06-28 10:35:40'),(699,699,'default/default_product_5.jpg','2017-06-28 10:35:40'),(700,700,'default/default_product_10.jpg','2017-06-28 10:35:40');
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
INSERT INTO `products_solutions` VALUES (601,25),(602,26),(603,27),(604,27),(605,28),(606,26),(607,26),(608,28),(609,25),(610,27),(611,26),(612,28),(613,27),(614,25),(615,28),(616,28),(617,25),(618,27),(619,27),(620,28),(621,26),(622,25),(623,26),(624,26),(625,28),(626,26),(627,26),(628,26),(629,26),(630,27),(631,26),(632,28),(633,25),(634,26),(635,27),(636,26),(637,28),(638,26),(639,25),(640,27),(641,27),(642,26),(643,26),(644,28),(645,28),(646,26),(647,25),(648,27),(649,28),(650,26),(651,26),(652,25),(653,26),(654,28),(655,26),(656,26),(657,25),(658,27),(659,27),(660,25),(661,26),(662,26),(663,26),(664,26),(665,27),(666,28),(667,26),(668,27),(669,25),(670,25),(671,26),(672,25),(673,25),(674,27),(675,28),(676,28),(677,25),(678,26),(679,25),(680,27),(681,27),(682,28),(683,27),(684,26),(685,25),(686,25),(687,25),(688,25),(689,25),(690,25),(691,28),(692,28),(693,27),(694,25),(695,27),(696,27),(697,26),(698,25),(699,25),(700,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (25,'Industrial','industrial','Ut fuga non quibusdam itaque ut quia. Quia quibusdam commodi fugiat debitis voluptatum occaecati. Quam quaerat ipsum earum vel qui itaque voluptatem. Numquam dicta accusamus non laboriosam ad eius tempore error. Et autem sint laboriosam et. Ipsum possimus consequuntur aliquam fugiat sit ratione. Aut aut necessitatibus adipisci nihil.'),(26,'Cinema','cinema','Aliquid sint aut iure voluptates fuga libero. Laudantium itaque non enim enim cumque quasi. Impedit porro ab adipisci vitae alias. Et consequatur enim excepturi quo dolor et officiis. Et consequatur earum aut consectetur cupiditate quae. Sit illo facilis accusamus ex. Et eveniet nemo voluptatibus necessitatibus.'),(27,'Agriculture','agriculture','Odit ducimus consequuntur voluptatem. Quod pariatur distinctio quis suscipit. Aut repellat qui alias et ad ab. Cupiditate vitae dolores et rem est ipsam voluptatem. Ut quibusdam voluptas dicta voluptatem. Soluta aut inventore non dolores ut in sit. Sit veniam non perspiciatis totam et blanditiis corrupti.'),(28,'Data Center','data-center','Nihil voluptas et ea repellat. Velit ex id sint quia velit nihil. Est et corrupti commodi ab. Quos perspiciatis tempora aut alias. Voluptas atque nulla necessitatibus magni consequatur nihil quis non. Veniam dolores quod perspiciatis placeat possimus veniam. Dignissimos optio ab ut dignissimos.');
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

-- Dump completed on 2017-06-28 14:36:18
