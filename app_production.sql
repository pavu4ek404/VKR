-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: app_production
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu0.19.10.3

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

--
-- Table structure for table `allpeopls`
--

DROP TABLE IF EXISTS `allpeopls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allpeopls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `peopl_id` bigint DEFAULT NULL,
  `sert_id` bigint DEFAULT NULL,
  `prof_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_allpeopls_on_peopl_id` (`peopl_id`),
  KEY `index_allpeopls_on_sert_id` (`sert_id`),
  KEY `index_allpeopls_on_prof_id` (`prof_id`),
  CONSTRAINT `fk_rails_4eddd75359` FOREIGN KEY (`sert_id`) REFERENCES `serts` (`id`),
  CONSTRAINT `fk_rails_a1a4b29c9e` FOREIGN KEY (`peopl_id`) REFERENCES `peopls` (`id`),
  CONSTRAINT `fk_rails_d2e1ee654e` FOREIGN KEY (`prof_id`) REFERENCES `profs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allpeopls`
--

LOCK TABLES `allpeopls` WRITE;
/*!40000 ALTER TABLE `allpeopls` DISABLE KEYS */;
/*!40000 ALTER TABLE `allpeopls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-04-10 08:50:46.121959','2020-04-10 08:50:46.121959');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organisation_id` bigint DEFAULT NULL,
  `explosive_id` bigint DEFAULT NULL,
  `coutn` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contracts_on_organisation_id` (`organisation_id`),
  KEY `index_contracts_on_explosive_id` (`explosive_id`),
  CONSTRAINT `fk_rails_872b0778a1` FOREIGN KEY (`explosive_id`) REFERENCES `explosives` (`id`),
  CONSTRAINT `fk_rails_ad53b5bb20` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,1,10,20,'2020-04-11 02:59:38.971232','2020-04-11 02:59:38.971232','rjdfs13'),(2,2,1,100,40000,'2020-04-11 03:18:54.418077','2020-04-11 03:18:54.418077','qweeee');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuts`
--

DROP TABLE IF EXISTS `cuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuts`
--

