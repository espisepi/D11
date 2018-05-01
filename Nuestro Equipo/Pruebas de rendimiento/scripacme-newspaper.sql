start transaction;
create database `Acme-Newspaper`;

use `Acme-Newspaper`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete on `Acme-Newspaper`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Newspaper`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: acme-newspaper
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gfgqmtp2f9i5wsojt33xm0uth` (`userAccount_id`),
  KEY `AdminUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (576,0,'admin@acmenewspaper.com','admin 1','+34617557203','postal Adress admin 1','surname admin 1',563);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expirationMonth` varchar(255) DEFAULT NULL,
  `expirationYear` varchar(255) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `targetPage` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_pdtmvobr4ousebqlhebxwn7q0` (`title`),
  KEY `FK_7n9ussuxsi3k6rm34vajrccvn` (`agent_id`),
  CONSTRAINT `FK_7n9ussuxsi3k6rm34vajrccvn` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (627,0,'https://sumedico.com/wp-content/uploads/2016/06/C%C3%B3mo_saber_si_tu_gato_te_quiere.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/abci-cinco-policias-heridos-tras-batalla-campal-contra-clanes-estacion-linares-baeza-201804301112_noticia.html','title 1 Agent1',585),(628,0,'https://www.petdarling.com/articulos/wp-content/uploads/2014/11/eliminar-pis-de-gato.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/castilla-leon/abci-hombre-mata-paliza-expareja-burgos-201804300824_noticia.html','title 2 Agent1',585),(629,0,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWHlWg-bUOzO10ILqRtdH_xY9gLwxRUUDFIKJHUTEqbQq3_Cg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/abci-juez-pidio-absolver-manada-no-tiene-ningun-expediente-ultimos-cuatro-anos-201804301228_noticia.html','title 3 Agent1',585),(630,0,'https://t2.uc.ltmcdn.com/images/5/0/6/img_como_saber_si_un_gato_es_macho_o_hembra_con_fotos_10605_600.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 4 Agent2',586),(631,0,'https://cdn3.computerhoy.com/sites/computerhoy.com/files/styles/fullcontent/public/novedades/entender-gato.jpg?itok=GQSe1IVJ','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 5 Agent2 sexo',586),(632,0,'https://img.bekiamascotas.com/articulos/portada/51000/51644-h2.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 6 Agent3 viagra',587),(633,0,'https://sumedico.com/wp-content/uploads/2017/12/por-qu%C3%A9-adoptar-un-gato.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 7 Agent2 cialis',586),(634,0,'https://t2.ea.ltmcdn.com/es/images/3/4/8/img_como_ensenar_a_un_gato_a_sentarse_20843_600.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 8 Agent3',587);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5cg6nedtnilfs6spfq209syse` (`userAccount_id`),
  KEY `AgentUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_5cg6nedtnilfs6spfq209syse` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (585,0,'agent1@acmenewspaper.com','agent 1','+34652582643','postal Adress agent 1','surname agent 1',572),(586,0,'agent2@acmenewspaper.com','agent 2','+34652582643','postal Adress agent 2','surname agent 2',573),(587,0,'agent3@acmenewspaper.com','agent 3','+34352582643','postal Adress agent 3','surname agent 3',574),(588,0,'agent4@acmenewspaper.com','agent 4','+34654582643','postal Adress agent 4','surname agent 4',575);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `publishedMoment` date DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ipgmt2t51ohhv3v3e7079qt1v` (`draftMode`,`publishedMoment`,`title`,`body`,`summary`,`newspaper_id`,`writer_id`),
  KEY `FK_pftm848lf5hu8sd0vghfs605l` (`newspaper_id`),
  KEY `FK_tushlj62v3v30iqifyful69d` (`writer_id`),
  CONSTRAINT `FK_tushlj62v3v30iqifyful69d` FOREIGN KEY (`writer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pftm848lf5hu8sd0vghfs605l` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (605,0,'body chirp 1','\0','2017-09-20','summary article 1 this article is so long','title article 1 sex',589,577),(607,0,'body chirp 2 cialis','\0','2017-10-21','summary article 1 this article is so long and interesting','title article 2',590,577),(608,0,'body chirp 3','',NULL,'summary article 1 this article is so refreshing','title article 3',591,577),(609,0,'body chirp 4','',NULL,'summary article 1 this article is so long','title article 4',591,577),(610,0,'body chirp 5','\0','2017-09-20','summary article 1 this article is so cool viagra','title article 5',592,579),(612,0,'body chirp 6','\0','2017-09-20','summary especial article 6 this article is so long','title article 6',594,578),(614,0,'body chirp 7','\0','2017-09-20','summary article 1 this article is so long','title article 7',592,579),(616,0,'body impresionante chirp 8','\0','2017-09-20','summary article 1 this article is so long','title article 8',593,580),(617,0,'body chirp 9','\0','2016-10-21','summary article 1 this article is so long','title article 9',594,578),(618,0,'body chirp 10','\0','2016-10-21','summary article 1 this article is so long','title article 10',595,579),(619,0,'body chirp 11','\0','2016-10-21','summary article 1 this article is so long','title article 11',596,578),(620,0,'body chirp 12','\0','2016-10-21','summary article 1 this article is so long','title article 12',597,580);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_pictures`
