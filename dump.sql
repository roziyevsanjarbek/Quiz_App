-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: quizapp
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_id` int NOT NULL,
  `option_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  KEY `answers_fk1` (`result_id`),
  KEY `answers_fk2` (`option_id`),
  CONSTRAINT `answers_fk1` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`),
  CONSTRAINT `answers_fk2` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (5,17,343),(6,18,340),(7,18,342),(8,19,338),(9,19,341),(10,20,340),(11,20,341),(12,21,343),(13,21,338),(14,22,342),(15,22,339),(16,23,340),(17,23,343),(18,24,338),(19,24,342);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  KEY `options_fk1` (`question_id`),
  CONSTRAINT `options_fk1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (328,303,'tg546h5h5h',1,'2025-01-24 00:43:36','2025-01-24 00:43:36'),(329,304,'tg546h5h5h',1,'2025-01-24 00:43:52','2025-01-24 00:43:52'),(330,304,'r54t54t45t',0,'2025-01-24 00:43:52','2025-01-24 00:43:52'),(338,308,'Option 1',1,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(339,308,'Option 2',0,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(340,308,'Option 3',0,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(341,309,'Option 1',0,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(342,309,'Option 2',0,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(343,309,'Option 3',1,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(344,310,'vefv',1,'2025-02-04 20:58:39','2025-02-04 20:58:39'),(345,311,'vefv',1,'2025-02-04 20:58:44','2025-02-04 20:58:44');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `question_text` text NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  KEY `questions_fk1` (`quiz_id`),
  CONSTRAINT `questions_fk1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (303,18,'erfgt4g5hg5','2025-01-24 00:43:36','2025-01-24 00:43:36'),(304,18,'erfgt4g5hg5','2025-01-24 00:43:52','2025-01-24 00:43:52'),(308,21,'Question Text 1','2025-01-29 14:10:21','2025-01-29 14:10:21'),(309,21,'Question Text 2','2025-01-29 14:10:21','2025-01-29 14:10:21'),(310,22,'vdfvdfv','2025-02-04 20:58:39','2025-02-04 20:58:39'),(311,23,'vdfvdfv','2025-02-04 20:58:44','2025-02-04 20:58:44');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unique_value` varchar(255) NOT NULL DEFAULT '',
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `time_limit` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  UNIQUE KEY `unique_value` (`unique_value`),
  KEY `quizzes_fk1` (`user_id`),
  CONSTRAINT `quizzes_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (18,'kjhhsdguye',20,'erf4gf4gt5','g54hg5h',12,'2025-01-24 00:43:36','2025-01-24 00:43:36'),(21,'6799f07d696e9',21,'Quiz Title','Quiz Descripition',15,'2025-01-29 14:10:21','2025-01-29 14:10:21'),(22,'67a2392f3fc50',47,'dewdfewf','fweerf',12,'2025-02-04 20:58:39','2025-02-04 20:58:39'),(23,'67a23934185ff',47,'dewdfewf','fweerf',12,'2025-02-04 20:58:44','2025-02-04 20:58:44');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `started_at` datetime NOT NULL,
  `finished_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  KEY `results_fk1` (`user_id`),
  KEY `results_fk2` (`quiz_id`),
  CONSTRAINT `result_fk2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `results_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (17,21,21,'2025-01-31 22:59:07','2025-02-01 12:12:32'),(18,22,21,'2025-02-01 12:18:33','2025-02-01 12:33:33'),(19,23,21,'2025-02-01 12:23:02','2025-02-01 12:38:02'),(20,24,21,'2025-02-01 12:25:10','2025-02-01 12:40:10'),(21,25,21,'2025-02-01 12:27:55','2025-02-01 12:28:12'),(22,26,21,'2025-02-01 12:28:47','2025-02-01 12:29:05'),(23,27,21,'2025-02-01 12:31:20','2025-02-01 12:32:26'),(24,47,21,'2025-02-02 21:15:48','2025-02-02 21:16:08');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_token`
--

DROP TABLE IF EXISTS `user_api_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_api_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_api_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_token`
--

LOCK TABLES `user_api_token` WRITE;
/*!40000 ALTER TABLE `user_api_token` DISABLE KEYS */;
INSERT INTO `user_api_token` VALUES (87,'047a938b53a2f42e32d5605b4edfb31a94f678bb9f5cf793ea8255d15e7b88a0affd5f43d9e8c9f8',20,'1970-01-01 06:00:00','2025-01-24 00:26:57'),(88,'ce07478165a6c2a85dbe79daa2674b824d1c1c8edc66a7e07ad17ee9c47de6f542cb80adbb810fca',20,'1970-01-01 06:00:00','2025-01-24 00:27:05'),(89,'2d860371b77249798476bfd6a0da85ac4046c4aeaf3af9810304f8af0b85e9c54eb3edbbd8e4f77c',20,'1970-01-01 06:00:00','2025-01-24 00:27:07'),(90,'b609b8dd054d1dbdcc9a99e683880106a2530d1780dff2e877dfb9b0ffe5c3206c256bdf31bc877c',20,'1970-01-01 06:00:00','2025-01-24 00:27:08'),(91,'6b3d7756ab77bfea211e150c4a8692c78cd03ffe973f68f2bffb71afa14984e6a895518449e5a8c6',20,'1970-01-01 06:00:00','2025-01-24 00:27:09'),(92,'0a327271e98286b1131a7872867b6fd4dddb87a2a07f773bc1c977088223ff7f66e57ac5ce729793',20,'1970-01-01 06:00:00','2025-01-24 00:28:17'),(93,'6f3f87a219f7dc78399ac237d8476e34588a22c97f7de888ec79166977bda0c23b9923bfe1623c65',20,'1970-01-01 06:00:00','2025-01-24 00:28:25'),(94,'ec02a7f643af2538bf5d994cdda8a7201f9ace78c5e00db67605059ae7f1431e8dffb4ff716b65ad',20,'1970-01-01 06:00:00','2025-01-24 00:28:26'),(95,'2a48a33fc9199330b2c5d5a410f432edefa393dda18a0ea15745ee657a10f4c8b31307a93894b5ee',20,'1970-01-01 06:00:00','2025-01-24 00:28:27'),(96,'e2e01f54de7866370d1c4437357ec0072014f2febe5d1949354853bb9842a2ee4c346810896e895c',20,'1970-01-01 06:00:00','2025-01-24 00:28:32'),(97,'c8f212fddb91b6efff3ed70f7f26580d379c3d7457dc41fa191e9794a50a2bf8621c4388ac960d92',20,'1970-01-01 06:00:00','2025-01-24 00:28:34'),(98,'41b7e82a63d24104aa5b7bdff353afd4b6f6a1332e5c23335cce35a72c1ef739b59b0437125ed1b4',20,'1970-01-01 06:00:00','2025-01-24 00:28:35'),(99,'765196242659fb0d2385699891ca33eb3a82e168d280a506d2c49071ccb034daa6dc2dac19bed4d1',20,'1970-01-01 06:00:00','2025-01-24 00:28:36'),(100,'7aa4b0dba264fc118d08674cf85630d6acf13f2bcee60767c59221d718b01451f69ad989706eb80e',20,'1970-01-01 06:00:00','2025-01-24 00:28:37'),(101,'19cc74b41dba779bbdcc9526548abdbff358d54d958e9a0b9f5090be380511a5bedfc0ce40fd4e67',20,'1970-01-01 06:00:00','2025-01-24 00:29:27'),(102,'7147087eaf934f125219d21623e7c4287e4bef7682779a2129148b9898bd85a983065853c34061a6',20,'2025-01-31 00:43:15','2025-01-24 00:43:15'),(103,'f194abfd1c789d69d1d146406c764c5045e45222ee1d14d4438f6616c21a4d8a8591d3cc6f21fc9a',21,'2025-02-01 20:56:43','2025-01-25 20:56:43'),(104,'2c6291ef1b3adbc8d31a42bc97353285094c145c641d30936807ebfce061607e945b1335de637908',21,'2025-02-05 13:58:10','2025-01-29 13:58:10'),(105,'d4108395288e4dee3e0b3b693c6113237b6988bfccf09e7158c78f2c29a980a01dcab7868ea8d3f5',21,'2025-02-05 16:11:27','2025-01-29 16:11:27'),(106,'41d7075cd916633ea6b43db66e339914340037cd2eca4382509e2326cd2f409411607d1209f8f27b',22,'2025-02-08 12:17:38','2025-02-01 12:17:38'),(107,'d8664a09551052c1e49151002ea4c9cc4cb35993886f8017684b90377329e67d63d7cf68d2d3332f',23,'2025-02-08 12:22:46','2025-02-01 12:22:46'),(108,'d223d518a738dafbdef71d43f90f75fee18603c73bd6251ccd4f565afe807048e5ab93dbb72c9ba1',24,'2025-02-08 12:24:24','2025-02-01 12:24:24'),(109,'719c8f62439da46f3ccd945f5c69175e320eb053f42ce442d8ba0819fcb1a2642dc7fc9816470405',25,'2025-02-08 12:27:32','2025-02-01 12:27:32'),(110,'1efb38668799b3ad4a00d3af2c268099188dd0c2e3db7e304769ed763e6fe37db40ca7bf77ee3fbf',26,'2025-02-08 12:28:35','2025-02-01 12:28:35'),(111,'fa52e5193e8ca793a6d2cc417ad91b33af3d9303844237639898715b465220a5906978103dcecb3c',27,'2025-02-08 12:31:11','2025-02-01 12:31:11'),(112,'846df72b756b0339efaff6d362c2db8b5b40fd9b99e6740c556775e7635e8e318bc09b2f1347489d',47,'2025-02-09 21:15:27','2025-02-02 21:15:27');
/*!40000 ALTER TABLE `user_api_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sanjarbek','sanjarbek@gmail.com','123','2025-01-24 00:23:19','2025-01-24 00:23:26'),(18,'Sanjarbek','sanjarbek1@gmail.com','$2y$10$6u2Bs67vaNcY9uH4BeCPeOSEzOhZyJkJo9LERlsR5n9HeiDxh4ce2','2025-01-24 00:25:45','2025-01-24 00:25:45'),(20,'Sanjarbek','sanjarbek12@gmail.com','$2y$10$DKg13rlIm.aHGC6d5S5tz.WZmd73jyrvnw4p6iMmLbvPPRniqV.UK','2025-01-24 00:26:57','2025-01-24 00:26:57'),(21,'Sanjarbek','sanjarbek123@gmail.com','$2y$10$WMtZnYf80t5Ad4aXFNsn8e2CFR7DFJbjg59MifaOtwyZXTYN89rjm','2025-01-25 20:56:43','2025-01-25 20:56:43'),(22,'Anvar','anvar@gmail.com','$2y$10$WCvOw/be3HynR0CDf92jDeB9ByVDc18oc4S/6MxFY7Zi74Vd30gdW','2025-02-01 12:17:38','2025-02-01 12:17:38'),(23,'Anvar','anvar1@gmail.com','$2y$10$//QfU8/Eu9d4HNi4CVwNyOc9QpMCTOPk5XjJ7E3e9UpoCmOOlrNTm','2025-02-01 12:22:46','2025-02-01 12:22:46'),(24,'Anvar','anvar12@gmail.com','$2y$10$cRINiAPq06uTOzP1rskj4Oz.1X3uGQ0QzfK7duCYkFWR0s5U1AwMe','2025-02-01 12:24:24','2025-02-01 12:24:24'),(25,'Anvar','anvar123@gmail.com','$2y$10$1zr5VsVkIggKXgJKE4gTtuTGpD8EfeuARNMl5S6flGMR2kwyuKLg2','2025-02-01 12:27:32','2025-02-01 12:27:32'),(26,'Anvar','anvar1234@gmail.com','$2y$10$4I.hZGH8w/pUyxn2pW6gd.Cu75..xV1wIQmt0UMGixPyk6dNwfWDG','2025-02-01 12:28:35','2025-02-01 12:28:35'),(27,'Anvar','anvar12345@gmail.com','$2y$10$9EDA93FHzAaLq.L3CLPZAO07F.MptD0o2wQwRcjKj0pL7yPSRqLQi','2025-02-01 12:31:11','2025-02-01 12:31:11'),(47,'Anvar','asdfefw@gmail.com','$2y$10$Ra3ZHQA6bmlx.wxqPurQVu1deD7LzCDPfYIBQ0kB4GOhCnmpEiUZu','2025-02-02 21:15:27','2025-02-02 21:15:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05  9:04:28