LOCK TABLES `cuts` WRITE;
/*!40000 ALTER TABLE `cuts` DISABLE KEYS */;
INSERT INTO `cuts` VALUES (1,'йцуйц','2020-04-10 09:46:48.409771','2020-04-10 09:46:48.409771');
/*!40000 ALTER TABLE `cuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint DEFAULT NULL,
  `storehouse_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deliveries_on_contract_id` (`contract_id`),
  KEY `index_deliveries_on_storehouse_id` (`storehouse_id`),
  CONSTRAINT `fk_rails_22d431aca4` FOREIGN KEY (`storehouse_id`) REFERENCES `storehouses` (`id`),
  CONSTRAINT `fk_rails_db9f3f5e9d` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (3,2,5,'2020-04-11 03:19:28.626713','2020-04-11 03:19:28.626713','2020-02-20 10:10:00'),(6,2,1,'2020-04-11 04:19:23.216008','2020-04-11 04:19:23.216008','1010-01-11 10:10:00'),(7,1,2,'2020-04-11 04:23:55.328820','2020-04-11 04:23:55.328820','1010-10-10 10:10:00'),(8,1,2,'2020-04-11 04:38:29.495798','2020-04-11 04:38:29.495798','1010-10-10 10:01:00'),(9,2,3,'2020-04-11 04:42:35.687189','2020-04-11 04:42:35.687189','2020-10-10 20:20:00'),(10,1,1,'2020-04-11 10:31:14.463015','2020-04-11 10:31:14.463015','2020-02-20 10:10:00');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explosives`
--

DROP TABLE IF EXISTS `explosives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explosives` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `oxygen` float DEFAULT NULL,
  `heat` float DEFAULT NULL,
  `speed` float DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explosives`
--

LOCK TABLES `explosives` WRITE;
/*!40000 ALTER TABLE `explosives` DISABLE KEYS */;
INSERT INTO `explosives` VALUES (1,'propan',10,10,10,'2020-04-11 02:59:19.096307','2020-04-11 02:59:19.096307');
/*!40000 ALTER TABLE `explosives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'wwww','2020-04-11 02:58:56.815837','2020-04-11 02:58:56.815837'),(2,'adasdasdasd','2020-04-11 03:18:24.185730','2020-04-11 03:18:24.185730');
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peopls`
--

DROP TABLE IF EXISTS `peopls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peopls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fn` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `tn` varchar(255) DEFAULT NULL,
  `dolj` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peopls`
--

LOCK TABLES `peopls` WRITE;
/*!40000 ALTER TABLE `peopls` DISABLE KEYS */;
INSERT INTO `peopls` VALUES (1,'Иванов','Иван','Иванович','Ответственный','2020-04-10 09:45:43.522857','2020-04-10 09:45:43.522857'),(2,'Петров1','Плючщь','Иванович','Взрывник','2020-04-10 09:46:28.025827','2020-04-10 09:46:28.025827'),(3,'йцуйцу','йцуйцу','уййуйц','Ответственный за взрывчатку','2020-04-10 09:50:11.551536','2020-04-10 09:50:11.551536'),(4,'wwww','wwww','wwww','Начальник охраны','2020-04-11 02:55:48.786299','2020-04-11 02:55:48.786299'),(5,'уууу','уууу','ууууу','Ответственный за склад','2020-04-11 02:56:15.248233','2020-04-11 02:56:15.248233');
/*!40000 ALTER TABLE `peopls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profs`
--

DROP TABLE IF EXISTS `profs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_prof` varchar(255) DEFAULT NULL,
  `peopl_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profs_on_peopl_id` (`peopl_id`),
  CONSTRAINT `fk_rails_771cea7d27` FOREIGN KEY (`peopl_id`) REFERENCES `peopls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profs`
--

LOCK TABLES `profs` WRITE;
/*!40000 ALTER TABLE `profs` DISABLE KEYS */;
/*!40000 ALTER TABLE `profs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `requi1` varchar(255) DEFAULT NULL,
  `requi2` varchar(255) DEFAULT NULL,
  `requi3` varchar(255) DEFAULT NULL,
  `requi4` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,'й','уйц','у','й','у','2020-04-10 09:47:17.648413','2020-04-10 09:47:17.648413');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20200224010744'),('20200224033140'),('20200224054634'),('20200314082839'),('20200327000000'),('20200327071159'),('20200327071606'),('20200406041539'),('20200408075820'),('20200408080147'),('20200408081617'),('20200408081915'),('20200408093726'),('20200408110338'),('20200408130825'),('20200408154830'),('20200410040148');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serts`
--

DROP TABLE IF EXISTS `serts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_sert` varchar(255) DEFAULT NULL,
  `peopl_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_serts_on_peopl_id` (`peopl_id`),
  CONSTRAINT `fk_rails_982a02d83b` FOREIGN KEY (`peopl_id`) REFERENCES `peopls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serts`
--

LOCK TABLES `serts` WRITE;
/*!40000 ALTER TABLE `serts` DISABLE KEYS */;
/*!40000 ALTER TABLE `serts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `peopl_id` bigint DEFAULT NULL,
  `peopl1_id` bigint DEFAULT NULL,
  `requirement_id` bigint DEFAULT NULL,
  `cut_id` bigint DEFAULT NULL,
  `capacity` float DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_storehouses_on_peopl_id` (`peopl_id`),
  KEY `index_storehouses_on_peopl1_id` (`peopl1_id`),
  KEY `index_storehouses_on_requirement_id` (`requirement_id`),
  KEY `index_storehouses_on_cut_id` (`cut_id`),
  CONSTRAINT `fk_rails_35db437e39` FOREIGN KEY (`peopl1_id`) REFERENCES `peopls` (`id`),
  CONSTRAINT `fk_rails_93c3eb20af` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`id`),
  CONSTRAINT `fk_rails_bfb8aef307` FOREIGN KEY (`cut_id`) REFERENCES `cuts` (`id`),
  CONSTRAINT `fk_rails_d7b2998d77` FOREIGN KEY (`peopl_id`) REFERENCES `peopls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,1,1,1,1,NULL,'2020-04-10 09:47:24.913455','2020-04-10 09:47:24.913455','йцу'),(2,1,2,1,1,NULL,'2020-04-10 09:47:32.985300','2020-04-10 09:47:32.985300','йцуй'),(3,2,1,1,1,NULL,'2020-04-10 09:47:41.034527','2020-04-10 09:47:41.034527','йцуйцу'),(4,4,5,1,1,NULL,'2020-04-11 02:56:39.013007','2020-04-11 02:56:39.013007','склад1'),(5,4,5,1,1,NULL,'2020-04-11 03:18:15.160696','2020-04-11 03:18:15.160696','фывфывфы');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `fname` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dimaz@mail.ru','$2a$11$0pd8xBwxYWdSlSnpyg4qgeGUyyHdVxYoqU9U4aU9zHSYcAAgNbqjS',NULL,NULL,NULL,'rwstzYxndMajQxxZUEwy','2020-04-10 08:53:30','2020-04-10 08:51:56',NULL,1,'Дмитрий','Загидуллин','2020-04-10 08:51:56.173524','2020-04-10 08:53:30.908310');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wells`
--

DROP TABLE IF EXISTS `wells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wells` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `explosive_id` bigint DEFAULT NULL,
  `cut_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wells_on_explosive_id` (`explosive_id`),
  KEY `index_wells_on_cut_id` (`cut_id`),
  CONSTRAINT `fk_rails_4699382a3b` FOREIGN KEY (`cut_id`) REFERENCES `cuts` (`id`),
  CONSTRAINT `fk_rails_6571f77f42` FOREIGN KEY (`explosive_id`) REFERENCES `explosives` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wells`
--

LOCK TABLES `wells` WRITE;
/*!40000 ALTER TABLE `wells` DISABLE KEYS */;
/*!40000 ALTER TABLE `wells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `well_id` bigint DEFAULT NULL,
  `peopl_id` bigint DEFAULT NULL,
  `peopl1_id` bigint DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_works_on_well_id` (`well_id`),
  KEY `index_works_on_peopl_id` (`peopl_id`),
  KEY `index_works_on_peopl1_id` (`peopl1_id`),
  CONSTRAINT `fk_rails_a5c8b7cf25` FOREIGN KEY (`peopl_id`) REFERENCES `peopls` (`id`),
  CONSTRAINT `fk_rails_c0ae2ce532` FOREIGN KEY (`well_id`) REFERENCES `wells` (`id`),
  CONSTRAINT `fk_rails_dd25c6f02d` FOREIGN KEY (`peopl1_id`) REFERENCES `peopls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-12 20:02:47
