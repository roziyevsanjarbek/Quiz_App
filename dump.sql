-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: quizapp
-- ------------------------------------------------------
-- Server version	8.0.29

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
  UNIQUE KEY `id` (`id`),
  KEY `answers_fk1` (`result_id`),
  KEY `answers_fk2` (`option_id`),
  CONSTRAINT `answers_fk1` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`),
  CONSTRAINT `answers_fk2` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
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
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `options_fk1` (`question_id`),
  CONSTRAINT `options_fk1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (325,301,'gfbgfnbnt',1,'2025-01-23 14:58:43','2025-01-23 14:58:43'),(326,302,'dcfsdfer',1,'2025-01-23 14:58:43','2025-01-23 14:58:43'),(327,302,'bgfnghn',0,'2025-01-23 14:58:43','2025-01-23 14:58:43');
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
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `questions_fk1` (`quiz_id`),
  CONSTRAINT `questions_fk1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (301,17,'dvfdbgrntnthn','2025-01-23 14:58:43','2025-01-23 14:58:43'),(302,17,'fbrbnytyn','2025-01-23 14:58:43','2025-01-23 14:58:43');
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
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_value` (`unique_value`),
  KEY `quizzes_fk1` (`user_id`),
  CONSTRAINT `quizzes_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (17,'rhtyhtjyujyujuy',11,'sdfergtrghh4th','grgttr4h4h',12,'2025-01-23 14:58:43','2025-01-23 14:58:43');
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
  UNIQUE KEY `id` (`id`),
  KEY `results_fk1` (`user_id`),
  KEY `results_fk2` (`quiz_id`),
  CONSTRAINT `results_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `results_fk2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
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
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_api_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_token`
--

