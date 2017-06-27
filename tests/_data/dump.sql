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
INSERT INTO `acl_object_identities` VALUES (1,NULL,1,'app.admin.solution',1),(2,NULL,2,'app.admin.category',1),(3,NULL,3,'app.admin.product',1),(4,NULL,4,'app.admin.product_image',1),(5,NULL,5,'sonata.user.admin.user',1),(6,NULL,6,'sonata.user.admin.group',1),(7,NULL,7,'9',1),(8,NULL,7,'10',1),(9,NULL,7,'11',1),(10,NULL,7,'12',1),(11,NULL,8,'9',1),(12,NULL,8,'10',1),(13,NULL,8,'11',1),(14,NULL,8,'12',1),(15,NULL,9,'201',1),(16,NULL,9,'202',1),(17,NULL,9,'203',1),(18,NULL,9,'204',1),(19,NULL,9,'205',1),(20,NULL,9,'206',1),(21,NULL,9,'207',1),(22,NULL,9,'208',1),(23,NULL,9,'209',1),(24,NULL,9,'210',1),(25,NULL,9,'211',1),(26,NULL,9,'212',1),(27,NULL,9,'213',1),(28,NULL,9,'214',1),(29,NULL,9,'215',1),(30,NULL,9,'216',1),(31,NULL,9,'217',1),(32,NULL,9,'218',1),(33,NULL,9,'219',1),(34,NULL,9,'220',1),(35,NULL,9,'221',1),(36,NULL,9,'222',1),(37,NULL,9,'223',1),(38,NULL,9,'224',1),(39,NULL,9,'225',1),(40,NULL,9,'226',1),(41,NULL,9,'227',1),(42,NULL,9,'228',1),(43,NULL,9,'229',1),(44,NULL,9,'230',1),(45,NULL,9,'231',1),(46,NULL,9,'232',1),(47,NULL,9,'233',1),(48,NULL,9,'234',1),(49,NULL,9,'235',1),(50,NULL,9,'236',1),(51,NULL,9,'237',1),(52,NULL,9,'238',1),(53,NULL,9,'239',1),(54,NULL,9,'240',1),(55,NULL,9,'241',1),(56,NULL,9,'242',1),(57,NULL,9,'243',1),(58,NULL,9,'244',1),(59,NULL,9,'245',1),(60,NULL,9,'246',1),(61,NULL,9,'247',1),(62,NULL,9,'248',1),(63,NULL,9,'249',1),(64,NULL,9,'250',1),(65,NULL,9,'251',1),(66,NULL,9,'252',1),(67,NULL,9,'253',1),(68,NULL,9,'254',1),(69,NULL,9,'255',1),(70,NULL,9,'256',1),(71,NULL,9,'257',1),(72,NULL,9,'258',1),(73,NULL,9,'259',1),(74,NULL,9,'260',1),(75,NULL,9,'261',1),(76,NULL,9,'262',1),(77,NULL,9,'263',1),(78,NULL,9,'264',1),(79,NULL,9,'265',1),(80,NULL,9,'266',1),(81,NULL,9,'267',1),(82,NULL,9,'268',1),(83,NULL,9,'269',1),(84,NULL,9,'270',1),(85,NULL,9,'271',1),(86,NULL,9,'272',1),(87,NULL,9,'273',1),(88,NULL,9,'274',1),(89,NULL,9,'275',1),(90,NULL,9,'276',1),(91,NULL,9,'277',1),(92,NULL,9,'278',1),(93,NULL,9,'279',1),(94,NULL,9,'280',1),(95,NULL,9,'281',1),(96,NULL,9,'282',1),(97,NULL,9,'283',1),(98,NULL,9,'284',1),(99,NULL,9,'285',1),(100,NULL,9,'286',1),(101,NULL,9,'287',1),(102,NULL,9,'288',1),(103,NULL,9,'289',1),(104,NULL,9,'290',1),(105,NULL,9,'291',1),(106,NULL,9,'292',1),(107,NULL,9,'293',1),(108,NULL,9,'294',1),(109,NULL,9,'295',1),(110,NULL,9,'296',1),(111,NULL,9,'297',1),(112,NULL,9,'298',1),(113,NULL,9,'299',1),(114,NULL,9,'300',1),(115,NULL,10,'201',1),(116,NULL,10,'202',1),(117,NULL,10,'203',1),(118,NULL,10,'204',1),(119,NULL,10,'205',1),(120,NULL,10,'206',1),(121,NULL,10,'207',1),(122,NULL,10,'208',1),(123,NULL,10,'209',1),(124,NULL,10,'210',1),(125,NULL,10,'211',1),(126,NULL,10,'212',1),(127,NULL,10,'213',1),(128,NULL,10,'214',1),(129,NULL,10,'215',1),(130,NULL,10,'216',1),(131,NULL,10,'217',1),(132,NULL,10,'218',1),(133,NULL,10,'219',1),(134,NULL,10,'220',1),(135,NULL,10,'221',1),(136,NULL,10,'222',1),(137,NULL,10,'223',1),(138,NULL,10,'224',1),(139,NULL,10,'225',1),(140,NULL,10,'226',1),(141,NULL,10,'227',1),(142,NULL,10,'228',1),(143,NULL,10,'229',1),(144,NULL,10,'230',1),(145,NULL,10,'231',1),(146,NULL,10,'232',1),(147,NULL,10,'233',1),(148,NULL,10,'234',1),(149,NULL,10,'235',1),(150,NULL,10,'236',1),(151,NULL,10,'237',1),(152,NULL,10,'238',1),(153,NULL,10,'239',1),(154,NULL,10,'240',1),(155,NULL,10,'241',1),(156,NULL,10,'242',1),(157,NULL,10,'243',1),(158,NULL,10,'244',1),(159,NULL,10,'245',1),(160,NULL,10,'246',1),(161,NULL,10,'247',1),(162,NULL,10,'248',1),(163,NULL,10,'249',1),(164,NULL,10,'250',1),(165,NULL,10,'251',1),(166,NULL,10,'252',1),(167,NULL,10,'253',1),(168,NULL,10,'254',1),(169,NULL,10,'255',1),(170,NULL,10,'256',1),(171,NULL,10,'257',1),(172,NULL,10,'258',1),(173,NULL,10,'259',1),(174,NULL,10,'260',1),(175,NULL,10,'261',1),(176,NULL,10,'262',1),(177,NULL,10,'263',1),(178,NULL,10,'264',1),(179,NULL,10,'265',1),(180,NULL,10,'266',1),(181,NULL,10,'267',1),(182,NULL,10,'268',1),(183,NULL,10,'269',1),(184,NULL,10,'270',1),(185,NULL,10,'271',1),(186,NULL,10,'272',1),(187,NULL,10,'273',1),(188,NULL,10,'274',1),(189,NULL,10,'275',1),(190,NULL,10,'276',1),(191,NULL,10,'277',1),(192,NULL,10,'278',1),(193,NULL,10,'279',1),(194,NULL,10,'280',1),(195,NULL,10,'281',1),(196,NULL,10,'282',1),(197,NULL,10,'283',1),(198,NULL,10,'284',1),(199,NULL,10,'285',1),(200,NULL,10,'286',1),(201,NULL,10,'287',1),(202,NULL,10,'288',1),(203,NULL,10,'289',1),(204,NULL,10,'290',1),(205,NULL,10,'291',1),(206,NULL,10,'292',1),(207,NULL,10,'293',1),(208,NULL,10,'294',1),(209,NULL,10,'295',1),(210,NULL,10,'296',1),(211,NULL,10,'297',1),(212,NULL,10,'298',1),(213,NULL,10,'299',1),(214,NULL,10,'300',1),(215,NULL,11,'9',1),(216,NULL,11,'10',1),(217,NULL,11,'11',1),(218,NULL,11,'12',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (9,'Industrial & Environmental','industrial-environmental'),(10,'Entertainment & Display','entertainment-display'),(11,'Agriculture & Horticultural','agriculture-horticultural'),(12,'Intelligent Light Sources','intelligent-light-sources');
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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (201,10,'Officiis eius qui eaque doloribus.','officiis-eius-qui-eaque-doloribus',467.00,'Veritatis eum molestiae voluptatibus esse occaecati consequatur voluptatem modi. Aut veritatis impedit ut est tempore. Atque quam et impedit illum consequuntur. Reprehenderit quasi et quae quod ea.','2017-06-27 17:18:21',274),(202,12,'Dolorum omnis nostrum quia ut qui modi est.','dolorum-omnis-nostrum-quia-ut-qui-modi-est',874.00,'Omnis voluptas provident beatae aperiam labore error velit. Et non possimus voluptas beatae. Eos qui soluta fugiat excepturi atque. Esse ipsum iusto corrupti libero est.','2017-06-27 17:18:21',174),(203,12,'Architecto animi ut et ut provident.','architecto-animi-ut-et-ut-provident',212.00,'Et ipsum laboriosam fugit est vitae. Fuga neque enim nostrum consequatur. Expedita suscipit et et.','2017-06-27 17:18:21',202),(204,11,'Omnis fugiat qui cumque quia.','omnis-fugiat-qui-cumque-quia',559.00,'Est dicta dolore velit impedit. Deserunt quia id voluptatem omnis magni. Impedit quasi soluta sunt harum.','2017-06-27 17:18:21',58),(205,11,'Et sapiente perspiciatis sunt numquam qui maiores.','et-sapiente-perspiciatis-sunt-numquam-qui-maiores',972.00,'Voluptatem molestiae odio saepe et ut quis. Sit et et ipsa animi facere voluptatum et et. Est quasi aspernatur voluptatem et cupiditate molestiae explicabo.','2017-06-27 17:18:21',215),(206,11,'Laboriosam aut quis nihil quo tempore cum.','laboriosam-aut-quis-nihil-quo-tempore-cum',342.00,'Sit aut quasi soluta minus. Et voluptas quasi expedita quia. Quas ut at magnam. Quidem aliquid aut ducimus velit dolorum ad. Non ex aliquid eveniet harum temporibus.','2017-06-27 17:18:21',74),(207,11,'Aperiam molestiae odit corrupti odio earum esse.','aperiam-molestiae-odit-corrupti-odio-earum-esse',86.00,'Nulla culpa est velit et. Laboriosam explicabo praesentium aliquid est dicta velit voluptatem. Cupiditate voluptate natus sint qui.','2017-06-27 17:18:21',152),(208,9,'Ex repellat quasi dolor aut et.','ex-repellat-quasi-dolor-aut-et',119.00,'Dignissimos sequi voluptatem perferendis repudiandae numquam occaecati dolor. Eum sit ut aut enim in. Omnis et consequatur aut necessitatibus ipsam. A consequatur perferendis alias sit minus at et.','2017-06-27 17:18:21',225),(209,11,'Voluptatum eum et et nihil exercitationem doloremque.','voluptatum-eum-et-et-nihil-exercitationem-doloremque',406.00,'Ipsa minus nostrum atque dolor ab. Harum repellat rerum vel sit illum et laboriosam. Totam iure eum et autem.','2017-06-27 17:18:21',44),(210,11,'Recusandae eos atque ullam.','recusandae-eos-atque-ullam',825.00,'Et suscipit fugiat ullam provident in. Laborum sapiente deserunt libero placeat rem ut voluptas. Fugiat esse quasi in aspernatur. Ipsa explicabo aut recusandae quas sit possimus molestias.','2017-06-27 17:18:21',196),(211,11,'Ut aliquam cumque nihil itaque corrupti dolorem quisquam iusto.','ut-aliquam-cumque-nihil-itaque-corrupti-dolorem-quisquam-iusto',178.00,'Architecto inventore quasi quis id. Harum laborum cumque molestiae nostrum corporis hic sit. Soluta veniam illum qui voluptatibus. Labore assumenda eveniet ad officia.','2017-06-27 17:18:21',277),(212,12,'Laborum molestiae consequatur error est.','laborum-molestiae-consequatur-error-est',327.00,'Quis magnam labore non ratione quas. Non corrupti delectus dolorum porro voluptas et. Assumenda id ut quis quis velit.','2017-06-27 17:18:21',82),(213,11,'Qui veniam eligendi enim asperiores dolore saepe.','qui-veniam-eligendi-enim-asperiores-dolore-saepe',747.00,'Earum sunt accusamus nihil odit provident est nemo. Amet voluptatem enim ipsam. Omnis id nostrum nobis.','2017-06-27 17:18:21',289),(214,10,'Aliquam sit numquam fuga reprehenderit et.','aliquam-sit-numquam-fuga-reprehenderit-et',334.00,'Beatae esse aut et consequatur similique corrupti nisi. Cupiditate quae repellendus eaque et itaque. Eveniet enim laborum autem. Et dignissimos rem ea similique enim vitae exercitationem.','2017-06-27 17:18:21',114),(215,9,'Dolorem saepe officia quis vel.','dolorem-saepe-officia-quis-vel',27.00,'Voluptatem aut aut autem accusantium voluptatem. Molestias quam consequatur maxime velit molestiae. Eos iure dolor error odit. Consectetur aut exercitationem cupiditate ullam tempore nesciunt cum.','2017-06-27 17:18:21',226),(216,10,'Nihil fugiat et et occaecati facilis quis magni.','nihil-fugiat-et-et-occaecati-facilis-quis-magni',984.00,'Laborum necessitatibus aut sed est. Eaque iusto labore vel quo eligendi mollitia. Sit iste magnam quidem nihil dignissimos. Facere aliquid doloremque corrupti quia non vel ut. Id cupiditate corrupti aut.','2017-06-27 17:18:21',227),(217,10,'Blanditiis officia doloribus id et expedita ut.','blanditiis-officia-doloribus-id-et-expedita-ut',271.00,'Est nam ipsa ut accusantium assumenda et fugit. Rem aut ipsa dolorem corrupti eligendi error consequuntur. Velit reiciendis voluptas voluptatem magni sunt consequatur sit. Ad aliquam ut omnis velit ad excepturi.','2017-06-27 17:18:21',33),(218,10,'Rerum nulla iste rerum officiis exercitationem.','rerum-nulla-iste-rerum-officiis-exercitationem',424.00,'Non maxime quos minima blanditiis et earum. Quo dolorum molestiae aspernatur ullam accusantium corrupti nihil. Est debitis soluta consequatur nihil. Rerum consequatur mollitia sint et esse aliquam in esse. Aperiam sit velit accusantium hic minima nisi.','2017-06-27 17:18:21',76),(219,12,'Qui inventore sapiente recusandae ipsam voluptas odio.','qui-inventore-sapiente-recusandae-ipsam-voluptas-odio',867.00,'Nam in id ea cumque sunt. Et et temporibus iste atque sit necessitatibus voluptates. Aspernatur saepe veritatis non id eos facere.','2017-06-27 17:18:21',40),(220,11,'Sunt exercitationem optio quo qui nulla quis autem ipsa.','sunt-exercitationem-optio-quo-qui-nulla-quis-autem-ipsa',766.00,'Consectetur quo reiciendis voluptatem et veniam in provident. Ipsam ut quibusdam recusandae ad. Architecto tempore adipisci impedit deleniti totam. Ut neque magnam qui.','2017-06-27 17:18:21',264),(221,12,'Nostrum deserunt doloremque blanditiis nisi.','nostrum-deserunt-doloremque-blanditiis-nisi',591.00,'Exercitationem repudiandae nihil quia ut aspernatur recusandae amet. Sunt tempore et accusantium sapiente voluptatum sint. Quae sapiente omnis harum maxime quae.','2017-06-27 17:18:21',90),(222,12,'Quia perferendis neque facere reiciendis vero.','quia-perferendis-neque-facere-reiciendis-vero',609.00,'Necessitatibus hic sit voluptatem temporibus magni ratione quasi. Voluptatibus quia velit et officiis. Non nisi laborum tempore ipsa autem velit et. Quos vero sint eius est. Sit minima qui saepe quos dolorum consequatur fuga.','2017-06-27 17:18:21',1),(223,12,'Nostrum earum sunt numquam ducimus facilis tempora.','nostrum-earum-sunt-numquam-ducimus-facilis-tempora',848.00,'Distinctio eum in libero omnis veritatis. Enim voluptas aut voluptatibus ut sint eos. Expedita aut voluptatem sapiente earum. Sed quis aperiam ut consequatur error dolorem neque.','2017-06-27 17:18:21',252),(224,10,'Ut omnis aspernatur consectetur rerum.','ut-omnis-aspernatur-consectetur-rerum',199.00,'Asperiores facilis est qui nihil ipsum. Esse pariatur vero quos in impedit ipsam. Magnam quam officiis similique quo ut sed earum.','2017-06-27 17:18:21',215),(225,11,'Saepe hic quam consequuntur officiis perspiciatis.','saepe-hic-quam-consequuntur-officiis-perspiciatis',747.00,'Non unde nam sit. Ipsa dolorem reprehenderit voluptates alias soluta odit sint. Voluptas sunt aut est aliquam itaque. Quam repudiandae consequatur necessitatibus.','2017-06-27 17:18:21',23),(226,11,'Voluptas sequi dolorem corrupti vero et nam ab.','voluptas-sequi-dolorem-corrupti-vero-et-nam-ab',147.00,'Doloremque vel doloribus laudantium ea ut maxime qui. Natus sed quod qui enim qui nisi. Nihil quia ad aut. Nihil sit dolore enim et ut error quas.','2017-06-27 17:18:21',207),(227,9,'Doloremque rem sint est maxime placeat.','doloremque-rem-sint-est-maxime-placeat',723.00,'Consequatur deleniti dolorem doloremque vitae numquam. Ullam ullam commodi repellat non dignissimos. Nemo nam numquam illum vel magnam reiciendis. Dicta voluptates saepe autem at odio nemo delectus. Itaque rem ut aut culpa et mollitia.','2017-06-27 17:18:21',248),(228,10,'Voluptate nesciunt incidunt laboriosam nam.','voluptate-nesciunt-incidunt-laboriosam-nam',105.00,'Aut placeat quidem voluptatem dolores quasi quae eos. Culpa autem laborum commodi. Sequi accusantium quisquam nostrum sed incidunt optio ut. Qui neque quis reiciendis in et.','2017-06-27 17:18:21',48),(229,11,'Ut aut rerum nobis in quidem dignissimos ut nesciunt.','ut-aut-rerum-nobis-in-quidem-dignissimos-ut-nesciunt',565.00,'Sunt provident accusantium eius quo impedit deserunt fugiat voluptate. Modi omnis odio natus quis. Voluptas vero dolore aut est repudiandae optio qui.','2017-06-27 17:18:21',39),(230,10,'Ipsa nulla doloribus consequatur voluptas accusamus.','ipsa-nulla-doloribus-consequatur-voluptas-accusamus',221.00,'Aut voluptatum repellat odio. Enim quisquam perferendis nobis voluptatum enim veritatis fuga. Nostrum deserunt corrupti autem voluptas maiores. Sint harum dignissimos similique minus animi quos.','2017-06-27 17:18:21',158),(231,9,'Qui hic fuga quasi exercitationem.','qui-hic-fuga-quasi-exercitationem',893.00,'Omnis aliquam quia qui voluptas inventore non eum. Ut sunt dolor sit minus eius dolorum ut. Ut aperiam voluptatibus ut esse consequatur.','2017-06-27 17:18:21',155),(232,11,'Nesciunt facere vitae eum neque est.','nesciunt-facere-vitae-eum-neque-est',863.00,'Expedita ut omnis facilis quis velit deserunt id recusandae. At asperiores illo nam cupiditate corrupti sed.','2017-06-27 17:18:21',134),(233,11,'Maiores ex molestiae veniam at aut qui omnis.','maiores-ex-molestiae-veniam-at-aut-qui-omnis',455.00,'Delectus voluptatem numquam est quis sunt sequi. Et qui nam voluptatem. Assumenda ratione nostrum minus voluptatem consequatur dolore.','2017-06-27 17:18:21',260),(234,9,'Eum sint voluptatum pariatur aliquam et aut quasi.','eum-sint-voluptatum-pariatur-aliquam-et-aut-quasi',369.00,'Dolores soluta molestiae veritatis eos laudantium iusto beatae. Eos inventore veritatis voluptatem nemo. Numquam itaque ut molestiae quis. Iste dolorem id veritatis voluptatem reiciendis quam possimus et. Voluptas molestiae ipsa in amet.','2017-06-27 17:18:21',296),(235,9,'Nihil fugiat placeat aspernatur alias.','nihil-fugiat-placeat-aspernatur-alias',722.00,'Omnis voluptatibus in et voluptatem laboriosam recusandae. Architecto ducimus cupiditate mollitia fugit quam nisi deleniti. Nisi perferendis magnam dolor consequatur corporis voluptatem corporis.','2017-06-27 17:18:21',57),(236,10,'Esse dicta sed soluta quod vel libero quasi.','esse-dicta-sed-soluta-quod-vel-libero-quasi',270.00,'Repudiandae at exercitationem suscipit autem labore at. Et saepe laudantium provident quaerat voluptatem assumenda deserunt. Quidem debitis autem aliquam explicabo placeat molestiae nobis.','2017-06-27 17:18:21',298),(237,12,'Omnis sit qui nam.','omnis-sit-qui-nam',506.00,'Ut reprehenderit vel sequi non expedita. Provident perspiciatis doloremque iure magnam perferendis. Dolorum quis quia vel ut aut ipsam.','2017-06-27 17:18:21',153),(238,12,'Et natus quod ab est.','et-natus-quod-ab-est',446.00,'Molestias adipisci amet nobis facere corrupti ducimus rerum. Placeat quae aut ea labore quis voluptatum. Error eum laudantium dolores dolorum tempora non vitae. Eum nobis aperiam dolorem.','2017-06-27 17:18:21',205),(239,9,'Ut et voluptas deleniti delectus quos nam.','ut-et-voluptas-deleniti-delectus-quos-nam',738.00,'Minima ut qui dolor est porro eligendi. Accusamus molestias harum animi neque minima. Nam unde magni illum porro assumenda.','2017-06-27 17:18:21',200),(240,11,'Quis eius sunt dicta assumenda rerum nobis vero.','quis-eius-sunt-dicta-assumenda-rerum-nobis-vero',962.00,'Modi vel cumque vel ut. Quis nam impedit ut possimus quidem ipsam. Eos veniam eaque ullam animi. Modi eaque aperiam est nobis.','2017-06-27 17:18:21',131),(241,12,'Neque nostrum eum consequatur iste debitis laboriosam.','neque-nostrum-eum-consequatur-iste-debitis-laboriosam',872.00,'Cumque voluptate beatae fugiat sed aliquid. Tempora nesciunt nostrum id quisquam delectus soluta possimus. Asperiores sunt ut repellat molestiae ut.','2017-06-27 17:18:21',182),(242,12,'Ut repellat delectus sequi natus rerum.','ut-repellat-delectus-sequi-natus-rerum',365.00,'Occaecati facere velit molestiae sapiente reprehenderit tenetur. Ut non ducimus voluptatem voluptatum. Consequuntur quasi fugiat et iste eius. Id aut sunt ut dolore consequatur.','2017-06-27 17:18:21',7),(243,12,'Aut optio quisquam enim laudantium.','aut-optio-quisquam-enim-laudantium',596.00,'Similique nemo labore fuga atque. Sequi asperiores aut unde expedita molestias eos sint eveniet. Alias est est odit tempora itaque saepe est aliquam.','2017-06-27 17:18:21',92),(244,9,'Mollitia ut hic saepe natus est excepturi.','mollitia-ut-hic-saepe-natus-est-excepturi',65.00,'Nesciunt incidunt qui quasi. Asperiores molestiae sapiente ab delectus sit consectetur. Omnis quasi commodi eum nobis id temporibus.','2017-06-27 17:18:21',219),(245,9,'Quibusdam aliquid dolores voluptatibus iste autem enim vel.','quibusdam-aliquid-dolores-voluptatibus-iste-autem-enim-vel',981.00,'Sint eveniet magni excepturi ab maiores eum veniam. Delectus voluptatem omnis laudantium voluptatem.','2017-06-27 17:18:21',238),(246,11,'Iure exercitationem veritatis laudantium veritatis.','iure-exercitationem-veritatis-laudantium-veritatis',973.00,'Voluptas ad explicabo iure similique fuga sit dolores excepturi. Quia fugiat consequatur nihil molestias. Nostrum eos ut reiciendis dolore ut nulla repellat eum.','2017-06-27 17:18:21',246),(247,9,'Qui aut minus qui ut.','qui-aut-minus-qui-ut',36.00,'Harum veritatis earum totam modi quaerat voluptate eligendi. Deleniti nulla officiis modi omnis soluta. Enim sunt inventore neque odio molestias consequuntur. Modi aut quae id aut.','2017-06-27 17:18:21',6),(248,12,'Velit itaque magnam magnam.','velit-itaque-magnam-magnam',77.00,'Eos ab deleniti saepe velit similique ullam. Excepturi blanditiis natus a qui minus. Sit et commodi debitis ut quasi. Est eos odio dolores ipsa nostrum maiores.','2017-06-27 17:18:21',221),(249,10,'Neque dolor nesciunt sequi nam a voluptas.','neque-dolor-nesciunt-sequi-nam-a-voluptas',660.00,'Est distinctio hic unde voluptas. Cum aut dolore consequatur ut assumenda sint. Voluptas qui nesciunt ipsum voluptas.','2017-06-27 17:18:21',135),(250,9,'Quos voluptate ipsam vel placeat voluptate possimus et.','quos-voluptate-ipsam-vel-placeat-voluptate-possimus-et',228.00,'Sed facere alias odio magnam. Aliquid vel dolor amet quisquam. Id dolores non ad cum fugiat sed. Voluptas quasi qui dolorem quia unde.','2017-06-27 17:18:21',232),(251,9,'Dolores omnis in impedit eum vel tenetur.','dolores-omnis-in-impedit-eum-vel-tenetur',857.00,'Nihil soluta sint voluptatem ullam vero. Aut delectus nisi non vitae sint. Voluptatum dolore deleniti id et ad illum. Debitis non porro sunt aut illo. Qui similique voluptatem non laboriosam doloribus veritatis.','2017-06-27 17:18:21',264),(252,12,'Qui incidunt minima culpa pariatur magni.','qui-incidunt-minima-culpa-pariatur-magni',488.00,'Qui doloremque libero minus nam deleniti quae. Natus ratione dolore quo temporibus nisi quis. Nesciunt sunt neque esse corporis et et nobis. Voluptate laboriosam consectetur aut quia.','2017-06-27 17:18:21',256),(253,11,'Vel autem hic harum eos nostrum voluptatem.','vel-autem-hic-harum-eos-nostrum-voluptatem',162.00,'Et recusandae occaecati aut quis fugit repellat. Quaerat totam possimus aut et. Sed exercitationem expedita rerum et. Qui quis debitis placeat odio facere blanditiis.','2017-06-27 17:18:21',68),(254,10,'Nihil dolorem mollitia sit quia minima.','nihil-dolorem-mollitia-sit-quia-minima',33.00,'Qui alias voluptatem nemo voluptates et. Deleniti magni cupiditate quibusdam repellendus soluta dolorem. Vel officia est pariatur ut.','2017-06-27 17:18:21',207),(255,11,'Eligendi qui consequuntur sunt voluptatum neque.','eligendi-qui-consequuntur-sunt-voluptatum-neque',175.00,'Ut minus quia vel aliquid. Sed aut impedit atque sequi odit quos sit. Omnis cupiditate harum quidem ut qui voluptatem porro.','2017-06-27 17:18:21',211),(256,12,'Voluptatem in at ducimus qui impedit.','voluptatem-in-at-ducimus-qui-impedit',681.00,'Similique et nisi praesentium rerum ut ut. In placeat molestiae assumenda fugiat rerum qui nam quae. Libero error voluptatibus aspernatur corrupti temporibus quam expedita. Distinctio quos praesentium mollitia rem repellat impedit eos.','2017-06-27 17:18:21',292),(257,11,'Ex et et vel similique architecto.','ex-et-et-vel-similique-architecto',915.00,'Eum aut provident impedit dolores. Minus voluptatum ut repellendus perferendis omnis et. Eos voluptatibus eligendi voluptas. Saepe impedit et delectus occaecati sapiente qui et.','2017-06-27 17:18:21',38),(258,11,'Inventore distinctio non at aut molestiae nihil.','inventore-distinctio-non-at-aut-molestiae-nihil',557.00,'Iure sequi optio eaque voluptatem incidunt repellat voluptate id. Enim sit necessitatibus consequatur minus. Illo iure repellat eveniet sunt nihil blanditiis.','2017-06-27 17:18:21',138),(259,11,'Facilis quasi quaerat in sed.','facilis-quasi-quaerat-in-sed',999.00,'Vitae est architecto modi dolores. Voluptatem et in quae porro qui doloremque molestiae. Minus nulla iste aut magnam sit. Sint non rerum alias eum et tenetur.','2017-06-27 17:18:21',269),(260,11,'Aperiam voluptas rerum reiciendis qui.','aperiam-voluptas-rerum-reiciendis-qui',987.00,'Nam tenetur et iste sed. Enim non nam eveniet iste iure. Inventore odio ut sed rerum minima.','2017-06-27 17:18:21',298),(261,12,'Repudiandae corrupti laboriosam praesentium accusantium nulla cumque.','repudiandae-corrupti-laboriosam-praesentium-accusantium-nulla-cumque',934.00,'Cumque laborum et officia temporibus voluptatibus non. Rerum sunt voluptas iste dolor. Non incidunt veritatis cupiditate.','2017-06-27 17:18:21',219),(262,11,'Modi voluptatem sed sit iusto.','modi-voluptatem-sed-sit-iusto',694.00,'Repellendus sed cupiditate autem soluta magnam quod ducimus. Qui amet numquam cupiditate vel laudantium rerum. Aperiam eveniet qui est et ipsam. Ea earum in corrupti in quisquam similique.','2017-06-27 17:18:21',131),(263,10,'Assumenda quas id qui optio sit.','assumenda-quas-id-qui-optio-sit',564.00,'Libero dignissimos eveniet eos optio ut illo voluptatem totam. Aspernatur libero et optio libero et hic. Id aut natus nostrum ut temporibus tempore aut. Blanditiis assumenda tenetur natus voluptas.','2017-06-27 17:18:21',173),(264,12,'Consequatur animi vel quisquam dolorem quos animi nulla.','consequatur-animi-vel-quisquam-dolorem-quos-animi-nulla',957.00,'Vel ea amet exercitationem qui possimus distinctio natus pariatur. Id magnam animi odio vero ab modi ut animi. Et velit et voluptatibus. Cum veniam soluta iusto.','2017-06-27 17:18:21',235),(265,9,'Nihil cum magnam temporibus quos expedita.','nihil-cum-magnam-temporibus-quos-expedita',646.00,'Amet est officiis delectus. Et quo nihil ipsa mollitia ratione nihil harum.','2017-06-27 17:18:21',23),(266,12,'Voluptate sit cupiditate qui et nisi quis.','voluptate-sit-cupiditate-qui-et-nisi-quis',495.00,'Accusantium tempora sed excepturi. Optio iste et quis earum quaerat. Eum officia unde temporibus officiis est deserunt. Rerum beatae aliquid explicabo molestias dolore officiis.','2017-06-27 17:18:21',173),(267,10,'In vel facere et amet quisquam doloremque incidunt.','in-vel-facere-et-amet-quisquam-doloremque-incidunt',654.00,'Qui sit perspiciatis temporibus ad dolorem. Hic ullam hic dolores blanditiis. Provident aut porro rem aut hic id. Facere dolore explicabo esse ratione consequatur ratione. Maxime et autem quos commodi id quaerat cupiditate dignissimos.','2017-06-27 17:18:21',244),(268,12,'Aperiam et molestias labore aliquam facilis.','aperiam-et-molestias-labore-aliquam-facilis',499.00,'Dicta reprehenderit quo cupiditate optio quae repudiandae quis ut. Ullam sit quia dignissimos deleniti ut vel optio. Alias voluptatem omnis perspiciatis asperiores.','2017-06-27 17:18:21',215),(269,9,'Sunt ut et delectus optio ut.','sunt-ut-et-delectus-optio-ut',334.00,'Accusantium officiis ut rerum distinctio. Fugit saepe et aut velit eius laboriosam. Neque aliquam sint nisi nulla aut vel.','2017-06-27 17:18:21',57),(270,9,'Natus eaque deleniti optio et est.','natus-eaque-deleniti-optio-et-est',623.00,'Voluptas unde quasi assumenda. Quia a est magni iure. Molestiae et quis esse sint placeat ducimus. Aut quia accusantium qui temporibus qui nihil.','2017-06-27 17:18:21',84),(271,11,'Unde adipisci et mollitia.','unde-adipisci-et-mollitia',917.00,'Qui voluptatem aspernatur laboriosam doloremque reprehenderit praesentium occaecati. Labore quia voluptatibus omnis rerum asperiores perspiciatis sit. Alias nisi cupiditate rerum.','2017-06-27 17:18:21',135),(272,9,'Nihil consequatur quidem eligendi ut.','nihil-consequatur-quidem-eligendi-ut',133.00,'Voluptatem ex asperiores atque qui. Consequatur pariatur itaque ab deserunt labore eius aspernatur. Voluptas minima recusandae explicabo consectetur. Illum nam nobis velit consequatur quos voluptate recusandae.','2017-06-27 17:18:21',60),(273,11,'Tempore omnis quod quas amet.','tempore-omnis-quod-quas-amet',283.00,'Cumque earum et quas enim neque aliquam. Quia ducimus non quia rerum delectus qui. Quis ut aut dignissimos nisi aut eos quis impedit. Reiciendis libero delectus et et voluptas eveniet ut excepturi.','2017-06-27 17:18:21',65),(274,9,'Assumenda animi molestias tempora ullam earum.','assumenda-animi-molestias-tempora-ullam-earum',991.00,'Explicabo quia voluptatem ea. Impedit rerum labore omnis rerum enim. Aut in velit molestiae numquam. Dolore maxime quasi molestiae error voluptatem. Eum corporis maxime distinctio velit ut aut ratione.','2017-06-27 17:18:21',283),(275,11,'Quod dolorem quo dolorem fugiat non minus.','quod-dolorem-quo-dolorem-fugiat-non-minus',938.00,'Quia dolorem consequatur itaque est labore molestiae. Officia inventore sit voluptates reiciendis libero. Blanditiis rerum sit sint voluptas laboriosam tempora rem.','2017-06-27 17:18:21',110),(276,10,'Placeat dolorum laborum architecto alias iure.','placeat-dolorum-laborum-architecto-alias-iure',566.00,'Laboriosam placeat accusantium ut corrupti facilis sit. Repellat aut eaque nobis. Dolores esse enim sunt nemo. Corporis id voluptatem rerum mollitia et quisquam voluptatem. Provident accusantium rerum error nihil.','2017-06-27 17:18:21',289),(277,12,'Asperiores voluptatem in et est sint quae voluptas.','asperiores-voluptatem-in-et-est-sint-quae-voluptas',98.00,'Commodi sit qui molestias. Reprehenderit voluptatum qui labore molestias. Voluptatem corrupti aut beatae hic facere.','2017-06-27 17:18:21',73),(278,10,'Laboriosam dolorum voluptatem qui ut non accusamus et.','laboriosam-dolorum-voluptatem-qui-ut-non-accusamus-et',333.00,'Sit ipsa odio consequatur adipisci eos. Necessitatibus rerum voluptas enim quia. Itaque expedita et ullam suscipit minus.','2017-06-27 17:18:21',90),(279,9,'Quia totam odio sed aspernatur soluta voluptas veniam.','quia-totam-odio-sed-aspernatur-soluta-voluptas-veniam',815.00,'Architecto sapiente laborum voluptate iusto. Possimus laboriosam quis rerum sapiente inventore accusantium ipsum. Omnis tempora omnis ut maiores aperiam. Dolore sint quo esse est qui nulla.','2017-06-27 17:18:21',299),(280,11,'Aut aut quam occaecati ut.','aut-aut-quam-occaecati-ut',429.00,'Et ab asperiores qui quos vero. Aperiam reiciendis consectetur nisi labore molestias. Quas ea et corporis temporibus delectus quisquam sed. Ut nisi minus illo iure.','2017-06-27 17:18:21',125),(281,11,'Beatae rerum quos occaecati sequi quia.','beatae-rerum-quos-occaecati-sequi-quia',885.00,'Eligendi quo sed tempore rerum quos. Voluptatem sed et laborum assumenda voluptas corrupti voluptatem. Ut velit porro fugit enim harum aut nihil. Unde voluptatem maxime voluptatibus accusantium ut.','2017-06-27 17:18:21',88),(282,10,'Id minus harum et itaque officiis similique.','id-minus-harum-et-itaque-officiis-similique',282.00,'Consectetur iusto et dolor. Perspiciatis perferendis id consequatur est illo. Veritatis molestiae qui id iusto molestiae quis dolore.','2017-06-27 17:18:21',157),(283,12,'Dolor sed inventore ut ut adipisci est earum.','dolor-sed-inventore-ut-ut-adipisci-est-earum',328.00,'Eos totam et aut assumenda quod. Magni quam eaque nihil officiis. Et illum dolor facilis facere.','2017-06-27 17:18:21',161),(284,10,'Facilis doloremque occaecati quod minima ex vero perspiciatis.','facilis-doloremque-occaecati-quod-minima-ex-vero-perspiciatis',936.00,'Rem inventore qui eum officiis pariatur. Inventore in aut possimus aperiam velit molestias. Quia similique laborum qui autem voluptatem omnis quos. Rem nostrum molestias ut ea.','2017-06-27 17:18:21',68),(285,10,'Eaque quam nam velit ut.','eaque-quam-nam-velit-ut',681.00,'Debitis eos in nisi quos maxime maiores qui dolore. Consequatur et ipsam et et iusto molestiae rem. Cumque fugiat in voluptas omnis quod. Maiores explicabo minus quia consequatur.','2017-06-27 17:18:21',117),(286,10,'Dolorem et et ullam reprehenderit.','dolorem-et-et-ullam-reprehenderit',50.00,'Voluptas eligendi facere dicta voluptatem sed voluptate. Error id et sed incidunt eum reprehenderit eos. Ipsam incidunt sit aut minima dolore.','2017-06-27 17:18:21',159),(287,10,'Voluptas velit praesentium qui laborum ut officiis.','voluptas-velit-praesentium-qui-laborum-ut-officiis',408.00,'Minima nulla accusamus quo sit asperiores. Veritatis rerum et ex hic. Eaque eum ut nostrum cum et dignissimos velit. Sit qui debitis minus qui.','2017-06-27 17:18:21',258),(288,12,'Exercitationem eos animi provident corporis.','exercitationem-eos-animi-provident-corporis',551.00,'Optio et et officia ipsam architecto id. Fuga incidunt aut quos debitis ut aut sequi. Esse iusto consequatur et facilis eius delectus possimus. Corrupti magnam asperiores dolores.','2017-06-27 17:18:21',227),(289,11,'Eos iste aut laudantium expedita provident enim sunt.','eos-iste-aut-laudantium-expedita-provident-enim-sunt',470.00,'Commodi sit incidunt cupiditate voluptates eum voluptatem. Reprehenderit vel libero voluptatum consequatur dolores est. Quas suscipit laboriosam modi aperiam.','2017-06-27 17:18:21',131),(290,11,'Deleniti odio deserunt temporibus.','deleniti-odio-deserunt-temporibus',860.00,'Ratione illo assumenda possimus omnis. Consequatur ea repudiandae dicta exercitationem.','2017-06-27 17:18:21',111),(291,9,'Nesciunt ipsam excepturi nesciunt neque quas.','nesciunt-ipsam-excepturi-nesciunt-neque-quas',677.00,'Modi et qui dignissimos non. Dolor et omnis enim nobis doloremque rerum. Dolores ut blanditiis debitis autem quae nam animi. Molestiae culpa officiis ut unde est unde.','2017-06-27 17:18:21',64),(292,11,'Laudantium aut eum porro esse natus enim.','laudantium-aut-eum-porro-esse-natus-enim',723.00,'Dolores praesentium et autem sit perspiciatis. Minima ut nemo officia officiis vitae maiores. Dignissimos animi est dignissimos blanditiis minus sequi voluptates est.','2017-06-27 17:18:21',82),(293,11,'Dolorum voluptas ducimus repellendus id.','dolorum-voluptas-ducimus-repellendus-id',252.00,'Voluptas cumque quia quae est rerum dolor molestias. Consequatur itaque ut quia. Fugit cum voluptatum voluptatem quis repudiandae.','2017-06-27 17:18:21',269),(294,9,'Rerum magnam eum magni libero sunt.','rerum-magnam-eum-magni-libero-sunt',938.00,'Inventore quia ipsam error fugiat. Nostrum fugit amet culpa qui quo est. Aut deleniti distinctio minus tempore. Quia voluptatem exercitationem est ducimus.','2017-06-27 17:18:21',151),(295,12,'Adipisci consequatur dolore aut laudantium aut eligendi sunt quo.','adipisci-consequatur-dolore-aut-laudantium-aut-eligendi-sunt-quo',37.00,'Aut laborum rerum aut et sed sunt magnam. Voluptas reprehenderit voluptatum libero consequatur sint non. Tenetur omnis voluptatum saepe doloremque.','2017-06-27 17:18:21',215),(296,10,'Magni corporis repudiandae aut totam molestias.','magni-corporis-repudiandae-aut-totam-molestias',838.00,'Quo enim doloribus et quam rerum. Qui quos a vel repellat fuga. Magnam quasi sit illum occaecati a.','2017-06-27 17:18:21',200),(297,10,'Ad magnam laborum dolores vel ratione.','ad-magnam-laborum-dolores-vel-ratione',397.00,'Et pariatur sed et. Molestias quis quo consectetur. Sed consectetur quos voluptas. Incidunt ut et voluptates doloremque temporibus dolorem voluptatem.','2017-06-27 17:18:21',45),(298,10,'Et odit est ea ut.','et-odit-est-ea-ut',482.00,'Sed voluptatum beatae saepe aspernatur. Quibusdam possimus aperiam fugit qui in. Alias aut velit natus rem reprehenderit.','2017-06-27 17:18:21',48),(299,11,'Amet nihil et dignissimos consequuntur eius explicabo doloremque.','amet-nihil-et-dignissimos-consequuntur-eius-explicabo-doloremque',268.00,'Eligendi perspiciatis dolorem labore quaerat esse sapiente ut. Et aut architecto totam ut. Aut saepe blanditiis sed ipsa ut reprehenderit. Veniam tempora quae odit voluptatibus.','2017-06-27 17:18:21',277),(300,12,'Pariatur dolores nam quod ab voluptatem error.','pariatur-dolores-nam-quod-ab-voluptatem-error',171.00,'Omnis a est similique error. Voluptatem voluptatem enim quis quae est fugit.','2017-06-27 17:18:21',88);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user`
--

LOCK TABLES `fos_user_user` WRITE;
/*!40000 ALTER TABLE `fos_user_user` DISABLE KEYS */;
INSERT INTO `fos_user_user` VALUES (9,'tom','tom','t@t.net','t@t.net',1,NULL,'$2y$13$j0rqCoGxNnHM4.6AvFB/durcVa6/OHKDKZyp9ShpZPPJTO/JyMuJy',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'2017-06-27 17:18:21','2017-06-27 17:18:21',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(10,'lili','lili','l@l.net','l@l.net',1,NULL,'$2y$13$M9is6RUyX2VrF/UTozqPzO5S7dWAXcM6sZOqTIoSEmbtK4PKvZb3y',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_STAFF\";}',0,NULL,'2017-06-27 17:18:21','2017-06-27 17:18:21',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(11,'alice','alice','a@a.net','a@a.net',1,NULL,'$2y$13$SepEGFwa3Y0VJ1m2OqQp4ubXLFiIKh68ExH.Y/1WgyDPJE/EdpDJ.','2017-06-27 17:20:19',0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_ADMIN\";}',0,NULL,'2017-06-27 17:18:22','2017-06-27 17:20:19',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(12,'ryan','ryan','s@s.net','s@s.net',1,NULL,'$2y$13$6iAH1O0qs/7KYb5yACesJ.SGfFc6E9UQOzw4tHRJw2GGsWUY0CanG',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,'2017-06-27 17:18:22','2017-06-27 17:18:22',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (201,201,'default/default_product_4.jpg','2017-06-27 17:18:21'),(202,202,'default/default_product_2.jpg','2017-06-27 17:18:21'),(203,203,'default/default_product_6.jpg','2017-06-27 17:18:21'),(204,204,'default/default_product_11.jpg','2017-06-27 17:18:21'),(205,205,'default/default_product_2.jpg','2017-06-27 17:18:21'),(206,206,'default/default_product_2.jpg','2017-06-27 17:18:21'),(207,207,'default/default_product_5.jpg','2017-06-27 17:18:21'),(208,208,'default/default_product_4.jpg','2017-06-27 17:18:21'),(209,209,'default/default_product_6.jpg','2017-06-27 17:18:21'),(210,210,'default/default_product_6.jpg','2017-06-27 17:18:21'),(211,211,'default/default_product_10.jpg','2017-06-27 17:18:21'),(212,212,'default/default_product_4.jpg','2017-06-27 17:18:21'),(213,213,'default/default_product_4.jpg','2017-06-27 17:18:21'),(214,214,'default/default_product_3.jpg','2017-06-27 17:18:21'),(215,215,'default/default_product_6.jpg','2017-06-27 17:18:21'),(216,216,'default/default_product_3.jpg','2017-06-27 17:18:21'),(217,217,'default/default_product_3.jpg','2017-06-27 17:18:21'),(218,218,'default/default_product_9.jpg','2017-06-27 17:18:21'),(219,219,'default/default_product_2.jpg','2017-06-27 17:18:21'),(220,220,'default/default_product_7.jpg','2017-06-27 17:18:21'),(221,221,'default/default_product_9.jpg','2017-06-27 17:18:21'),(222,222,'default/default_product_4.jpg','2017-06-27 17:18:21'),(223,223,'default/default_product_7.jpg','2017-06-27 17:18:21'),(224,224,'default/default_product_5.jpg','2017-06-27 17:18:21'),(225,225,'default/default_product_0.jpg','2017-06-27 17:18:21'),(226,226,'default/default_product_7.jpg','2017-06-27 17:18:21'),(227,227,'default/default_product_7.jpg','2017-06-27 17:18:21'),(228,228,'default/default_product_1.jpg','2017-06-27 17:18:21'),(229,229,'default/default_product_11.jpg','2017-06-27 17:18:21'),(230,230,'default/default_product_11.jpg','2017-06-27 17:18:21'),(231,231,'default/default_product_7.jpg','2017-06-27 17:18:21'),(232,232,'default/default_product_4.jpg','2017-06-27 17:18:21'),(233,233,'default/default_product_1.jpg','2017-06-27 17:18:21'),(234,234,'default/default_product_3.jpg','2017-06-27 17:18:21'),(235,235,'default/default_product_1.jpg','2017-06-27 17:18:21'),(236,236,'default/default_product_5.jpg','2017-06-27 17:18:21'),(237,237,'default/default_product_7.jpg','2017-06-27 17:18:21'),(238,238,'default/default_product_5.jpg','2017-06-27 17:18:21'),(239,239,'default/default_product_7.jpg','2017-06-27 17:18:21'),(240,240,'default/default_product_7.jpg','2017-06-27 17:18:21'),(241,241,'default/default_product_7.jpg','2017-06-27 17:18:21'),(242,242,'default/default_product_10.jpg','2017-06-27 17:18:21'),(243,243,'default/default_product_9.jpg','2017-06-27 17:18:21'),(244,244,'default/default_product_11.jpg','2017-06-27 17:18:21'),(245,245,'default/default_product_7.jpg','2017-06-27 17:18:21'),(246,246,'default/default_product_0.jpg','2017-06-27 17:18:21'),(247,247,'default/default_product_11.jpg','2017-06-27 17:18:21'),(248,248,'default/default_product_10.jpg','2017-06-27 17:18:21'),(249,249,'default/default_product_2.jpg','2017-06-27 17:18:21'),(250,250,'default/default_product_10.jpg','2017-06-27 17:18:21'),(251,251,'default/default_product_2.jpg','2017-06-27 17:18:21'),(252,252,'default/default_product_8.jpg','2017-06-27 17:18:21'),(253,253,'default/default_product_1.jpg','2017-06-27 17:18:21'),(254,254,'default/default_product_9.jpg','2017-06-27 17:18:21'),(255,255,'default/default_product_9.jpg','2017-06-27 17:18:21'),(256,256,'default/default_product_0.jpg','2017-06-27 17:18:21'),(257,257,'default/default_product_8.jpg','2017-06-27 17:18:21'),(258,258,'default/default_product_7.jpg','2017-06-27 17:18:21'),(259,259,'default/default_product_9.jpg','2017-06-27 17:18:21'),(260,260,'default/default_product_1.jpg','2017-06-27 17:18:21'),(261,261,'default/default_product_2.jpg','2017-06-27 17:18:21'),(262,262,'default/default_product_3.jpg','2017-06-27 17:18:21'),(263,263,'default/default_product_9.jpg','2017-06-27 17:18:21'),(264,264,'default/default_product_6.jpg','2017-06-27 17:18:21'),(265,265,'default/default_product_10.jpg','2017-06-27 17:18:21'),(266,266,'default/default_product_8.jpg','2017-06-27 17:18:21'),(267,267,'default/default_product_10.jpg','2017-06-27 17:18:21'),(268,268,'default/default_product_5.jpg','2017-06-27 17:18:21'),(269,269,'default/default_product_0.jpg','2017-06-27 17:18:21'),(270,270,'default/default_product_0.jpg','2017-06-27 17:18:21'),(271,271,'default/default_product_4.jpg','2017-06-27 17:18:21'),(272,272,'default/default_product_2.jpg','2017-06-27 17:18:21'),(273,273,'default/default_product_9.jpg','2017-06-27 17:18:21'),(274,274,'default/default_product_7.jpg','2017-06-27 17:18:21'),(275,275,'default/default_product_5.jpg','2017-06-27 17:18:21'),(276,276,'default/default_product_3.jpg','2017-06-27 17:18:21'),(277,277,'default/default_product_3.jpg','2017-06-27 17:18:21'),(278,278,'default/default_product_6.jpg','2017-06-27 17:18:21'),(279,279,'default/default_product_3.jpg','2017-06-27 17:18:21'),(280,280,'default/default_product_2.jpg','2017-06-27 17:18:21'),(281,281,'default/default_product_8.jpg','2017-06-27 17:18:21'),(282,282,'default/default_product_6.jpg','2017-06-27 17:18:21'),(283,283,'default/default_product_1.jpg','2017-06-27 17:18:21'),(284,284,'default/default_product_9.jpg','2017-06-27 17:18:21'),(285,285,'default/default_product_3.jpg','2017-06-27 17:18:21'),(286,286,'default/default_product_8.jpg','2017-06-27 17:18:21'),(287,287,'default/default_product_3.jpg','2017-06-27 17:18:21'),(288,288,'default/default_product_9.jpg','2017-06-27 17:18:21'),(289,289,'default/default_product_2.jpg','2017-06-27 17:18:21'),(290,290,'default/default_product_3.jpg','2017-06-27 17:18:21'),(291,291,'default/default_product_8.jpg','2017-06-27 17:18:21'),(292,292,'default/default_product_5.jpg','2017-06-27 17:18:21'),(293,293,'default/default_product_8.jpg','2017-06-27 17:18:21'),(294,294,'default/default_product_10.jpg','2017-06-27 17:18:21'),(295,295,'default/default_product_2.jpg','2017-06-27 17:18:21'),(296,296,'default/default_product_1.jpg','2017-06-27 17:18:21'),(297,297,'default/default_product_10.jpg','2017-06-27 17:18:21'),(298,298,'default/default_product_9.jpg','2017-06-27 17:18:21'),(299,299,'default/default_product_10.jpg','2017-06-27 17:18:21'),(300,300,'default/default_product_0.jpg','2017-06-27 17:18:21');
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
INSERT INTO `products_solutions` VALUES (201,11),(202,10),(203,11),(204,11),(205,12),(206,12),(207,9),(208,9),(209,11),(210,9),(211,9),(212,10),(213,11),(214,10),(215,11),(216,10),(217,9),(218,10),(219,12),(220,10),(221,10),(222,9),(223,12),(224,12),(225,11),(226,12),(227,11),(228,11),(229,11),(230,11),(231,10),(232,11),(233,11),(234,9),(235,9),(236,12),(237,9),(238,10),(239,12),(240,9),(241,12),(242,11),(243,12),(244,12),(245,12),(246,9),(247,11),(248,10),(249,10),(250,10),(251,9),(252,9),(253,11),(254,10),(255,11),(256,12),(257,9),(258,9),(259,12),(260,10),(261,12),(262,11),(263,9),(264,10),(265,10),(266,10),(267,11),(268,10),(269,11),(270,10),(271,10),(272,9),(273,9),(274,11),(275,10),(276,12),(277,12),(278,12),(279,11),(280,10),(281,9),(282,11),(283,10),(284,9),(285,12),(286,12),(287,10),(288,11),(289,12),(290,9),(291,11),(292,11),(293,10),(294,9),(295,10),(296,12),(297,12),(298,9),(299,10),(300,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (9,'Industrial','industrial','Ut fuga non quibusdam itaque ut quia. Quia quibusdam commodi fugiat debitis voluptatum occaecati. Quam quaerat ipsum earum vel qui itaque voluptatem. Numquam dicta accusamus non laboriosam ad eius tempore error. Et autem sint laboriosam et. Ipsum possimus consequuntur aliquam fugiat sit ratione. Aut aut necessitatibus adipisci nihil.'),(10,'Cinema','cinema','Aliquid sint aut iure voluptates fuga libero. Laudantium itaque non enim enim cumque quasi. Impedit porro ab adipisci vitae alias. Et consequatur enim excepturi quo dolor et officiis. Et consequatur earum aut consectetur cupiditate quae. Sit illo facilis accusamus ex. Et eveniet nemo voluptatibus necessitatibus.'),(11,'Agriculture','agriculture','Odit ducimus consequuntur voluptatem. Quod pariatur distinctio quis suscipit. Aut repellat qui alias et ad ab. Cupiditate vitae dolores et rem est ipsam voluptatem. Ut quibusdam voluptas dicta voluptatem. Soluta aut inventore non dolores ut in sit. Sit veniam non perspiciatis totam et blanditiis corrupti.'),(12,'Data Center','data-center','Nihil voluptas et ea repellat. Velit ex id sint quia velit nihil. Est et corrupti commodi ab. Quos perspiciatis tempora aut alias. Voluptas atque nulla necessitatibus magni consequatur nihil quis non. Veniam dolores quod perspiciatis placeat possimus veniam. Dignissimos optio ab ut dignissimos.');
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

-- Dump completed on 2017-06-27 17:21:44
