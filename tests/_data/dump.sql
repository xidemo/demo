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
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
INSERT INTO `acl_object_identities` VALUES (1,NULL,1,'app.admin.solution',1),(2,NULL,2,'app.admin.category',1),(3,NULL,3,'app.admin.product',1),(4,NULL,4,'app.admin.product_image',1),(5,NULL,5,'sonata.user.admin.user',1),(6,NULL,6,'sonata.user.admin.group',1),(7,NULL,7,'25',1),(8,NULL,7,'26',1),(9,NULL,7,'27',1),(10,NULL,7,'28',1),(11,NULL,8,'25',1),(12,NULL,8,'26',1),(13,NULL,8,'27',1),(14,NULL,8,'28',1),(15,NULL,9,'601',1),(16,NULL,9,'602',1),(17,NULL,9,'603',1),(18,NULL,9,'604',1),(19,NULL,9,'605',1),(20,NULL,9,'606',1),(21,NULL,9,'607',1),(22,NULL,9,'608',1),(23,NULL,9,'609',1),(24,NULL,9,'610',1),(25,NULL,9,'611',1),(26,NULL,9,'612',1),(27,NULL,9,'613',1),(28,NULL,9,'614',1),(29,NULL,9,'615',1),(30,NULL,9,'616',1),(31,NULL,9,'617',1),(32,NULL,9,'618',1),(33,NULL,9,'619',1),(34,NULL,9,'620',1),(35,NULL,9,'621',1),(36,NULL,9,'622',1),(37,NULL,9,'623',1),(38,NULL,9,'624',1),(39,NULL,9,'625',1),(40,NULL,9,'626',1),(41,NULL,9,'627',1),(42,NULL,9,'628',1),(43,NULL,9,'629',1),(44,NULL,9,'630',1),(45,NULL,9,'631',1),(46,NULL,9,'632',1),(47,NULL,9,'633',1),(48,NULL,9,'634',1),(49,NULL,9,'635',1),(50,NULL,9,'636',1),(51,NULL,9,'637',1),(52,NULL,9,'638',1),(53,NULL,9,'639',1),(54,NULL,9,'640',1),(55,NULL,9,'641',1),(56,NULL,9,'642',1),(57,NULL,9,'643',1),(58,NULL,9,'644',1),(59,NULL,9,'645',1),(60,NULL,9,'646',1),(61,NULL,9,'647',1),(62,NULL,9,'648',1),(63,NULL,9,'649',1),(64,NULL,9,'650',1),(65,NULL,9,'651',1),(66,NULL,9,'652',1),(67,NULL,9,'653',1),(68,NULL,9,'654',1),(69,NULL,9,'655',1),(70,NULL,9,'656',1),(71,NULL,9,'657',1),(72,NULL,9,'658',1),(73,NULL,9,'659',1),(74,NULL,9,'660',1),(75,NULL,9,'661',1),(76,NULL,9,'662',1),(77,NULL,9,'663',1),(78,NULL,9,'664',1),(79,NULL,9,'665',1),(80,NULL,9,'666',1),(81,NULL,9,'667',1),(82,NULL,9,'668',1),(83,NULL,9,'669',1),(84,NULL,9,'670',1),(85,NULL,9,'671',1),(86,NULL,9,'672',1),(87,NULL,9,'673',1),(88,NULL,9,'674',1),(89,NULL,9,'675',1),(90,NULL,9,'676',1),(91,NULL,9,'677',1),(92,NULL,9,'678',1),(93,NULL,9,'679',1),(94,NULL,9,'680',1),(95,NULL,9,'681',1),(96,NULL,9,'682',1),(97,NULL,9,'683',1),(98,NULL,9,'684',1),(99,NULL,9,'685',1),(100,NULL,9,'686',1),(101,NULL,9,'687',1),(102,NULL,9,'688',1),(103,NULL,9,'689',1),(104,NULL,9,'690',1),(105,NULL,9,'691',1),(106,NULL,9,'692',1),(107,NULL,9,'693',1),(108,NULL,9,'694',1),(109,NULL,9,'695',1),(110,NULL,9,'696',1),(111,NULL,9,'697',1),(112,NULL,9,'698',1),(113,NULL,9,'699',1),(114,NULL,9,'700',1),(115,NULL,10,'601',1),(116,NULL,10,'602',1),(117,NULL,10,'603',1),(118,NULL,10,'604',1),(119,NULL,10,'605',1),(120,NULL,10,'606',1),(121,NULL,10,'607',1),(122,NULL,10,'608',1),(123,NULL,10,'609',1),(124,NULL,10,'610',1),(125,NULL,10,'611',1),(126,NULL,10,'612',1),(127,NULL,10,'613',1),(128,NULL,10,'614',1),(129,NULL,10,'615',1),(130,NULL,10,'616',1),(131,NULL,10,'617',1),(132,NULL,10,'618',1),(133,NULL,10,'619',1),(134,NULL,10,'620',1),(135,NULL,10,'621',1),(136,NULL,10,'622',1),(137,NULL,10,'623',1),(138,NULL,10,'624',1),(139,NULL,10,'625',1),(140,NULL,10,'626',1),(141,NULL,10,'627',1),(142,NULL,10,'628',1),(143,NULL,10,'629',1),(144,NULL,10,'630',1),(145,NULL,10,'631',1),(146,NULL,10,'632',1),(147,NULL,10,'633',1),(148,NULL,10,'634',1),(149,NULL,10,'635',1),(150,NULL,10,'636',1),(151,NULL,10,'637',1),(152,NULL,10,'638',1),(153,NULL,10,'639',1),(154,NULL,10,'640',1),(155,NULL,10,'641',1),(156,NULL,10,'642',1),(157,NULL,10,'643',1),(158,NULL,10,'644',1),(159,NULL,10,'645',1),(160,NULL,10,'646',1),(161,NULL,10,'647',1),(162,NULL,10,'648',1),(163,NULL,10,'649',1),(164,NULL,10,'650',1),(165,NULL,10,'651',1),(166,NULL,10,'652',1),(167,NULL,10,'653',1),(168,NULL,10,'654',1),(169,NULL,10,'655',1),(170,NULL,10,'656',1),(171,NULL,10,'657',1),(172,NULL,10,'658',1),(173,NULL,10,'659',1),(174,NULL,10,'660',1),(175,NULL,10,'661',1),(176,NULL,10,'662',1),(177,NULL,10,'663',1),(178,NULL,10,'664',1),(179,NULL,10,'665',1),(180,NULL,10,'666',1),(181,NULL,10,'667',1),(182,NULL,10,'668',1),(183,NULL,10,'669',1),(184,NULL,10,'670',1),(185,NULL,10,'671',1),(186,NULL,10,'672',1),(187,NULL,10,'673',1),(188,NULL,10,'674',1),(189,NULL,10,'675',1),(190,NULL,10,'676',1),(191,NULL,10,'677',1),(192,NULL,10,'678',1),(193,NULL,10,'679',1),(194,NULL,10,'680',1),(195,NULL,10,'681',1),(196,NULL,10,'682',1),(197,NULL,10,'683',1),(198,NULL,10,'684',1),(199,NULL,10,'685',1),(200,NULL,10,'686',1),(201,NULL,10,'687',1),(202,NULL,10,'688',1),(203,NULL,10,'689',1),(204,NULL,10,'690',1),(205,NULL,10,'691',1),(206,NULL,10,'692',1),(207,NULL,10,'693',1),(208,NULL,10,'694',1),(209,NULL,10,'695',1),(210,NULL,10,'696',1),(211,NULL,10,'697',1),(212,NULL,10,'698',1),(213,NULL,10,'699',1),(214,NULL,10,'700',1),(215,NULL,11,'25',1),(216,NULL,11,'26',1),(217,NULL,11,'27',1),(218,NULL,11,'28',1),(219,NULL,7,'41',1),(220,NULL,7,'42',1),(221,NULL,7,'43',1),(222,NULL,7,'44',1),(223,NULL,8,'41',1),(224,NULL,8,'42',1),(225,NULL,8,'43',1),(226,NULL,8,'44',1),(227,NULL,9,'1001',1),(228,NULL,9,'1002',1),(229,NULL,9,'1003',1),(230,NULL,9,'1004',1),(231,NULL,9,'1005',1),(232,NULL,9,'1006',1),(233,NULL,9,'1007',1),(234,NULL,9,'1008',1),(235,NULL,9,'1009',1),(236,NULL,9,'1010',1),(237,NULL,9,'1011',1),(238,NULL,9,'1012',1),(239,NULL,9,'1013',1),(240,NULL,9,'1014',1),(241,NULL,9,'1015',1),(242,NULL,9,'1016',1),(243,NULL,9,'1017',1),(244,NULL,9,'1018',1),(245,NULL,9,'1019',1),(246,NULL,9,'1020',1),(247,NULL,9,'1021',1),(248,NULL,9,'1022',1),(249,NULL,9,'1023',1),(250,NULL,9,'1024',1),(251,NULL,9,'1025',1),(252,NULL,9,'1026',1),(253,NULL,9,'1027',1),(254,NULL,9,'1028',1),(255,NULL,9,'1029',1),(256,NULL,9,'1030',1),(257,NULL,9,'1031',1),(258,NULL,9,'1032',1),(259,NULL,9,'1033',1),(260,NULL,9,'1034',1),(261,NULL,9,'1035',1),(262,NULL,9,'1036',1),(263,NULL,9,'1037',1),(264,NULL,9,'1038',1),(265,NULL,9,'1039',1),(266,NULL,9,'1040',1),(267,NULL,9,'1041',1),(268,NULL,9,'1042',1),(269,NULL,9,'1043',1),(270,NULL,9,'1044',1),(271,NULL,9,'1045',1),(272,NULL,9,'1046',1),(273,NULL,9,'1047',1),(274,NULL,9,'1048',1),(275,NULL,9,'1049',1),(276,NULL,9,'1050',1),(277,NULL,9,'1051',1),(278,NULL,9,'1052',1),(279,NULL,9,'1053',1),(280,NULL,9,'1054',1),(281,NULL,9,'1055',1),(282,NULL,9,'1056',1),(283,NULL,9,'1057',1),(284,NULL,9,'1058',1),(285,NULL,9,'1059',1),(286,NULL,9,'1060',1),(287,NULL,9,'1061',1),(288,NULL,9,'1062',1),(289,NULL,9,'1063',1),(290,NULL,9,'1064',1),(291,NULL,9,'1065',1),(292,NULL,9,'1066',1),(293,NULL,9,'1067',1),(294,NULL,9,'1068',1),(295,NULL,9,'1069',1),(296,NULL,9,'1070',1),(297,NULL,9,'1071',1),(298,NULL,9,'1072',1),(299,NULL,9,'1073',1),(300,NULL,9,'1074',1),(301,NULL,9,'1075',1),(302,NULL,9,'1076',1),(303,NULL,9,'1077',1),(304,NULL,9,'1078',1),(305,NULL,9,'1079',1),(306,NULL,9,'1080',1),(307,NULL,9,'1081',1),(308,NULL,9,'1082',1),(309,NULL,9,'1083',1),(310,NULL,9,'1084',1),(311,NULL,9,'1085',1),(312,NULL,9,'1086',1),(313,NULL,9,'1087',1),(314,NULL,9,'1088',1),(315,NULL,9,'1089',1),(316,NULL,9,'1090',1),(317,NULL,9,'1091',1),(318,NULL,9,'1092',1),(319,NULL,9,'1093',1),(320,NULL,9,'1094',1),(321,NULL,9,'1095',1),(322,NULL,9,'1096',1),(323,NULL,9,'1097',1),(324,NULL,9,'1098',1),(325,NULL,9,'1099',1),(326,NULL,9,'1100',1),(327,NULL,10,'301',1),(328,NULL,10,'302',1),(329,NULL,10,'303',1),(330,NULL,10,'304',1),(331,NULL,10,'305',1),(332,NULL,10,'306',1),(333,NULL,10,'307',1),(334,NULL,10,'308',1),(335,NULL,10,'309',1),(336,NULL,10,'310',1),(337,NULL,10,'311',1),(338,NULL,10,'312',1),(339,NULL,10,'313',1),(340,NULL,10,'314',1),(341,NULL,10,'315',1),(342,NULL,10,'316',1),(343,NULL,10,'317',1),(344,NULL,10,'318',1),(345,NULL,10,'319',1),(346,NULL,10,'320',1),(347,NULL,10,'321',1),(348,NULL,10,'322',1),(349,NULL,10,'323',1),(350,NULL,10,'324',1),(351,NULL,10,'325',1),(352,NULL,10,'326',1),(353,NULL,10,'327',1),(354,NULL,10,'328',1),(355,NULL,10,'329',1),(356,NULL,10,'330',1),(357,NULL,10,'331',1),(358,NULL,10,'332',1),(359,NULL,10,'333',1),(360,NULL,10,'334',1),(361,NULL,10,'335',1),(362,NULL,10,'336',1),(363,NULL,10,'337',1),(364,NULL,10,'338',1),(365,NULL,10,'339',1),(366,NULL,10,'340',1),(367,NULL,10,'341',1),(368,NULL,10,'342',1),(369,NULL,10,'343',1),(370,NULL,10,'344',1),(371,NULL,10,'345',1),(372,NULL,10,'346',1),(373,NULL,10,'347',1),(374,NULL,10,'348',1),(375,NULL,10,'349',1),(376,NULL,10,'350',1),(377,NULL,10,'351',1),(378,NULL,10,'352',1),(379,NULL,10,'353',1),(380,NULL,10,'354',1),(381,NULL,10,'355',1),(382,NULL,10,'356',1),(383,NULL,10,'357',1),(384,NULL,10,'358',1),(385,NULL,10,'359',1),(386,NULL,10,'360',1),(387,NULL,10,'361',1),(388,NULL,10,'362',1),(389,NULL,10,'363',1),(390,NULL,10,'364',1),(391,NULL,10,'365',1),(392,NULL,10,'366',1),(393,NULL,10,'367',1),(394,NULL,10,'368',1),(395,NULL,10,'369',1),(396,NULL,10,'370',1),(397,NULL,10,'371',1),(398,NULL,10,'372',1),(399,NULL,10,'373',1),(400,NULL,10,'374',1),(401,NULL,10,'375',1),(402,NULL,10,'376',1),(403,NULL,10,'377',1),(404,NULL,10,'378',1),(405,NULL,10,'379',1),(406,NULL,10,'380',1),(407,NULL,10,'381',1),(408,NULL,10,'382',1),(409,NULL,10,'383',1),(410,NULL,10,'384',1),(411,NULL,10,'385',1),(412,NULL,10,'386',1),(413,NULL,10,'387',1),(414,NULL,10,'388',1),(415,NULL,10,'389',1),(416,NULL,10,'390',1),(417,NULL,10,'391',1),(418,NULL,10,'392',1),(419,NULL,10,'393',1),(420,NULL,10,'394',1),(421,NULL,10,'395',1),(422,NULL,10,'396',1),(423,NULL,10,'397',1),(424,NULL,10,'398',1),(425,NULL,10,'399',1),(426,NULL,10,'400',1),(427,NULL,11,'41',1),(428,NULL,11,'42',1),(429,NULL,11,'43',1),(430,NULL,11,'44',1);
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
INSERT INTO `acl_object_identity_ancestors` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131),(132,132),(133,133),(134,134),(135,135),(136,136),(137,137),(138,138),(139,139),(140,140),(141,141),(142,142),(143,143),(144,144),(145,145),(146,146),(147,147),(148,148),(149,149),(150,150),(151,151),(152,152),(153,153),(154,154),(155,155),(156,156),(157,157),(158,158),(159,159),(160,160),(161,161),(162,162),(163,163),(164,164),(165,165),(166,166),(167,167),(168,168),(169,169),(170,170),(171,171),(172,172),(173,173),(174,174),(175,175),(176,176),(177,177),(178,178),(179,179),(180,180),(181,181),(182,182),(183,183),(184,184),(185,185),(186,186),(187,187),(188,188),(189,189),(190,190),(191,191),(192,192),(193,193),(194,194),(195,195),(196,196),(197,197),(198,198),(199,199),(200,200),(201,201),(202,202),(203,203),(204,204),(205,205),(206,206),(207,207),(208,208),(209,209),(210,210),(211,211),(212,212),(213,213),(214,214),(215,215),(216,216),(217,217),(218,218),(219,219),(220,220),(221,221),(222,222),(223,223),(224,224),(225,225),(226,226),(227,227),(228,228),(229,229),(230,230),(231,231),(232,232),(233,233),(234,234),(235,235),(236,236),(237,237),(238,238),(239,239),(240,240),(241,241),(242,242),(243,243),(244,244),(245,245),(246,246),(247,247),(248,248),(249,249),(250,250),(251,251),(252,252),(253,253),(254,254),(255,255),(256,256),(257,257),(258,258),(259,259),(260,260),(261,261),(262,262),(263,263),(264,264),(265,265),(266,266),(267,267),(268,268),(269,269),(270,270),(271,271),(272,272),(273,273),(274,274),(275,275),(276,276),(277,277),(278,278),(279,279),(280,280),(281,281),(282,282),(283,283),(284,284),(285,285),(286,286),(287,287),(288,288),(289,289),(290,290),(291,291),(292,292),(293,293),(294,294),(295,295),(296,296),(297,297),(298,298),(299,299),(300,300),(301,301),(302,302),(303,303),(304,304),(305,305),(306,306),(307,307),(308,308),(309,309),(310,310),(311,311),(312,312),(313,313),(314,314),(315,315),(316,316),(317,317),(318,318),(319,319),(320,320),(321,321),(322,322),(323,323),(324,324),(325,325),(326,326),(327,327),(328,328),(329,329),(330,330),(331,331),(332,332),(333,333),(334,334),(335,335),(336,336),(337,337),(338,338),(339,339),(340,340),(341,341),(342,342),(343,343),(344,344),(345,345),(346,346),(347,347),(348,348),(349,349),(350,350),(351,351),(352,352),(353,353),(354,354),(355,355),(356,356),(357,357),(358,358),(359,359),(360,360),(361,361),(362,362),(363,363),(364,364),(365,365),(366,366),(367,367),(368,368),(369,369),(370,370),(371,371),(372,372),(373,373),(374,374),(375,375),(376,376),(377,377),(378,378),(379,379),(380,380),(381,381),(382,382),(383,383),(384,384),(385,385),(386,386),(387,387),(388,388),(389,389),(390,390),(391,391),(392,392),(393,393),(394,394),(395,395),(396,396),(397,397),(398,398),(399,399),(400,400),(401,401),(402,402),(403,403),(404,404),(405,405),(406,406),(407,407),(408,408),(409,409),(410,410),(411,411),(412,412),(413,413),(414,414),(415,415),(416,416),(417,417),(418,418),(419,419),(420,420),(421,421),(422,422),(423,423),(424,424),(425,425),(426,426),(427,427),(428,428),(429,429),(430,430);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (41,'Industrial & Environmental','industrial-environmental'),(42,'Entertainment & Display','entertainment-display'),(43,'Agriculture & Horticultural','agriculture-horticultural'),(44,'Intelligent Light Sources','intelligent-light-sources');
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
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (1001,44,'Projection Lamps for Optical Inspection 25000 watts','projection-lamps-for-optical-inspection-25000-watts',138.00,'Delectus earum autem ipsum ut veritatis. Molestiae voluptatibus esse occaecati consequatur voluptatem modi. Aut veritatis impedit ut est tempore.','2017-06-29 20:48:18',211),(1002,44,'Mercury Xenon Short Arc Lamps 24000 watts','mercury-xenon-short-arc-lamps-24000-watts',314.00,'Reprehenderit quasi et quae quod ea. Est voluptas dolorum omnis nostrum quia ut qui. Est ab impedit rerum velit.','2017-06-29 20:48:18',189),(1003,41,'Mercury Xenon Short Arc Lamps 17000 watts','mercury-xenon-short-arc-lamps-17000-watts',63.00,'Velit maxime et non possimus voluptas. Quaerat eos qui soluta fugiat excepturi. Qui esse ipsum iusto corrupti libero est atque accusamus.','2017-06-29 20:48:18',175),(1004,44,'Mercury Xenon Short Arc Lamps 23000 watts','mercury-xenon-short-arc-lamps-23000-watts',347.00,'Et sit corrupti voluptas et ipsum. Fugit est vitae hic fuga neque enim nostrum. Perspiciatis expedita suscipit et et ex repudiandae.','2017-06-29 20:48:18',182),(1005,42,'Long Arc UV Lamps for Curing/Coating 4500 watts','long-arc-uv-lamps-for-curing-coating-4500-watts',122.00,'Delectus saepe doloremque est dicta dolore. Impedit eum deserunt quia id. Omnis magni ullam impedit.','2017-06-29 20:48:18',227),(1006,43,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',322.00,'Sapiente perspiciatis sunt numquam qui maiores adipisci magni. Animi praesentium voluptatem molestiae odio. Et ut quis enim sit et et ipsa. Facere voluptatum et et ex est quasi aspernatur.','2017-06-29 20:48:18',187),(1007,44,'Film/Stage Xenon Lamps 9700 watts','film-stage-xenon-lamps-9700-watts',538.00,'Laboriosam aut quis nihil quo tempore cum. Quasi qui cum quos sit.','2017-06-29 20:48:18',9),(1008,44,'Film/Stage Xenon Lamps 700 watts','film-stage-xenon-lamps-700-watts',741.00,'Expedita quia veritatis quas ut at magnam est quidem. Aut ducimus velit dolorum ad fugiat non ex. Eveniet harum temporibus voluptatem et eligendi aperiam.','2017-06-29 20:48:18',153),(1009,43,'DE HPS Lamps 1700 watts','de-hps-lamps-1700-watts',673.00,'Distinctio velit quos nulla culpa est velit et. Laboriosam explicabo praesentium aliquid est dicta velit voluptatem. Cupiditate voluptate natus sint qui.','2017-06-29 20:48:18',152),(1010,41,'Projection Lamps for Optical Inspection 31000 watts','projection-lamps-for-optical-inspection-31000-watts',579.00,'Et sunt praesentium ullam minus iure. Sequi voluptatem perferendis repudiandae numquam occaecati dolor ipsum eum. Ut aut enim in aperiam omnis et. Aut necessitatibus ipsam numquam a consequatur perferendis.','2017-06-29 20:48:18',147),(1011,41,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',11.00,'Voluptatum eum et et nihil exercitationem doloremque. Vel quasi aut qui ipsa minus nostrum. Dolor ab consequuntur harum. Rerum vel sit illum et.','2017-06-29 20:48:18',230),(1012,44,'Mercury Xenon Short Arc Lamps 10000 watts','mercury-xenon-short-arc-lamps-10000-watts',400.00,'Odit dolorum recusandae eos atque ullam. Omnis consequatur et nostrum. Suscipit fugiat ullam provident. Est laborum sapiente deserunt libero placeat rem ut voluptas.','2017-06-29 20:48:18',57),(1013,41,'Mercury Xenon Short Arc Lamps 20000 watts','mercury-xenon-short-arc-lamps-20000-watts',436.00,'Explicabo aut recusandae quas sit possimus molestias. Nemo inventore ut aliquam cumque. Itaque corrupti dolorem quisquam iusto. Et vel porro et architecto inventore.','2017-06-29 20:48:18',216),(1014,41,'CDI-190S Single-table Scan Laser Direct Imaging System ','cdi-190s-single-table-scan-laser-direct-imaging-system',322.00,'Nostrum corporis hic sit sit soluta veniam illum. Voluptatibus ducimus labore assumenda eveniet ad officia. Eos blanditiis laborum molestiae consequatur error. Odio rerum rerum fugit.','2017-06-29 20:48:18',175),(1015,41,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',144.00,'Non corrupti delectus dolorum porro voluptas et. Assumenda id ut quis quis velit. Qui deserunt qui veniam eligendi enim asperiores dolore saepe. Natus voluptas quo qui earum sunt accusamus. Odit provident est nemo vel.','2017-06-29 20:48:18',37),(1016,43,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',645.00,'Nobis doloribus recusandae ut aliquam sit numquam fuga. Et et esse quia voluptatem. Beatae esse aut et consequatur similique corrupti nisi.','2017-06-29 20:48:18',6),(1017,42,'Germicidal Lamps for UV/O3 Cleaning 200 watts','germicidal-lamps-for-uv-o3-cleaning-200-watts',484.00,'Eveniet enim laborum autem. Et dignissimos rem ea similique enim vitae exercitationem. Et magnam dolorem saepe officia quis vel tenetur. Iure nihil et voluptatem aut aut autem.','2017-06-29 20:48:18',254),(1018,43,'Germicidal Lamps for UV/O3 Cleaning 50 watts','germicidal-lamps-for-uv-o3-cleaning-50-watts',217.00,'Molestiae sunt eos iure dolor. Odit occaecati consectetur aut exercitationem cupiditate ullam. Nesciunt cum non labore minima. Fugiat et et occaecati facilis quis magni ab.','2017-06-29 20:48:18',257),(1019,44,'Germicidal Lamps for UV/O3 Cleaning 120 watts','germicidal-lamps-for-uv-o3-cleaning-120-watts',388.00,'Est amet eaque iusto labore vel quo. Mollitia est sit iste magnam quidem nihil. Libero facere aliquid doloremque corrupti quia non. Ut quia id cupiditate corrupti.','2017-06-29 20:48:18',121),(1020,41,'Long Arc UV Lamps for Curing/Coating 17500 watts','long-arc-uv-lamps-for-curing-coating-17500-watts',516.00,'Et expedita ut esse tenetur. In praesentium est nam. Ut accusantium assumenda et fugit vel rem. Ipsa dolorem corrupti eligendi error consequuntur dicta.','2017-06-29 20:48:18',180),(1021,43,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',778.00,'Dolorem ad aliquam ut omnis velit ad. Dolores fugiat molestiae rerum nulla. Rerum officiis exercitationem veniam ut. Cumque maiores non maxime quos. Blanditiis et earum quia quo dolorum molestiae aspernatur ullam.','2017-06-29 20:48:18',206),(1022,44,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',950.00,'Nihil vel rerum consequatur mollitia sint et. Aliquam in esse omnis aperiam sit. Accusantium hic minima nisi est.','2017-06-29 20:48:18',123),(1023,41,'Film/Stage Xenon Lamps 4700 watts','film-stage-xenon-lamps-4700-watts',555.00,'Odio neque aut quisquam. Id nam in id ea cumque. Reprehenderit et et temporibus iste atque sit.','2017-06-29 20:48:18',30),(1024,41,'Long Arc UV Lamps for Exposure 350 watts','long-arc-uv-lamps-for-exposure-350-watts',696.00,'Eos facere quae dolor fuga sunt exercitationem. Quo qui nulla quis autem. Earum earum quia inventore illo. Quo reiciendis voluptatem et veniam.','2017-06-29 20:48:18',195),(1025,42,'DE HPS Lamps 600 watts','de-hps-lamps-600-watts',837.00,'Reiciendis architecto tempore adipisci impedit deleniti totam non. Neque magnam qui ipsum ut qui. Deserunt doloremque blanditiis nisi ex reiciendis dolores laborum quo. Repudiandae nihil quia ut aspernatur recusandae amet laborum.','2017-06-29 20:48:18',44),(1026,44,'Long Arc UV Lamps for Curing/Coating 13500 watts','long-arc-uv-lamps-for-curing-coating-13500-watts',212.00,'Quae sapiente omnis harum maxime quae. Rerum sed quia perferendis neque facere reiciendis vero. Est fugiat fugiat molestias necessitatibus. Sit voluptatem temporibus magni ratione quasi perferendis.','2017-06-29 20:48:18',18),(1027,43,'Mercury Xenon Short Arc Lamps 13000 watts','mercury-xenon-short-arc-lamps-13000-watts',262.00,'Laborum tempore ipsa autem velit. Inventore quos vero sint eius est ut sit. Qui saepe quos dolorum.','2017-06-29 20:48:18',154),(1028,43,'DE HPS Lamps 500 watts','de-hps-lamps-500-watts',185.00,'Numquam ducimus facilis tempora nemo sunt ullam voluptatem. Distinctio eum in libero omnis veritatis. Enim voluptas aut voluptatibus ut sint eos. Expedita aut voluptatem sapiente earum.','2017-06-29 20:48:18',230),(1029,43,'Mercury Xenon Short Arc Lamps 2000 watts','mercury-xenon-short-arc-lamps-2000-watts',395.00,'Neque sunt ipsam sunt ut omnis. Consectetur rerum nesciunt optio veniam ratione corporis. Facilis est qui nihil ipsum quia esse.','2017-06-29 20:48:18',85),(1030,41,'Long Arc UV Lamps for Curing/Coating 5500 watts','long-arc-uv-lamps-for-curing-coating-5500-watts',156.00,'Quam officiis similique quo ut sed earum. Est autem saepe hic quam consequuntur officiis perspiciatis placeat. Sint veritatis dignissimos non unde. Sit sit ipsa dolorem reprehenderit voluptates alias soluta odit.','2017-06-29 20:48:18',210),(1031,43,'Projection Lamps for Optical Inspection 24000 watts','projection-lamps-for-optical-inspection-24000-watts',115.00,'Dolor quam repudiandae consequatur. Adipisci ipsam temporibus voluptas sequi dolorem corrupti. Et nam ab eius qui.','2017-06-29 20:48:18',232),(1032,42,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',734.00,'Ut maxime qui magnam natus sed quod qui. Qui nisi esse nihil quia ad aut mollitia. Sit dolore enim et ut error. Facilis nostrum odit doloremque rem.','2017-06-29 20:48:18',90),(1033,43,'Film/Stage Xenon Lamps 5700 watts','film-stage-xenon-lamps-5700-watts',383.00,'Laborum consequatur deleniti dolorem doloremque vitae numquam aut ullam. Commodi repellat non dignissimos officia. Nam numquam illum vel magnam. Quo dicta voluptates saepe autem at. Nemo delectus commodi itaque rem ut aut culpa et.','2017-06-29 20:48:18',210),(1034,41,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',768.00,'Nam praesentium recusandae voluptatem itaque qui aut. Quidem voluptatem dolores quasi quae eos alias culpa. Laborum commodi qui sequi.','2017-06-29 20:48:18',110),(1035,44,'Germicidal Lamps for UV/O3 Cleaning 150 watts','germicidal-lamps-for-uv-o3-cleaning-150-watts',305.00,'Qui neque quis reiciendis in et. Dicta ad ut aut rerum nobis in quidem. Ut nesciunt ut vel nihil nulla aliquid.','2017-06-29 20:48:18',133),(1036,42,'Projection Lamps for Optical Inspection 28000 watts','projection-lamps-for-optical-inspection-28000-watts',678.00,'Voluptate officiis modi omnis odio natus quis modi. Vero dolore aut est repudiandae. Qui deleniti molestiae suscipit ipsa nulla doloribus consequatur voluptas.','2017-06-29 20:48:18',6),(1037,44,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',265.00,'Repellat odio ad enim quisquam. Nobis voluptatum enim veritatis. Numquam nostrum deserunt corrupti autem.','2017-06-29 20:48:18',168),(1038,42,'Long Arc UV Lamps for Curing/Coating 12500 watts','long-arc-uv-lamps-for-curing-coating-12500-watts',587.00,'Animi quos fugit animi asperiores qui hic fuga quasi. Atque sed totam eos molestias omnis aliquam quia qui. Inventore non eum nihil ut sunt dolor sit.','2017-06-29 20:48:18',295),(1039,41,'CDI-110S Single-table Scan Laser Direct Imaging System ','cdi-110s-single-table-scan-laser-direct-imaging-system',758.00,'Ut esse consequatur est omnis. Nesciunt facere vitae eum neque est. Similique tempore quidem dignissimos expedita ut omnis.','2017-06-29 20:48:18',183),(1040,42,'Projection Lamps for Optical Inspection 35000 watts','projection-lamps-for-optical-inspection-35000-watts',943.00,'Asperiores illo nam cupiditate corrupti sed. Perspiciatis dolores maiores ex molestiae. At aut qui omnis architecto occaecati saepe. Ut delectus voluptatem numquam est quis.','2017-06-29 20:48:18',214),(1041,42,'Long Arc UV Lamps for Curing/Coating 13500 watts','long-arc-uv-lamps-for-curing-coating-13500-watts',701.00,'Assumenda ratione nostrum minus voluptatem consequatur dolore. Ipsa doloremque eum sint voluptatum pariatur aliquam et. Quasi est qui magnam omnis.','2017-06-29 20:48:18',191),(1042,41,'Projection Lamps for Optical Inspection 9000 watts','projection-lamps-for-optical-inspection-9000-watts',951.00,'Beatae dolorum eos inventore veritatis voluptatem. Quia numquam itaque ut molestiae quis qui.','2017-06-29 20:48:18',230),(1043,44,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',684.00,'Et rerum voluptas molestiae ipsa. Amet ut aut qui nihil fugiat placeat. Alias voluptatum ipsum numquam similique. Omnis voluptatibus in et voluptatem laboriosam recusandae. Architecto ducimus cupiditate mollitia fugit quam nisi deleniti.','2017-06-29 20:48:18',298),(1044,42,'Mercury Xenon Short Arc Lamps 34000 watts','mercury-xenon-short-arc-lamps-34000-watts',163.00,'Corporis laboriosam et quae esse. Sed soluta quod vel libero quasi molestiae quia quis. Eum repudiandae at exercitationem suscipit autem. At facilis et saepe laudantium provident quaerat voluptatem assumenda.','2017-06-29 20:48:18',269),(1045,44,'DE HPS Lamps 1600 watts','de-hps-lamps-1600-watts',433.00,'Molestiae nobis quas illum odio. Sit qui nam non et et. Laboriosam ut reprehenderit vel sequi. Expedita sit provident perspiciatis doloremque iure magnam perferendis veritatis.','2017-06-29 20:48:18',296),(1046,43,'DE HPS Lamps 700 watts','de-hps-lamps-700-watts',938.00,'Neque est et natus quod. Est ut dignissimos aut dolores dignissimos molestias. Amet nobis facere corrupti ducimus rerum consequatur placeat. Aut ea labore quis voluptatum dolorem.','2017-06-29 20:48:18',197),(1047,44,'Mercury Xenon Short Arc Lamps 26000 watts','mercury-xenon-short-arc-lamps-26000-watts',520.00,'Animi eum nobis aperiam dolorem rerum explicabo deserunt. Et voluptas deleniti delectus quos nam vero. Alias sunt cupiditate minima ut qui.','2017-06-29 20:48:18',45),(1048,43,'Long Arc UV Lamps for Curing/Coating 2500 watts','long-arc-uv-lamps-for-curing-coating-2500-watts',894.00,'Animi neque minima fugiat nam unde magni illum. Assumenda reprehenderit sint aut quis.','2017-06-29 20:48:18',261),(1049,41,'Projection Lamps for Optical Inspection 32000 watts','projection-lamps-for-optical-inspection-32000-watts',386.00,'Omnis consequatur eligendi consequuntur modi vel cumque. Ut quaerat quis nam impedit. Possimus quidem ipsam repudiandae eos veniam.','2017-06-29 20:48:18',266),(1050,41,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',634.00,'Nobis impedit quos et neque nostrum eum. Iste debitis laboriosam eaque maiores. Odio est cumque voluptate beatae fugiat.','2017-06-29 20:48:18',266),(1051,44,'DE HPS Lamps 1000 watts','de-hps-lamps-1000-watts',119.00,'Delectus soluta possimus distinctio asperiores sunt ut repellat. Ut ut excepturi eum ut repellat delectus sequi. Rerum neque in dolorem itaque. Occaecati facere velit molestiae sapiente reprehenderit tenetur.','2017-06-29 20:48:18',251),(1052,43,'Mercury Xenon Short Arc Lamps 18000 watts','mercury-xenon-short-arc-lamps-18000-watts',555.00,'Quasi fugiat et iste eius vitae id. Sunt ut dolore consequatur aliquid. Molestiae aut optio quisquam enim.','2017-06-29 20:48:18',261),(1053,42,'Projection Lamps for Optical Inspection 28000 watts','projection-lamps-for-optical-inspection-28000-watts',913.00,'Labore fuga atque id sequi asperiores aut unde. Molestias eos sint eveniet tempore alias est est odit.','2017-06-29 20:48:18',145),(1054,43,'DE HPS Lamps 1100 watts','de-hps-lamps-1100-watts',351.00,'Mollitia ut hic saepe natus est excepturi. Quam odit ut consequatur nesciunt incidunt qui. Deleniti asperiores molestiae sapiente ab delectus sit consectetur rerum. Quasi commodi eum nobis id temporibus nulla tenetur.','2017-06-29 20:48:18',39),(1055,44,'Long Arc UV Lamps for Curing/Coating 16500 watts','long-arc-uv-lamps-for-curing-coating-16500-watts',882.00,'Vel minus eaque quia accusantium consequatur sint. Magni excepturi ab maiores eum. Quia delectus voluptatem omnis laudantium. Molestiae rerum et iure exercitationem veritatis.','2017-06-29 20:48:18',263),(1056,41,'Projection Lamps for Optical Inspection 1000 watts','projection-lamps-for-optical-inspection-1000-watts',737.00,'Ad explicabo iure similique. Sit dolores excepturi ratione quia fugiat. Nihil molestias corrupti nostrum eos ut reiciendis. Ut nulla repellat eum ipsa eaque quasi qui. Minus qui ut quos maiores maxime.','2017-06-29 20:48:18',192),(1057,44,'Projection Lamps for Optical Inspection 27000 watts','projection-lamps-for-optical-inspection-27000-watts',419.00,'Voluptate eligendi ut deleniti nulla officiis. Omnis soluta sed enim sunt inventore neque odio. Consequuntur cumque modi aut quae id aut optio.','2017-06-29 20:48:18',13),(1058,41,'Long Arc UV Lamps for Curing/Coating 7500 watts','long-arc-uv-lamps-for-curing-coating-7500-watts',166.00,'Voluptatem nihil culpa eos ab deleniti. Velit similique ullam magni excepturi.','2017-06-29 20:48:18',176),(1059,42,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',143.00,'Commodi debitis ut quasi occaecati est eos. Dolores ipsa nostrum maiores molestiae ut impedit neque. Nesciunt sequi nam a voluptas iure ea.','2017-06-29 20:48:18',190),(1060,41,'CDI-70S Single-table Scan Laser Direct Imaging System ','cdi-70s-single-table-scan-laser-direct-imaging-system',935.00,'Praesentium cum aut dolore consequatur ut assumenda sint. Voluptas qui nesciunt ipsum voluptas. Impedit perferendis quos voluptate ipsam vel placeat.','2017-06-29 20:48:18',76),(1061,41,'Projection Lamps for Optical Inspection 2000 watts','projection-lamps-for-optical-inspection-2000-watts',228.00,'Sed facere alias odio magnam. Aliquid vel dolor amet quisquam. Id dolores non ad cum fugiat sed. Voluptas quasi qui dolorem quia unde.','2017-06-29 20:48:18',232),(1062,44,'Mercury Xenon Short Arc Lamps 29000 watts','mercury-xenon-short-arc-lamps-29000-watts',47.00,'Vel tenetur rerum similique quaerat quia quisquam nihil soluta. Voluptatem ullam vero optio aut delectus. Non vitae sint ad voluptatum dolore deleniti id et.','2017-06-29 20:48:18',138),(1063,42,'Germicidal Lamps for UV/O3 Cleaning 80 watts','germicidal-lamps-for-uv-o3-cleaning-80-watts',936.00,'Illo ex qui similique. Non laboriosam doloribus veritatis corrupti sed. Qui incidunt minima culpa pariatur magni.','2017-06-29 20:48:18',188),(1064,41,'Projection Lamps for Optical Inspection 10000 watts','projection-lamps-for-optical-inspection-10000-watts',413.00,'Minus nam deleniti quae aut natus ratione. Quo temporibus nisi quis ut.','2017-06-29 20:48:18',226),(1065,43,'Film/Stage Xenon Lamps 9700 watts','film-stage-xenon-lamps-9700-watts',260.00,'Officiis voluptate laboriosam consectetur aut. Eos aut ullam vel autem. Harum eos nostrum voluptatem asperiores veniam vel libero. Et recusandae occaecati aut quis fugit repellat.','2017-06-29 20:48:18',127),(1066,43,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',371.00,'Exercitationem expedita rerum et suscipit qui. Debitis placeat odio facere blanditiis. Dicta repudiandae nihil dolorem mollitia.','2017-06-29 20:48:18',117),(1067,42,'Germicidal Lamps for UV/O3 Cleaning 170 watts','germicidal-lamps-for-uv-o3-cleaning-170-watts',33.00,'Qui alias voluptatem nemo voluptates et. Deleniti magni cupiditate quibusdam repellendus soluta dolorem. Vel officia est pariatur ut.','2017-06-29 20:48:18',207),(1068,42,'Film/Stage Xenon Lamps 1700 watts','film-stage-xenon-lamps-1700-watts',612.00,'Neque aliquam voluptatem deleniti rerum reprehenderit. Minus quia vel aliquid doloribus sed aut. Atque sequi odit quos sit autem. Cupiditate harum quidem ut qui voluptatem porro.','2017-06-29 20:48:18',211),(1069,43,'CDI-190S Single-table Scan Laser Direct Imaging System ','cdi-190s-single-table-scan-laser-direct-imaging-system',504.00,'Impedit repellat optio excepturi debitis autem similique et. Praesentium rerum ut ut et in placeat molestiae. Fugiat rerum qui nam quae et libero.','2017-06-29 20:48:18',35),(1070,43,'Projection Lamps for Optical Inspection 24000 watts','projection-lamps-for-optical-inspection-24000-watts',496.00,'Distinctio quos praesentium mollitia rem repellat impedit eos. Commodi et ex et et vel. Architecto perferendis eligendi rerum aut.','2017-06-29 20:48:18',66),(1071,44,'Long Arc UV Lamps for Exposure 250 watts','long-arc-uv-lamps-for-exposure-250-watts',908.00,'Voluptatum ut repellendus perferendis omnis et. Eos voluptatibus eligendi voluptas. Saepe impedit et delectus occaecati sapiente qui et. Quas eveniet inventore distinctio.','2017-06-29 20:48:18',151),(1072,42,'Germicidal Lamps for UV/O3 Cleaning 170 watts','germicidal-lamps-for-uv-o3-cleaning-170-watts',869.00,'Odio neque iure sequi optio. Voluptatem incidunt repellat voluptate id amet enim sit. Consequatur minus totam illo iure repellat eveniet sunt.','2017-06-29 20:48:18',186),(1073,42,'Long Arc UV Lamps for Curing/Coating 14500 watts','long-arc-uv-lamps-for-curing-coating-14500-watts',21.00,'In sed nihil rem vitae exercitationem aliquam vitae est. Modi dolores dolorum voluptatem et in quae porro qui. Molestiae harum minus nulla iste. Magnam sit nisi sint non rerum alias eum et.','2017-06-29 20:48:18',74),(1074,43,'Projection Lamps for Optical Inspection 26000 watts','projection-lamps-for-optical-inspection-26000-watts',137.00,'Qui aperiam aspernatur distinctio nihil. Nam tenetur et iste sed. Enim non nam eveniet iste iure. Inventore odio ut sed rerum minima.','2017-06-29 20:48:18',298),(1075,41,'Film/Stage Xenon Lamps 7700 watts','film-stage-xenon-lamps-7700-watts',428.00,'Nulla cumque exercitationem ipsam. Mollitia voluptatem cumque laborum et officia temporibus voluptatibus. Dolor rerum sunt voluptas iste.','2017-06-29 20:48:18',259),(1076,43,'Long Arc UV Lamps for Curing/Coating 11500 watts','long-arc-uv-lamps-for-curing-coating-11500-watts',908.00,'Ea modi voluptatem sed sit. Possimus repudiandae itaque ut cumque. Sed cupiditate autem soluta magnam.','2017-06-29 20:48:18',211),(1077,44,'Long Arc UV Lamps for Curing/Coating 3500 watts','long-arc-uv-lamps-for-curing-coating-3500-watts',205.00,'Laudantium rerum deleniti aperiam eveniet qui est. Ipsam placeat ea earum in. In quisquam similique ipsum reprehenderit quos assumenda.','2017-06-29 20:48:18',28),(1078,42,'Film/Stage Xenon Lamps 2700 watts','film-stage-xenon-lamps-2700-watts',166.00,'Aperiam eos libero dignissimos eveniet eos. Ut illo voluptatem totam quas aspernatur libero et. Libero et hic laborum id aut. Nostrum ut temporibus tempore aut dicta blanditiis.','2017-06-29 20:48:18',209),(1079,44,'Projection Lamps for Optical Inspection 26000 watts','projection-lamps-for-optical-inspection-26000-watts',384.00,'Animi vel quisquam dolorem quos animi. Id quia voluptatem aperiam illum vel. Amet exercitationem qui possimus distinctio. Pariatur molestias id magnam animi odio.','2017-06-29 20:48:18',181),(1080,44,'Mercury Xenon Short Arc Lamps 15000 watts','mercury-xenon-short-arc-lamps-15000-watts',393.00,'Et voluptatibus assumenda cum veniam soluta. Esse iste neque nihil. Magnam temporibus quos expedita cum aspernatur. Eum dicta amet est officiis delectus nobis.','2017-06-29 20:48:18',138),(1081,43,'DE HPS Lamps 1900 watts','de-hps-lamps-1900-watts',935.00,'Et quis ducimus voluptate sit cupiditate qui et. Quis consectetur recusandae voluptas vel. Accusantium tempora sed excepturi. Optio iste et quis earum quaerat.','2017-06-29 20:48:18',162),(1082,42,'Germicidal Lamps for UV/O3 Cleaning 150 watts','germicidal-lamps-for-uv-o3-cleaning-150-watts',90.00,'Et rerum beatae aliquid explicabo molestias dolore. Commodi atque amet in vel facere et. Quisquam doloremque incidunt eius voluptatem atque aut et. Sit perspiciatis temporibus ad dolorem.','2017-06-29 20:48:18',137),(1083,42,'Projection Lamps for Optical Inspection 12000 watts','projection-lamps-for-optical-inspection-12000-watts',250.00,'Aut porro rem aut hic. Totam facere dolore explicabo esse. Consequatur ratione sunt maxime et autem. Commodi id quaerat cupiditate dignissimos quis.','2017-06-29 20:48:18',227),(1084,43,'Mercury Xenon Short Arc Lamps 5000 watts','mercury-xenon-short-arc-lamps-5000-watts',619.00,'Quae sed sint in odit dicta. Quo cupiditate optio quae repudiandae quis ut. Ullam sit quia dignissimos deleniti ut vel optio. Alias voluptatem omnis perspiciatis asperiores.','2017-06-29 20:48:18',215),(1085,43,'Long Arc UV Lamps for Exposure 270 watts','long-arc-uv-lamps-for-exposure-270-watts',270.00,'Ut dicta earum enim velit quam accusantium officiis. Rerum distinctio exercitationem fugit saepe. Aut velit eius laboriosam aperiam neque.','2017-06-29 20:48:18',21),(1086,41,'Long Arc UV Lamps for Curing/Coating 5500 watts','long-arc-uv-lamps-for-curing-coating-5500-watts',110.00,'Ut natus eaque deleniti optio et. Quidem iure et sed fugiat voluptas unde quasi. Sint quia a est magni. Eos molestiae et quis esse sint placeat ducimus.','2017-06-29 20:48:18',225),(1087,41,'Projection Lamps for Optical Inspection 11000 watts','projection-lamps-for-optical-inspection-11000-watts',54.00,'Iusto aliquid a unde adipisci et mollitia quaerat. Quibusdam minus adipisci qui voluptatem aspernatur. Doloremque reprehenderit praesentium occaecati non. Quia voluptatibus omnis rerum asperiores perspiciatis sit blanditiis.','2017-06-29 20:48:18',254),(1088,41,'DE HPS Lamps 1500 watts','de-hps-lamps-1500-watts',167.00,'Consequatur quidem eligendi ut porro aliquam distinctio sed. Voluptatem ex asperiores atque qui. Consequatur pariatur itaque ab deserunt labore eius aspernatur.','2017-06-29 20:48:18',190),(1089,41,'Projection Lamps for Optical Inspection 27000 watts','projection-lamps-for-optical-inspection-27000-watts',580.00,'Nam nobis velit consequatur quos voluptate. Sint ipsum corrupti tempore omnis quod. Amet ex ut quaerat ducimus. Cumque earum et quas enim neque aliquam.','2017-06-29 20:48:18',4),(1090,44,'Mercury Xenon Short Arc Lamps 19000 watts','mercury-xenon-short-arc-lamps-19000-watts',694.00,'Aspernatur quis ut aut dignissimos nisi. Eos quis impedit quos reiciendis libero. Et et voluptas eveniet ut excepturi quia fugit.','2017-06-29 20:48:18',181),(1091,41,'Long Arc UV Lamps for Exposure 250 watts','long-arc-uv-lamps-for-exposure-250-watts',161.00,'At ad quasi nam explicabo. Voluptatem ea illum impedit rerum. Omnis rerum enim voluptate aut.','2017-06-29 20:48:18',61),(1092,42,'CDI-90S Single-table Scan Laser Direct Imaging System ','cdi-90s-single-table-scan-laser-direct-imaging-system',612.00,'Molestiae error voluptatem iure eum corporis maxime distinctio. Ut aut ratione recusandae neque adipisci. Dolorem quo dolorem fugiat non minus. Nobis eveniet dicta dolor quia dolorem consequatur itaque.','2017-06-29 20:48:18',285),(1093,41,'Germicidal Lamps for UV/O3 Cleaning 110 watts','germicidal-lamps-for-uv-o3-cleaning-110-watts',796.00,'Reiciendis libero ea blanditiis rerum sit. Voluptas laboriosam tempora rem nostrum. Dicta placeat dolorum laborum architecto alias iure.','2017-06-29 20:48:18',266),(1094,44,'DE HPS Lamps 1700 watts','de-hps-lamps-1700-watts',626.00,'Ut corrupti facilis sit provident repellat aut. Nobis nesciunt dolores esse enim sunt nemo laborum. Id voluptatem rerum mollitia et.','2017-06-29 20:48:18',105),(1095,43,'Long Arc UV Lamps for Curing/Coating 12500 watts','long-arc-uv-lamps-for-curing-coating-12500-watts',144.00,'Neque asperiores minima asperiores. In et est sint quae voluptas occaecati. Ut similique atque commodi.','2017-06-29 20:48:18',236),(1096,42,'Film/Stage Xenon Lamps 3700 watts','film-stage-xenon-lamps-3700-watts',122.00,'Molestias sed voluptatem corrupti aut. Hic facere omnis deleniti. Laboriosam dolorum voluptatem qui ut non accusamus et. Qui et enim et sit ipsa odio consequatur adipisci.','2017-06-29 20:48:18',44),(1097,41,'Long Arc UV Lamps for Curing/Coating 15500 watts','long-arc-uv-lamps-for-curing-coating-15500-watts',440.00,'Itaque expedita et ullam suscipit minus. Debitis pariatur quia totam odio sed aspernatur. Voluptas veniam tempore sequi assumenda esse ut architecto. Laborum voluptate iusto optio possimus laboriosam quis rerum sapiente.','2017-06-29 20:48:18',231),(1098,42,'DE HPS Lamps 1000 watts','de-hps-lamps-1000-watts',857.00,'Maiores aperiam deserunt dolore. Quo esse est qui nulla nisi. Tempora aut aut quam occaecati. Quas et voluptatum voluptates eaque et ab.','2017-06-29 20:48:18',211),(1099,41,'Projection Lamps for Optical Inspection 29000 watts','projection-lamps-for-optical-inspection-29000-watts',380.00,'Nisi labore molestias sequi quas ea et corporis temporibus. Quisquam sed a ut nisi. Illo iure enim quo occaecati beatae.','2017-06-29 20:48:18',182),(1100,41,'Film/Stage Xenon Lamps 2700 watts','film-stage-xenon-lamps-2700-watts',346.00,'Velit est eligendi quo sed. Rerum quos expedita voluptatem sed et laborum. Voluptas corrupti voluptatem ut ut. Porro fugit enim harum aut nihil.','2017-06-29 20:48:18',298);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user`
--

LOCK TABLES `fos_user_user` WRITE;
/*!40000 ALTER TABLE `fos_user_user` DISABLE KEYS */;
INSERT INTO `fos_user_user` VALUES (41,'tom','tom','t@t.net','t@t.net',1,NULL,'$2y$13$nngXokKSECS9VYM7qG6uuuNQsdaKLcJ73k5LRafMbqeJ7rI9p9Cmq',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'2017-06-29 20:48:18','2017-06-29 20:48:18',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(42,'lili','lili','l@l.net','l@l.net',1,NULL,'$2y$13$7Yw5StGVyxIsmsBWcJmgbOsYsIYNJ1wH/d9u0xd60p1O..h5M3CYa',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_STAFF\";}',0,NULL,'2017-06-29 20:48:18','2017-06-29 20:48:18',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(43,'alice','alice','a@a.net','a@a.net',1,NULL,'$2y$13$vleKBXOcJjviMYkDUnyJUOB6dTGpnr3CBDdyVyyuNMUYGU9sFu1d.',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:18:\"ROLE_CONTENT_ADMIN\";}',0,NULL,'2017-06-29 20:48:19','2017-06-29 20:48:19',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL),(44,'ryan','ryan','s@s.net','s@s.net',1,NULL,'$2y$13$RaAQXE4q7.k5U7iI5jqrIO9BqEBiEZPmhfIr4yDZRW8EFhYspUSYS',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,'2017-06-29 20:48:19','2017-06-29 20:48:19',NULL,NULL,NULL,NULL,NULL,'u',NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,'null',NULL,NULL,'null',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (301,1001,'default/default_product_2.jpg','2017-06-29 20:48:18'),(302,1002,'default/default_product_1.jpg','2017-06-29 20:48:18'),(303,1003,'default/default_product_3.jpg','2017-06-29 20:48:18'),(304,1004,'default/default_product_5.jpg','2017-06-29 20:48:18'),(305,1005,'default/default_product_9.jpg','2017-06-29 20:48:18'),(306,1006,'default/default_product_1.jpg','2017-06-29 20:48:18'),(307,1007,'default/default_product_8.jpg','2017-06-29 20:48:18'),(308,1008,'default/default_product_6.jpg','2017-06-29 20:48:18'),(309,1009,'default/default_product_10.jpg','2017-06-29 20:48:18'),(310,1010,'default/default_product_3.jpg','2017-06-29 20:48:18'),(311,1011,'default/default_product_11.jpg','2017-06-29 20:48:18'),(312,1012,'default/default_product_10.jpg','2017-06-29 20:48:18'),(313,1013,'default/default_product_8.jpg','2017-06-29 20:48:18'),(314,1014,'default/default_product_6.jpg','2017-06-29 20:48:18'),(315,1015,'default/default_product_7.jpg','2017-06-29 20:48:18'),(316,1016,'default/default_product_4.jpg','2017-06-29 20:48:18'),(317,1017,'default/default_product_3.jpg','2017-06-29 20:48:18'),(318,1018,'default/default_product_0.jpg','2017-06-29 20:48:18'),(319,1019,'default/default_product_9.jpg','2017-06-29 20:48:18'),(320,1020,'default/default_product_2.jpg','2017-06-29 20:48:18'),(321,1021,'default/default_product_8.jpg','2017-06-29 20:48:18'),(322,1022,'default/default_product_11.jpg','2017-06-29 20:48:18'),(323,1023,'default/default_product_10.jpg','2017-06-29 20:48:18'),(324,1024,'default/default_product_5.jpg','2017-06-29 20:48:18'),(325,1025,'default/default_product_3.jpg','2017-06-29 20:48:18'),(326,1026,'default/default_product_0.jpg','2017-06-29 20:48:18'),(327,1027,'default/default_product_5.jpg','2017-06-29 20:48:18'),(328,1028,'default/default_product_5.jpg','2017-06-29 20:48:18'),(329,1029,'default/default_product_7.jpg','2017-06-29 20:48:18'),(330,1030,'default/default_product_7.jpg','2017-06-29 20:48:18'),(331,1031,'default/default_product_8.jpg','2017-06-29 20:48:18'),(332,1032,'default/default_product_11.jpg','2017-06-29 20:48:18'),(333,1033,'default/default_product_8.jpg','2017-06-29 20:48:18'),(334,1034,'default/default_product_6.jpg','2017-06-29 20:48:18'),(335,1035,'default/default_product_0.jpg','2017-06-29 20:48:18'),(336,1036,'default/default_product_2.jpg','2017-06-29 20:48:18'),(337,1037,'default/default_product_1.jpg','2017-06-29 20:48:18'),(338,1038,'default/default_product_9.jpg','2017-06-29 20:48:18'),(339,1039,'default/default_product_1.jpg','2017-06-29 20:48:18'),(340,1040,'default/default_product_10.jpg','2017-06-29 20:48:18'),(341,1041,'default/default_product_1.jpg','2017-06-29 20:48:18'),(342,1042,'default/default_product_1.jpg','2017-06-29 20:48:18'),(343,1043,'default/default_product_0.jpg','2017-06-29 20:48:18'),(344,1044,'default/default_product_8.jpg','2017-06-29 20:48:18'),(345,1045,'default/default_product_9.jpg','2017-06-29 20:48:18'),(346,1046,'default/default_product_9.jpg','2017-06-29 20:48:18'),(347,1047,'default/default_product_7.jpg','2017-06-29 20:48:18'),(348,1048,'default/default_product_7.jpg','2017-06-29 20:48:18'),(349,1049,'default/default_product_8.jpg','2017-06-29 20:48:18'),(350,1050,'default/default_product_9.jpg','2017-06-29 20:48:18'),(351,1051,'default/default_product_5.jpg','2017-06-29 20:48:18'),(352,1052,'default/default_product_7.jpg','2017-06-29 20:48:18'),(353,1053,'default/default_product_10.jpg','2017-06-29 20:48:18'),(354,1054,'default/default_product_6.jpg','2017-06-29 20:48:18'),(355,1055,'default/default_product_9.jpg','2017-06-29 20:48:18'),(356,1056,'default/default_product_2.jpg','2017-06-29 20:48:18'),(357,1057,'default/default_product_2.jpg','2017-06-29 20:48:18'),(358,1058,'default/default_product_3.jpg','2017-06-29 20:48:18'),(359,1059,'default/default_product_9.jpg','2017-06-29 20:48:18'),(360,1060,'default/default_product_7.jpg','2017-06-29 20:48:18'),(361,1061,'default/default_product_8.jpg','2017-06-29 20:48:18'),(362,1062,'default/default_product_3.jpg','2017-06-29 20:48:18'),(363,1063,'default/default_product_6.jpg','2017-06-29 20:48:18'),(364,1064,'default/default_product_9.jpg','2017-06-29 20:48:18'),(365,1065,'default/default_product_3.jpg','2017-06-29 20:48:18'),(366,1066,'default/default_product_9.jpg','2017-06-29 20:48:18'),(367,1067,'default/default_product_5.jpg','2017-06-29 20:48:18'),(368,1068,'default/default_product_6.jpg','2017-06-29 20:48:18'),(369,1069,'default/default_product_5.jpg','2017-06-29 20:48:18'),(370,1070,'default/default_product_11.jpg','2017-06-29 20:48:18'),(371,1071,'default/default_product_4.jpg','2017-06-29 20:48:18'),(372,1072,'default/default_product_10.jpg','2017-06-29 20:48:18'),(373,1073,'default/default_product_6.jpg','2017-06-29 20:48:18'),(374,1074,'default/default_product_1.jpg','2017-06-29 20:48:18'),(375,1075,'default/default_product_7.jpg','2017-06-29 20:48:18'),(376,1076,'default/default_product_6.jpg','2017-06-29 20:48:18'),(377,1077,'default/default_product_9.jpg','2017-06-29 20:48:18'),(378,1078,'default/default_product_5.jpg','2017-06-29 20:48:18'),(379,1079,'default/default_product_1.jpg','2017-06-29 20:48:18'),(380,1080,'default/default_product_5.jpg','2017-06-29 20:48:18'),(381,1081,'default/default_product_5.jpg','2017-06-29 20:48:18'),(382,1082,'default/default_product_1.jpg','2017-06-29 20:48:18'),(383,1083,'default/default_product_1.jpg','2017-06-29 20:48:18'),(384,1084,'default/default_product_8.jpg','2017-06-29 20:48:18'),(385,1085,'default/default_product_2.jpg','2017-06-29 20:48:18'),(386,1086,'default/default_product_1.jpg','2017-06-29 20:48:18'),(387,1087,'default/default_product_11.jpg','2017-06-29 20:48:18'),(388,1088,'default/default_product_9.jpg','2017-06-29 20:48:18'),(389,1089,'default/default_product_3.jpg','2017-06-29 20:48:18'),(390,1090,'default/default_product_1.jpg','2017-06-29 20:48:18'),(391,1091,'default/default_product_2.jpg','2017-06-29 20:48:18'),(392,1092,'default/default_product_8.jpg','2017-06-29 20:48:18'),(393,1093,'default/default_product_8.jpg','2017-06-29 20:48:18'),(394,1094,'default/default_product_7.jpg','2017-06-29 20:48:18'),(395,1095,'default/default_product_6.jpg','2017-06-29 20:48:18'),(396,1096,'default/default_product_10.jpg','2017-06-29 20:48:18'),(397,1097,'default/default_product_11.jpg','2017-06-29 20:48:18'),(398,1098,'default/default_product_0.jpg','2017-06-29 20:48:18'),(399,1099,'default/default_product_5.jpg','2017-06-29 20:48:18'),(400,1100,'default/default_product_10.jpg','2017-06-29 20:48:18');
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
INSERT INTO `products_solutions` VALUES (1001,41),(1002,42),(1003,43),(1004,43),(1005,44),(1006,42),(1007,42),(1008,44),(1009,41),(1010,43),(1011,42),(1012,44),(1013,43),(1014,41),(1015,44),(1016,44),(1017,41),(1018,43),(1019,43),(1020,44),(1021,42),(1022,41),(1023,42),(1024,42),(1025,44),(1026,42),(1027,42),(1028,42),(1029,42),(1030,43),(1031,42),(1032,44),(1033,41),(1034,42),(1035,43),(1036,42),(1037,44),(1038,42),(1039,41),(1040,43),(1041,43),(1042,42),(1043,42),(1044,44),(1045,44),(1046,42),(1047,41),(1048,43),(1049,44),(1050,42),(1051,42),(1052,41),(1053,42),(1054,44),(1055,42),(1056,42),(1057,41),(1058,43),(1059,43),(1060,41),(1061,42),(1062,42),(1063,42),(1064,42),(1065,43),(1066,44),(1067,42),(1068,43),(1069,41),(1070,41),(1071,42),(1072,41),(1073,41),(1074,43),(1075,44),(1076,44),(1077,41),(1078,42),(1079,41),(1080,43),(1081,43),(1082,44),(1083,43),(1084,42),(1085,41),(1086,41),(1087,41),(1088,41),(1089,41),(1090,41),(1091,44),(1092,44),(1093,43),(1094,41),(1095,43),(1096,43),(1097,42),(1098,41),(1099,41),(1100,42);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (41,'Industrial','industrial','Ut fuga non quibusdam itaque ut quia. Quia quibusdam commodi fugiat debitis voluptatum occaecati. Quam quaerat ipsum earum vel qui itaque voluptatem. Numquam dicta accusamus non laboriosam ad eius tempore error. Et autem sint laboriosam et. Ipsum possimus consequuntur aliquam fugiat sit ratione. Aut aut necessitatibus adipisci nihil.'),(42,'Cinema','cinema','Aliquid sint aut iure voluptates fuga libero. Laudantium itaque non enim enim cumque quasi. Impedit porro ab adipisci vitae alias. Et consequatur enim excepturi quo dolor et officiis. Et consequatur earum aut consectetur cupiditate quae. Sit illo facilis accusamus ex. Et eveniet nemo voluptatibus necessitatibus.'),(43,'Agriculture','agriculture','Odit ducimus consequuntur voluptatem. Quod pariatur distinctio quis suscipit. Aut repellat qui alias et ad ab. Cupiditate vitae dolores et rem est ipsam voluptatem. Ut quibusdam voluptas dicta voluptatem. Soluta aut inventore non dolores ut in sit. Sit veniam non perspiciatis totam et blanditiis corrupti.'),(44,'Data Center','data-center','Nihil voluptas et ea repellat. Velit ex id sint quia velit nihil. Est et corrupti commodi ab. Quos perspiciatis tempora aut alias. Voluptas atque nulla necessitatibus magni consequatur nihil quis non. Veniam dolores quod perspiciatis placeat possimus veniam. Dignissimos optio ab ut dignissimos.');
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

-- Dump completed on 2017-06-29 20:50:12