--

DROP TABLE IF EXISTS `article_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_pictures` (
  `Article_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_slh5rr6y2n4ml5s20v5nlr52g` (`Article_id`),
  CONSTRAINT `FK_slh5rr6y2n4ml5s20v5nlr52g` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_pictures`
--

LOCK TABLES `article_pictures` WRITE;
/*!40000 ALTER TABLE `article_pictures` DISABLE KEYS */;
INSERT INTO `article_pictures` VALUES (605,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(605,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(605,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(607,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(607,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(607,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(608,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(608,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(608,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(609,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(609,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(609,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(610,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(610,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(610,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(612,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(612,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(612,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(614,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(614,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(614,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(616,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(616,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(616,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(617,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(617,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(617,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(618,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(618,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(618,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(619,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(619,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(619,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg'),(620,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg'),(620,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg'),(620,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg');
/*!40000 ALTER TABLE `article_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `postedMoment` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_n6v0v2dwnaeokhvh1spb6qfui` (`postedMoment`,`title`,`description`,`user_id`),
  KEY `FK_t10lk4j2g8uw7k7et58ytrp70` (`user_id`),
  CONSTRAINT `FK_t10lk4j2g8uw7k7et58ytrp70` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (598,0,'description chirp 1','2017-10-21','title chirp 1 cialis',577),(599,0,'description chirp 2','2018-01-21','title chirp 2 sexo',578),(600,0,'description chirp 3 sex','2018-01-21','title chirp 3',579),(601,0,'description chirp 4','2017-10-21','title chirp 4',577),(602,0,'description chirp 5','2016-01-21','title chirp 5',578),(603,0,'description chirp 6','2018-02-21','title chirp 6',579),(604,0,'description chirp 7','2018-01-21','title chirp 7',580);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem`
--

DROP TABLE IF EXISTS `configurationsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem`
--

LOCK TABLES `configurationsystem` WRITE;
/*!40000 ALTER TABLE `configurationsystem` DISABLE KEYS */;
INSERT INTO `configurationsystem` VALUES (621,0);
/*!40000 ALTER TABLE `configurationsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem_tabooword`
--

DROP TABLE IF EXISTS `configurationsystem_tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem_tabooword` (
  `ConfigurationSystem_id` int(11) NOT NULL,
  `tabooWords_id` int(11) NOT NULL,
  UNIQUE KEY `UK_atoy8roxhv9akeamxs61hujxr` (`tabooWords_id`),
  KEY `FK_4uqlduhykfkaeldgil1dx4ehl` (`ConfigurationSystem_id`),
  CONSTRAINT `FK_4uqlduhykfkaeldgil1dx4ehl` FOREIGN KEY (`ConfigurationSystem_id`) REFERENCES `configurationsystem` (`id`),
  CONSTRAINT `FK_atoy8roxhv9akeamxs61hujxr` FOREIGN KEY (`tabooWords_id`) REFERENCES `tabooword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem_tabooword`
--

LOCK TABLES `configurationsystem_tabooword` WRITE;
/*!40000 ALTER TABLE `configurationsystem_tabooword` DISABLE KEYS */;
INSERT INTO `configurationsystem_tabooword` VALUES (621,622),(621,623),(621,624),(621,625);
/*!40000 ALTER TABLE `configurationsystem_tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  KEY `CustomerUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (581,0,'customer1@acmenewspaper.com','customer 1','+34617557203','postal Adress customer 1','surname customer 1',564),(582,0,'customer2@acmenewspaper.com','customer 2','+34652582643','postal Adress customer 2','surname customer 2',565),(583,0,'customer3@acmenewspaper.com','customer 3','+34667437865','postal Adress customer 3','surname customer 3',566),(584,0,'customer4@acmenewspaper.com','customer 4','+34667437865','postal Adress customer 4','surname customer 4',567);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_underwrite`
--

DROP TABLE IF EXISTS `customer_underwrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_underwrite` (
  `Customer_id` int(11) NOT NULL,
  `underwrites_id` int(11) NOT NULL,
  UNIQUE KEY `UK_tlbqr8gy5aobf9g4fv39133m2` (`underwrites_id`),
  KEY `FK_csihs5rxnve4hu62ex2mopsix` (`Customer_id`),
  CONSTRAINT `FK_csihs5rxnve4hu62ex2mopsix` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_tlbqr8gy5aobf9g4fv39133m2` FOREIGN KEY (`underwrites_id`) REFERENCES `underwrite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_underwrite`
--

LOCK TABLES `customer_underwrite` WRITE;
/*!40000 ALTER TABLE `customer_underwrite` DISABLE KEYS */;
INSERT INTO `customer_underwrite` VALUES (581,642),(581,643),(581,644),(582,645),(582,646),(582,647),(584,641);
/*!40000 ALTER TABLE `customer_underwrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `publicationMoment` date DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_aer0q20rslre6418yqlfwmeek` (`article_id`),
  CONSTRAINT `FK_aer0q20rslre6418yqlfwmeek` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (606,0,'2017-10-21','summary 2','text followUp2','title followUp 2',605),(611,0,'2017-10-21','summary 3','text followUp3','title followUp 3',610),(613,0,'2017-10-21','summary 3','text followUp4','title followUp 4',612),(615,0,'2017-10-21','summary 5','text followUp5','title followUp 5',614),(728,0,'2017-10-21','summary 1','text 1','title followUp 1',620);
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup_pictures`
--

DROP TABLE IF EXISTS `followup_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup_pictures` (
  `FollowUp_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_be66suxjlinls1y3yymi3tc0d` (`FollowUp_id`),
  CONSTRAINT `FK_be66suxjlinls1y3yymi3tc0d` FOREIGN KEY (`FollowUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup_pictures`
--

LOCK TABLES `followup_pictures` WRITE;
/*!40000 ALTER TABLE `followup_pictures` DISABLE KEYS */;
INSERT INTO `followup_pictures` VALUES (606,'http://creativo.site/sodeme/wp-content/uploads/2016/03/articulos.jpg'),(606,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbsNo-dfvsa40IwGLZ5Cfn4msRIG1LtEzM_Vm0lOnTRsk6B0M'),(611,'http://creativo.site/sodeme/wp-content/uploads/2016/03/articulos.jpg'),(611,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbsNo-dfvsa40IwGLZ5Cfn4msRIG1LtEzM_Vm0lOnTRsk6B0M'),(613,'http://creativo.site/sodeme/wp-content/uploads/2016/03/articulos.jpg'),(613,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbsNo-dfvsa40IwGLZ5Cfn4msRIG1LtEzM_Vm0lOnTRsk6B0M'),(615,'http://creativo.site/sodeme/wp-content/uploads/2016/03/articulos.jpg'),(615,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbsNo-dfvsa40IwGLZ5Cfn4msRIG1LtEzM_Vm0lOnTRsk6B0M'),(728,'http://creativo.site/sodeme/wp-content/uploads/2016/03/articulos.jpg'),(728,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbsNo-dfvsa40IwGLZ5Cfn4msRIG1LtEzM_Vm0lOnTRsk6B0M');
/*!40000 ALTER TABLE `followup_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `messageFolder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_h27p9c2qmr2peaojb34sh9axv` (`messageFolder_id`,`subject`,`body`),
  CONSTRAINT `FK_iq38mox9qghnx2rc8hpdtmros` FOREIGN KEY (`messageFolder_id`) REFERENCES `messagefolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (714,0,'body1','2017-09-21','HIGH','subject1',654,585,576),(715,0,'body1','2017-09-21','HIGH','subject1',649,585,576),(716,0,'body2','2016-09-21','NEUTRAL','subject2',654,585,581),(717,0,'body2','2016-09-21','NEUTRAL','subject2',675,585,581),(718,0,'body3','2018-01-01','LOW','subject3',654,585,577),(719,0,'body3','2018-01-01','LOW','subject3',695,585,577);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagefolder`
--

DROP TABLE IF EXISTS `messagefolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagefolder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `modifiable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_qtw36ey8a18uy89ca2xvcpsb4` (`actor_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagefolder`
--

LOCK TABLES `messagefolder` WRITE;
/*!40000 ALTER TABLE `messagefolder` DISABLE KEYS */;
INSERT INTO `messagefolder` VALUES (648,0,'\0','In box',576),(649,0,'\0','Out box',576),(650,0,'\0','Notification box',576),(651,0,'\0','Trash box',576),(652,0,'\0','Spam box',576),(653,0,'','Folder 1',576),(654,0,'\0','In box',585),(655,0,'\0','Out box',585),(656,0,'\0','Notification box',585),(657,0,'\0','Trash box',585),(658,0,'\0','Spam box',585),(659,0,'\0','In box',586),(660,0,'\0','Out box',586),(661,0,'\0','Notification box',586),(662,0,'\0','Trash box',586),(663,0,'\0','Spam box',586),(664,0,'\0','In box',587),(665,0,'\0','Out box',587),(666,0,'\0','Notification box',587),(667,0,'\0','Trash box',587),(668,0,'\0','Spam box',587),(669,0,'\0','In box',588),(670,0,'\0','Out box',588),(671,0,'\0','Notification box',588),(672,0,'\0','Trash box',588),(673,0,'\0','Spam box',588),(674,0,'\0','In box',581),(675,0,'\0','Out box',581),(676,0,'\0','Notification box',581),(677,0,'\0','Trash box',581),(678,0,'\0','Spam box',581),(679,0,'\0','In box',582),(680,0,'\0','Out box',582),(681,0,'\0','Notification box',582),(682,0,'\0','Trash box',582),(683,0,'\0','Spam box',582),(684,0,'\0','In box',583),(685,0,'\0','Out box',583),(686,0,'\0','Notification box',583),(687,0,'\0','Trash box',583),(688,0,'\0','Spam box',583),(689,0,'\0','In box',584),(690,0,'\0','Out box',584),(691,0,'\0','Notification box',584),(692,0,'\0','Trash box',584),(693,0,'\0','Spam box',584),(694,0,'\0','In box',577),(695,0,'\0','Out box',577),(696,0,'\0','Notification box',577),(697,0,'\0','Trash box',577),(698,0,'\0','Spam box',577),(699,0,'\0','In box',578),(700,0,'\0','Out box',578),(701,0,'\0','Notification box',578),(702,0,'\0','Trash box',578),(703,0,'\0','Spam box',578),(704,0,'\0','In box',579),(705,0,'\0','Out box',579),(706,0,'\0','Notification box',579),(707,0,'\0','Trash box',579),(708,0,'\0','Spam box',579),(709,0,'\0','In box',580),(710,0,'\0','Out box',580),(711,0,'\0','Notification box',580),(712,0,'\0','Trash box',580),(713,0,'\0','Spam box',580);
/*!40000 ALTER TABLE `messagefolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `open` bit(1) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_trr5i0tpor3p4h2hubeeiyct6` (`open`,`publicationDate`,`title`,`description`,`publisher_id`),
  KEY `FK_6w4ywp7unfjqi2kflvm35ie1g` (`publisher_id`),
  CONSTRAINT `FK_6w4ywp7unfjqi2kflvm35ie1g` FOREIGN KEY (`publisher_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (589,0,'description newspaper 1','\0','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 1',577),(590,0,'description newspaper 2 sex','','https://supergracioso.com/wp-content/uploads/2015/05/Errores-en-peri%C3%B3dicos-%C2%A1INCRE%C3%8DBLES-Parte-I.jpg',NULL,'title newspaper 2',577),(591,0,'description newspaper 3','','https://supergracioso.com/wp-content/uploads/2015/05/Errores-en-peri%C3%B3dicos-%C2%A1INCRE%C3%8DBLES-Parte-I.jpg',NULL,'title accidente newspaper 3',577),(592,0,'description newspaper 4','\0','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 4',579),(593,0,'description newspaper 5 cialis','','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 5',580),(594,0,'description amanecer newspaper 6','','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 6',578),(595,0,'description newspaper 7','','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title terror newspaper 7',579),(596,0,'description newspaper 8','\0','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 8',578),(597,0,'description newspaper 9','\0','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg',NULL,'title newspaper 9',580);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_advertisement`
--

DROP TABLE IF EXISTS `newspaper_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_advertisement` (
  `Newspaper_id` int(11) NOT NULL,
  `advertisements_id` int(11) NOT NULL,
  UNIQUE KEY `UK_tb7o1y9ulk08rvr5l4xqt0myr` (`advertisements_id`),
  KEY `FK_97th6woe726kprc71xhahdq9f` (`Newspaper_id`),
  CONSTRAINT `FK_97th6woe726kprc71xhahdq9f` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_tb7o1y9ulk08rvr5l4xqt0myr` FOREIGN KEY (`advertisements_id`) REFERENCES `advertisement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_advertisement`
--

LOCK TABLES `newspaper_advertisement` WRITE;
/*!40000 ALTER TABLE `newspaper_advertisement` DISABLE KEYS */;
INSERT INTO `newspaper_advertisement` VALUES (590,627),(590,630),(590,632),(591,628),(591,631),(593,629),(593,633),(593,634);
/*!40000 ALTER TABLE `newspaper_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expirationMonth` varchar(255) DEFAULT NULL,
  `expirationYear` varchar(255) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_nc1vf3np9y553nvhx2n6mxd1m` (`customer_id`,`newspaper_id`),
  KEY `FK_b3d3q413vlktogdjnnus3ep9e` (`newspaper_id`),
  CONSTRAINT `FK_b3d3q413vlktogdjnnus3ep9e` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_2i5w4btb7x3r6d2jsd213aqct` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (720,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',581,589),(721,0,'Brand name 2',123,'01','21','holder name 2','4388576018410707',582,589),(722,0,'Brand name 3',614,'01','19','holder name 3','4388576018410707',583,589),(723,0,'Brand name 4',614,'01','19','holder name 4','4388576018410707',584,592),(724,0,'Brand name 4',614,'01','19','holder name 4','4388576018410707',584,589),(725,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',581,596),(726,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',581,592),(727,0,'Brand name 2',123,'01','21','holder name 2','4388576018410707',582,596);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabooword`
--

DROP TABLE IF EXISTS `tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabooword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `default_word` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabooword`
--

LOCK TABLES `tabooword` WRITE;
/*!40000 ALTER TABLE `tabooword` DISABLE KEYS */;
INSERT INTO `tabooword` VALUES (622,0,'','sex'),(623,0,'','sexo'),(624,0,'','viagra'),(625,0,'','cialis'),(626,0,'\0','cialis 1');
/*!40000 ALTER TABLE `tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `underwrite`
--

DROP TABLE IF EXISTS `underwrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `underwrite` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expirationMonth` varchar(255) DEFAULT NULL,
  `expirationYear` varchar(255) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `volume_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1wgrvo3bnjcmmmwh9yu9lswlh` (`volume_id`),
  CONSTRAINT `FK_1wgrvo3bnjcmmmwh9yu9lswlh` FOREIGN KEY (`volume_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `underwrite`
--

LOCK TABLES `underwrite` WRITE;
/*!40000 ALTER TABLE `underwrite` DISABLE KEYS */;
INSERT INTO `underwrite` VALUES (641,0,'Brand name 4',614,'01','19','holder name 4','4388576018410707',635),(642,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',637),(643,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',638),(644,0,'Brand name 1',123,'06','20','holder name 1','4388576018410707',639),(645,0,'Brand name 2',123,'01','21','holder name 2','4388576018410707',635),(646,0,'Brand name 2',123,'01','21','holder name 2','4388576018410707',637),(647,0,'Brand name 2',123,'01','21','holder name 2','4388576018410707',638);
/*!40000 ALTER TABLE `underwrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  KEY `UserUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (577,0,'user1@acmenewspaper.com','user 1','+34617557203','postal Adress user 1','surname user 1',568),(578,0,'user2@acmenewspaper.com','user 2','+34617557203','postal Adress user 2','surname user 2',569),(579,0,'user3@acmenewspaper.com','user 3','+34648213455','postal Adress user 3','surname user 3',570),(580,0,'user4@acmenewspaper.com','user 4','+34648213455','postal Adress user 4','surname user 4',571);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `followers_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  KEY `FK_fkljans6a6pux89xnqbfcw3ho` (`followed_id`),
  KEY `FK_ipxcfus1p41qgn9xbfhg2aa0r` (`followers_id`),
  CONSTRAINT `FK_ipxcfus1p41qgn9xbfhg2aa0r` FOREIGN KEY (`followers_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_fkljans6a6pux89xnqbfcw3ho` FOREIGN KEY (`followed_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (577,578),(577,579),(577,580),(578,577),(578,579),(578,580),(579,577),(579,578),(579,580);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_volume`
--

DROP TABLE IF EXISTS `user_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_volume` (
  `User_id` int(11) NOT NULL,
  `volumes_id` int(11) NOT NULL,
  UNIQUE KEY `UK_gc15moa9t8kck7amqhv1kqdx2` (`volumes_id`),
  KEY `FK_njiv8khinvd4ihw4w0yw4lsqi` (`User_id`),
  CONSTRAINT `FK_njiv8khinvd4ihw4w0yw4lsqi` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_gc15moa9t8kck7amqhv1kqdx2` FOREIGN KEY (`volumes_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_volume`
--

LOCK TABLES `user_volume` WRITE;
/*!40000 ALTER TABLE `user_volume` DISABLE KEYS */;
INSERT INTO `user_volume` VALUES (577,635),(577,636),(578,637),(578,638),(579,639),(579,640);
/*!40000 ALTER TABLE `user_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (563,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(564,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(565,0,'5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(566,0,'033f7f6121501ae98285ad77f216d5e7','customer3'),(567,0,'55feb130be438e686ad6a80d12dd8f44','customer4'),(568,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(569,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(570,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(571,0,'3f02ebe3d7929b091e3d8ccfde2f3bc6','user4'),(572,0,'83a87fd756ab57199c0bb6d5e11168cb','agent1'),(573,0,'b1a4a6b01cc297d4677c4ca6656e14d7','agent2'),(574,0,'6f097a447415dd5030d579a9051165f0','agent3'),(575,0,'0d7745d57a8ae3fcacdd9fe6e54cac8a','agent4');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (563,'ADMIN'),(564,'CUSTOMER'),(565,'CUSTOMER'),(566,'CUSTOMER'),(567,'CUSTOMER'),(568,'USER'),(569,'USER'),(570,'USER'),(571,'USER'),(572,'AGENT'),(573,'AGENT'),(574,'AGENT'),(575,'AGENT');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
INSERT INTO `volume` VALUES (635,0,'description1','title volume1 user1',2018),(636,0,'description2','title volume2 user1',2018),(637,0,'description3','title volume3 user2',2018),(638,0,'description4','title volume4 user2',2018),(639,0,'description5','title volume5 user3',2018),(640,0,'description6','title volume6 user3',2018);
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_newspaper`
--

DROP TABLE IF EXISTS `volume_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_newspaper` (
  `Volume_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  KEY `FK_55de0xvt5cb2u4p2xkeofporj` (`newspapers_id`),
  KEY `FK_piiv98lkttksatc6qx4cncuas` (`Volume_id`),
  CONSTRAINT `FK_piiv98lkttksatc6qx4cncuas` FOREIGN KEY (`Volume_id`) REFERENCES `volume` (`id`),
  CONSTRAINT `FK_55de0xvt5cb2u4p2xkeofporj` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_newspaper`
--

LOCK TABLES `volume_newspaper` WRITE;
/*!40000 ALTER TABLE `volume_newspaper` DISABLE KEYS */;
INSERT INTO `volume_newspaper` VALUES (635,589),(635,590),(635,591),(636,591),(637,594),(637,596),(638,596),(639,592),(639,595),(640,595);
/*!40000 ALTER TABLE `volume_newspaper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 22:00:07

commit;