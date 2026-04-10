-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: alexandria_online
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a51d14c8-ffa5-11f0-95d3-e42f3fadaa49:1-191';

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL,
  `author_first_name` varchar(100) DEFAULT NULL,
  `author_last_name` varchar(100) DEFAULT NULL,
  `author_pen_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Andy','Weir','N/A'),(2,'JRR','Tolkien','J.R.R. Tolkien'),(3,'Jane','Austen','N/A'),(4,'F','Scott Fitzgerald','N/A'),(5,'George','Orwell','N/A'),(6,'Harper','Lee','N/A'),(7,'Stephen','King','N/A'),(8,'Agatha','Christie','N/A'),(9,'Isaac','Asimov','N/A'),(10,'Arthur','C Clarke','N/A'),(11,'Frank','Herbert','N/A'),(12,'Neil','Gaiman','N/A'),(13,'Terry','Pratchett','N/A'),(14,'Suzanne','Collins','N/A'),(15,'John','Green','N/A'),(16,'Dan','Brown','N/A'),(17,'Paulo','Coelho','N/A'),(18,'Yann','Martel','N/A'),(19,'Cormac','McCarthy','N/A'),(20,'Gillian','Flynn','N/A'),(21,'Stieg','Larsson','N/A'),(22,'Patrick','Rothfuss','N/A'),(23,'Ernest','Cline','N/A'),(24,'Alex','Michaelides','N/A');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_books`
--

