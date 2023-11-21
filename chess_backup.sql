-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: chessBackup
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `id_match` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tournament` int unsigned NOT NULL,
  `match_player` varchar(80) NOT NULL,
  `match_opponent` varchar(80) NOT NULL,
  `match_date` date DEFAULT (curdate()),
  `match_score_1` enum('1','0.5','0') DEFAULT NULL,
  `match_score_2` enum('1','0.5','0') DEFAULT NULL,
  PRIMARY KEY (`id_match`),
  UNIQUE KEY `id_match_UNIQUE` (`id_match`),
  KEY `id_tournament` (`id_tournament`),
  KEY `tournament_match_indx` (`id_match`,`id_tournament`),
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_tournament`) REFERENCES `tournament` (`id_tournament`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,2,'Магнус Карлсен','Хікару Накамура','2023-01-21','1','0'),(2,1,'Діна Бєлєнька','Дін Ліжень','2022-06-19','0.5','0.5'),(3,3,'Хікару Накамура','Дін Ліжень','2022-04-01','0','1'),(4,2,'Хікару Накамура','Магнус Карлсен','2023-01-21','0.5','0.5'),(5,3,'Магнус Карлсен','Діна Бєлєнька','2023-02-26','0.5','0.5'),(6,11,'Йорден Ван Форест','Магнус Карлсен','2022-06-01','0','1'),(7,7,'Рамешбабу Прагнанандха','Левон Аронян','2022-12-28','1','0'),(8,12,'Діна Бєлєнька','Левон Аронян','2022-12-12','0.5','0.5'),(9,9,'Дін Ліжень','Йорден Ван Форест','2018-09-27','1','0'),(10,5,'Гукеш Доммараджу','Магнус Карлсен','2022-01-20','0','1'),(11,2,'Гукеш Доммараджу','Рамешбабу Прагнанандха','2023-01-22','0','1'),(12,13,'Хікару Накамура','Йорден Ван Форест','2021-05-25','0.5','0.5'),(13,15,'Веслі Со','Хікару Накамура','2021-09-12','0.5','0.5'),(14,8,'Діна Бєлєнька','Рамешбабу Прагнанандха','2022-12-29','1','0'),(15,14,'Левон Аронян','Аніш Гірі','2022-10-27','0','1'),(16,14,'Веслі Со','Аніш Гірі','2022-10-28','0','1'),(17,15,'Аніш Гірі','Діна Бєлєнька','2021-09-13','0.5','0.5'),(18,6,'Магнус Карлсен','Хікару Накамура','2022-09-13','1','0'),(19,6,'Хікару Накамура','Магнус Карлсен','2022-09-13','0','1'),(20,3,'Дін Ліжень','Аніш Гірі','2022-04-01','1','0'),(21,4,'Діна Бєлєнька','Магнус Карлсен','2021-12-10','0','1'),(22,4,'Магнус Карлсен','Діна Бєлєнька','2021-12-10','0.5','0.5'),(23,14,'Веслі Со','Дін Ліжень','2022-10-30','1','0'),(24,10,'Йорден Ван Форест','Аніш Гірі','2022-09-05','1','0'),(25,4,'Йорден Ван Форест','Левон Аронян','2021-12-14','1','0'),(26,1,'Аніш Гірі','Хікару Накамура','2022-06-21','0','1'),(27,9,'Гукеш Доммараджу','Веслі Со','2018-09-25','0.5','0.5'),(28,9,'Гукеш Доммараджу','Йорден Ван Форест','2018-10-04','1','0'),(29,1,'Гукеш Доммараджу','Дін Ліжень','2022-07-03','0.5','0.5'),(30,1,'Дін Ліжень','Гукеш Доммараджу','2022-07-03','1','0'),(31,2,'Рамешбабу Прагнанандха','Гукеш Доммараджу','2023-01-25','0.5','0.5'),(32,2,'Дін Ліжень','Хікару Накамура','2023-01-26','1','0'),(33,2,'Магнус Карлсен','Дін Ліжень','2023-01-26','0.5','0.5'),(34,15,'Хікару Накамура','Веслі Со','2021-09-18','1','0'),(35,15,'Діна Бєлєнька','Аніш Гірі','2021-09-20','0','1'),(36,8,'Рамешбабу Прагнанандха','Діна Бєлєнька','2022-12-30','0','1'),(37,1,'Дін Ліжень','Діна Бєлєнька','2022-06-23','1','0'),(38,1,'Хікару Накамура','Аніш Гірі','2022-06-27','0','1'),(39,15,'Веслі Со','Діна Бєлєнька','2021-09-19','1','0'),(40,15,'Веслі Со','Діна Бєлєнька','2021-09-19','1','0'),(41,15,'Веслі Со','Діна Бєлєнька','2021-09-19','1','0'),(42,3,'Дін Ліжень','Аніш Гірі','2022-04-01','0.5','0.5');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `match_points_trigger` BEFORE INSERT ON `match` FOR EACH ROW BEGIN
IF (NEW.match_score_1 = '1' AND NEW.match_score_2 = '1') 
OR (NEW.match_score_1 = '0' AND NEW.match_score_2 = '0') 
OR (NEW.match_score_1 = '0.5' AND NEW.match_score_2 = '1') 
OR (NEW.match_score_1 = '1' AND NEW.match_score_2 = '0.5') 
OR (NEW.match_score_1 = '0.5' AND NEW.match_score_2 = '0')
OR (NEW.match_score_1 = '0' AND NEW.match_score_2 = '0.5')
THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: invalid values of match points.';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;

