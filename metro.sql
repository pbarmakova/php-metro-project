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
  `travel_time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `station_id1` (`station_id1`),
  KEY `station_id2` (`station_id2`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`station_id1`) REFERENCES `stations` (`id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`station_id2`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,2,4,3),(2,2,3,5,3),(3,3,4,5,3),(4,4,5,5,3),(5,5,6,6,3),(6,6,7,5,3),(7,7,8,6,3),(8,8,9,7,3),(9,9,10,8,3),(10,10,11,6,3),(11,11,12,6,3),(12,12,13,7,3),(13,13,14,6,3),(14,14,15,5,3),(15,15,16,6,3),(16,16,17,5,3),(17,17,18,6,3),(18,18,19,5,3),(19,20,21,5,3),(20,21,22,4,3),(21,22,23,5,3),(22,23,24,5,3),(23,24,25,5,3),(24,25,26,5,3),(25,26,27,6,3),(26,27,28,7,3),(27,28,29,6,3),(28,29,30,6,3),(29,30,31,6,3),(30,31,32,5,3),(31,32,33,5,3),(32,33,34,5,3),(33,34,35,5,3),(34,35,36,5,3),(35,36,37,5,3),(36,30,13,4,3),(37,38,39,4,3),(38,39,40,5,3),(39,40,41,5,3),(40,41,42,5,3),(41,42,43,4,3),(42,43,44,6,3),(43,44,45,6,3),(44,45,46,5,3),(45,46,47,5,3),(46,47,48,5,3),(47,48,49,5,3),(48,50,51,6,3),(49,51,52,6,3),(50,52,53,6,3),(51,53,54,5,3),(52,54,55,6,3),(53,55,56,5,3),(54,56,57,6,3),(55,57,58,5,3),(56,59,60,5,3),(57,60,61,5,3),(58,61,62,5,3),(59,62,63,6,3),(60,63,64,5,3),(61,64,65,8,3),(62,65,66,6,3),(63,66,67,6,3),(64,67,68,5,3),(65,68,69,5,3),(66,69,70,5,3),(67,70,71,5,3),(68,71,72,5,3),(69,72,73,4,3),(70,13,30,2,2),(71,10,43,3,3),(72,11,52,3,3),(73,28,42,4,4),(74,29,51,4,4),(75,29,65,4,4),(76,51,65,3,3),(77,44,54,3,3),(78,66,12,3,3);
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
  `label_offset_y` int DEFAULT NULL,
  `label_offset_x` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Девяткино','#E60012',938,204,NULL,NULL),(2,'Гражданский проспект','#E60012',938,260,NULL,NULL),(3,'Академическая','#E60012',938,316,NULL,NULL),(4,'Политехническая','#E60012',938,372,NULL,NULL),(5,'Площадь Мужества','#E60012',938,428,NULL,NULL),(6,'Лесная','#E60012',938,484,NULL,NULL),(7,'Выборгская','#E60012',938,540,NULL,NULL),(8,'Площадь Ленина','#E60012',938,596,NULL,NULL),(9,'Чернышевская','#E60012',938,660,NULL,NULL),(10,'Площадь Восстания','#E60012',938,708,NULL,NULL),(11,'Владимирская','#E60012',923,869,NULL,NULL),(12,'Пушкинская','#E60012',804,988,-20,-70),(13,'Технологический институт-1','#E60012',701,1091,-20,40),(14,'Балтийская','#E60012',622,1170,NULL,NULL),(15,'Нарвская','#E60012',546,1246,NULL,NULL),(16,'Кировский завод','#E60012',504,1308,NULL,NULL),(17,'Автово','#E60012',504,1364,NULL,NULL),(18,'Ленинский проспект','#E60012',504,1420,NULL,NULL),(19,'Проспект Ветеранов','#E60012',504,1476,NULL,NULL),(20,'Парнас','#0078BF',716,204,NULL,NULL),(21,'Проспект Просвещения','#0078BF',716,260,NULL,NULL),(22,'Озерки','#0078BF',716,316,NULL,NULL),(23,'Удельная','#0078BF',716,372,NULL,NULL),(24,'Пионерская','#0078BF',716,428,NULL,NULL),(25,'Черная речка','#0078BF',716,484,NULL,NULL),(26,'Петроградская','#0078BF',716,540,NULL,NULL),(27,'Горьковская','#0078BF',716,596,NULL,NULL),(28,'Невский проспект','#0078BF',716,714,NULL,NULL),(29,'Сенная площадь','#0078BF',716,842,-40,30),(30,'Технологический институт-2','#0078BF',716,1076,NULL,NULL),(31,'Фрунзенская','#0078BF',716,1140,NULL,NULL),(32,'Московский ворота','#0078BF',716,1196,NULL,NULL),(33,'Электросила','#0078BF',716,1252,NULL,NULL),(34,'Парк Победы','#0078BF',716,1308,NULL,NULL),(35,'Московская','#0078BF',716,1364,NULL,NULL),(36,'Звёздная','#0078BF',716,1420,NULL,NULL),(37,'Купчино','#0078BF',716,1476,NULL,NULL),(38,'Беговая','#00985F',286,484,NULL,NULL),(39,'Зенит','#00985F',286,540,NULL,NULL),(40,'Приморская','#00985F',286,650,NULL,NULL),(41,'Василеостровская','#00985F',372,734,-10,30),(42,'Гостиный двор','#00985F',716,734,-10,30),(43,'Маяковская','#00985F',938,734,-20,35),(44,'Площадь Александра Невского-1','#00985F',1202,834,-35,30),(45,'Елизаровская','#00985F',1202,1086,NULL,NULL),(46,'Ломоносовская','#00985F',1202,1140,NULL,NULL),(47,'Пролетарская','#00985F',1202,1196,NULL,NULL),(48,'Обухово','#00985F',1202,1252,NULL,NULL),(49,'Рыбацкое','#00985F',1202,1308,NULL,NULL),(50,'Горный институт','#F58220',372,854,-30,30),(51,'Спасская','#F58220',734,854,-30,30),(52,'Достоевская','#F58220',938,854,-30,30),(53,'Лиговский проспект','#F58220',1042,854,-30,30),(54,'Площадь Александра Невского-2','#F58220',1202,854,-30,30),(55,'Новочеркасская','#F58220',1463,922,NULL,NULL),(56,'Ладожская','#F58220',1463,982,NULL,NULL),(57,'Проспект Большевиков','#F58220',1463,1045,NULL,NULL),(58,'Улица Дыбенко','#F58220',1463,1111,NULL,NULL),(59,'Комендантский проспект','#800080',504,426,NULL,NULL),(60,'Старая Деревня','#800080',504,484,NULL,NULL),(61,'Крестовский остров','#800080',504,540,NULL,NULL),(62,'Чкаловская','#800080',504,614,NULL,NULL),(63,'Спортивная','#800080',528,686,NULL,NULL),(64,'Адмиралтейская','#800080',637,789,-20,-90),(65,'Садовая','#800080',716,866,-10,30),(66,'Звенигородская','#800080',819,973,NULL,NULL),(67,'Обводный канал','#800080',903,1055,NULL,NULL),(68,'Волковская','#800080',938,1196,NULL,NULL),(69,'Бухарестская','#800080',938,1252,NULL,NULL),(70,'Международная','#800080',938,1308,NULL,NULL),(71,'Проспект Славы','#800080',938,1364,NULL,NULL),(72,'Дунайская','#800080',938,1420,NULL,NULL),(73,'Шушары','#800080',938,1476,NULL,NULL);
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

-- Dump completed on 2025-06-03 19:16:01