DROP TABLE IF EXISTS `authors_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_books` (
  `authors_books` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`authors_books`),
  KEY `author_id` (`author_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `authors_books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `authors_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books`
--

LOCK TABLES `authors_books` WRITE;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_genres`
--

DROP TABLE IF EXISTS `authors_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_genres` (
  `author_genres_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`author_genres_id`),
  KEY `author_id` (`author_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `authors_genres_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `authors_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_genres`
--

LOCK TABLES `authors_genres` WRITE;
/*!40000 ALTER TABLE `authors_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `booke_published_date` date DEFAULT NULL,
  `book_isbn` varchar(20) DEFAULT NULL,
  `shelf_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_isbn` (`book_isbn`),
  KEY `shelf_id` (`shelf_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`shelf_id`) REFERENCES `shelves` (`shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Lord of the Rings','1954-07-29','2611252',1),(2,'Project Hail Mary','2021-05-04','5935229',2),(3,'Pride and prejudice','1813-01-28','84763454',1),(4,'The Great Gatsby','1925-04-10','4321252',3),(5,'The Martian','2011-02-11','9780804139021',1),(6,'Project Hail Mary','2021-05-04','9780593135204',1),(7,'The Hobbit','1937-09-21','9780345339683',2),(8,'The Fellowship of the Ring','1954-07-29','9780261103573',2),(9,'Pride and Prejudice','1813-01-28','9780141439518',3),(10,'Emma','1815-12-23','9780141439587',3),(11,'The Great Gatsby','1925-04-10','9780743273565',4),(12,'Tender Is the Night','1934-04-12','9780684801544',4),(13,'1984','1949-06-08','9780451524935',5),(14,'Animal Farm','1945-08-17','9780451526342',5),(15,'To Kill a Mockingbird','1960-07-11','9780061120084',6),(16,'Go Set a Watchman','2015-07-14','9780062409850',6),(17,'The Shining','1977-01-28','9780307743657',7),(18,'It','1986-09-15','9780450411434',7),(19,'Murder on the Orient Express','1934-01-01','9780062073501',8),(20,'And Then There Were None','1939-11-06','9780062073488',8),(21,'Foundation','1951-05-01','9780553293357',9),(22,'I Robot','1950-12-02','9780553382563',9),(23,'2001 A Space Odyssey','1968-07-01','9780451457998',10),(24,'Rendezvous with Rama','1973-06-01','9780575077331',10),(25,'Dune','1965-08-01','9780441172719',11),(26,'Dune Messiah','1969-10-15','9780441172696',11),(27,'American Gods','2001-06-19','9780062572233',12),(28,'Neverwhere','1996-09-16','9780380789016',12),(29,'Good Omens','1990-05-01','9780060853983',13),(30,'Small Gods','1992-05-01','9780062237378',13),(31,'The Hunger Games','2008-09-14','9780439023528',14),(32,'Catching Fire','2009-09-01','9780439023498',14),(33,'The Fault in Our Stars','2012-01-10','9780525478812',15),(34,'Looking for Alaska','2005-03-03','9780525475064',15),(35,'The Da Vinci Code','2003-04-03','9780307474278',16),(36,'Angels and Demons','2000-05-01','9781416524793',16),(37,'The Alchemist','1988-04-15','9780061122415',17),(38,'Brida','1990-01-01','9780061762703',17),(39,'Life of Pi','2001-09-11','9780156027328',18),(40,'Beatrice and Virgil','2010-02-02','9780385660068',18),(41,'The Road','2006-09-26','9780307387899',19),(42,'No Country for Old Men','2005-07-19','9780307387134',19),(43,'Gone Girl','2012-06-05','9780307588371',20),(44,'Sharp Objects','2006-09-26','9780307341556',20),(45,'The Girl with the Dragon Tattoo','2005-08-01','9780307454546',21),(46,'The Girl Who Played with Fire','2006-05-01','9780307454553',21),(47,'The Name of the Wind','2007-03-27','9780756404741',22),(48,'The Wise Man Fear','2011-03-01','9780756404734',22),(49,'Ready Player One','2011-08-16','9780307887443',23),(50,'Ready Player Two','2020-11-24','9781524761332',23),(51,'The Silent Patient','2019-02-05','9781250301697',24),(52,'The Maidens','2021-06-10','9781250304452',24);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_genres` (
  `books_genres_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`books_genres_id`),
  KEY `book_id` (`book_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `books_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_genres`
--

LOCK TABLES `books_genres` WRITE;
/*!40000 ALTER TABLE `books_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(100) DEFAULT NULL,
  `genre_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fantasy','Stories in medievel settings with magic.'),(2,'Science Fiction','Books that contain advanced technologies and real science.'),(3,'Mystery','Detective stories.'),(4,'Horror','Scary and intense stories.'),(5,'Romance','Love stories.'),(6,'Thriller','Fast paced suspense stories'),(7,'Adventure','Exploration and action stories'),(8,'Biography','Stories about real people'),(9,'Historical Fiction','Stories set in historical periods'),(10,'Young Adult','Books aimed at teenage readers'),(11,'Drama','Emotionally driven storytelling'),(12,'Crime','Stories involving criminal investigations'),(13,'Poetry','Collections of poems'),(14,'Philosophy','Books discussing philosophical ideas'),(15,'Self Help','Books about personal improvement'),(16,'Travel','Books about places and journeys'),(17,'Education','Academic or instructional books'),(18,'Technology','Books about computers and tech'),(19,'Politics','Books about political systems'),(20,'Religion','Books about religious beliefs'),(21,'Mythology','Stories of ancient myths'),(22,'Classic Literature','Famous works of literature'),(23,'Satire','Humorous criticism of society'),(24,'Short Stories','Collections of short narratives');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `loan_checkout_date` date DEFAULT NULL,
  `loan_end_date` date NOT NULL,
  `loan_return_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,1,'2026-01-04','2026-04-04','2026-03-24'),(2,2,2,'2026-01-11','2026-03-08','2026-01-05'),(3,3,3,'2026-01-24','2026-04-04','2026-03-21'),(4,4,4,'2026-02-26','2026-03-20','2026-03-29'),(5,5,5,'2026-01-07','2026-03-20','2026-01-12'),(6,6,6,'2026-01-05','2026-03-07','2026-02-20'),(7,7,7,'2026-02-12','2026-03-08','2026-02-26'),(8,8,8,'2026-02-15','2026-03-25','2026-01-08'),(9,9,9,'2026-01-14','2026-03-04','2026-03-06'),(10,10,10,'2026-02-04','2026-04-03','2026-01-20'),(11,11,11,'2026-01-16','2026-03-28','2026-03-18'),(12,12,12,'2026-01-21','2026-03-22','2026-03-15'),(13,13,13,'2026-02-16','2026-03-01','2026-03-19'),(14,14,14,'2026-01-18','2026-03-04','2026-01-15'),(15,15,15,'2026-02-15','2026-03-17','2026-01-07'),(16,16,16,'2026-01-11','2026-03-17','2026-03-22'),(17,17,17,'2026-02-19','2026-03-29','2026-01-18'),(18,18,18,'2026-01-31','2026-03-26','2026-02-12'),(19,19,19,'2026-01-09','2026-03-24','2026-01-06'),(20,20,20,'2026-01-07','2026-04-03','2026-03-28'),(21,21,21,'2026-01-23','2026-04-05','2026-03-29'),(22,22,22,'2026-02-13','2026-03-22','2026-02-13'),(23,23,23,'2026-01-19','2026-03-02','2026-01-30'),(24,24,24,'2026-01-10','2026-04-04','2026-03-20'),(25,25,25,'2026-01-18','2026-03-15','2026-04-06'),(26,26,26,'2026-01-23','2026-03-01','2026-03-18'),(27,27,27,'2026-01-18','2026-03-25','2026-03-23'),(28,28,28,'2026-01-30','2026-03-16','2026-03-04'),(29,29,29,'2026-02-10','2026-04-01','2026-01-21'),(30,30,30,'2026-02-09','2026-03-26','2026-02-23');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelves`
--

DROP TABLE IF EXISTS `shelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelves` (
  `shelf_id` int NOT NULL,
  `shelf_location_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelves`
--

LOCK TABLES `shelves` WRITE;
/*!40000 ALTER TABLE `shelves` DISABLE KEYS */;
INSERT INTO `shelves` VALUES (1,'on the second floor and first from the stairs'),(2,'on the first floor and first from the door'),(3,'on the second floor and second from the stairs'),(4,'on the first floor near the front desk'),(5,'on the second floor near the windows'),(6,'on the third floor east wing'),(7,'on the third floor west wing'),(8,'on the basement archive level'),(9,'on the first floor children\'s section'),(10,'on the second floor study area'),(11,'on the second floor near the elevators'),(12,'on the first floor reference section'),(13,'on the third floor quiet study zone'),(14,'on the basement rare books room'),(15,'on the first floor multimedia area'),(16,'on the second floor computer lab'),(17,'on the third floor historical section'),(18,'on the second floor reading lounge'),(19,'on the first floor near magazines'),(20,'on the third floor philosophy section'),(21,'on the second floor science section'),(22,'on the first floor entrance display'),(23,'on the basement storage area'),(24,'on the second floor literature wing');
/*!40000 ALTER TABLE `shelves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_first_name` varchar(100) DEFAULT NULL,
  `user_last_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `user_signup_date` date DEFAULT NULL,
  `user_balance` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  CONSTRAINT `users_chk_1` CHECK ((`user_balance` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sean','Meegan','sean.meegan@gmail.com','210-123-4567','2026-04-07',3.67),(2,'Aubrey','Brooks','aubrey.brooks@gmail.com','210-234-5678','2026-04-08',6.21),(3,'Owen','Flatmen','owen.flatmen@gmail.com','210-345-6789','2026-04-06',0.01),(4,'Isi','Ataghauman','isi.ataghauman@gmail.com','210-456-7890','2026-04-04',9.99),(5,'Loren','Dunston','ldunston4@intel.com','413-897-0726','2025-05-15',8.93),(6,'Berta','Ney','bney5@mail.ru','187-413-5283','2026-02-21',9.62),(7,'Salim','Bagnal','sbagnal6@accuweather.com','615-893-2311','2025-07-11',5.76),(8,'Jennine','Wateridge','jwateridge7@cbc.ca','850-943-4179','2025-09-28',5.30),(9,'Abelard','Cowap','acowap8@woothemes.com','922-493-0682','2025-10-31',6.82),(10,'Laurella','Antusch','lantusch9@vk.com','449-676-7554','2025-09-17',7.27),(11,'Wallis','Siggin','wsiggina@tuttocitta.it','858-551-9144','2025-08-17',6.46),(12,'Zedekiah','Stiff','zstiffb@instagram.com','303-887-2594','2025-10-18',9.22),(13,'Meade','Wilse','mwilsec@pinterest.com','846-711-5184','2025-08-09',5.99),(14,'Charita','Balma','cbalmad@unblog.fr','595-543-6299','2025-04-11',3.94),(15,'Lyn','Ferreri','lferrerie@seattletimes.com','953-637-9413','2026-01-14',6.50),(16,'Nealon','Faulkner','nfaulknerf@ameblo.jp','919-646-2814','2025-04-30',6.43),(17,'Kassia','Edsell','kedsellg@nytimes.com','459-430-4833','2026-02-10',9.44),(18,'Othella','Hawthorn','ohawthornh@people.com.cn','164-389-3904','2025-09-14',6.91),(19,'Bellanca','Mountstephen','bmountstepheni@shareasale.com','890-581-7547','2026-01-13',4.03),(20,'Anstice','Pye','apyej@mysql.com','938-758-7950','2025-06-29',4.93),(21,'Madison','Aarons','maaronsk@mac.com','282-487-2628','2026-03-11',5.46),(22,'Elset','Dungee','edungeel@abc.net.au','303-189-4256','2025-12-07',4.33),(23,'Lyndy','McCaffrey','lmccaffreym@craigslist.org','433-324-2537','2026-02-23',9.24),(24,'Christabel','Benion','cbenionn@who.int','949-408-6307','2025-09-30',4.44),(25,'Doll','Poag','dpoago@usgs.gov','626-328-7597','2025-09-24',5.50),(26,'Bonny','Olenov','bolenovp@ask.com','367-111-7683','2025-10-16',2.06),(27,'Frans','Landre','flandreq@icq.com','119-132-0737','2025-07-19',7.44),(28,'Tilly','Ablott','tablottr@umn.edu','951-773-7828','2025-12-19',2.89),(29,'Bamby','Bygott','bbygotts@nymag.com','430-749-4672','2025-10-04',9.57),(30,'Yvon','Kent','ykentt@elegantthemes.com','249-881-2919','2025-11-09',4.38);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-09 19:58:03