--
-- Temporary view structure for view `match_white_last_year_view`
--

DROP TABLE IF EXISTS `match_white_last_year_view`;
/*!50001 DROP VIEW IF EXISTS `match_white_last_year_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `match_white_last_year_view` AS SELECT 
 1 AS `id_match`,
 1 AS `id_tournament`,
 1 AS `match_player`,
 1 AS `match_opponent`,
 1 AS `match_date`,
 1 AS `match_score_1`,
 1 AS `match_score_2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `opening`
--

DROP TABLE IF EXISTS `opening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opening` (
  `id_opening` int unsigned NOT NULL AUTO_INCREMENT,
  `opening_name` varchar(50) NOT NULL,
  `opening_category` enum('Відкритий','Напіввідкритий','Закритий','Фланговий') NOT NULL,
  `opening_year` smallint DEFAULT NULL,
  `opening_famous_player` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_opening`),
  UNIQUE KEY `id_opening_UNIQUE` (`id_opening`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening`
--

LOCK TABLES `opening` WRITE;
/*!40000 ALTER TABLE `opening` DISABLE KEYS */;
INSERT INTO `opening` VALUES (1,'Скандинавський захист','Напіввідкритий',1475,'Карл Яніш'),(2,'Прийнятий ферзевий гамбіт','Закритий',1490,'Тигран Петросян'),(3,'Каталонський початок','Закритий',1929,'Магнус Карлсен'),(4,'Іспанська партія','Відкритий',1497,'Магнус Карлсен'),(5,'Дебют чотирьох коней','Відкритий',1534,'Михайло Ботвинник'),(6,'Угорська партія','Відкритий',1842,'Анатолій Карпов'),(7,'Захист Алехіна','Напіввідкритий',1921,'Іссак Болеславський'),(8,'Індійський захист','Закритий',1768,'Хікару Накамура'),(9,'Захист Каро-Канн','Напіввідкритий',1895,'Василь Іванчук'),(10,'Дебют Німцовича','Напіввідкритий',1906,'Ентоні Майлс'),(11,'Дебют Андерсена','Фланговий',1858,'Ксавері Тартаковер'),(12,'Захист Чигоріна','Закритий',1889,'Олександр Морозевич'),(13,'Голандський захист','Закритий',1789,'Магнус Карлсен'),(14,'Захист Петрова','Відкритий',1840,'Володимир Крамник'),(15,'Шотландська партія','Відкритий',1750,'Гаррі Каспаров'),(16,'Шотландський гамбіт','Відкритий',1833,'Анатолій Карпов'),(17,'Центральний дебют','Відкритий',1737,'Олександр Алехін'),(18,'Північний дебют','Відкритий',1867,'Мартін Фром'),(19,'Будапештський гамбіт','Закритий',1896,'Олександр Алехін'),(20,'Дебют Реті','Фланговий',1912,'Дін Ліжень');
/*!40000 ALTER TABLE `opening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_usage`
--

DROP TABLE IF EXISTS `opening_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opening_usage` (
  `id_opening_usage` int unsigned NOT NULL AUTO_INCREMENT,
  `id_opening` int unsigned DEFAULT NULL,
  `id_player` int unsigned NOT NULL,
  `opening_usage_points` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_opening_usage`),
  UNIQUE KEY `id_opening_usage_UNIQUE` (`id_opening_usage`),
  KEY `id_opening_idx` (`id_opening`),
  KEY `id_player_idx` (`id_player`),
  CONSTRAINT `id_usage_opening` FOREIGN KEY (`id_opening`) REFERENCES `opening` (`id_opening`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_usage_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_usage`
--

LOCK TABLES `opening_usage` WRITE;
/*!40000 ALTER TABLE `opening_usage` DISABLE KEYS */;
INSERT INTO `opening_usage` VALUES (1,1,5,45),(2,6,1,53),(3,3,3,50),(4,10,5,33),(5,4,7,56),(6,4,1,78),(7,11,5,44),(8,18,3,61),(9,19,2,70),(10,13,1,65),(11,8,3,56),(12,16,5,49),(13,3,1,71),(14,20,2,58),(15,10,10,44),(16,12,9,52),(17,6,6,64),(19,17,4,40),(20,1,4,71),(21,11,6,48),(22,20,7,52),(23,15,8,63),(24,2,10,50),(25,9,2,68),(26,14,9,40),(27,19,8,50),(28,19,10,51),(29,17,5,67),(30,2,1,71),(31,1,2,50),(32,1,5,38),(33,14,8,45),(34,1,7,71),(35,19,4,54),(36,4,4,50);
/*!40000 ALTER TABLE `opening_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id_player` int unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(80) NOT NULL,
  `player_gender` enum('Чоловіча','Жіноча') NOT NULL,
  `player_birthday` date NOT NULL,
  `player_country` varchar(30) NOT NULL,
  `player_nationality` varchar(30) DEFAULT NULL,
  `player_rate` int unsigned NOT NULL,
  `player_matches` int unsigned NOT NULL,
  `player_wins` int unsigned NOT NULL,
  PRIMARY KEY (`id_player`),
  UNIQUE KEY `id_player_UNIQUE` (`id_player`),
  UNIQUE KEY `player_name_UNIQUE` (`player_name`),
  KEY `player_country_indx` (`player_country`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Магнус Карлсен','Чоловіча','1990-11-30','Норвегія','Норвежець',2902,115,91),(2,'Дін Ліжень','Чоловіча','1992-10-24','Китай','Китаєць',2788,46,23),(3,'Хікару Накамура','Чоловіча','1987-12-09','США','Японець',2768,50,38),(4,'Аніш Гірі','Чоловіча','1994-06-28','Нідерланди','Росіянин',2768,98,70),(5,'Діна Бєлєнька','Жіноча','1993-12-22','Ізраїль','Росіянка',2269,24,15),(6,'Йорден Ван Форест','Чоловіча','1999-04-30','Нідерланди','Голандець',2684,76,50),(7,'Левон Аронян','Чоловіча','1982-10-06','США','Вірмен',2745,64,39),(8,'Рамешбабу Прагнанандха','Чоловіча','1985-08-10','Індія','Індієць',2691,88,50),(9,'Гукеш Доммараджу','Чоловіча','1986-05-29','Індія','Індієць',2730,91,61),(10,'Веслі Со','Чоловіча','1993-10-09','США','Філіппінець',2591,56,38);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_matches_trigger` BEFORE INSERT ON `player` FOR EACH ROW BEGIN
IF NEW.player_matches < NEW.player_wins 
THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: invalid values of matches and wins.';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title` (
  `id_title` int unsigned NOT NULL AUTO_INCREMENT,
  `title_name` varchar(40) NOT NULL,
  `title_year` year DEFAULT NULL,
  `id_player` int unsigned NOT NULL,
  PRIMARY KEY (`id_title`),
  UNIQUE KEY `id_title_UNIQUE` (`id_title`),
  KEY `id_player_idx` (`id_player`),
  KEY `title_name_indx` (`title_name`),
  CONSTRAINT `id_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` VALUES (1,'Гросмейстер',2004,1),(2,'16-тий чемпіон світу',2013,1),(3,'Гросмейстер',2009,2),(4,'Гросмейстер серед жінок',2016,5),(5,'Міжнародний майстер',2001,3),(6,'Майстер ФІДЕ',2008,4),(7,'Гросмейстер',2009,4),(8,'Чемпіон США',2019,3),(9,'Чемпіон США',2015,3),(10,'Чемпіон світу з рапіду',2022,1),(11,'Чемпіон світу з бліцу',2022,1),(12,'Чемпіон Санкт-Петербурга з шах',2018,5),(13,'Чемпіон Китаю',2009,2),(14,'Чемпіон Китаю',2011,2),(15,'Чемпіон Китаю',2012,2),(16,'Чемпіон Нідерландів',2012,4),(17,'Чемпіон Нідерландів',2012,4),(18,'Чемпіон Нідерландів',2015,4),(19,'Гросмейстер',2016,6),(20,'Гросмейстер',2000,7),(21,'Гросмейстер',2018,8),(22,'Гросмейстер',2019,9),(23,'Гросмейстер',2008,10),(24,'Міжнародний майстер',2006,10);
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `id_tournament` int unsigned NOT NULL AUTO_INCREMENT,
  `tournament_type` enum('Турнір','Чемпіонат','Олімпіада') NOT NULL,
  `tournament_name` varchar(80) NOT NULL,
  `tournament_start` date NOT NULL DEFAULT (curdate()),
  `tournament_end` date NOT NULL DEFAULT (curdate()),
  `tournament_connection` enum('Онлайн','Офлайн') DEFAULT NULL,
  `tournament_country` varchar(30) DEFAULT NULL,
  `tournament_city` varchar(30) DEFAULT NULL,
  `tournament_prize` int unsigned NOT NULL,
  `tournament_matches` int unsigned NOT NULL,
  `tournament_players` int unsigned NOT NULL,
  `tournament_prize_places` int unsigned NOT NULL,
  `tournament_current_champ` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_tournament`),
  UNIQUE KEY `id_tournament_UNIQUE` (`id_tournament`),
  KEY `tournament_name_indx` (`tournament_name`),
  KEY `tournament_type_indx` (`tournament_type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,'Турнір','Турнір претендентів 2022','2022-06-16','2022-07-05','Офлайн','Іспанія','Мадрид',500000,56,8,3,'Ян Непомнящий'),(2,'Турнір','Вейк-ан-Зее 2023','2023-01-13','2023-01-29','Офлайн','Нідерланди','Вейк-ан-Зее',36000,91,14,3,'Йорден Ван Форест'),(3,'Чемпіонат','Чемпіонат Європи із шахів 2022','2022-03-27','2022-04-07','Офлайн','Словенія','Брежице',100000,1727,314,5,'Антон Демченко'),(4,'Чемпіонат','Чемпіонат світу із шахів 2021','2021-12-10','2021-12-10','Офлайн','Об\'єднані Арабські Емірати','Дубаї',2000000,12,2,1,'Магнус Карлсен'),(5,'Турнір','Вейк-ан-Зее 2022','2022-01-14','2022-01-30','Офлайн','Нідерланди','Вейк-ан-Зее',40000,91,14,3,'Магнус Карлсен'),(6,'Чемпіонат','Чемпіонат світу ФІДЕ з довільних шахів 2022','2022-08-19','2022-10-30','Онлайн',NULL,NULL,400000,74,8,8,'Веслі Со'),(7,'Чемпіонат','Чемпіонат світу з рапіду 2022','2022-12-25','2022-12-28','Офлайн','Казахстан','Алмати',350000,1450,178,35,'Нодірбек Абдусатторов'),(8,'Чемпіонат','Чемпіонат світу з бліцу 2022','2022-12-29','2022-12-30','Офлайн','Казахстан','Алмати',350000,1438,176,35,'Максим Ваш\'є-Лаграв'),(9,'Олімпіада','Шахова олімпіада 2018','2018-09-23','2018-10-06','Офлайн','Грузія','Батумі',9000000,4069,1667,3,'Сбірна США'),(10,'Турнір','The Sinquefield Cup 2022','2022-09-01','2022-09-12','Офлайн','США','Сент-Луїс',350000,90,10,10,'Максим Ваш\'є-Лаграв'),(11,'Турнір','Norway Chess 2022','2022-05-31','2022-06-10','Офлайн','Норвегія','Ставангер',150000,90,10,10,'Магнус Карлсен'),(12,'Чемпіонат','Чемпіонат з швидких шахів 2022','2022-11-23','2022-12-18','Онлайн',NULL,NULL,110000,15,8,8,'Хікару Накамура'),(13,'Турнір','Шаховий турнір чемпіонів 2022','2020-11-22','2021-10-04','Онлайн',NULL,NULL,1500000,78,10,2,'Магнус Карлсен'),(14,'Чемпіонат','Чемпіонат США з шахів 2022','2022-10-19','2022-11-15','Офлайн','США','Сент-Луїс',1500000,132,23,3,'Фабіано Каруана'),(15,'Турнір','The Sinquefield Cup 2021','2021-09-10','2021-09-23','Офлайн','США','Сент-Луїс',325000,90,10,10,'Веслі Со'),(16,'Чемпіонат','Чемпіонат Європи із шахів 2023','2023-09-27','2023-10-17','Офлайн','Іспанія','Гранада',155000,1900,331,5,'Магнус Карлсен'),(17,'Чемпіонат','Чемпіонат Європи із шахів 2024','2023-09-27','2023-10-17','Офлайн','Польща','Катовіце',200000,2000,400,6,'Магнус Карлсен');
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tournament_insert_logging` AFTER INSERT ON `tournament` FOR EACH ROW BEGIN
INSERT INTO tournament_log VALUES(NEW.id_tournament, NEW.tournament_type, NEW.tournament_name, NEW.tournament_start, NEW.tournament_end, NEW.tournament_connection, NEW.tournament_country, NEW.tournament_city, NEW.tournament_prize, NEW.tournament_matches, NEW.tournament_players, NEW.tournament_prize_places, NEW.tournament_current_champ, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;

--
-- Table structure for table `tournament_log`
--

DROP TABLE IF EXISTS `tournament_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_log` (
  `id_tournament` int unsigned NOT NULL AUTO_INCREMENT,
  `tournament_type` enum('Турнір','Чемпіонат','Олімпіада') NOT NULL,
  `tournament_name` varchar(80) NOT NULL,
  `tournament_start` date NOT NULL,
  `tournament_end` date NOT NULL,
  `tournament_connection` enum('Онлайн','Офлайн') DEFAULT NULL,
  `tournament_country` varchar(30) DEFAULT NULL,
  `tournament_city` varchar(30) DEFAULT NULL,
  `tournament_prize` int unsigned NOT NULL,
  `tournament_matches` int unsigned NOT NULL,
  `tournament_players` int unsigned NOT NULL,
  `tournament_prize_places` int unsigned NOT NULL,
  `tournament_current_champ` varchar(80) DEFAULT NULL,
  `change_time` datetime NOT NULL,
  PRIMARY KEY (`id_tournament`),
  UNIQUE KEY `id_tournament_UNIQUE` (`id_tournament`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_log`
--

LOCK TABLES `tournament_log` WRITE;
/*!40000 ALTER TABLE `tournament_log` DISABLE KEYS */;
INSERT INTO `tournament_log` VALUES (17,'Чемпіонат','Чемпіонат Європи із шахів 2024','2023-09-27','2023-10-17','Офлайн','Польща','Катовіце',200000,2000,400,6,'Магнус Карлсен','2023-10-15 13:00:46');
/*!40000 ALTER TABLE `tournament_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_participation`
--

DROP TABLE IF EXISTS `tournament_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_participation` (
  `id_tournament_participation` int unsigned NOT NULL AUTO_INCREMENT,
  `id_player` int unsigned NOT NULL,
  `id_tournament` int unsigned NOT NULL,
  `tournament_participation_registration` date DEFAULT (curdate()),
  `tournament_participation_place` int unsigned NOT NULL,
  PRIMARY KEY (`id_tournament_participation`),
  UNIQUE KEY `id_tournament_participation_UNIQUE` (`id_tournament_participation`),
  KEY `id_player_idx` (`id_player`),
  KEY `id_tournament_idx` (`id_tournament`),
  CONSTRAINT `id_participation_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON UPDATE CASCADE,
  CONSTRAINT `id_participation_tournament` FOREIGN KEY (`id_tournament`) REFERENCES `tournament` (`id_tournament`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_participation`
--

LOCK TABLES `tournament_participation` WRITE;
/*!40000 ALTER TABLE `tournament_participation` DISABLE KEYS */;
INSERT INTO `tournament_participation` VALUES (1,1,3,'2022-02-01',1),(2,5,1,'2022-02-11',3),(3,2,1,'2022-01-21',1),(4,3,3,'2022-02-10',3),(5,2,2,'2022-11-15',4),(6,1,2,'2022-10-17',1),(7,1,4,'2021-01-01',1),(8,1,6,'2021-05-15',2),(9,1,5,'2021-07-30',2),(10,1,11,'2022-01-21',1),(11,2,3,'2021-11-01',2),(12,2,9,'2018-03-10',1),(13,2,14,'2022-07-14',6),(14,3,2,'2022-12-02',2),(15,3,1,'2022-02-06',2),(16,3,6,'2022-01-23',1),(17,3,13,'2020-06-01',1),(18,3,15,'2021-04-01',1),(19,4,1,'2022-03-30',5),(20,4,3,'2021-12-31',1),(21,4,10,'2022-07-20',4),(22,4,14,'2022-07-29',2),(23,4,15,'2021-05-01',3),(24,5,4,'2021-07-17',2),(25,5,8,'2022-09-19',7),(26,5,12,'2022-09-20',1),(27,5,15,'2022-06-30',2),(28,6,4,'2021-06-30',3),(29,6,9,'2018-06-18',3),(30,6,10,'2022-05-11',1),(31,6,11,'2022-02-01',1),(32,6,13,'2020-07-09',1),(33,7,7,'2022-01-02',1),(34,7,4,'2021-06-30',4),(35,7,12,'2022-09-20',2),(36,7,14,'2022-07-13',3),(37,8,2,'2022-11-19',3),(38,8,7,'2022-01-03',2),(39,8,8,'2022-09-20',1),(40,9,1,'2022-02-11',4),(41,9,2,'2022-10-20',5),(42,9,5,'2021-07-30',1),(43,9,9,'2018-03-30',2),(44,10,9,'2018-03-30',4),(45,10,14,'2022-07-13',1),(46,10,15,'2022-06-30',3);
/*!40000 ALTER TABLE `tournament_participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tournament_prize_champ_last_year_view`
--

DROP TABLE IF EXISTS `tournament_prize_champ_last_year_view`;
/*!50001 DROP VIEW IF EXISTS `tournament_prize_champ_last_year_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tournament_prize_champ_last_year_view` AS SELECT 
 1 AS `id_tournament`,
 1 AS `tournament_type`,
 1 AS `tournament_name`,
 1 AS `tournament_start`,
 1 AS `tournament_end`,
 1 AS `tournament_connection`,
 1 AS `tournament_country`,
 1 AS `tournament_city`,
 1 AS `tournament_prize`,
 1 AS `tournament_matches`,
 1 AS `tournament_players`,
 1 AS `tournament_prize_places`,
 1 AS `tournament_current_champ`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'chess'
--

--
-- Dumping routines for database 'chess'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_new_player` */;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_new_player`(IN id_player INT, IN new_player_name VARCHAR(80), IN player_gender ENUM('Чоловіча', 'Жіноча'), IN player_birthday DATE, IN player_country VARCHAR(30), IN player_nationality VARCHAR(30), IN player_rate INT, IN player_matches INT, IN player_wins INT)
BEGIN
DECLARE count INT DEFAULT 0;

SELECT COUNT(*) INTO count FROM player WHERE player.player_name = new_player_name;
IF count = 0 
THEN INSERT INTO player VALUES(id_player, new_player_name, player_gender, player_birthday, player_country, player_nationality, player_rate, player_matches, player_wins);
ELSE 
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Error: the player what you are trying to insert has already been inserted";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sort_players_by_rating` */;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sort_players_by_rating`()
BEGIN
SELECT * FROM player ORDER BY player_rate DESC, player_wins DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `sum_of_prizes_won_by_player` */;
ALTER DATABASE `chessBack` CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sum_of_prizes_won_by_player`(IN search_player_name VARCHAR(80), OUT sum_of_prizes BIGINT)
BEGIN
DECLARE count INT DEFAULT 0;

