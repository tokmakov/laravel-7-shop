-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: larashop
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `basket_product`
--

DROP TABLE IF EXISTS `basket_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `basket_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `basket_product_basket_id_foreign` (`basket_id`),
  KEY `basket_product_product_id_foreign` (`product_id`),
  CONSTRAINT `basket_product_basket_id_foreign` FOREIGN KEY (`basket_id`) REFERENCES `baskets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `basket_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_product`
--

LOCK TABLES `basket_product` WRITE;
/*!40000 ALTER TABLE `basket_product` DISABLE KEYS */;
INSERT INTO `basket_product` VALUES (53,212,41,2),(54,212,50,1),(56,230,58,1);
/*!40000 ALTER TABLE `basket_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baskets`
--

DROP TABLE IF EXISTS `baskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baskets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baskets`
--

LOCK TABLES `baskets` WRITE;
/*!40000 ALTER TABLE `baskets` DISABLE KEYS */;
INSERT INTO `baskets` VALUES (212,'2020-11-05 05:47:35','2020-11-05 05:47:35'),(216,'2020-11-05 09:16:42','2020-11-05 09:16:42'),(218,'2020-11-09 05:37:32','2020-11-09 08:03:31'),(219,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(220,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(221,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(222,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(223,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(224,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(225,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(226,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(227,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(228,'2020-11-10 08:49:18','2020-11-10 08:49:18'),(229,'2020-11-17 07:44:06','2020-11-17 07:44:06'),(230,'2020-11-17 07:44:06','2020-11-28 12:08:28');
/*!40000 ALTER TABLE `baskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Первый бренд','Чичиков. — Я?.. нет, я уж покажу, — отвечала девчонка. — Куда ж? — сказал Чичиков — А как, например, теперь, — когда были еще только статские советники, сказал даже ошибкою два раза: «ваше.','Pervyj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:23:49'),(2,'Пятый бренд','Повторивши это раза три, он попросил хозяйку приказать заложить его бричку. — Говоря — это, Ноздрев показал пальцем на своем мизинце самую маленькую часть. — Голову.','Pyatyj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:25:47'),(3,'Второй бренд','Ты лучше человеку не будет ли эта негоция — несоответствующею гражданским постановлениям и дальнейшим видам России, а чрез минуту потом прибавил, что казна получит даже выгоды, ибо получит законные.','Vtoroj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:24:31'),(4,'Третий бренд','Чичикову, — я к тебе просьба. — Какая? — Дай прежде слово, что исполнишь. — Да как же цена? хотя, впрочем, это такой предмет… что о — цене даже странно….','Tretij-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:25:04'),(5,'Четвертый бренд','Селифану сей же час спросил: «Не побеспокоил ли я вас?» Но Чичиков отказался решительно как играть, так и есть. Я уж сказал, что не угадаешь: штабс-ротмистр Поцелуев.','Chetvertyj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:26:37'),(6,'Шестой бренд','Нет, больше двух рублей я не то, — сказал Манилов, вдруг очнувшись и почти над головами их раздалися крик сидевших в коляске дамы глядели на все согласный Селифан.','Shestoj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:27:16'),(7,'Седьмой бренд','Пока приезжий господин осматривал свою комнату, внесены были его мысли. «Славная бабешка! — сказал он. — Но позвольте — доложить, не будет ли это предприятие или.','Sedmoj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:27:45'),(8,'Восьмой бренд','Дождь стучал звучно по деревянной крыше и журчащими ручьями стекал в подставленную бочку. Между тем три экипажа подкатили уже к чинам генеральским, те, бог весть, может быть, и познакомятся с.','Vosmoj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:28:12'),(9,'Девятый бренд','Что ж тут смешного? — сказал он наконец, высунувшись из брички. — Что, мошенник, по какой дороге ты едешь? — сказал Ноздрев. — Стану я разве.','Devyatyj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:28:38'),(10,'Десятый бренд','Хозяйка очень часто обращалась к Чичикову с словами: «Вы ничего не было. Поехали отыскивать Маниловку. Проехавши две версты, встретили поворот на проселочную дорогу.','Desyatyj-brend',NULL,'2020-10-09 05:20:42','2020-11-03 09:29:35');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,'Обувь','Все вышли в столовую. В столовой уже стояли два мальчика, сыновья Манилова, которые были еще деньги. Ты куда теперь едешь? — сказал Чичиков с весьма черными густыми.','Obuv','9o6PAG4FVvkKsCvnRw3EKxpV1ttMoauZjE3aXQT3.jpeg','2020-10-09 05:20:41','2020-11-03 06:10:56'),(2,0,'Одежда','Хозяйка уже изъявила было готовность послать за пуховиками и подушками, но хозяин сказал: «Ничего, мы отдохнем в креслах», — и прибавил еще: — — Бейте его! — кричал Ноздрев в.','Odezhda','sA7vDIfsYGiMzlGMA5T4q9aP95JxHuz9SKFeK1Hn.jpeg','2020-10-09 05:20:41','2020-11-03 06:16:53'),(3,0,'Сумки','Позвольте вас попросить в мой кабинет, — сказал наконец Чичиков, изумленный таким обильным — наводнением речей, которым, казалось, и конца не было, — все было в афишке.','Sumki','iR5N3SgGf7Qpy5BhK9LtqMmeX0tje2TF9SLNjCvi.jpeg','2020-10-09 05:20:41','2020-11-28 12:10:58'),(5,1,'Мужская обувь','Фемистоклюс, жуя хлеб и болтая головой направо и налево, и зятю и Чичикову; Чичиков заметил, что Чичиков, несмотря на то что прокурор и все ожидающие впереди.','Muzhskaya-obuv','SWvVfQ6iCtgytrZNZAXqicpjHqGf1ImYdqLy2Cv7.jpeg','2020-10-09 05:20:41','2020-11-03 06:11:41'),(6,1,'Женская обувь','Въезд его не пересилить; сколько ни хлестал их кучер, они не могли выбраться из проселков раньше полудня. Без девчонки было бы трудно сделать и это, потому что ты хоть.','Zhenskaya-obuv','FUPxQ5ExFKj55ugHp1rWDyJYPrHYycunXlEfNZFU.jpeg','2020-10-09 05:20:41','2020-11-03 06:13:40'),(7,2,'Мужская одежда','Наконец Манилов поднял трубку с чубуком и поглядел снизу ему в глаза скажу, что я один в продолжение хлопотни около экипажей не разведал от форейтора или кучера, кто такие были.','Muzhskaya-odezhda','5gEitEAOgCk3zr9H1NRQNNwHiGDR4hlK15fE22pN.jpeg','2020-10-09 05:20:41','2020-11-03 06:21:40'),(8,5,'Зимняя мужская обувь','Очень обходительный и приятный человек, — отвечал Фемистоклюс. — А может, в хозяйстве-то как-нибудь под случай понадобятся… — — продолжала она заглянувши к нему мужик и.','Zimnyaya-muzhskaya-obuv','DEZ08YW9Dy38KwYSxFzEd1Xdl6NU0h1n9YpWST4G.jpeg','2020-10-09 05:20:41','2020-11-03 06:12:14'),(9,3,'Мужские сумки','После таких сильных — убеждений Чичиков почти уже не было вместо швейцаров лихих собак, которые доложили о нем так звонко, что он любезнейший и обходительнейший человек. Даже сам Собакевич.','Muzhskie-sumki','vZRjzR7y75reTO3c4ANRCy91rRuU7AzAhG69QiL1.jpeg','2020-10-09 05:20:41','2020-11-28 12:01:20'),(11,5,'Летняя мужская обувь','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem expedita itaque laboriosam minima, modi neque perspiciatis providen.','Letnyaya-muzhskaya-obuv','Eu6DFEbt8kwZPiWZ9g1tZbA4psoOtCy75ERVGOhm.jpeg','2020-11-03 06:02:29','2020-11-03 06:12:54'),(12,6,'Зимняя женская обувь','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Zimnyaya-zhenskaya-obuv','qlFBVVMqOrs8yJW9YPjKQeFdkkMpHGUW4BNvBz5p.jpeg','2020-11-03 06:03:45','2020-11-03 06:14:08'),(13,6,'Летняя женская обувь','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Letnyaya-zhenskaya-obuv','WHiIWKhlrjXkLFLvF8Jw4mtwDIBvUh60NWmy3Q4O.jpeg','2020-11-03 06:04:23','2020-11-03 06:14:46'),(14,2,'Женская одежда','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque l','Zhenskaya-odezhda','kEIZrVvDUkdFyiqYmy83tegdjzwlzK8rdbfDiXV9.jpeg','2020-11-03 06:05:49','2020-11-28 11:54:05'),(15,7,'Зимняя мужская одежда','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Zimnyaya-muzhskaya-odezhda',NULL,'2020-11-03 06:06:31','2020-11-03 06:06:31'),(16,7,'Летняя мужская одежда','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Letnyaya-muzhskaya-odezhda',NULL,'2020-11-03 06:07:10','2020-11-03 06:07:10'),(17,14,'Зимняя женская одежда','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Zimnyaya-zhenskaya-odezhda','a3hEhtUBYcL6RZlJHPKFq6zmhviDZ1gghYt83EgT.jpeg','2020-11-03 06:07:59','2020-11-28 11:55:12'),(18,14,'Летняя женская одежда','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Letnyaya-zhenskaya-odezhda','3RekDrxhoMB5PwJazdDiV5otojsRDLEikWL3XruC.jpeg','2020-11-03 06:08:35','2020-11-28 11:53:16'),(19,3,'Женские сумки','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab ad alias, aliquam blanditiis debitis delectus deserunt dicta dolorem ea expedita itaque laboriosam minima, modi neque perspiciatis providen','Zhenskie-sumki','kdJPeOYsYii9k754SbMthRMfLHaddaAgzD2Q3oOg.jpeg','2020-11-03 06:10:21','2020-11-28 12:04:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_09_28_130327_create_categories_table',1),(5,'2020_09_28_130335_create_brands_table',1),(6,'2020_09_28_130346_create_products_table',1),(7,'2020_10_02_120033_create_baskets_table',1),(8,'2020_10_02_120730_create_basket_product_table',1),(9,'2020_10_09_081701_alter_users_table',1),(16,'2020_10_10_105603_create_orders_table',2),(17,'2020_10_10_111729_create_order_items_table',2),(18,'2020_10_25_090836_alter_orders_table',3),(20,'2020_10_27_060337_create_pages_table',4),(24,'2020_11_01_064359_create_profiles_table',5),(25,'2020_11_08_101100_alter_products_table',6),(26,'2020_11_10_111203_create_items_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `cost` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,NULL,'Пока приезжий господин жил в городе, там вам.',1412.00,2,2824.00),(2,1,NULL,'Манилов посмотрел на него — вдруг.',1905.00,3,5715.00),(3,1,NULL,'Уже стул, которым он вместе обедал у.',1329.00,1,1329.00),(4,2,NULL,'Пока приезжий господин жил в городе, там вам.',1412.00,2,2824.00),(5,2,NULL,'Манилов посмотрел на него — вдруг.',1905.00,3,5715.00),(6,2,NULL,'Уже стул, которым он вместе обедал у.',1329.00,1,1329.00),(7,3,NULL,'Пока приезжий господин жил в городе, там вам.',1412.00,2,2824.00),(8,3,NULL,'Манилов посмотрел на него — вдруг.',1905.00,1,1905.00),(9,4,NULL,'Вы были замешаны в историю, по случаю.',1535.00,4,6140.00),(10,4,NULL,'Уже стул, которым он вместе обедал у.',1329.00,3,3987.00),(11,4,NULL,'Манилов посмотрел на него — вдруг.',1905.00,2,3810.00),(12,4,NULL,'Пока приезжий господин жил в городе, там вам.',1412.00,1,1412.00),(13,5,NULL,'Пока приезжий господин жил в городе, там вам.',1412.00,2,2824.00),(14,5,NULL,'Манилов посмотрел на него — вдруг.',1905.00,1,1905.00),(15,6,1,'Пока приезжий господин жил в городе, там вам.',1412.00,1,1412.00),(16,6,7,'Манилов посмотрел на него — вдруг.',1905.00,1,1905.00),(17,7,5,'Между крепкими греками, неизвестно каким.',1957.00,1,1957.00),(18,7,12,'Поцелуев — вместе с исподним и прежде.',1215.00,1,1215.00),(19,7,16,'Фетюк, просто фетюк! Засим вошли они в.',1723.00,1,1723.00),(20,8,1,'Пока приезжий господин жил в городе, там вам.',1412.00,3,4236.00),(21,8,7,'Манилов посмотрел на него — вдруг.',1905.00,2,3810.00),(22,9,1,'Мужская зимняя куртка 1',1412.00,1,1412.00),(23,9,2,'Мужская зимняя куртка 2',1300.00,1,1300.00),(24,9,3,'Мужская зимняя куртка 3',1619.00,1,1619.00),(25,10,39,'Мужские зимние ботинки 1',1200.00,1,1200.00),(26,10,40,'Мужские зимние ботинки 2',1500.00,2,3000.00),(27,10,41,'Мужские зимние ботинки 3',2000.00,3,6000.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,'Андрей Сергеев','sergeev.a@mail.ru','+7 (495) 777-77-77','Москва, 3-й Лихачевский переулок, д.1, к.1, кв. 22',NULL,9868.00,4,'2020-10-11 05:20:41','2020-10-25 07:10:15'),(2,NULL,'Константин Антонов','antonov.k@gmail.com','+7 (495) 555-55-55','Москва, Флотская 5, кв.25',NULL,9868.00,4,'2020-10-11 06:46:00','2020-10-25 07:11:24'),(3,NULL,'Евгений Токмаков','tokmakov.e@mail.ru','+7 (495) 111-11-11','Москва, Чехова 11, кв. 9','Какой-то комментарий от покупателя',4729.00,4,'2020-10-11 08:42:08','2020-10-25 07:11:52'),(4,NULL,'Дмитрий Николаев','nikolaev.d@mail.ru','+7 (495) 222-22-22','Москва, улица Лавочкина, дом 5, кв. 17','Какой-то комментарий от покупателя',15349.00,4,'2020-10-11 08:45:00','2020-10-25 07:12:22'),(5,NULL,'Евгений Федоров','fedorov.e@mail.ru','+7 (926) 123-45-67','125438, Москва, ул. Строителей, дом 123, кв. 456','Какой-то коментарий к заказу от покупателя',4729.00,3,'2020-10-11 09:21:03','2020-10-25 07:12:42'),(6,NULL,'Николай Петров','petrov.n@gmail.com','+7 (495) 333-33-33','Москва, Коптевская 12, кв. 43','Какой-то комментарий',3317.00,2,'2020-10-11 09:32:01','2020-10-25 07:13:02'),(7,2,'Евгений Токмаков','tokmakov.e@mail.ru','+7 (495) 444-44-44','Онежская, дом 17, кв.32','Какой-то комментарий',4895.00,1,'2020-10-12 04:25:50','2020-10-25 07:13:22'),(8,NULL,'Сергей Иванов','ivanov.s@mail.ru','+7 (926) 765-43-21','Москва, Шоссе Энтузиастов, дом 5, кв. 11','Доставка в воскресенье',8046.00,1,'2020-10-25 03:17:42','2020-11-12 06:31:37'),(9,2,'Евгений  Токмаков','tokmakov.e@mail.ru','+7 (926) 111-11-11','125438, Москва, Онежская улица, дом 123, кв. 456','Доставка в выходные дни',4331.00,0,'2020-11-09 07:52:03','2020-11-09 07:52:03'),(10,2,'Евгений Токмаков','tokmakov.e@mail.ru','+7 (926) 111-11-11','111141, Москва, 3-й проезд Перова поля, дом 8, стр.11','Доставка в будние дни',10200.00,0,'2020-11-09 08:03:31','2020-11-09 08:03:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Доставка','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p>','Dostavka','2020-11-01 03:56:45','2020-11-26 11:43:49'),(2,0,'Оплата','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p>','Oplata','2020-11-01 03:57:18','2020-11-01 03:57:18'),(3,0,'Контакты','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad animi assumenda, consectetur deserunt distinctio et excepturi iste neque numquam quam quia quidem reiciendis, similique totam voluptate! Aperiam asperiores dignissimos dolorum eaque natus non porro quae veniam. Architecto at aut, debitis ea eum exercitationem ipsam, laudantium minus modi nesciunt nihil obcaecati quia quibusdam quisquam repellat rerum sapiente sed sequi sint ullam.</p>','Kontakty','2020-11-01 03:57:47','2020-11-01 03:57:47');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (email(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `hit` tinyint(1) NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,15,2,'Мужская зимняя куртка 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Muzhskaya-zimnyaya-kurtka-1','oiFl1Q67NjqZwFmx56RTNoOOBBef41m8yhb02vC9.jpeg',1412.00,0,0,1,'2020-10-09 05:20:42','2020-11-28 11:37:40'),(2,15,5,'Мужская зимняя куртка 2','Тут много было поворотов, которые все приветствовали его, как наседка цыплят, а влепливает сразу, как пашпорт на вечную носку, и нечего прибавлять уже потом, какой у тебя под властью мужики: ты с ними не в курятник; по крайней мере. Старуха вновь задумалась. — О чем бы разговор ни был, он всегда умел поддержать его: шла ли речь о лошадином заводе; говорили ли о хороших собаках, и здесь в приезжем оказалась.','Muzhskaya-zimnyaya-kurtka-2','JzZShPuDFj28j29rFi3kYjEni4P1xQuCVKwv6KMJ.jpeg',1300.00,0,1,0,'2020-10-09 05:20:42','2020-11-09 04:41:20'),(3,15,5,'Мужская зимняя куртка 3','Он был недоволен поведением Собакевича. Все-таки, как бы с тем, у которого все до последнего выказываются белые, как сахар, зубы, дрожат и прыгают щеки, а сосед за двумя дверями, в третьей комнате, вскидывается со сна, вытаращив очи и произнося: «Эк его неугомонный бес как обуял!» — подумал про себя Чичиков, — сказал Чичиков, — сказал с приятною улыбкою Манилов. Наконец оба приятеля вошли в дверь.','Muzhskaya-zimnyaya-kurtka-3','xEHphc1qaMrNxDRmKZmqojzIJJ20i3sMTDF39HQv.jpeg',1619.00,1,0,0,'2020-10-09 05:20:42','2020-11-09 04:41:38'),(4,15,1,'Мужская зимняя куртка 4','Селифан, не видя так долго заниматься Коробочкой? Коробочка ли, Манилова ли, хозяйственная ли жизнь, или нехозяйственная — мимо их! Не то на свете дивно устроено: веселое мигом обратится в печальное, если только она держалась на ту пору вместо Чичикова какой-нибудь двадцатилетний юноша, гусар ли он, или просто благовидные, весьма гладко выбритые овалы лиц, так же красным, как самовар, так что скорей место затрещит и угнется под ними, а уж они не двигались и стояли как вкопанные.','Muzhskaya-zimnyaya-kurtka-4','nTsbhPgg3EZnTVgj31LT4nrk9gzd4PAGeSjYEOyI.jpeg',1452.00,0,0,1,'2020-10-09 05:20:42','2020-11-09 04:41:54'),(5,15,3,'Мужская зимняя куртка 5','Вся разница в том, что делается в ее доме и в деревне остались только старые бабы да малые ребята. Постромки отвязали; несколько тычков чубарому коню так понравилось новое знакомство, что он начал — называть их наконец секретарями. Между тем псы заливались всеми возможными голосами: один, забросивши вверх голову, выводил так протяжно и с русским желудком — сладят! Нет, это все готовится? вы есть не так густ, как другой. — А свиного сала не покупаете? — сказала.','Muzhskaya-zimnyaya-kurtka-5','0FEplLfCTM6cmrtkbnHIgg1Jv9nKti00usiTnwS6.jpeg',1957.00,0,1,0,'2020-10-09 05:20:42','2020-11-09 04:42:12'),(6,15,3,'Мужская зимняя куртка 6','Анну, и поговаривали даже, что был представлен к звезде; впрочем, был большой добряк и даже бузиной, подлец, затирает; но — за ушами пальцем. — Очень обходительный и приятный человек, — отвечал Ноздрев — Нет, в женском поле не нуждаюсь. — Ну, как ты себе хочешь, а не в первый раз в дороге. Чемодан внесли кучер Селифан, низенький человек в решительные минуты найдется, что сделать, не вдаваясь в дальние рассуждения, то, поворотивши направо, на первую перекрестную дорогу.','Muzhskaya-zimnyaya-kurtka-6','BFIJ5EvymTAyHrbVnlQY7KjGnfByyAgWbo25dBtd.jpeg',1835.00,1,0,0,'2020-10-09 05:20:42','2020-11-09 04:42:35'),(7,15,1,'Мужская зимняя куртка 7','Я знаю, что выиграю, да мне нужно. — За водочку, барин, не заплатили… — сказала — хозяйка, когда они вышли на крыльцо. — Будет, будет готова. Расскажите только мне, как добраться до большой — дороги. — Как с того времени много у вас был пожар, матушка? — Плохо, отец мой. — Как вы себе хотите, я покупаю не для просьб. Впрочем, чтобы успокоить ее, он дал ей какой-то лист в рубль ценою. Написавши письмо, дал он ей подписаться и попросил маленький списочек мужиков.','Muzhskaya-zimnyaya-kurtka-7','mkMMlxiTgyyhps1jDxndaRiqrv9DwHl58QVYf21b.jpeg',1905.00,0,0,1,'2020-10-09 05:20:42','2020-11-09 04:42:54'),(8,17,4,'Женская зимняя куртка 1','Такой гадкий привиделся; а рога-то длиннее бычачьих. — Я его нарочно кормлю сырым мясом. Мне хочется, чтобы он был человек видный; черты лица больше закругленные и крепкие. Это были почетные чиновники в городе. Увы! толстые умеют лучше на этом свете обделывать дела свои, нежели тоненькие. Тоненькие служат больше по особенным поручениям или только числятся и виляют туда и сюда; их существование как-то слишком легко, воздушно и совсем неожиданным образом. Все, не.','Zhenskaya-zimnyaya-kurtka-1','u8gZMStLlawrim349cssiXTSdc2jxzytePnKydGI.jpeg',1252.00,0,1,0,'2020-10-09 05:20:42','2020-11-09 04:43:12'),(9,17,3,'Женская зимняя куртка 2','Так и блондинка тоже вдруг совершенно неожиданным образом показалась в нашей поэме. Лицо Ноздрева, верно, уже сколько-нибудь знакомо читателю. Таких людей приходилось всякому встречать немало. Они называются разбитными малыми, слывут еще в детстве и в другом кафтане; но легкомысленно непроницательны люди, и человек в то время, когда молчал, — может быть, а не подоспей капитан-исправник, мне бы, может быть, около.','Zhenskaya-zimnyaya-kurtka-2','blzxUpja1u6XYCoixIyubJ1YUUGYOCkC8s5C48fN.jpeg',1254.00,1,0,0,'2020-10-09 05:20:42','2020-11-09 04:43:40'),(10,17,4,'Женская зимняя куртка (3)','Потом показались трубки — деревянные, глиняные, пенковые, обкуренные и необкуренные, обтянутые замшею и необтянутые, чубук с трубкою в зубах. Ноздрев приветствовал его по-дружески и даже незнакомым; шестой уже одарен такою рукою, которая чувствует желание сверхъестественное заломить угол какому-нибудь бубновому тузу или двойке, тогда как рука седьмого так и быть, в шашки сыграю. — Души идут в ста рублях! — Зачем же? довольно, если пойдут в пятидесяти. — Нет, брат, это.','Zhenskaya-zimnyaya-kurtka-3','rPiPOPVOGP3DUz24BwZG7u1zXu6GmuMxl0sphlvp.jpeg',1535.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:01:27'),(11,17,4,'Женская зимняя куртка (4)','Под всем этим было написано: «И вот заведение». Кое-где просто на улице стояли столы с орехами, мылом и пряниками, похожими на искусственные, и самый — крап глядел весьма подозрительно. — Отчего ж не сорвал, — сказал тихо Чичиков Ноздреву. — А ваше имя как? — спросила помещица. — Ведь я на обывательских приехал! — Вот на этом свете обделывать дела свои, нежели тоненькие. Тоненькие служат больше по особенным поручениям или.','Zhenskaya-zimnyaya-kurtka-4','8DNE0B7lCIZQmycJRiaDYVpv9Bjhdmxnq7pB0yTv.jpeg',1534.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:02:15'),(12,17,1,'Женская зимняя куртка (5)','Прошу покорнейше, — сказал Чичиков, изумленный таким обильным — наводнением речей, которым, казалось, и конца не — знакомы? Зять мой Мижуев! Мы с Кувшинниковым каждый день завтракали в его голове: как ни переворачивал он ее, но никак не была похожа на неприступную. Напротив, — крепость чувствовала такой страх, что душа ее спряталась в самые губы, так что возвращался домой он иногда с одной только бакенбардой, и то же самое время подвинул обшлагом рукава и другую — комнату, и.','Zhenskaya-zimnyaya-kurtka-5','fOvrgGngD5NbdXFivOeEBnbWIUk8GMgoUksCHaRJ.jpeg',1215.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:02:58'),(13,12,2,'Женские зимние сапоги 1','Расспросивши подробно будочника, куда можно пройти ближе, если понадобится, к собору, к присутственным местам, к губернатору, он отправился взглянуть на реку, протекавшую посредине города, дорогою оторвал прибитую к столбу афишу, с тем только, чтобы увидеться с образованными людьми. Одичаешь, — знаете, будешь все время жить взаперти. — Правда, с такой дороги и очень нужно отдохнуть. Вот здесь и — Фемистоклюса, которые занимались каким-то деревянным.','Zhenskie-zimnie-sapogi-1','HMgblgXw4l61wlumssDM33zsxmlLFahGAR1tBHNC.jpeg',1329.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:16:43'),(14,12,3,'Женские зимние сапоги 2','К чему же об заклад? — Ну, бог с ним! — Ну, семнадцать бутылок ты не хочешь? — Не сорвал потому, что загнул утку не вовремя. А ты думаешь, доедет то колесо, если б один самовар не был сопровожден ничем особенным; только два русские мужика, стоявшие у дверей кабака против гостиницы, сделали кое-какие замечания, относившиеся, впрочем, более к экипажу, чем к сидевшему в нем. «Вишь ты, — сказал Ноздрев, немного помолчавши. — Не знаю, как вам.','Zhenskie-zimnie-sapogi-2','W5jOV9eNytr7Wrc43Lf65l4xXt0BCKELjHF7C7zC.jpeg',1881.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:17:54'),(15,12,1,'Женские зимние сапоги 3','Пропал бы, как волдырь на воде, без всякого следа, не оставивши потомков, не доставив будущим детям ни состояния, ни честного имени!» Герой наш очень заботился о своих потомках. «Экой скверный барин! — думал про себя Чичиков, садясь. в бричку. — Послушай, Чичиков, ты должен кормить, потому что он, точно, хотел бы — можно сказать, меня самого обижаешь, она такая почтенная и верная! Услуги оказывает такие… — поверишь, у меня видел, возьму я с тобою нет возможности играть.','Zhenskie-zimnie-sapogi-3','q0lmvX6YXq2gabOhgi9GGYKrLeWa8oBwPu7c9hue.jpeg',1204.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:18:40'),(16,12,2,'Женские зимние сапоги 4','И в самом деле, — подумал про себя Чичиков, садясь. в бричку. — Говоря — это, Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой конурке он приладил к стене узенькую трехногую кровать, накрыв ее небольшим подобием тюфяка, убитым и тоненьким, как лепешка. Кроме страсти к чтению, он имел случай заметить, что это сущее ничего, что он, чувствуя уважение личное к нему, готов бы даже воспитали тебя по моде, другие оделись во что бог послал в.','Zhenskie-zimnie-sapogi-4','732UpfqS2NrufG6AUFuSxUZUleCGfO3egAqButg1.jpeg',1723.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:19:56'),(17,12,3,'Женские зимние сапоги 5','Селифан, Чичиков, гладь и пустота окрестных полей. Везде, где бы ни случилось с ним; но судьбам угодно было спасти бока, — плеча и все что хочешь. Эх, Чичиков, ну что он намерен с ним поговорить об одном очень нужном деле. — В таком случае позвольте мне быть откровенным: я бы с тем, который бы хотя одним чином был его повыше, и шапочное знакомство с графом или князем для него лучше всяких тесных дружеских отношений. Автор даже опасается за своего.','Zhenskie-zimnie-sapogi-5','Eb3QrSkfwXcNEWwprxZNrulpCCaI6ZvD1oWZEOoQ.jpeg',1196.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:20:45'),(18,12,2,'Женские зимние сапоги 6','Фемистоклюс, жуя хлеб и болтая головой направо и налево. Чичиков поблагодарил хозяйку, сказавши, что ему сделать, но ничего другого не мог — понять, как губернатор мог попасть в разбойники. — Признаюсь, этого — я бы мог сорвать весь банк. — Однако ж это обидно! что же я такое в самом деле были уже мертвые, а потом отправляющиеся в Карлсбад или на дверь. — Не сделал привычки, боюсь; говорят, трубка сушит. — Позвольте мне вас попотчевать трубочкою. — Нет, брат, это, кажется, ты сочинитель, да.','Zhenskie-zimnie-sapogi-6','IhHVbOoqc1sjh0gpINFDKEwOTaPZfIbmX5a99mRr.jpeg',1997.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:27:50'),(19,12,1,'Женские зимние сапоги 7','Казалось, как будто несколько знакомо. Он стал припоминать себе: кто бы это сделать? — сказала супруга Собакевича. — А вы еще не вычеркнуть из ревизии? — Ну да мне нужно. — Ну ее, жену, к..! важное в самом деле, — подумал про себя Чичиков и тут же, пред вашими глазами, и нагадит вам. И нагадит так, как есть, в том же месте, одинаково держат голову, их почти готов принять за мебель и думаешь, что скроешь свое.','Zhenskie-zimnie-sapogi-7','5DlHLq11xQU1cgh4r48vsAkNmDeAarIvVIq3hnJ8.jpeg',1425.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:28:35'),(20,13,3,'Женские летние туфли 1','Ну, да изволь, я готова отдать за пятнадцать верст, то значит, что к нему в шкатулку. И в самом деле дело станете делать вместе! — Не — хочешь быть посланником? — Хочу, — отвечал Фемистоклюс, жуя хлеб и болтая головой направо и налево, и зятю и Чичикову; Чичиков заметил, что придумал не очень ловко и предлог довольно слаб. — Ну, да уж оттого! — сказал Чичиков, изумленный в самом деле какой-нибудь — прок? — Нет.','Zhenskie-letnie-tufli-1','ORXURHGdSv84PGFTf8JIqycI5oexu5IoaJmcmz5b.jpeg',1930.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:29:39'),(21,13,2,'Женские летние туфли 2','Только — смотри, отец мой, у меня, — мертвые души, все вместе! — Нет, не курю, — отвечал он обыкновенно, куря трубку, и ему даже в самой средине «мыльница, за мыльницею шесть-семь узеньких перегородок для бритв; «потом квадратные закоулки для песочницы и чернильницы с выдолбленною «между ними лодочкой для перьев, сургучей и всего, что прежде фортепьяно, потом французский язык, необходимый для счастия семейственной жизни, фортепьяно, для составления приятных минут супругу.','Zhenskie-letnie-tufli-2','V4e72UazTL0u52NKhe6IO47WHRRHQpu65Lp5aQiY.jpeg',1618.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:30:30'),(22,13,3,'Женские летние туфли 3','Богдан ни в чем состоит предмет. Я полагаю даже, — что он спорил, а между тем про себя Чичиков и в Петербург, и на ярмарке посчастливилось напасть на простака и обыграть его, он накупал кучу всего, что прежде хозяйственная часть, то есть книг или бумаги; висели только сабли и два ружья — одно только и останавливает, что ведь они уже мертвые. «Эк ее, дубинноголовая какая! — сказал Ноздрей. — Давай его, клади сюда на пол!.','Zhenskie-letnie-tufli-3','ZIjOibdHRYzrPrY5mxCwyu6Ytjnws2lKhimZGED6.jpeg',1311.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:31:43'),(23,13,1,'Женские летние туфли 4','При этом испуг в открытых, остановившихся устах, на глазах слезы — все было прилично и в его бричку. Настасья Петровна тут же разговориться и познакомиться с сими властителями он очень дурно. Какие-то маленькие пребойкие насекомые кусали его нестерпимо больно, так что он почтенный и любезный человек; жена полицеймейстера — что же тебе за прибыль знать? ну, просто так, пришла фантазия. — Так вот же: до тех пор, пока не.','Zhenskie-letnie-tufli-4','P2TAmsTLzcDOSUEJL8oPpOhNMn0xUtbEZdSrXD2u.jpeg',1674.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:32:29'),(24,13,4,'Женские летние туфли 5','Манилова, делал весьма дельные замечания чубарому пристяжному коню, запряженному с правой стороны, а дядя Митяй с рыжей бородой взобрался на коренного коня и сделался похожим на средней величины медведя. Для довершение сходства фрак на нем не было видно такого, напротив, лицо даже казалось степеннее обыкновенного; потом подумал, не спятил ли гость как-нибудь невзначай с ума, и со сметаною? — С хреном и со вкусом хозяина. Зодчий был педант и хотел заплатить этим хозяину за хорошее.','Zhenskie-letnie-tufli-5','tdqGDPb0rPRT5oP9UyKnrf1M4VO7yG62RQotzyA5.jpeg',1770.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:33:17'),(25,13,3,'Женские летние туфли 6','Насилу дотащили, проклятые, я уже перелез вот в — кармане, — продолжал он, обратившись тут же просадил их. — Ну, да изволь, я готова отдать за пятнадцать ассигнацией! Только — смотри, отец мой, а насчет подрядов-то: если случится муки брать — ржаной, или гречневой, или круп, или скотины битой, так уж, — пожалуйста, не затрудняйтесь. Пожалуйста, — проходите, — говорил он, куря трубку, и ему даже один раз «вы». Кучер, услышав, что нужно пропустить два.','Zhenskie-letnie-tufli-6','oqXN4XYPa19obD66NjOrAGK3eP2j3dHjxOPoILRy.jpeg',1957.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:34:04'),(26,13,4,'Женские летние туфли 7','Одних балаганов, я думаю, уже заметил, что это, точно, правда. Уж совсем ни на что не охотник. — Да зачем же приобретать — вещь, решительно для меня ненужную? — Ну вот уж здесь, — сказал Собакевич, оборотившись. — Готова? Пожалуйте ее сюда! — Он и одной не — стоит. — Ей-богу, товар такой странный, совсем небывалый! Здесь Чичиков закусил губу и не изотрется само собою: бережлива старушка, и салопу суждено пролежать долго в.','Zhenskie-letnie-tufli-7','e8tdDL3fEJpuFW6yRC7rjJ6VIS5PcDno34d5gfk5.jpeg',1251.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:34:51'),(27,16,2,'Мужская летняя футблока 1','Чичиков вошел боком в столовую. — Прощайте, мои крошки. Вы — давайте настоящую цену! «Ну, уж черт его знает. Кончил он наконец тем, что в особенности не согласятся плясать по чужой дудке; а кончится всегда тем, что станет наконец врать всю жизнь, и выдет просто черт знает что: пищит птицей и все время игры. Выходя с фигуры, он ударял по столу крепко рукою, приговаривая, если была дама: «Пошла, старая попадья!», если же говорил, то какими-то общими местами, с заметною.','Muzhskaya-letnyaya-futbloka-1','kDVRjxH3vYcglng58TVEBt1ioeWoJnNqrXGL2lxN.jpeg',1938.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:40:55'),(28,16,2,'Мужская летняя футболка 2','Он был в темно-синей венгерке, чернявый просто в полосатом архалуке. Издали тащилась еще колясчонка, пустая, влекомая какой-то длинношерстной четверней с изорванными хомутами и веревочной упряжью. Белокурый тотчас же последовало хрипенье, и наконец, понатужась всеми силами, они пробили два часа с небольшим показал решительно все, так что тот отступил шага два назад. — Я полагаю даже, — что он вынул еще.','Muzhskaya-letnyaya-futbolka-2','wKdtWC4WsskCLXQl4QNaS5q65ZaAXbOXz21WEDSG.jpeg',1933.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:42:03'),(29,16,4,'Мужская летняя футболка 3','Это бы скорей походило на диво, если бы вы с ним о деле, поступил неосторожно, как ребенок, как дурак: ибо дело совсем не было ни цепочки, ни — часов. Ему даже показалось, что и — прокрутил, канальство, еще сверх шесть целковых. А какой, если б случилось, в Москву или не хотите понимать слов моих, или — вступления в какие-нибудь выгодные обязательства. «Вишь, куды метит, подлец!» — но, однако ж, остановил, впрочем, — они остановились бы и другое слово, да — пропади и околей со всей.','Muzhskaya-letnyaya-futbolka-3','DkrcUqtXou4NXu4ISvLh5fLYANl9OlXbf6CItdY3.jpeg',1953.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:43:11'),(30,16,2,'Мужская летняя футболка 4','Тут начал он слегка верхушек какой-нибудь науки, даст он знать потом, занявши место повиднее всем тем, которые в некотором недоумении. Побужденный признательностию, он наговорил тут же из-под козел какую-то дрянь из серого сукна, надел ее в рукава, схватил в руку черешневый чубук. Чичиков — стал бледен как полотно. Он хотел что-то сказать, но чувствовал, что глаза его делались чрезвычайно сладкими и лицо принимало самое довольное выражение; впрочем, все эти прожекты так и остался с.','Muzhskaya-letnyaya-futbolka-4','Ls0dRLqYgCHhUhoYSFS7elo2kK8YxFRDSRPb8oas.jpeg',1577.00,0,0,0,'2020-10-09 05:20:42','2020-11-03 07:44:47'),(31,16,5,'Мужская летняя футболка 5','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas.','Muzhskaya-letnyaya-futbolka-5','rChdV4SATYdeRKTrnk1iAJNXGWVt0AxGOjkedWEE.jpeg',0.00,0,0,0,'2020-11-03 07:46:43','2020-11-03 07:46:43'),(32,16,8,'Мужская летняя футболка 6','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-6','LFyN9N3HA2brgZoebYwpzzNcYDx8nb2P5tt8SSwr.jpeg',0.00,0,0,0,'2020-11-03 07:47:28','2020-11-03 07:47:28'),(33,16,10,'Мужская летняя футболка 7','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-7','4ZtTPMdlEDL2VaLD7CtvXlyOUNeA4fxERK1q9Zti.jpeg',0.00,0,0,0,'2020-11-03 07:48:14','2020-11-03 07:48:14'),(34,16,4,'Мужская летняя футболка 8','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-8','lfd5w0cW14mtG2h0yjtiTKGekcWr5JQQMBc86KKI.jpeg',0.00,0,0,0,'2020-11-03 07:48:58','2020-11-03 07:48:58'),(35,16,1,'Мужская летняя футболка 9','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-9','cP1KxGDkgbmXdMiYgF2B9YeCQLUJXTabiDEPNQ3J.jpeg',0.00,0,0,0,'2020-11-03 07:49:36','2020-11-03 07:49:57'),(36,16,8,'Мужская летняя футболка 10','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-10','zPpBpi3pt3DmBbCnlp4XRT09dLtQxjqUeSBdt2Jo.jpeg',0.00,0,0,0,'2020-11-03 07:50:56','2020-11-03 07:50:56'),(37,16,8,'Мужская летняя футболка 11','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-11','5vDjt4eeKG4DwY9ZRA5olcJ0TLylyxsIjkkVt6Ku.jpeg',0.00,0,0,0,'2020-11-03 07:51:48','2020-11-03 07:51:48'),(38,16,3,'Мужская летняя футболка 12','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ducimus, eligendi exercitationem expedita, iure iusto laborum magnam qui quidem repellat similique tempora tempore ullam! Deserunt doloremque impedit quis repudiandae voluptas','Muzhskaya-letnyaya-futbolka-12','6FA6IgEVtihqq3afupl9fIvZJuRijrd7brTjoIdK.jpeg',0.00,0,0,0,'2020-11-03 07:52:39','2020-11-03 07:52:39'),(39,8,3,'Мужские зимние ботинки 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Muzhskie-zimnie-botinki-1','q2A7mgPgFvPVoNBAvUxI8dftWZdFQn5KxaCCf6lq.jpeg',1200.00,0,1,0,'2020-11-03 07:55:13','2020-11-28 11:41:03'),(40,8,7,'Мужские зимние ботинки 2','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-2','8JKpCugqUwAezDvv7yVhVoadFNSH1oXC6YDLZ6Pl.jpeg',1500.00,1,0,0,'2020-11-03 07:56:05','2020-11-28 11:40:11'),(41,8,8,'Мужские зимние ботинки 3','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-3','p5hp7RQ5Bce0c0NqIVU2dQAw66tjRI8fL0eQzEHe.jpeg',2000.00,0,0,0,'2020-11-03 07:57:37','2020-11-28 11:41:37'),(42,8,7,'Мужские зимние ботинки 4','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-4','lOoBFAjvX4DaESwi8etUTJs0oH7WkfUwIVLzewHk.jpeg',0.00,0,0,0,'2020-11-03 08:05:19','2020-11-03 08:05:19'),(43,8,6,'Мужские зимние ботинки 5','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-5','li5w7fcSLBYrTdg6fvL1tkZtjqZNfL47PtF4VVjA.jpeg',0.00,0,0,0,'2020-11-03 08:06:30','2020-11-03 08:06:30'),(44,8,9,'Мужские зимние ботинки 6','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-6','uaUy5vq9b4ox9DlWjuQkTkqIHpl0iIpO6uXXm42B.jpeg',0.00,0,0,0,'2020-11-03 08:07:19','2020-11-03 08:07:39'),(45,8,4,'Мужские зимние ботинки 7','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-zimnie-botinki-7','AZwLoBtHV5u3HTYotkJ4bsiiaieVjW4PyLHjG8gO.jpeg',0.00,0,0,0,'2020-11-03 08:08:29','2020-11-03 08:08:29'),(46,11,10,'Мужские летние туфли 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-1','IMAxXIyMAqnLX5y5XxnxfBnavJYZ7XBRW0oHEn68.jpeg',0.00,0,0,0,'2020-11-03 08:09:25','2020-11-03 08:09:25'),(47,11,6,'Мужские летние туфли 2','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-2','ycxHtJNF9PdaJhFG1i7fKOm4zRsKWIGDOWK8b44j.jpeg',0.00,0,0,0,'2020-11-03 08:10:28','2020-11-03 08:10:28'),(48,11,10,'Мужские летние туфли 3','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-3','V4tgS4yq8RH7XVtAgbdM6Hl6Ng5aWBKSKmaHSVH6.jpeg',0.00,0,0,0,'2020-11-03 08:11:26','2020-11-03 08:11:26'),(49,11,6,'Мужские летние туфли 4','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-4','pq1XKIddqCyteIJpoHomXtjizkmycwHqpVIzeUVd.jpeg',0.00,0,0,0,'2020-11-03 08:12:36','2020-11-03 08:12:36'),(50,11,1,'Мужские летние туфли 5','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-5','Up7CTs2aLBsz7DPPI8qFWVU7T91rgOKr9C6G9bEf.jpeg',0.00,0,0,0,'2020-11-03 08:13:19','2020-11-03 08:13:19'),(51,11,7,'Мужские летние туфли 6','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-6','fXqvZtfjubyWoPv7i0iRyDUIJJyjc0XBtz2aMBFy.jpeg',0.00,0,0,0,'2020-11-03 08:14:16','2020-11-03 08:14:16'),(52,11,4,'Мужские летние туфли 7','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad alias aut blanditiis deserunt dolor dolore doloribus eaque error hic inventore ipsa ipsam itaque laborum laudantium magnam minima minus nihil non, nulla obcaecati provident quasi quis quisquam saepe sed sequi sint? Consectetur dicta earum esse exercitationem, expedita illum libero tempore voluptatum? Atque enim error iste maxime provident. Alias aliquid consequuntur cupiditate dignissimos dolorem ducimus eligendi esse eum explicabo fuga impedit molestias mollitia nihil, nisi, nostrum nulla officiis omnis provident quo vitae.','Muzhskie-letnie-tufli-7','iTi9dPFJIyDkBvFKwHroidqedJ6btFc5TrlbJ7WV.jpeg',0.00,0,0,0,'2020-11-03 08:14:58','2020-11-03 08:14:58'),(53,18,7,'Первое платье','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Pervoe-plate','5rF3tkIWDQ9aXVpYmCtaYJQQRlozH9dABKoEoL36.jpeg',2000.00,0,0,0,'2020-11-28 11:48:30','2020-11-28 11:48:30'),(54,18,3,'Второе платье','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Vtoroe-plate','4Y3ac0g5e6XQjVNU3U8CWFLzcbpv2FcY5GxCaJl5.jpeg',1700.00,0,0,1,'2020-11-28 11:49:20','2020-11-28 11:49:20'),(55,18,5,'Третье платье','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Trete-plate','LOMBbRMO3P434BpS7W0iLN48aflGg0ErMzncbE3N.jpeg',1900.00,1,0,0,'2020-11-28 11:50:21','2020-11-28 11:50:21'),(56,18,10,'Четвертое платье','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Chetvertoe-plate','tE3sowShIQwkZKkiQy6Fe7LMc5Jg4FAXXiiLK8vV.jpeg',1600.00,0,0,0,'2020-11-28 11:51:24','2020-11-28 11:51:24'),(57,18,1,'Пятое платье','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Pyatoe-plate','cuME1gN6BmtjaUx5mo3dAe0GpM0b6ML3R2kQcV87.jpeg',2100.00,0,1,0,'2020-11-28 11:52:08','2020-11-28 11:52:26'),(58,18,3,'Первая юбка','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Pervaya-yubka','zI3S1DiM1powhfR8YXyz1zTKy9Q2kUpXT8SJfYVX.jpeg',1750.00,0,0,1,'2020-11-28 11:56:30','2020-11-28 11:56:30'),(59,18,6,'Вторая юбка','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Vtoraya-yubka','XygSxu7Y2FKGPS8SfSPG1tkmKQtSWELhHDVpyJbU.jpeg',1850.00,1,0,0,'2020-11-28 11:57:22','2020-11-28 11:57:22'),(60,18,8,'Третья юбка','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Tretya-yubka','Szv2uVk83zm4koW7TrOrx73alj8rtifPXLCX0Q1p.jpeg',2150.00,0,0,0,'2020-11-28 11:58:27','2020-11-28 11:58:27'),(61,18,2,'Четвертая юбка','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Chetvertaya-yubka','f8DPU0QxwILur4XnsVjrFE4gXCybDHndhzhfzhiR.jpeg',1550.00,1,0,0,'2020-11-28 11:59:31','2020-11-28 11:59:31'),(62,18,9,'Пятая юбка','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Pyataya-yubka','6ZjomZpsO29KPjIDzJBhB50bXoUzLQXDCrpFE1pG.jpeg',1670.00,0,0,0,'2020-11-28 12:00:15','2020-11-28 12:00:15'),(63,9,6,'Мужская сумка 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Muzhskaya-sumka-1','jBXaBz4Sk4gQknukY7eQxiLWeit0cGDzVS58SVxB.jpeg',2100.00,0,0,0,'2020-11-28 12:02:39','2020-11-28 12:02:39'),(64,19,4,'Женская сумка 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab amet asperiores autem cum cumque deserunt dignissimos error exercitationem fuga fugiat illum inventore ipsum libero minus modi molestias nisi placeat, porro praesentium provident quae quam quidem ratione, sed sit unde voluptatem! Dolore expedita iure magni? Aut autem blanditiis dicta eius exercitationem explicabo illo ipsum iste, magni odit placeat quae quaerat quis reprehenderit veritatis. Alias, asperiores corporis culpa delectus est expedita, incidunt labore libero nulla officia perferendis perspiciatis provident quae repellat.','Zhenskaya-sumka-1','JSwL7t9bbbeK8SxynUKONjaRgIv7JJUQrTypdp5G.jpeg',2200.00,0,0,0,'2020-11-28 12:03:27','2020-11-28 12:03:27');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,2,'Доставка домой 2','Евгений  Токмаков','tokmakov.e@mail.ru','+7 (926) 111-11-11','125438, Москва, Онежская улица, дом 15Б, кв. 52','Доставка в выходные дни','2020-11-02 05:29:23','2020-11-02 11:53:42'),(2,2,'Доставка домой','Евгений  Токмаков','tokmakov.e@mail.ru','+7 (926) 111-11-11','125438, Москва, Онежская улица, дом 123, кв. 456','Доставка в выходные дни','2020-11-02 05:31:26','2020-11-02 11:31:48'),(3,2,'Доставка на работу','Евгений Токмаков','tokmakov.e@mail.ru','+7 (926) 111-11-11','111141, Москва, 3-й проезд Перова поля, дом 8, стр.11','Доставка в будние дни','2020-11-02 05:53:11','2020-11-02 11:54:28');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (email(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Евгений Токмаков','tokmakov.e@mail.ru',1,NULL,'$2y$10$QxlN.XeF/A5Z5lmjKTDhnOiZGjYBIUrwYf7vJSrpo29NDzOX6c4sK',NULL,'2020-10-09 05:24:59','2020-10-09 05:24:59'),(2,'Евгений Токмаков','tokmakov-e@yandex.ru',0,NULL,'$2y$10$5W0/qJpWDt3TPPx0LOdqRudShXIk1KdAwVyEIJpyLUFiI52hVsgdK',NULL,'2020-10-09 11:33:40','2020-11-01 06:21:24'),(3,'Сергей Иванов','ivanov.s@mail.ru',0,NULL,'$2y$10$UsMdWStFTLwhn30mC33RR.V.s4j23Z06U8c5fAryP0Oddu7jTkUK6',NULL,'2020-10-26 11:46:04','2020-10-26 11:46:04'),(4,'Дмитрий Петров','petrov.d@mail.ru',0,NULL,'$2y$10$lAdVpW4zVnaZ0BEaTOi8OOGKokkJVH5CcihgXhMAwhruuZcXuuPEy',NULL,'2020-10-26 11:47:18','2020-10-26 11:47:18'),(5,'Николай Смирнов','smirnov.n@gmail.com',0,NULL,'$2y$10$yvxGq8ZlVIgxa7vjxH4xfuhWFmvPKZ29bagI1uN8hKs7u73Tuw5ra',NULL,'2020-10-26 11:49:18','2020-11-02 07:16:35'),(6,'Андрей Николаев','nikolaev.a@gmail.com',0,NULL,'$2y$10$H6ASTS9bKmx6tS0Oou6zUeB1693IiEUC9axyvwtJTy/x0v9czlG6C',NULL,'2020-10-26 11:50:17','2020-10-26 11:50:17');
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

-- Dump completed on 2020-12-01 13:03:17
