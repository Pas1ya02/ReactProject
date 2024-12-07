-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: anura_opticals
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `mobile_number` varchar(10) NOT NULL,
  `admin_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`mobile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('0718822276','admin','123456789');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Frames'),(2,'Lense');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `mobile` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0718822276','pasindu perera','22'),('0718822444','Nimal','42'),('0772601571','kalana Perera','35'),('0774852222','kasun','45');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `mobile` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nic` varchar(45) NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('0718822276','asira perera','adcd7048512e64b48da55b027577886ee5a36350','200223201191');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `Invoice_Number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` varchar(45) NOT NULL,
  `order_code` varchar(45) NOT NULL,
  PRIMARY KEY (`Invoice_Number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `total_amount` double NOT NULL,
  `payment` double NOT NULL,
  `due_amount` double NOT NULL,
  `payment_method_id` int NOT NULL,
  `order_code` varchar(45) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_payment_method1_idx` (`payment_method_id`),
  KEY `fk_order_customer1_idx` (`customer_mobile`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_order_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (73,5500,5000,500,1,'512437','0718822276','2024-09-14','2024-09-14 19:57:07'),(74,3000,3000,0,2,'765298','0772601571','2024-09-14','2024-09-14 19:58:09'),(75,3000,2800,200,1,'875946','0718822276','2024-09-14','2024-09-14 20:10:41');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_code` int NOT NULL,
  `unit_price` double NOT NULL,
  `qty` int NOT NULL,
  `total` double NOT NULL,
  `product_code` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_details_product1_idx` (`product_code`),
  CONSTRAINT `fk_order_details_product1` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (225,156843,2000,1,2000,1794),(226,548172,2000,1,2000,1794),(228,451792,2500,1,2500,3146),(229,972351,2000,1,2000,1794),(230,261974,2000,1,2000,1794),(231,973218,1800,1,1800,2195),(232,854219,1200,1,1200,1794),(233,658421,1000,1,1000,1794),(234,942863,1500,1,1500,1794),(235,548672,2000,1,2000,1794),(236,286731,2000,1,2000,1794),(237,239457,1200,1,1200,1794),(238,276891,2000,1,2000,4526),(239,761394,1500,2,3000,1794),(240,891762,200,1,200,1794),(241,983456,2000,1,2000,1794),(242,796421,5000,1,5000,2873),(243,825439,50003,1,50003,1794),(244,351479,2000,1,2000,1794),(245,251674,2500,1,2500,2195),(246,512437,4500,1,4500,1794),(247,765298,2000,1,2000,1794),(248,875946,2000,1,2000,1794),(251,827954,4200,1,4200,1794);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'cash'),(2,'card'),(3,'cash & card');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `left_DIS_sph` varchar(45) DEFAULT NULL,
  `left_DIS_cyt` varchar(45) DEFAULT NULL,
  `left_DIS_axis` varchar(45) DEFAULT NULL,
  `left_ADD_sph` varchar(45) DEFAULT NULL,
  `left_ADD_cyt` varchar(45) DEFAULT NULL,
  `left_ADD_axis` varchar(45) DEFAULT NULL,
  `right_DIS_sph` varchar(45) DEFAULT NULL,
  `right_DIS_cyt` varchar(45) DEFAULT NULL,
  `right_DIS_axis` varchar(45) DEFAULT NULL,
  `right_ADD_sph` varchar(45) DEFAULT NULL,
  `right_ADD_cyt` varchar(45) DEFAULT NULL,
  `right_ADD_axis` varchar(45) DEFAULT NULL,
  `order_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_code` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_code`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1246,'rayban blue',1),(1794,'rayban black',1),(2195,'dsdsd',1),(2873,'kkkkk',1),(3146,'lens001',2),(4198,'rayban',1),(4526,'DOOS',1),(4935,'ssddd',1),(5219,'gsdd',1),(5829,'gggggg',1),(5934,'Black Lense',2),(6453,'sdsdswe',1),(7128,'ghghgh',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-07 15:28:59