LOCK TABLES `user_api_token` WRITE;
/*!40000 ALTER TABLE `user_api_token` DISABLE KEYS */;
INSERT INTO `user_api_token` VALUES (1,'98edaab6fed9f8f383048152a127056440d7b5e12b7b05f41ea1c809d3f7e5650090a6ee68e3617f',1,'2025-01-02 16:17:00',NULL),(2,'6cf746560c84d6134c4b53e82573f503ba2b4480ffbea9d83a2db137d75b1875c4bdc22068aeb066',2,'2025-01-02 16:19:29',NULL),(3,'e5b6cf8ffb8c954ae2ebf286a68bee869c262f9e488f12d3e3a9104cab41728c2c2afdb8d68385e9',3,'2025-01-15 12:54:47',NULL),(4,'c45fcf780ca0b056c0b2f01af0f9ca18b2a26514dbce343bf8c87f46c33c5e1fa95341c017313a42',3,'2025-01-15 15:51:04',NULL),(5,'c49707ea962fc1c58b244149554aa83832b3d0bfd9d9389d1d162a22218501d7d6abc055ec606ab2',3,'2025-01-15 16:04:09',NULL),(6,'c4e8cdb1d8a6f13ebf3058030f6f0df841b7cfe1bff79865dbf19a3634e75b67a7e8df68d582b8cc',3,'2025-01-15 16:04:19',NULL),(7,'00ad185935f70fac025e7fe77c290c10fb402a6eb5761496d508ea932e3a58e7b9609ec39202d4c5',3,'2025-01-15 16:04:20',NULL),(8,'de6aafa634f99d4d829320611ec1ff0b5b77672354fdc35c0d103c0c5bffe40b0c23ae7ffb3e4b5e',4,'2025-01-16 13:13:16',NULL),(9,'fe38f02e0f81c39b97beedf9c3f8d64aeb1539e2e214201e56be69821bf21383229c8db13784cf35',5,'2025-01-16 13:15:08',NULL),(10,'fd1aa1aec0ae921e9ef5f6086ca38a22df6822bb34808c6a7614b116310a16dbca63c887ca55b7a1',4,'2025-01-16 14:19:44',NULL),(11,'a38292a4f693860c323973650c25034a441404f70975c1beea8454225ee785a13f0a8c857d34dbd6',4,'2025-01-16 14:20:05',NULL),(12,'69b5aa2c57670fa337271ce37f2776d82de653f4a6ba6d0540ac057006bcb1add784732398d76fc2',5,'2025-01-16 14:45:50',NULL),(13,'fab23deaf9c83445b8dbd4fb8ce6e18dbb584881609b3e0097ca20127d65fba923e37d3ad2e4db62',5,'2025-01-17 09:59:27',NULL),(14,'2c3bfad93508c972cfdfd6c429a3ae17e6999f3fa3370746843fbede2e785c3375dbaaaeecf751b4',5,'2025-01-17 09:59:29',NULL),(15,'01206f9c7d6fb25baa4342e40a39efb0d087184ad396b978aceb51701a69dabcfd1337ef18263a3c',5,'2025-01-17 09:59:30',NULL),(16,'a3eacde63472461a0391e3bfc90cd82d02bf21085d8152e9c06212d6aa5e59d1c27a048efbb93329',5,'2025-01-17 09:59:35',NULL),(17,'cf796bb87c6ef5b236918466a579d853c232212ac59b5031fbb31d132e93a51a28c677126b004f6c',5,'2025-01-17 12:45:14',NULL),(18,'3c0bbd76dcd92905c27025ff0f67430918c0a27b4690ab2556c9defeeea88f1acc3db147fae39ae6',5,'2025-01-17 12:54:31',NULL),(19,'065b3e121756d871b729b92b82244118069d5d13f23b3bfa51c1b200d1c8dd74d7429129e97f364d',3,'2025-01-17 12:55:01',NULL),(20,'83aa1a0a75c5d71ff0a080f8cd9d3d0c6f23b64780e866bc9403a7e5955ee93b9a1b205780a62cb6',3,'2025-01-17 12:55:37',NULL),(21,'bde7056cc3e978de707e8e8deb81ebd616aa89c3c90e4c752f400c9b39d41871770be1ebb2b5adc2',5,'2025-01-17 13:18:21',NULL),(22,'0e86ec982b8cb8f1d04f9a8d3cb3d60e5d57f6e025c0e45f57fdc76a54799c5b9d6988e0da2e3886',5,'2025-01-17 13:18:34',NULL),(23,'724e3d38202153f73951a2edbfbe2d6e241e96ba27d59f5ab1dc36381bd8c774c1d4ad39442dfd19',5,'2025-01-17 13:18:55',NULL),(24,'eb110e5bd6db386888481e12e307ebf651895ac5bc7523c283d1e2faae039137b26b7010aad9f671',5,'2025-01-17 13:19:02',NULL),(25,'bda85f89125be323a9474718347a7a71871be35558bc3f17f6682638a6979721c2ba92d6f62a882b',5,'2025-01-17 13:19:02',NULL),(26,'38950f14b50f65b9dc96fcf3ed31bc9ca05945e7bb33155208ca7b0730ac3c9540f64a0e3ec1f3f2',5,'2025-01-17 13:19:02',NULL),(27,'c156e4e7fe335490cde6e7e5807d71950216b8c23f0e8ff9e5ca2a7cdb465a0976b346d32d241f93',5,'2025-01-17 13:19:03',NULL),(28,'d4a02aaccc0c1b94ed7bf8b0461392db2b9587f6ba5a91643f72f79e8bece34c351ccea39be880c7',5,'2025-01-17 13:29:03',NULL),(29,'c8dfc2a2bec5ec3052fe0f0f616c039905014f6abb607d0fb5a09edc353d4e4c043c6a3f04ea8656',5,'2025-01-17 13:29:42',NULL),(30,'85b328d781602895e6912c8cb229e530fa7aa2db632a5120557ed8f481a3ebf900a69459a04d9ed5',5,'2025-01-17 13:30:06',NULL),(31,'b468985aef4933458bc7af3ea52cd97f9e52b76cff2dc848b6114c813efdbde51abef5ab9b331752',5,'2025-01-17 13:35:40',NULL),(32,'34695eb4d01b62603d31be17f6fc098f2c1e6a90aa6d217d074ab39be624041cdcebc040cc4b16b0',5,'2025-01-17 15:48:46',NULL),(33,'45c6e066591e069592a0101f36e38aa0d6cb9336d505264df429b323a5725f5f20074f4ce8cde402',6,'2025-01-17 16:54:36',NULL),(34,'9472486f0eac9e56e234b2fc9fcf13e504d4fd600a3b6d74e57d7258ec04b9343363a47d0ac2dfa7',7,'2025-01-17 16:58:13',NULL),(35,'570029951b2dd6999bacfb3a810cd37e70beb3d5710850e80bd672657dd7ac4ac5fadc7311b90229',10,'2025-01-17 16:58:55',NULL),(36,'9a90d3a3f7c3a32892345d8b5f4981c1f0ae74285314ff39eed255fcb0a722223b24573b7810793a',5,'2025-01-20 13:16:34',NULL),(37,'b69cdf38ffeee096b09ab3295f14f6cd0c0f9410244ca8a853ad1b31fc54495977807aa72a96b280',11,'2025-01-21 08:32:07',NULL),(38,'6880d5dbf768619257d3888e1d97a752fddfed4cbb4d6f44e1e13bf352cf2710b08bf4114babbd20',11,'2025-01-21 08:32:24',NULL),(39,'5503c6931f0d9c40d0f48399439a36c00cd7e45b25b92c331734109c9b21da02c3579d4765b5c8fb',11,'2025-01-21 08:32:52',NULL),(40,'ba6aade78b3b6e2ddda5c37fdd5e52816029f5f7ca58122ce5e4e15b3bc67819ff484f9f74b15b91',11,'2025-01-21 13:18:59',NULL),(41,'6504fcefa3350a9414e1850a8a5498f5cdc30e6e97edcc9e1624d69b3a0df9ed1d36fc65055cb752',11,'2025-01-21 13:52:47',NULL),(42,'42c8d28a4b7e8330c65a4430b0078263121c81cd8917f190deb404defc57d2dac2c8734f69e2e284',11,'2025-01-21 16:00:53',NULL),(43,'3a8e8f677429227d7b938d8696dd1eefdb7d875f2e91486866d85b2e8591db4717f8182247285417',11,'2025-01-21 16:12:41',NULL),(44,'64d0cd20aace04d5f03e2cfa06080a92ad65c7721552eed36ef11802c252ff9f6ed4688563875915',11,'2025-01-21 16:15:29',NULL),(45,'73afcc5535929ac7ee8e1411a4df18ef682547f4fbe552bc98414636447bb9c1f1cc6fb22987ab5f',11,'2025-01-21 16:16:59',NULL),(46,'099cd8def5966e905b613ad3f974c0808e92807ac24759ca6a7f97f1c2b9b556b3e98b7e84ae4c19',11,'2025-01-21 16:28:28',NULL),(47,'96c551600092ecc95bb8cf7e2083cb61ed3f079613f8e7bc0981ebc9cbcbf0eb33dd2a5b04af70f9',11,'2025-01-21 16:30:51',NULL),(48,'5e522adf28862738e9f796704713cdf1c6d5f6a15107bba50f00de4914c81b5e39b792def6e6c837',11,'2025-01-21 16:32:02',NULL),(49,'4f4b77674889168447a2f9dfb9317f5a70b6bed9511de7332dd1dfdc80fe8a5d43e035b9df8284c5',11,'2025-01-21 16:39:13',NULL),(50,'97d12c9cfd97530c0ae2b7015812ba810fb103f46bc336a89d6a6bc1eadd3125daea3bf249a08ffd',11,'2025-01-21 17:28:38','2025-01-14 21:28:38'),(51,'83ee2fadbb38e6858b494cc59fd9a6f8f693bbfdc3399fac512f593a4ec3ee25ca0cb4f613c8523f',14,'2025-01-21 17:31:12','2025-01-14 21:31:12'),(52,'53c000f9e0bc98ee356c8da9dd36d9a0a637c8346c30a17946810d7746aedc084e7ef24ac68054a1',11,'2025-01-22 08:56:13','2025-01-15 12:56:13'),(53,'46ad09eaf3a6ae1e151aa8d4daff895de5749df976b4e8b363490245ca51d44b64d66bac773bc69d',11,'2025-01-22 09:03:03','2025-01-15 13:03:03'),(54,'bed61a6890779bddfb0bcd09f9bf7adc1dcb2dd84b363aecdad2bdac66651de9cd53f2cdce397c6c',15,'2025-01-22 10:06:14','2025-01-15 14:06:14'),(55,'9f4265fe7c2491824d7f81f8273164049cca4fd0cf68bf01267f309b01d9475f2d8959d3327ada4a',11,'2025-01-22 10:17:00','2025-01-15 14:17:00'),(56,'bb729be23216ddcdea735f30561985c0fc02413bc8dda6cfbc4c0f71bccb635dc7d4ace63c1f9bae',11,'2025-01-22 11:42:26','2025-01-15 15:42:26'),(57,'deffd0ffa69b093b76dac470f416cfbc29d8cf0d8aa3054ca04a628fb09d0402d77ffa35fbfe53fa',11,'2025-01-22 13:11:43','2025-01-15 17:11:43'),(58,'a129b53338ec7b5f630cbdfcb80bf81cbb79fcbf692af10f2ab317befe3b63f347a2994389e96fbd',11,'2025-01-22 13:15:19','2025-01-15 17:15:19'),(59,'9bcbc6488d285f258b7e6e668143f71e72da349cb86847b1259ee200e3b984768933d3ed46c9e9ec',11,'2025-01-22 13:16:16','2025-01-15 17:16:16'),(60,'193d38e0295102037f16100b7f8bf50c4137ff9bfa51d92ac6f576af122cff406ca50c363f1809d5',11,'2025-01-22 13:18:37','2025-01-15 17:18:37'),(61,'a06bcbb50165cd12562aba66f39912b2bd76eed591ee693b06af0eaf13e2ff75ac939455a829fb1a',11,'2025-01-22 13:22:34','2025-01-15 17:22:34'),(62,'5f149eeb4d52fff826ad50d95461edc5aff40a990161d576538294884976f76a5df4afe6a1c52a8a',11,'2025-01-22 13:58:30','2025-01-15 17:58:30'),(63,'9e56dce80e6eaf6402ad9eeb4de17722b6edf44495ffd401b566a738ca8adfb941a5d57ca90ec6b3',11,'2025-01-22 13:58:43','2025-01-15 17:58:43'),(64,'47bd8c39c9b38b105746aec4bcf2b064ba727607408871353fe012acd581197556de233f01e93c08',11,'2025-01-22 14:37:20','2025-01-15 18:37:20'),(65,'66949573c65255432c8b8812591d6c9bea6325a1f65735cd6a7ba016ab01664a485edea3c5d2d59a',11,'2025-01-22 17:22:51','2025-01-15 21:22:51'),(66,'210955084a8006ae2260cb41ccf8a8df474ea4810653b46868c089bd7ad8fa78aa478bab9544d7d4',11,'2025-01-22 17:22:51','2025-01-15 21:22:51'),(67,'451d4aece4d1487da508c6ee2b99ab9d264d09f7ff0c56dc184ee587370af57b3c29d59b33f737dc',11,'2025-01-22 19:36:25','2025-01-15 23:36:25'),(68,'38197257592dcd1f95822470ae28b8b6d8179f6fc628e09f2b10509e2a1891253a3afbde1e9de0dc',11,'2025-01-23 13:15:21','2025-01-16 17:15:21'),(69,'c44f8dcf577eb2c38791f7d490f71c29e535d582c7d952c252613265c8f84c5225c3f56215a2e04c',11,'2025-01-24 13:12:37','2025-01-17 17:12:37'),(70,'a949c6e855f91f9a070894d52b06a8d0d8ffeec6a32f677b4ca44115f39f008a8a78c06a3110787a',11,'2025-01-24 21:45:01','2025-01-18 01:45:01'),(71,'3f7483115b7ce8268a302c046e9bb3bff74966a1ca61f516041f1594dcbc1a82fe4ccac0a85084f1',11,'2025-01-25 12:40:53','2025-01-18 16:40:53'),(72,'61427d7d42cda10aeb07825ee4a951c76d24e93aa7d76674d49aca34577b61f4743e4f0262be2dbb',11,'2025-01-27 12:57:31','2025-01-20 16:57:31'),(73,'ed19cc2736e0bf8540d10d53edb8d9335ee07326fae40cc2d28c9b278e3798946d71f2adc4d53a55',11,'2025-01-27 15:56:50','2025-01-20 19:56:50'),(74,'540d2f34bb1fe32af6f45865460b3c0b5099b15296e3db721c951aaf2ff41ee9c6eaf74ed5c21195',11,'2025-01-29 03:34:16','2025-01-22 07:34:16'),(75,'039ed0ac5b07fa42f15b9e32b2652c04f37f7e583d1acbffe2772f27643ea85034f10b424538fb36',11,'2025-01-29 07:50:40','2025-01-22 11:50:40'),(76,'399a56c8c9b1815efe486fdc3f6963bfe292ea7335a0b61caaceddd86ddc11d1c001de019f642a7b',11,'2025-01-29 08:41:49','2025-01-22 12:41:49'),(77,'08c275a0494ccf6e4066e14384cb34109641890796055df470f9ed20e1aee77ee75db0a3bd8e8bd2',11,'2025-01-29 19:07:00','2025-01-22 23:07:00'),(78,'b3ae5cc12031fcafbf257418499ca81d7074a5dfedc6eacbb4523d3a092c6aff2db158a5e210f7eb',11,'2025-01-30 04:32:43','2025-01-23 08:32:43'),(79,'e11999d9a8f5f0ca99df209d8e75208e47597d98240ccc506be282ba97a5ad652655e9db34c7d290',11,'2025-01-30 13:07:54','2025-01-23 13:07:54'),(80,'3360b4b14ea5fba4d62ac8673f65d7563531068322631df800a67cda7e25b5c0ee021a2a46f68862',11,'2025-01-30 13:17:32','2025-01-23 13:17:32'),(81,'c46d2f0aa012fda01264b04ef615f616b79b55e4684c0e816ae9531d37ddb011ce2200822b21bd09',11,'2025-01-30 14:35:31','2025-01-23 14:35:31'),(82,'9f5ae0d897d6182b0c90151c83c3b926f19ce58d2b2354eaa057fdd2b50ab9809257374f9465d664',11,'2025-01-30 15:14:56','2025-01-23 15:14:56'),(83,'028fb89b63a9d613fa879793a08d38231382341b325ddf2ab6abd2f90ff9acbe7772ac914e1cb24d',11,'2025-01-30 15:17:06','2025-01-23 15:17:06'),(84,'275ce39d23c32256e7b34af600bc99c32c58d505db1d257c2f9c59692777c87502b356b0a197ac46',11,'2025-01-30 15:18:33','2025-01-23 15:18:33'),(85,'15fa23a366d4cc82737a92d5497076cf32e7c3f53f8658a4e99910691e740dd0dbe51ff2c0c65fd4',11,'2025-01-30 15:19:20','2025-01-23 15:19:20'),(86,'041d63a12236348ce8c2345aa0d835883aba57b07d897171ebc89dae80fd78f752ee3efe10792e48',11,'2025-01-30 15:19:44','2025-01-23 15:19:44');
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
  `update_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Abdullajon','abdullajon@gmail.com','$2y$10$fiRBG0oM8DNofbsjggVrP.9AgbprhZmk5JSeSqMT2p/AE27cYukgu','2024-12-26 20:16:59','2024-12-26 20:16:59'),(2,'Abdullajon','abdullajon12@gmail.com','$2y$10$2SA5TmCLJk85fTM1FMIspOaO7woyJ.PICbJM1k7Z.YptAZcO1Z27m','2024-12-26 20:19:29','2024-12-26 20:19:29'),(3,'Begzod','begzod123@gmil.com','$2y$10$4fMhlTcepNbSLbwew75l0.VMFfgVUci0N7PKXHBB/UCZCkwDbDDKq','2025-01-08 16:54:47','2025-01-08 16:54:47'),(4,'rgftgtrghrth','roziyevsanjarbek1216546@gmail.com','$2y$10$pS0YCgj1e4riJxcvSa8KmuWosGepf5RSeBEG8GvQQcd0zEMc9o8SK','2025-01-09 17:13:16','2025-01-09 17:13:16'),(5,'Sanjarbek','roziyevsanjarbek1216@gmail.com','$2y$10$hKtaA7bRfi6aBm.u.V4Vd.jZr7ZbZLEElDAIuivQYmMwx/WeI0Z2G','2025-01-09 17:15:08','2025-01-09 17:15:08'),(6,'Elbek','Elbek@admin.com','$2y$10$0yJw1adufT/Shy5mLxM.pOPW/XdueJNOj2GqddDS4vlwPJ8r4B2Ge','2025-01-10 20:54:36','2025-01-10 20:54:36'),(7,'anvar','anvar@gmail.com','$2y$10$bXVj8LD2yCq1Jkupekme8enU2rG7.bHNmc10xK.OiOfK5Q6gLSCwC','2025-01-10 20:58:13','2025-01-10 20:58:13'),(10,'anvar','anvar12@gmail.com','$2y$10$P6FZC9QTADKE5UHU9thxr.dGpF4H6jsf991nB.rjTzearq0M4oSDu','2025-01-10 20:58:55','2025-01-10 20:58:55'),(11,'Elyor','Elyor@gmail.com','$2y$10$FS6cmOkJE7ngfsNnFNHBZ.qFebQKP9tppeLvYx0uZiKIFcgf.nhhO','2025-01-14 12:32:07','2025-01-14 12:32:07'),(12,'Sanjarbek','roziyevsanjarbek11216@gmail.com','$2y$10$vMRebWUjzfWhFsTxGjqNgOyKMYl92/Y9HzaKwZyjIwuMRJDSqYhtm','2025-01-14 21:03:04','2025-01-14 21:03:04'),(14,'Sanjarbek','roziyevsanjarbek12516@gmail.com','$2y$10$0kPdoj3d9qIFQT9KouQH/OzIR50GZBdHInJ09lxzGUO2.z/bmDzje','2025-01-14 21:31:12','2025-01-14 21:31:12'),(15,'Sanjarbek','roziyevsanjarbek090h9@gmail.com','$2y$10$m4kttH8m5bzW3jjbubBK6emW7lsP2JFm/ULPntitzjNrWuM3PU4ii','2025-01-15 14:06:14','2025-01-15 14:06:14');
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

-- Dump completed on 2025-01-23 18:12:30
