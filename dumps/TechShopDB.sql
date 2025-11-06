CREATE DATABASE  IF NOT EXISTS `techshop_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `techshop_db`;
-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: techshop_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `note` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `province` varchar(100) NOT NULL,
  `street` varchar(50) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1fa36y2oqhao3wgg2rw1pi459` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'2025-10-21 14:54:01.694391','Sang','hahahahaha','0379641588','Ho Chi Minh','52356 duong 223','2025-10-21 14:54:01.694453','Tang Nhon Phu',1,_binary '\0'),(2,'2025-10-21 15:05:24.181746','Sang','hahahahaha','0379641588','Ho Chi Minh','52356 duong 223','2025-10-21 15:05:24.181799','Tang Nhon Phu',1,_binary '\0'),(3,'2025-10-22 18:06:33.095340','sang','hihuhihu','097 964 15 99','sang','sang','2025-10-22 18:06:33.095353','sang',3,_binary ''),(4,'2025-10-30 06:57:48.559670','sang','dfsngsakjxfsd\n','097 964 15 99','Tiền giang','123','2025-10-30 07:02:39.589879','Châu thành ',1,_binary '\0'),(5,'2025-10-30 08:20:24.161974','sang','dhfgdfsg','097 964 15 99','Tiền giang','sang','2025-10-30 08:20:24.161995','Châu thành ',1,_binary '');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `discounted_price` decimal(19,2) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cart_product_size` (`cart_id`,`product_id`,`size`),
  KEY `idx_cart` (`cart_id`),
  KEY `idx_product` (`product_id`),
  CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (19,'2025-10-23 09:54:15.289639',34910300.00,35990000.00,5,1,'1TB',3);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `discount` int NOT NULL,
  `original_price` int NOT NULL,
  `total_discounted_price` int NOT NULL,
  `total_items` int NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK64t7ox312pqal3p7fg9o503c2` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,'2025-10-19 18:46:02.547336',0,0,0,0,'2025-10-30 09:28:02.715951',1),(3,'2025-10-23 09:54:15.227675',1079700,35990000,34910300,1,'2025-10-23 09:54:15.298782',5);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `is_parent` bit(1) NOT NULL,
  `level` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `idx_parent_category` (`parent_category_id`),
  CONSTRAINT `FK9il7y6fehxwunjeepq0n7g5rd` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2025-10-13 17:51:55.869689',_binary '',1,'Smartphones','2025-10-13 17:51:55.869742',NULL),(2,'2025-10-13 17:51:55.916271',_binary '\0',2,'Google Pixel','2025-10-13 17:51:55.916292',1),(3,'2025-10-13 17:51:55.950688',_binary '\0',2,'Xiaomi','2025-10-13 17:51:55.950705',1),(4,'2025-10-13 17:51:55.982469',_binary '\0',2,'Samsung','2025-10-13 17:51:55.982484',1),(5,'2025-10-13 17:51:56.015391',_binary '\0',2,'OPPO','2025-10-13 17:51:56.015406',1),(6,'2025-10-13 17:51:56.040358',_binary '\0',2,'Asus','2025-10-13 17:51:56.040373',1),(7,'2025-10-13 17:51:56.065663',_binary '\0',2,'iPhone','2025-10-13 17:51:56.065677',1),(8,'2025-10-26 15:59:55.564717',_binary '\0',2,'Samsung Galaxy S','2025-10-26 15:59:55.564763',1),(9,'2025-10-26 16:12:07.269463',_binary '\0',2,'Apple Iphone','2025-10-26 16:12:07.269510',1),(14,'2025-10-26 18:30:42.117563',_binary '\0',2,'Xiaomi Mi Series','2025-10-26 18:30:42.117623',1),(15,'2025-10-26 18:30:42.191785',_binary '\0',2,'Samsung Galaxy Z (foldable)','2025-10-26 18:30:42.191802',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `download_url` varchar(500) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product` (`product_id`),
  CONSTRAINT `FKghwsjbjo7mg3iufxruvq6iu3q` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,'2025-10-13 17:51:55.932236','https://imgproxy7.tinhte.vn/e7iz_lClja1y_ttVtInCOv0HE7j7N4TcWvs64lmYQu0/w:500/plain/https://photo2.tinhte.vn/data/attachment-files/2023/09/8127395_tren-tay-iphone-15-pro-ma-natural-titanium-tinhte.12.jpg','pixel-9-pro-side','image/jpeg',1),(4,'2025-10-13 17:51:55.959324','https://shopdunk.com/images/uploaded/iphone-15-xam-titan/dap-hop-iphone-15-titan-tu-nhien.jpg','xiaomi-15-pro-front','image/jpeg',2),(5,'2025-10-13 17:51:55.962402','https://mobileworld.com.vn/uploads/news/01_2023/pro7.jpg','xiaomi-15-pro-back','image/jpeg',2),(7,'2025-10-13 17:51:55.987648','https://didongthongminh.vn/upload_images/images/products/xiaomi-mi/original/xiaomi-13-pro-2_1685956373_1_copy.jpg','z-fold-6-unfolded','image/jpeg',3),(8,'2025-10-13 17:51:55.992864','https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/1/3/13_prooo_4_.jpg','z-fold-6-folded','image/jpeg',3),(9,'2025-10-13 17:51:55.997640','https://static.fnac-static.com/multimedia/Images/FR/NR/44/c7/d8/14206788/1541-4/tsp20220301100513/OPPO-FIND-X5-PRO-256GB-BLACK.jpg','z-fold-6-hinge','image/jpeg',3),(10,'2025-10-13 17:51:55.999499','https://images.techadvisor.com/cmsdata/reviews/3813726/oppo_find_x5_pro-06_thumb.jpg','z-fold-6-multitasking','image/jpeg',3),(11,'2025-10-13 17:51:56.019623','https://no1computer.vn/images/products/2023/02/10/large/acer-nitro-5-rtx-3060-jpg_1675967112-copy-1.jpg','Product 4 Image 1','JPG',4),(12,'2025-10-13 17:51:56.020978','https://laptop88.vn/media/lib/08-03-2023/acer-nitro-5-5669.jpg','Product 4 Image 2','JPG',4),(13,'2025-10-13 17:51:56.025732','https://laptop3mien.vn/wp-content/uploads/2023/06/Nitro-5-Eagle-AN515-57-54MV-3.jpg','Product 4 Image 3','JPG',4),(14,'2025-10-13 17:51:56.028460','https://cdn-v2.didongviet.vn/files/media/catalog/product/l/a/laptop-gaming-acer-nitro-5-eagle-an515-57-5669-didongviet.jpg','Product 4 Image 4','JPG',4),(16,'2025-10-13 17:51:56.049306','https://cdn.tgdd.vn/Products/Images/44/305745/asus-gaming-rog-strix-scar-17-g733pz-r9-ll980w-thumb-600x600.jpg','Product 5 Image 2','JPG',5),(17,'2025-10-13 17:51:56.050550','https://bizweb.dktcdn.net/100/497/222/products/20200824120842b374cd8323a5401d.jpg?v=1697689086317','Product 5 Image 3','JPG',5),(18,'2025-10-13 17:51:56.051600','https://cdn.tgdd.vn/Files/2022/07/29/1451311/asus-ra-mat-laptop-gaming-rog-strix-scar-17-se-cau-hinh-sieu-khung-5.jpg','Product 5 Image 4','JPG',5),(19,'2025-10-13 17:51:56.068874','https://phongvukinhbac.vn/wp-content/uploads/2021/09/man-hinh-lg-utragear-gaming-34gn850-b-phong-vu-kinh-bac-min.jpg10-min.jpg ','Product 17 Image 1','jpg',6),(21,'2025-10-13 17:51:56.070873','https://i.rtings.com/assets/products/7A4bsXUk/lg-34gn850-b/design-small.jpg?format=auto ','Product 17 Image 3','jpg',6),(22,'2025-10-13 17:51:56.097860','https://example.com/s24-ultra-1.jpg','galaxy-s24-ultra-1','image/jpeg',7),(23,'2025-10-26 15:59:55.628239','https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-4-chong-on-chu-dong-thumb_1.png ','Product 13 Image 1','png',8),(25,'2025-10-26 15:59:55.632683','https://tuanphong.vn/pictures/full/2020/03/1584963297-349-tai-nghe-bluetooth-apple-airpods-pro-7.jpg','Product 13 Image 3','jpg',8),(26,'2025-10-26 16:12:07.346475','https://minhvietstore.vn/wp-content/uploads/2021/03/xiaomiviet.vn-pin-sac-du-phong-xiaomi-power-bank-3-gen-3-30-000mah-xiaomi-power-bank-3--30.000-mah.jpg.webp','Product 9 Image 1','webp',9),(27,'2025-10-26 16:12:07.350269','https://gntek.vn/wp-content/uploads/2023/08/image-2023-08-04T212416.591.png.webp','Product 9 Image 2','webp',9),(30,'2025-10-26 18:30:42.217431','https://bizweb.dktcdn.net/thumb/grande/100/512/769/products/dell-xps-13-9340-2.webp?v=1716793972937','Product 6 Image 1','JPG',12),(31,'2025-10-26 18:30:42.221109','https://phucngoc.vn/Data/images/laptop-dell-xps-13-plus-9320.jpg','Product 6 Image 2','JPG',12),(32,'2025-10-26 18:30:42.223731','https://product.hstatic.net/1000089469/product/dell-xps-l322x-core-i5_master.jpg','Product 6 Image 3','JPG',12),(33,'2025-10-26 18:30:42.226346','https://file.hstatic.net/200000484561/file/12_6eea69fae5754fc6a3a14d62f7ff938c_grande.png','Product 6 Image 4','PNG',12),(34,'2025-10-26 18:30:42.232631','https://lapvip.vn/upload/products/original/hp-spectre-x360-14-2024-nightfall-black-1705650060.jpg','Product 7 Image 1','JPG',13),(35,'2025-10-26 18:30:42.234750','https://mac24h.vn/images/detailed/94/spectre-x360-2-in-1-14-2024-mac24h.jpg','Product 7 Image 2','JPG',13),(36,'2025-10-26 18:30:42.237408','https://www.cnet.com/a/img/resize/eae3840288fe99145fa33596146ecb448eff6a1b/hub/2021/04/12/ec06344f-4113-4966-9b4f-8fdcd129869f/014-hp-spectre-x360-14.jpg?auto=webp&fit=crop&height=900&width=1200','Product 7 Image 3','JPG',13),(37,'2025-10-26 18:30:42.239195','https://dangvu.vn/wp-content/uploads/2023/09/Surface-Laptop-5-va-HP-Spectre-X360-14-2023-Nen-mua-may-nao-15.webp','Product 7 Image 4','JPG',13),(39,'2025-10-27 10:27:21.986309','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761560841/smartvn/8054eb2d-3989-4429-891d-427128ecc61a.png','smartvn/8054eb2d-3989-4429-891d-427128ecc61a','image/png',1),(40,'2025-10-29 16:43:51.329563','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761756230/smartvn/d6a7bc75-662b-4d32-904a-b8f2004326b5.png','smartvn/d6a7bc75-662b-4d32-904a-b8f2004326b5','image/png',2),(41,'2025-10-29 16:45:01.643628','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761756300/smartvn/c7b17132-672a-42df-8eca-f06fddc5338b.png','smartvn/c7b17132-672a-42df-8eca-f06fddc5338b','image/png',2),(42,'2025-10-30 06:28:19.643584','https://minhvietstore.vn/wp-content/uploads/2021/03/xiaomiviet.vn-pin-sac-du-phong-xiaomi-power-bank-3-gen-3-30-000mah-xiaomi-power-bank-3--30.000-mah.jpg.webp','Product 9 Image 1','webp',15),(43,'2025-10-30 06:28:19.645723','https://gntek.vn/wp-content/uploads/2023/08/image-2023-08-04T212416.591.png.webp','Product 9 Image 2','webp',15),(44,'2025-10-30 06:28:19.647011','https://cdn.dienmaygiakhanh.com/Products/Images/57/216136/pin-sac-du-phong-polymer-10000mah-xiaomi-mi-18w-avatar-1-600x600.jpg','Product 9 Image 3','jpg',15),(45,'2025-10-30 06:28:19.648262','https://mivietnam.vn/wp-content/uploads/2019/12/MIVIETNAM-PINSDPPLM13ZM-01.jpg','Product 9 Image 4','jpg',15),(46,'2025-10-30 06:32:27.517526','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761805947/smartvn/309c5eca-c804-49ec-9b79-8cc6f835399b.png','smartvn/309c5eca-c804-49ec-9b79-8cc6f835399b','image/png',16),(47,'2025-10-30 06:38:53.663099','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761806333/smartvn/c3490891-1106-4cc1-985e-b89196cd6d80.png','smartvn/c3490891-1106-4cc1-985e-b89196cd6d80','image/png',17),(48,'2025-10-30 06:40:32.173589','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761806432/smartvn/8a457cfa-3b61-4baa-b120-94c26b0195d2.png','smartvn/8a457cfa-3b61-4baa-b120-94c26b0195d2','image/png',18),(49,'2025-10-30 06:40:36.486434','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761806436/smartvn/aa651197-6853-469a-baa5-a4cc62a55e50.png','smartvn/aa651197-6853-469a-baa5-a4cc62a55e50','image/png',18),(50,'2025-10-30 06:40:38.831806','http://res.cloudinary.com/dgygvrrjs/image/upload/v1761806438/smartvn/3d4f018e-7543-4e9c-b93d-138dd4dc3bda.png','smartvn/3d4f018e-7543-4e9c-b93d-138dd4dc3bda','image/png',18);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `discount_percent` int NOT NULL,
  `discounted_price` decimal(19,2) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_product_size` (`product_id`,`size`),
  KEY `idx_inventory_product` (`product_id`),
  CONSTRAINT `FKq2yge7ebtfuvwufr6lwfwqy9l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'2025-10-13 17:51:55.934467',8,26670800.00,28990000.00,20,'256GB','2025-10-22 15:58:36.783094',1),(2,'2025-10-13 17:51:55.937158',5,30390500.00,31990000.00,9,'Sangggg','2025-10-29 16:42:17.635238',1),(3,'2025-10-13 17:51:55.967091',12,22871200.00,25990000.00,34,'256GBC','2025-10-29 16:54:03.220921',2),(4,'2025-10-13 17:51:55.969144',10,26091000.00,28990000.00,25,'sangC','2025-10-29 16:54:03.237627',2),(5,'2025-10-13 17:51:55.970826',7,29750700.00,31990000.00,10,'1TBC','2025-10-29 16:54:03.203921',2),(6,'2025-10-13 17:51:56.000955',5,40840500.00,42990000.00,17,'256GB','2025-10-30 09:28:02.704890',3),(7,'2025-10-13 17:51:56.002458',3,45580300.00,46990000.00,10,'512GB','2025-10-13 17:51:56.002471',3),(8,'2025-10-13 17:51:56.030246',10,26991000.00,29990000.00,21,'256GB','2025-10-23 11:19:49.123917',4),(9,'2025-10-13 17:51:56.031963',8,30350800.00,32990000.00,15,'512GB','2025-10-13 17:51:56.031979',4),(10,'2025-10-13 17:51:56.052802',5,30390500.00,31990000.00,15,'512GB','2025-10-13 17:51:56.052813',5),(11,'2025-10-13 17:51:56.053948',3,34910300.00,35990000.00,6,'1TB','2025-10-23 09:06:56.664165',5),(12,'2025-10-13 17:51:56.073296',5,33240500.00,34990000.00,25,'256GB','2025-10-13 17:51:56.073316',6),(13,'2025-10-13 17:51:56.076716',5,37990500.00,39990000.00,15,'512GB','2025-10-13 17:51:56.076738',6),(14,'2025-10-13 17:51:56.079707',3,43640300.00,44990000.00,10,'1TB','2025-10-13 17:51:56.079725',6),(15,'2025-10-13 17:51:56.099334',10,26991000.00,29990000.00,30,'256GB','2025-10-13 17:51:56.099346',7),(16,'2025-10-13 17:51:56.102458',8,31270800.00,33990000.00,20,'512GB','2025-10-13 17:51:56.102470',7),(17,'2025-10-26 15:59:55.624133',5,31340500.00,32990000.00,30,'256GB','2025-10-26 15:59:55.624149',8),(18,'2025-10-26 15:59:55.626206',0,36990000.00,36990000.00,15,'512GB','2025-10-26 15:59:55.626215',8),(19,'2025-10-26 16:12:07.340117',0,33990000.00,33990000.00,40,'256GB','2025-10-26 16:12:07.340136',9),(20,'2025-10-26 16:12:07.343343',0,39990000.00,39990000.00,25,'512GB','2025-10-26 16:12:07.343364',9),(21,'2025-10-26 18:30:42.210052',3,31030300.00,31990000.00,15,'512GB','2025-10-26 18:30:42.210085',12),(22,'2025-10-26 18:30:42.213982',0,34990000.00,34990000.00,8,'1TB','2025-10-26 18:30:42.213996',12),(23,'2025-10-26 18:30:42.228472',5,41790500.00,43990000.00,25,'512GB','2025-10-26 18:30:42.228482',13),(24,'2025-10-26 18:30:42.230606',0,48990000.00,48990000.00,10,'1TB','2025-10-26 18:30:42.230617',13),(25,'2025-10-27 09:41:44.808541',5,1900000000.00,2000000000.00,20,'sang','2025-10-27 09:41:44.808977',1),(26,'2025-10-27 10:22:36.174515',50,5000000.00,9999999.00,1000,'SIMAY','2025-10-27 10:37:34.815594',8),(27,'2025-10-29 16:43:18.090745',50,50000000.00,99999999.00,1000,'sanggggggggcuto','2025-10-29 16:43:18.090756',2),(28,'2025-10-30 06:27:05.623966',50,2500000.00,5000000.00,50,'ccc','2025-10-30 06:27:05.623986',14),(29,'2025-10-30 06:28:19.639562',0,33990000.00,33990000.00,40,'256GB','2025-10-30 06:28:19.639568',15),(30,'2025-10-30 06:28:19.641002',0,39990000.00,39990000.00,25,'512GB','2025-10-30 06:28:19.641010',15),(31,'2025-10-30 06:30:43.378453',50,2500000.00,5000000.00,50,'sang','2025-10-30 06:30:43.378461',16),(32,'2025-10-30 06:38:50.287200',50,2500000.00,5000000.00,50,'sang','2025-10-30 06:38:50.287206',17),(33,'2025-10-30 06:40:28.505546',50,5000000.00,10000000.00,47,'sang','2025-10-30 09:27:44.902411',18),(34,'2025-10-30 06:40:28.508857',70,150000000.00,500000000.00,1000,'sanggggggg','2025-10-30 06:40:28.508868',18);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discounted_price` decimal(19,2) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order` (`order_id`),
  KEY `idx_product` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,30390500.00,31990000.00,1,1,'512GB',1),(2,26670800.00,28990000.00,1,1,'256GB',1),(3,26670800.00,28990000.00,1,1,'256GB',2),(4,30390500.00,31990000.00,1,3,'512GB',3),(5,22871200.00,25990000.00,2,1,'256GB',4),(6,34910300.00,35990000.00,5,1,'1TB',5),(7,40840500.00,42990000.00,3,1,'256GB',6),(8,34910300.00,35990000.00,5,1,'1TB',7),(9,34910300.00,35990000.00,5,1,'1TB',8),(10,26991000.00,29990000.00,4,1,'256GB',9),(11,5000000.00,10000000.00,18,3,'sang',10),(12,40840500.00,42990000.00,3,1,'256GB',11);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `order_status` enum('CANCELLED','CONFIRMED','DELIVERED','PENDING','SHIPPED') NOT NULL,
  `payment_method` enum('COD','VNPAY') DEFAULT NULL,
  `payment_status` enum('CANCELLED','COMPLETED','FAILED','PENDING','REFUNDED') NOT NULL,
  `shipping_address_id` bigint NOT NULL,
  `total_items` int NOT NULL,
  `total_price` decimal(19,2) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_order_status` (`order_status`),
  KEY `idx_payment_status` (`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-10-21 15:04:32.441165',NULL,'CANCELLED','COD','PENDING',1,2,57061300.00,'2025-10-21 15:48:27.784622',1,'n22dccn068'),(2,'2025-10-21 15:54:18.413939',NULL,'CANCELLED','COD','CANCELLED',1,1,26670800.00,'2025-10-22 15:58:36.807873',1,'tansang06092004@gmail.com'),(3,'2025-10-21 17:29:07.663343',NULL,'PENDING','COD','PENDING',1,3,91171500.00,'2025-10-21 17:29:07.663361',1,'tansang06092004@gmail.com'),(4,'2025-10-22 16:14:23.457261','2025-10-27 11:57:36.717129','DELIVERED','COD','COMPLETED',1,1,22871200.00,'2025-10-27 11:57:36.811431',1,'n22dccn068@student.ptithcm.edu.vn'),(5,'2025-10-23 07:19:08.474852',NULL,'CANCELLED','COD','CANCELLED',1,1,34910300.00,'2025-10-23 07:29:56.950924',1,'n22dccn068@student.ptithcm.edu.vn'),(6,'2025-10-23 07:31:57.609232',NULL,'CANCELLED','COD','CANCELLED',1,1,40840500.00,'2025-10-23 07:37:21.726357',1,'tansang06092004@gmail.com'),(7,'2025-10-23 07:37:31.397692',NULL,'CONFIRMED','COD','PENDING',1,1,34910300.00,'2025-10-29 09:57:30.462094',1,'n22dccn068@student.ptithcm.edu.vn'),(8,'2025-10-23 09:06:56.641572','2025-10-29 10:00:35.925556','DELIVERED','VNPAY','COMPLETED',1,1,34910300.00,'2025-10-29 10:00:35.960911',1,'n22dccn068@student.ptithcm.edu.vn'),(9,'2025-10-23 11:19:49.100397',NULL,'DELIVERED','VNPAY','COMPLETED',1,1,26991000.00,'2025-10-23 11:20:19.274734',1,'n22dccn068@student.ptithcm.edu.vn'),(10,'2025-10-30 09:27:44.859744',NULL,'CONFIRMED','COD','PENDING',5,3,15000000.00,'2025-10-30 15:07:58.488615',1,'n22dccn068@student.ptithcm.edu.vn'),(11,'2025-10-30 09:28:02.695477','2025-10-30 09:38:21.339722','DELIVERED','VNPAY','COMPLETED',5,1,40840500.00,'2025-10-30 09:38:21.349358',1,'n22dccn068@student.ptithcm.edu.vn');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_log` text,
  `payment_method` tinyint DEFAULT NULL,
  `payment_status` tinyint DEFAULT NULL,
  `total_amount` decimal(19,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `vnp_response_code` varchar(10) DEFAULT NULL,
  `vnp_secure_hash` varchar(255) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKof2hvjrt3h42uja5aibie81tp` (`order_id`),
  KEY `idx_transaction_id` (`transaction_id`),
  CONSTRAINT `FK34yjcjptgtt05syk6x0t8s35b` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `payment_details_chk_1` CHECK ((`payment_method` between 0 and 1)),
  CONSTRAINT `payment_details_chk_2` CHECK ((`payment_status` between 0 and 4))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,'2025-10-21 15:55:19.940595',NULL,NULL,0,0,26670800.00,'2_26517721','2025-10-21 15:55:19.940613',NULL,'716660188562a7626619145d0ae60082f311b721ea4326f133a2b161ee9f51f628c44c764d547c8428953b6f44afccd95627facb981dada97491d9e05715dfba',2),(2,'2025-10-22 16:14:23.523316',NULL,NULL,0,0,22871200.00,'4_73622987','2025-10-22 16:14:23.523336',NULL,'c4f2492e97d6c73fbe534f9f6f5f4b369db5d54acf4101e22918dfe09adb695d86980ee0d5c98357ce66857045e1426a7b5a2ee0cc16611dbff102b7dafea1de',4),(3,'2025-10-23 07:19:08.585304',NULL,NULL,0,0,34910300.00,'5_33320634','2025-10-23 07:19:08.585320',NULL,'5340943a1252bd2222971db9d33fdbbd6100470aa395ff01003478f54bb41bbe75119dc2d0ff82f89a0510fee5aa1110cf27eff9cda9d56927a58390a63c0eaf',5),(4,'2025-10-23 07:31:57.663226',NULL,NULL,0,0,40840500.00,'6_21579554','2025-10-23 07:31:57.663239',NULL,'d0c9db74c6fba206cb2d3f4c975ede7078756d2f05b77786280e507becc2c707f10a65c0e4954ae8c4e325ef0bd80411b0c559db4a95489d05d8586cf7a6ddc4',6),(5,'2025-10-23 07:37:31.470875',NULL,NULL,0,0,34910300.00,'7_59478263','2025-10-23 07:37:31.470886',NULL,'eb8ef433a3f5aa5ac586feb66bd7b2f45a3755b3513bcebe87089e94bdaec002a305e1cc99cb680d42a77df0e0274ad2ba4271c61ced340c336a287bae443430',7),(6,'2025-10-23 09:06:56.762622','2025-10-23 09:07:30.295223','{\"vnp_Amount\":\"3491030000\",\"vnp_BankCode\":\"NCB\",\"vnp_BankTranNo\":\"VNP15215831\",\"vnp_CardType\":\"ATM\",\"vnp_OrderInfo\":\"Thanh toan don hang #8\",\"vnp_PayDate\":\"20251023160908\",\"vnp_ResponseCode\":\"00\",\"vnp_TmnCode\":\"N7MGBPT4\",\"vnp_TransactionNo\":\"15215831\",\"vnp_TransactionStatus\":\"00\",\"vnp_TxnRef\":\"8_70148065\",\"vnp_SecureHash\":\"5db99d6838271b7b02a9f0957f036a42c78e777b018432f279df0a6669084be8165168e69c9f65be386ca7627b2b3935772712318517b0504a1ff555dbb4c787\"}',0,1,34910300.00,'8_70148065','2025-10-23 09:07:30.297202','00','9d2d76f69a2635865ae40ab347e68a94c9cade1f350a5d0cc3e9024c01f1863cc9ff564e30441b3154ca23bc2877183006213ea9e631bd7621fccae0fb5b0166',8),(7,'2025-10-23 11:19:49.200393','2025-10-23 11:20:19.293197','{\"vnp_Amount\":\"2699100000\",\"vnp_BankCode\":\"NCB\",\"vnp_BankTranNo\":\"VNP15216093\",\"vnp_CardType\":\"ATM\",\"vnp_OrderInfo\":\"Thanh toan don hang #9\",\"vnp_PayDate\":\"20251023182157\",\"vnp_ResponseCode\":\"00\",\"vnp_TmnCode\":\"N7MGBPT4\",\"vnp_TransactionNo\":\"15216093\",\"vnp_TransactionStatus\":\"00\",\"vnp_TxnRef\":\"9_40068086\",\"vnp_SecureHash\":\"13c2b0382612aefb2d02c2a07d0e97e94eb30ec856a5bb51827128c9828745b8c52f02a6771eb6e16517b618682e532ab0481f8d84db44a9119d74ccb030251e\"}',0,1,26991000.00,'9_40068086','2025-10-23 11:20:19.295517','00','af8fb126a495e96ebf547c32c2a615117be86335f4706addb27d94a5366ed0c08c8ebe38ae724b07edf5be81b6f112ea8f9143545006d86cda483fbe4082ef88',9),(8,'2025-10-30 09:28:02.752391','2025-10-30 09:29:06.712644','{\"vnp_Amount\":\"4084050000\",\"vnp_BankCode\":\"NCB\",\"vnp_BankTranNo\":\"VNP15227685\",\"vnp_CardType\":\"ATM\",\"vnp_OrderInfo\":\"Thanh toan don hang #11\",\"vnp_PayDate\":\"20251030162900\",\"vnp_ResponseCode\":\"00\",\"vnp_TmnCode\":\"N7MGBPT4\",\"vnp_TransactionNo\":\"15227685\",\"vnp_TransactionStatus\":\"00\",\"vnp_TxnRef\":\"11_64289759\",\"vnp_SecureHash\":\"7b6b509923aaa59489406f91dcd5c577842603c3d06d5546f6a7c8aa4785477a5987b03f5149114da2f796a4246de0bb3ce04141178567db34c55ba4627357fe\"}',0,1,40840500.00,'11_64289759','2025-10-30 09:29:06.714640','00','dba9011aafafbdf586b7dfbaa6af4a8b01d085ee732d37dd0ad4acedbcd97ab530dc4551c9556bb1bf8aa74ace379d50d54d2171b73996a0124e0673c430e40a',11);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `average_rating` double NOT NULL,
  `battery_capacity` varchar(50) DEFAULT NULL,
  `battery_type` varchar(50) DEFAULT NULL,
  `brand` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `connection_port` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` text,
  `detailed_review` text,
  `dimension` varchar(100) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `num_ratings` int NOT NULL,
  `powerful_performance` text,
  `quantity_sold` bigint NOT NULL,
  `ram_capacity` varchar(50) DEFAULT NULL,
  `rom_capacity` varchar(50) DEFAULT NULL,
  `screen_size` varchar(200) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `warning_count` int NOT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_title` (`title`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,0,'5050 mAh','Li-Ion','Google','Obsidian Black','Type-C','2025-10-13 17:51:55.919601','Chiếc điện thoại thông minh từ Google với camera xuất sắc và các tính năng AI độc quyền.','Pixel 9 Pro mang lại trải nghiệm Android thuần khiết nhất cùng hệ thống camera AI thông minh bậc nhất thế giới.','Dài 162.1 mm - Ngang 76.5 mm - Dày 8.5 mm',_binary '\0',0,'Chip Google Tensor G4 tối ưu cho các tác vụ máy học và AI, mang lại hiệu năng thông minh và mượt mà.',0,'12 GB','256 GB','6.7 inch - LTPO OLED, 120Hz','Google Pixel 9 Pro','2025-10-29 16:53:14.590736',0,'215 g',2),(2,0,'5000 mAhC','Li-PoC','XiaomIIII','Trắng tinh CCCCCC','Type-CCCC','2025-10-13 17:51:55.953818','Flagship từ Xiaomi với camera Leica danh tiếng và công nghệ sạc siêu nhanh 120W. CCCCC','Xiaomi 15 Pro hợp tác cùng Leica, mang đến chất lượng hình ảnh chuyên nghiệp và hiệu năng hàng đầu. CCCCCCCCCCCCC','161.4 x 75.3 x 8.5 mm CC',_binary '\0',0,'Trang bị Snapdragon 8 Gen 4, Xiaomi 15 Pro là một \'quái vật\' hiệu năng trong thế giới Android. CCCCCCCCCCCCCCCC',0,'16 GCC','512 GBCC','6.73 inch -CC','Sang ','2025-10-29 16:54:03.185298',0,'220 g CC',3),(3,0,'4400 mAh','Li-Po','Samsung','Đen Phantom','Type-C','2025-10-13 17:51:55.985058','Điện thoại gập cao cấp của Samsung, kết hợp giữa smartphone và máy tính bảng.','Galaxy Z Fold 6 là đỉnh cao của công nghệ điện thoại gập, mang lại trải nghiệm đa nhiệm như một chiếc máy tính bảng.','Gập: 154.9 x 67.1 x 13.4 mm, Mở: 154.9 x 129.9 x 6.1 mm',_binary '',0,'Với Snapdragon 8 Gen 4 for Galaxy, mọi tác vụ trên màn hình lớn đều được xử lý một cách trơn tru.',0,'12 GB','256 GB','Màn hình chính 7.6 inch, Màn hình phụ 6.2 inch','Samsung Galaxy Z Fold 6','2025-10-13 17:51:55.985075',0,'253 g',4),(4,5,'5100 mAh','Li-Po','OPPO','Xanh Lục Bảo','Type-C','2025-10-13 17:51:56.017556','Chuyên gia nhiếp ảnh di động với thiết kế sang trọng và màn hình hiển thị sống động.','Find X8 Pro tiếp tục khẳng định vị thế của OPPO trong lĩnh vực nhiếp ảnh di động với hệ thống camera Hasselblad tiên tiến.','164.1 x 76.2 x 9.1 mm',_binary '',1,'Vi xử lý Dimensity 9400 mang lại hiệu năng ổn định và khả năng tiết kiệm năng lượng ấn tượng.',0,'16 GB','256 GB','6.82 inch - AMOLED LTPO, 120Hz','OPPO Find X8 Pro','2025-10-29 16:14:53.178179',0,'225 g',5),(5,0,'6000 mAh','Li-Po','Asus','Phantom Black','Type-C','2025-10-13 17:51:56.045315','Smartphone chuyên game mạnh mẽ nhất thế giới dành cho các game thủ chuyên nghiệp.','ROG Phone 9 là cỗ máy chiến game tối thượng với hệ thống tản nhiệt hàng đầu và các phím trigger siêu âm.','173 x 77 x 10.3 mm',_binary '',0,'Snapdragon 8 Gen 4 được ép xung đặc biệt mang lại hiệu năng gaming không đối thủ.',0,'18 GB','512 GB','6.78 inch - AMOLED, 165Hz','Asus ROG Phone 9','2025-10-13 17:51:56.045328',0,'239 g',6),(6,0,'4422 mAh','Li-Ion','Apple','Titan tự nhiên','Type-C','2025-10-13 17:51:56.067304','Điện thoại thông minh cao cấp nhất của Apple với hiệu năng vượt trội và camera tiên tiến.','iPhone 15 Pro Max là một chiếc smartphone toàn diện, hội tụ những công nghệ tiên tiến nhất của Apple.','Dài 159.9 mm - Ngang 76.7 mm - Dày 8.25 mm',_binary '',0,'Với chip A17 Pro, iPhone 15 Pro Max mang đến hiệu năng vượt trội, dễ dàng xử lý mọi tác vụ.',0,'8 GB','256 GB','6.7 inch - Tần số quét 120 Hz','iPhone 15 Pro Max','2025-10-13 17:51:56.067311',0,'221 g',7),(7,0,'5000 mAh','Li-Ion','Samsung','Titanium Gray','Type-C','2025-10-13 17:51:56.095558','Flagship cao cấp của Samsung với AI tiên tiến.','Galaxy S24 Ultra với S Pen tích hợp và camera zoom 100x ấn tượng.','162.3 x 79.0 x 8.6 mm',_binary '',0,'Snapdragon 8 Gen 3 mạnh mẽ cho mọi tác vụ.',0,'12 GB','256 GB','6.8 inch - Dynamic AMOLED 2X','Samsung Galaxy S24 Ultra','2025-10-13 17:51:56.095573',0,'232 g',4),(8,0,'5000 mAh','Li-Po','XYZ','Xanh Dương','USB-C','2025-10-26 15:59:55.619795','Mô tả cập nhật cho Điện thoại XYZ với nhiều tính năng mới.','Đánh giá chi tiết về hiệu năng, camera và pin đã được cập nhật.','160 x 75 x 8 mm',_binary '',0,'Chipset mới mang lại hiệu năng mạnh mẽ hơn đáng kể.',0,'12GB','256GB','6.7 inch OLED','Điện thoại XYZ Phiên bản Nâng cấp','2025-10-27 10:34:27.655927',0,'195g',8),(9,0,'4676 mAh','Li-Ion','Apple','Titan Tự Nhiên','Type-C','2025-10-26 16:12:07.336545','Siêu phẩm từ Apple với khung viền Titan cao cấp, màn hình lớn hơn, hệ thống camera Pro cải tiến và các tính năng AI độc quyền.','iPhone 16 Pro Max đánh dấu bước tiến mới về nhiếp ảnh điện toán và tích hợp sâu Apple Intelligence, mang lại trải nghiệm thông minh và liền mạch.','Dài 160.8 mm - Ngang 77.2 mm - Dày 8.3 mm',_binary '',0,'Chip Apple A18 Pro với Neural Engine thế hệ mới, tối ưu cho các tác vụ AI phức tạp và hiệu suất đồ họa vượt trội.',0,'8 GB','256 GB','6.9 inch - Super Retina XDR OLED, 120Hz ProMotion','iPhone 16 Pro Max','2025-10-26 16:12:07.362253',0,'225 g',9),(12,0,'5300 mAh','Li-Po','Xiaomi','Trắng Gốm (Ceramic White)','Type-C','2025-10-26 18:30:42.200009','Chiếc điện thoại flagship chuyên về nhiếp ảnh của Xiaomi, với vật liệu gốm cao cấp và hiệu năng hàng đầu.','Hợp tác cùng Leica, Xiaomi 15 Ultra mang đến cảm biến camera 1-inch thế hệ mới và ống kính zoom tiềm vọng có khả năng thay đổi khẩu độ.','Dài 161.8 mm - Ngang 75.5 mm - Dày 9.2 mm',_binary '',0,'Chip Snapdragon 8 Gen 4 mới nhất, kết hợp hệ thống tản nhiệt buồng hơi lớn, tối ưu cho sạc nhanh HyperCharge 120W.',0,'16 GB','512 GB','6.73 inch - LTPO AMOLED, 1-120Hz, 3000 nits (peak)','Xiaomi 15 Ultra','2025-10-26 18:30:42.244627',0,'229 g',14),(13,0,'4400 mAh','Li-Po','Samsung','Đen Phantom','Type-C','2025-10-26 18:30:42.203974','Điện thoại gập cao cấp nhất của Samsung, kết hợp sức mạnh của smartphone và máy tính bảng, hỗ trợ bút S Pen (bán riêng).','Z Fold 7 tiếp tục là vua đa nhiệm với màn hình gập không nếp gấp rõ rệt và bản lề mới mỏng hơn, bền bỉ hơn. Tích hợp AI cho S Pen.','Gập: 155.1 x 67.1 x 13.4 mm; Mở: 155.1 x 130.1 x 6.1 mm',_binary '',0,'Chip Snapdragon 8 Gen 4 for Galaxy tối ưu cho trải nghiệm đa nhiệm chia 3 cửa sổ và chế độ DeX không dây.',0,'12 GB','512 GB','Chính 7.6 inch, Phụ 6.2 inch - Dynamic LTPO AMOLED 2X','Samsung Galaxy Z Fold 7','2025-10-26 18:30:42.250156',0,'253 g',15),(14,0,'5050 mAh','Li-Po','ádf','Trắng tinh','Type-CCCC','2025-10-30 06:27:05.586306','fasdfsad','vbxcbxcvbxc','161.4 x 75.3 x 8.5 mm',_binary '',0,'dfgsdfgsdfsd',0,'16 GB','512 GB','6.73 inch -CC','sdgadsf','2025-10-30 06:27:05.633626',0,'220 g',2),(15,0,'4676 mAh','Li-Ion','Apple','Titan Tự Nhiên','Type-C','2025-10-30 06:28:19.637774','Siêu phẩm từ Apple với khung viền Titan cao cấp, màn hình lớn hơn, hệ thống camera Pro cải tiến và các tính năng AI độc quyền.','iPhone 16 Pro Max đánh dấu bước tiến mới về nhiếp ảnh điện toán và tích hợp sâu Apple Intelligence, mang lại trải nghiệm thông minh và liền mạch.','Dài 160.8 mm - Ngang 77.2 mm - Dày 8.3 mm',_binary '',0,'Chip Apple A18 Pro với Neural Engine thế hệ mới, tối ưu cho các tác vụ AI phức tạp và hiệu suất đồ họa vượt trội.',0,'8 GB','256 GB','6.9 inch - Super Retina XDR OLED, 120Hz ProMotion','iPhone 16 Pro','2025-10-30 06:28:19.651518',0,'225 g',9),(16,0,'5000 mAhC','Li-Po','fdsdfsaf','Trắng tinh','Type-CCCC','2025-10-30 06:30:43.376186','sdfdsf','sdfsadf','161.4 x 75.3 x 8.5 mm',_binary '',0,'sấdfsaf',0,'16 GCC','512 GB','6.73 inch - AMOLED, 120Hz','dgfd','2025-10-30 06:32:23.888682',0,'0.5',3),(17,0,'5000 mAhC','Li-Po','fdsdfsaf','Trắng tinh','Type-CCCC','2025-10-30 06:38:50.285734','sdfdsf','sdfsadf','161.4 x 75.3 x 8.5 mm',_binary '',0,'sấdfsaf',0,'16 GCC','512 GB','6.73 inch - AMOLED, 120Hz','dgfdƯdfgsfdgsdf','2025-10-30 06:38:50.290620',0,'0.5',3),(18,0,'5000 mAh','Li-Po','nazi','Trắng tinh','Type-C','2025-10-30 06:40:28.501422','fasdfasfsadf','dvsdfsafdas','161.4 x 75.3 x 8.5 mm',_binary '',0,'fasdfsafdsafas',0,'16 GB','512 GB','6.73 inch - AMOLED, 120Hz','hitler','2025-10-30 06:40:28.513170',0,'220 g',7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `review_content` varchar(500) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_product_user_review` (`product_id`,`user_id`),
  KEY `idx_product` (`product_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_status` (`status`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (8,'2025-10-29 16:14:53.173586',5,'Sản phẩm tuyệt vời!','APPROVED','2025-10-29 16:14:53.173599',1,4);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `name` enum('ADMIN','CUSTOMER','STAFF') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'2025-10-19 18:29:27.162662','CUSTOMER','2025-10-19 18:29:27.162724'),(2,'2025-10-25 18:26:38.000000','ADMIN','2025-10-25 18:26:38.000000'),(3,'2025-10-25 18:26:54.000000','STAFF','2025-10-25 18:26:54.000000');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `oauth_provider` varchar(50) DEFAULT NULL,
  `oauth_provider_id` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `warning_count` int NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','2025-10-19 18:29:27.208442','n22dccn068@student.ptithcm.edu.vn','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$SXMZZIciKqKp3l0iyAm3auz.TKcWRiUHcFq.thAWSXOC8ch2bU9M.','544542454','2025-10-29 16:14:39.987879',1,2),(3,_binary '','2025-10-22 17:39:13.277036','sangshin0987@gmail.com','Polo','https://lh3.googleusercontent.com/a/ACg8ocJM6_QGPGgEPl76yV5EjSAVhmXSUmZFCn8BaG0CgUBokIO_03gu=s96-c',_binary '\0','nè','google','111194025296074592145','$2a$10$BVl8MIl6plYZAEvC28uRk.GS6wTVmlg2XC7i0C8r1HbqXyswOMUJu',NULL,'2025-10-29 09:58:59.359868',2,3),(5,_binary '','2025-10-23 09:37:33.966437','tansang06092004@gmail.com','Sang',NULL,_binary '\0','Nguyen',NULL,NULL,'$2a$10$0naLr8p7EF2QFyu9YLkHmuS9m.xMTIsT6ZEM.z0aRGtttBzk5JyF2','432343245242','2025-10-29 09:08:59.057849',1,1),(6,_binary '','2025-10-29 16:58:27.149007','techshopprojectteam@gmail.com','Tech','https://lh3.googleusercontent.com/a/ACg8ocLfq744MsNRypFTQEqmDqLyAqdxxALnnTCn0R0KjYUWZmnnmX0=s96-c',_binary '\0','Shop','google','109586030998862167021','$2a$10$fWwglMVTjsg4WaTmOyDrmuxse7ErsmUD/ken1Gi5ugYayMob/NSYe',NULL,'2025-10-29 17:17:05.776368',0,1),(7,_binary '','2025-10-29 17:17:33.392135','a@gmail.com','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$/8XiGDk70f93BLGCUJ4G0eDTNdvhN.pkzIikbaCH.VKjz1dE.svOO',NULL,'2025-10-30 15:27:57.920182',0,1),(8,_binary '\0','2025-10-29 17:22:31.208415','b@gmail.com','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$fxHRjg6B7SZdn5c.9kyE6uDRbo7EEbWouKZvOvRpGjRQO9FbxTaMO',NULL,'2025-10-29 17:22:31.208430',0,1),(9,_binary '\0','2025-10-29 17:22:56.410963','sangggg@student.ptithcm.edu.vn','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$Ukbulj1rIAE6k89.RPgF/OIEN2WTiYRDiOG2Cd4wk9F6/BWi.PXbG',NULL,'2025-10-29 17:22:56.410981',0,1),(10,_binary '\0','2025-10-29 17:23:17.443054','sangpolo469@gmail.com','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$fTWOv7PwE12bRFGyG9.72e6uspAoWcewhT/tA9GBSAwEB5xaEPOgy',NULL,'2025-10-30 09:45:02.138804',0,3),(11,_binary '','2025-10-29 17:24:15.429017','sangpolo694@gmail.com','Tu',NULL,_binary '\0','Ma Y',NULL,NULL,'$2a$10$63YThlQA41uvFLpY2yyiPOpbezJDcoDpvr.2iKYdANOEMrBvFYkeu',NULL,'2025-10-30 09:45:20.787004',0,3);
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

-- Dump completed on 2025-11-01 22:49:58
