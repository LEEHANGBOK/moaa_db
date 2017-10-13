-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: moaa
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drive_name` varchar(30) NOT NULL,
  `drive_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drive_id_UNIQUE` (`id`),
  UNIQUE KEY `drive_name_UNIQUE` (`drive_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drives`
--

LOCK TABLES `drives` WRITE;
/*!40000 ALTER TABLE `drives` DISABLE KEYS */;
INSERT INTO `drives` VALUES (1,'google',NULL),(2,'dropbox',NULL),(3,'box',NULL);
/*!40000 ALTER TABLE `drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `drive` varchar(30) NOT NULL,
  `token` varchar(300) NOT NULL,
  `refresh_token` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  UNIQUE KEY `refresh_token_UNIQUE` (`refresh_token`),
  KEY `fk_token_1_idx` (`user_id`),
  KEY `fk_token_drives1_idx` (`drive`),
  CONSTRAINT `fk_token_drives` FOREIGN KEY (`drive`) REFERENCES `drives` (`drive_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_token_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (29,3,'google','ya29.GlzhBHDtiMbc3AOMbuniNwZlPd4KdyeJI6mO8St0mIyq3vCOWQR1nleP7BdmwK8bGuZpSD6aJLjKkQFUSTuBeWhpdFhk_I9181cY_VRKjj8se-3t9kuGdiaB5GqjVQ',NULL,1),(30,3,'dropbox','kFb_ENWtmyUAAAAAAAAAvFBcTIFGgBJ7T7Zx180x7g76iD0ESOdM2SG0gxfYAb8n',NULL,1),(31,3,'box','bi27uye1Ejuf6rmhOJubmgjiZEQhdBLL',NULL,1),(32,4,'google','ya29.GlzhBIuVjj-1VI80mMqmrM74EMrjvSO1QuEETY1fKUXh0mDPH-U5uP-n95hXMQwCzoDyB1TuMGQQhcFIUwVbVbC0VG_IB2EGNNmGWqznILVXkYXkn3JQu3nJSZWBAQ',NULL,1),(33,5,'google','ya29.GlzhBNe4YzpQmMVvwuqFdSAG8E_6rBRhuWZK-7zmXMu8bxWl-y3RwTY6ZRuaMy3aQheGn4nh3wgf1Kjto_0dOL8fW1xPq6EUqhEq_IikwlOcQFj5mJcwrtKuj2s8eA',NULL,1),(34,7,'google','ya29.GlzjBF55eN0QzYLJKdNX1OL5NU5UiuaDhPqUqxlljcL2PMmKfjeQNvlwAxCP2crxqprT_isxlUtwQDNc6HXkiM0Lr9ahNlc8odkqeo_po3d0DmzfCa4r1IZ68xpoFA',NULL,1),(35,7,'dropbox','KeJ5HTyanRAAAAAAAAAACTpBMp_IhJsLwOuf-REg5MtRURqSQXjE5GT-Ri-A1Eb3',NULL,1),(36,7,'box','TpzpwI0W1aTPcrk3l5Gh2ipCZRk2ShGs',NULL,1),(37,1,'google','ya29.GlzjBBwT9FycFcUxjNYCYxejwk4209n92zy3NdAwoJy2LGQB961aOkapcTX3UG0zCtxrLPt2RJkjguThjnm72VZP7lA40l9ByDPSleNz3sWy-bmrfQMS1SSG-X_1rw',NULL,1),(38,1,'dropbox','KeJ5HTyanRAAAAAAAAAADDBgSRxnCgwG6rkQI3-ncmNeogyF4Aze2aYzdSikgcyw',NULL,1),(39,1,'box','eB5JpvFNSPfJatKuiDR3cy1HnB1oRTJd',NULL,1);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `user_email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@gmail.com','Test User','test123','2017-10-10 10:24:36'),(2,'test2@gmail.com','Test User','test123','2017-10-10 12:14:47'),(3,'sunmin@gmail.com','SSSunmin','test123','2017-10-11 13:36:50'),(4,'example1@gmail.com','test','test123','2017-10-11 17:39:36'),(5,'example2@gmail.com','test','test123','2017-10-11 17:42:03'),(6,'example3@gmail.com','Example','test123','2017-10-11 18:14:30'),(7,'speedgyuri@naver.com','Gyuriiii','test123','2017-10-13 06:20:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_domain`
--

DROP TABLE IF EXISTS `users_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `domain_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`,`users_id`),
  KEY `fk_users_domain_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_domain_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_domain`
--

LOCK TABLES `users_domain` WRITE;
/*!40000 ALTER TABLE `users_domain` DISABLE KEYS */;
INSERT INTO `users_domain` VALUES (1,1,'35/a192b7913b04c54574d18c28d46e6395428ab'),(2,2,'da/b9237bacccdf19c0760cab7aec4a8359010b0'),(3,3,'77/e68daecd823babbb58edb1c8e14d7106e83bb'),(4,4,'1b/453892473a467d07372d45eb05abc2031647a'),(5,5,'ac/478d69a3c81fa62e60f5c3696165a4e5e6ac4'),(6,6,'c1/fd96eea8cc2b62785275bca38ac261256e278'),(7,7,'90/ba3cda1883801594b6e1b452790cc53948fda');
/*!40000 ALTER TABLE `users_domain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-13 18:16:16
