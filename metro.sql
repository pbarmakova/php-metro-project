-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: metro
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_id1` int NOT NULL,
  `station_id2` int DEFAULT NULL COMMENT 'ID второй станции (конец соединения)',
  `time` int DEFAULT NULL COMMENT 'Время в пути',
  PRIMARY KEY (`id`),
  KEY `station_id1` (`station_id1`),
  KEY `station_id2` (`station_id2`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`station_id1`) REFERENCES `stations` (`id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`station_id2`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,2,6),(2,2,3,6),(3,3,4,4),(4,4,5,4),(5,5,6,5),(6,6,7,5),(7,7,8,5),(8,8,9,5),(9,9,10,5),(10,10,11,4),(11,11,12,4),(12,12,13,4),(13,13,14,4),(14,14,15,5),(15,15,16,6),(16,16,17,4),(17,17,18,5),(18,18,19,4);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `line` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Девяткино','Красная',938,204),(2,'Гражданский проспект','Красная',938,260),(3,'Академическая','Красная',938,316),(4,'Политехническая','Красная',938,372),(5,'Площадь Мужества','Красная',938,428),(6,'Лесная','Красная',938,484),(7,'Выборгская','Красная',938,540),(8,'Площадь Ленина','Красная',938,596),(9,'Чернышевская','Красная',938,596),(10,'Площадь Восстания','Красная',938,708),(11,'Владимирская','Красная',923,869),(12,'Пушкинская','Красная',804,988),(13,'Технологический институт1','Красная',701,1091),(14,'Балтийская','Красная',622,1170),(15,'Нарвская','Красная',546,1246),(16,'Кировский завод','Красная',504,1308),(17,'Автово','Красная',504,1364),(18,'Ленинский проспект','Красная',504,1420),(19,'Проспект Ветеранов','Красная',504,1476);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'metro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31 19:51:20