SELECT COUNT(*) INTO count FROM tournament WHERE tournament_current_champ = search_player_name;
IF count <> 0 
THEN SELECT SUM(tournament_prize) INTO sum_of_prizes FROM tournament WHERE tournament_current_champ = search_player_name;
ELSE 
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Error: there is no such player";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `chessBack` CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci ;

--
-- Final view structure for view `match_white_last_year_view`
--

/*!50001 DROP VIEW IF EXISTS `match_white_last_year_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `match_white_last_year_view` AS select `match`.`id_match` AS `id_match`,`match`.`id_tournament` AS `id_tournament`,`match`.`match_player` AS `match_player`,`match`.`match_opponent` AS `match_opponent`,`match`.`match_date` AS `match_date`,`match`.`match_score_1` AS `match_score_1`,`match`.`match_score_2` AS `match_score_2` from `match` where (`match`.`match_date` >= (now() - interval 12 month)) order by `match`.`match_player` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tournament_prize_champ_last_year_view`
--

/*!50001 DROP VIEW IF EXISTS `tournament_prize_champ_last_year_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tournament_prize_champ_last_year_view` AS select `tournament`.`id_tournament` AS `id_tournament`,`tournament`.`tournament_type` AS `tournament_type`,`tournament`.`tournament_name` AS `tournament_name`,`tournament`.`tournament_start` AS `tournament_start`,`tournament`.`tournament_end` AS `tournament_end`,`tournament`.`tournament_connection` AS `tournament_connection`,`tournament`.`tournament_country` AS `tournament_country`,`tournament`.`tournament_city` AS `tournament_city`,`tournament`.`tournament_prize` AS `tournament_prize`,`tournament`.`tournament_matches` AS `tournament_matches`,`tournament`.`tournament_players` AS `tournament_players`,`tournament`.`tournament_prize_places` AS `tournament_prize_places`,`tournament`.`tournament_current_champ` AS `tournament_current_champ` from `tournament` where ((`tournament`.`tournament_start` >= (now() - interval 12 month)) and (`tournament`.`tournament_end` >= (now() - interval 12 month))) group by `tournament`.`tournament_prize`,`tournament`.`tournament_current_champ` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 12:07:58
