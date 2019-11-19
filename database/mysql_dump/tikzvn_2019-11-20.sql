# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.6-MariaDB)
# Database: tikzvn
# Generation Time: 2019-11-19 17:49:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` tinyint(4) DEFAULT NULL,
  `is_header` tinyint(4) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 0,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `type_id`, `is_header`, `is_active`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'Dashboard',1,0,0,'fa-home','/',NULL,NULL,'2019-11-19 16:06:01'),
	(2,0,2,'Admin',2,0,0,'fa-tasks','',NULL,NULL,NULL),
	(3,2,3,'Users',2,0,0,'fa-users','auth/users',NULL,NULL,NULL),
	(4,2,4,'Roles',2,0,0,'fa-user','auth/roles',NULL,NULL,NULL),
	(5,2,5,'Permission',2,0,0,'fa-ban','auth/permissions',NULL,NULL,NULL),
	(6,2,6,'Menu',2,0,0,'fa-bars','auth/menu',NULL,NULL,NULL),
	(7,2,7,'Operation log',2,0,0,'fa-history','auth/logs',NULL,NULL,NULL),
	(10,0,10,'Translations',1,0,0,'fa-leanpub','translations',NULL,NULL,'2019-11-19 16:06:15'),
	(11,0,10,'Log viewer',1,0,0,'fa-edit','logviewer',NULL,NULL,'2019-11-19 16:06:27'),
	(12,0,0,'Menu home',1,0,0,'fa-list-alt','/menu_homes',NULL,'2019-11-19 16:07:12','2019-11-19 16:07:28'),
	(13,0,0,'Tag',1,0,0,'fa-tag','tags',NULL,'2019-11-19 16:40:27','2019-11-19 16:40:27'),
	(14,0,0,'Config Site',1,0,0,'fa-connectdevelop','config_sites',NULL,'2019-11-19 16:45:49','2019-11-19 16:45:49');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_notifies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_notifies`;

CREATE TABLE `admin_notifies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `messenger` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin/auth/logs','GET','127.0.0.1','[]','2019-11-18 10:26:30','2019-11-18 10:26:30'),
	(2,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-18 10:26:33','2019-11-18 10:26:33'),
	(3,1,'admin/auth/roles','GET','127.0.0.1','[]','2019-11-18 10:26:36','2019-11-18 10:26:36'),
	(4,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-11-18 10:26:39','2019-11-18 10:26:39'),
	(5,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-18 10:38:56','2019-11-18 10:38:56'),
	(6,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:13:28','2019-11-18 15:13:28'),
	(7,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:22:37','2019-11-18 15:22:37'),
	(8,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:25:29','2019-11-18 15:25:29'),
	(9,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:27:27','2019-11-18 15:27:27'),
	(10,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:27:31','2019-11-18 15:27:31'),
	(11,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:27:44','2019-11-18 15:27:44'),
	(12,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:27:46','2019-11-18 15:27:46'),
	(13,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:27:53','2019-11-18 15:27:53'),
	(14,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:28:12','2019-11-18 15:28:12'),
	(15,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:28:35','2019-11-18 15:28:35'),
	(16,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:29:50','2019-11-18 15:29:50'),
	(17,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:30:13','2019-11-18 15:30:13'),
	(18,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:30:33','2019-11-18 15:30:33'),
	(19,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:30:54','2019-11-18 15:30:54'),
	(20,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:31:02','2019-11-18 15:31:02'),
	(21,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:31:15','2019-11-18 15:31:15'),
	(22,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:31:23','2019-11-18 15:31:23'),
	(23,1,'admin','GET','127.0.0.1','[]','2019-11-18 15:31:42','2019-11-18 15:31:42'),
	(24,1,'admin','GET','127.0.0.1','[]','2019-11-18 16:01:29','2019-11-18 16:01:29'),
	(25,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-18 16:01:36','2019-11-18 16:01:36'),
	(26,1,'admin/auth/roles','GET','127.0.0.1','[]','2019-11-18 16:01:40','2019-11-18 16:01:40'),
	(27,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-11-18 16:01:42','2019-11-18 16:01:42'),
	(28,1,'admin/auth/permissions/1/edit','GET','127.0.0.1','[]','2019-11-18 16:01:46','2019-11-18 16:01:46'),
	(29,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-18 16:01:49','2019-11-18 16:01:49'),
	(30,1,'admin','GET','127.0.0.1','[]','2019-11-18 16:01:56','2019-11-18 16:01:56'),
	(31,1,'admin/logviewer','GET','127.0.0.1','[]','2019-11-18 16:01:59','2019-11-18 16:01:59'),
	(32,1,'admin','GET','127.0.0.1','[]','2019-11-19 06:38:56','2019-11-19 06:38:56'),
	(33,1,'admin/auth/setting','GET','127.0.0.1','[]','2019-11-19 06:39:07','2019-11-19 06:39:07'),
	(34,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-19 06:39:12','2019-11-19 06:39:12'),
	(35,1,'admin','GET','127.0.0.1','[]','2019-11-19 06:39:14','2019-11-19 06:39:14'),
	(36,1,'admin','GET','127.0.0.1','[]','2019-11-19 06:39:17','2019-11-19 06:39:17'),
	(37,1,'admin/logviewer','GET','127.0.0.1','[]','2019-11-19 06:39:20','2019-11-19 06:39:20'),
	(38,1,'admin/translations','GET','127.0.0.1','[]','2019-11-19 06:39:21','2019-11-19 06:39:21'),
	(39,1,'admin/logviewer','GET','127.0.0.1','[]','2019-11-19 06:39:23','2019-11-19 06:39:23'),
	(40,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-19 06:39:36','2019-11-19 06:39:36'),
	(41,1,'admin/departments','GET','127.0.0.1','[]','2019-11-19 06:39:48','2019-11-19 06:39:48'),
	(42,1,'admin/auth/logs','GET','127.0.0.1','[]','2019-11-19 06:40:03','2019-11-19 06:40:03'),
	(43,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 06:40:05','2019-11-19 06:40:05'),
	(44,1,'admin','GET','127.0.0.1','[]','2019-11-19 08:56:26','2019-11-19 08:56:26'),
	(45,1,'admin/auth/users','GET','127.0.0.1','[]','2019-11-19 08:56:33','2019-11-19 08:56:33'),
	(46,1,'admin/logviewer','GET','127.0.0.1','[]','2019-11-19 08:56:39','2019-11-19 08:56:39'),
	(47,1,'admin','GET','127.0.0.1','[]','2019-11-19 15:09:04','2019-11-19 15:09:04'),
	(48,1,'admin','GET','127.0.0.1','[]','2019-11-19 16:04:49','2019-11-19 16:04:49'),
	(49,1,'admin','GET','127.0.0.1','[]','2019-11-19 16:05:07','2019-11-19 16:05:07'),
	(50,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:05:23','2019-11-19 16:05:23'),
	(51,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:05:31','2019-11-19 16:05:31'),
	(52,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:05:42','2019-11-19 16:05:42'),
	(53,1,'admin/auth/menu/1/edit','GET','127.0.0.1','[]','2019-11-19 16:05:46','2019-11-19 16:05:46'),
	(54,1,'admin/auth/menu/1','PUT','127.0.0.1','{\"id\":\"1\",\"parent_id\":\"0\",\"title\":\"Dashboard\",\"type_id\":\"1\",\"icon\":\"fa-home\",\"uri\":\"\\/\",\"roles\":[null],\"is_header\":\"off\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/auth\\/menu\"}','2019-11-19 16:06:01','2019-11-19 16:06:01'),
	(55,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:06:01','2019-11-19 16:06:01'),
	(56,1,'admin/auth/menu/10/edit','GET','127.0.0.1','[]','2019-11-19 16:06:04','2019-11-19 16:06:04'),
	(57,1,'admin/auth/menu/10','PUT','127.0.0.1','{\"id\":\"10\",\"parent_id\":\"0\",\"title\":\"Translations\",\"type_id\":\"1\",\"icon\":\"fa-leanpub\",\"uri\":\"translations\",\"roles\":[null],\"is_header\":\"off\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/auth\\/menu\"}','2019-11-19 16:06:15','2019-11-19 16:06:15'),
	(58,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:06:15','2019-11-19 16:06:15'),
	(59,1,'admin/auth/menu/11/edit','GET','127.0.0.1','[]','2019-11-19 16:06:18','2019-11-19 16:06:18'),
	(60,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"id\":\"11\",\"parent_id\":\"0\",\"title\":\"Log viewer\",\"type_id\":\"1\",\"icon\":\"fa-edit\",\"uri\":\"logviewer\",\"roles\":[null],\"is_header\":\"off\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/auth\\/menu\"}','2019-11-19 16:06:27','2019-11-19 16:06:27'),
	(61,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:06:27','2019-11-19 16:06:27'),
	(62,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Menu home\",\"type_id\":\"1\",\"icon\":\"fa-list-alt\",\"uri\":null,\"roles\":[null],\"is_header\":\"off\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\"}','2019-11-19 16:07:12','2019-11-19 16:07:12'),
	(63,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:07:12','2019-11-19 16:07:12'),
	(64,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:07:12','2019-11-19 16:07:12'),
	(65,1,'admin/auth/menu/12/edit','GET','127.0.0.1','[]','2019-11-19 16:07:17','2019-11-19 16:07:17'),
	(66,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"id\":\"12\",\"parent_id\":\"0\",\"title\":\"Menu home\",\"type_id\":\"1\",\"icon\":\"fa-list-alt\",\"uri\":\"\\/menu_homes\",\"roles\":[\"1\",null],\"is_header\":\"off\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/auth\\/menu\"}','2019-11-19 16:07:28','2019-11-19 16:07:28'),
	(67,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:07:28','2019-11-19 16:07:28'),
	(68,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:14:46','2019-11-19 16:14:46'),
	(69,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:15:03','2019-11-19 16:15:03'),
	(70,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:15:05','2019-11-19 16:15:05'),
	(71,1,'admin/menu_homes/favicon.png','GET','127.0.0.1','[]','2019-11-19 16:15:06','2019-11-19 16:15:06'),
	(72,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:15:38','2019-11-19 16:15:38'),
	(73,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:16:18','2019-11-19 16:16:18'),
	(74,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:17:07','2019-11-19 16:17:07'),
	(75,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:17:46','2019-11-19 16:17:46'),
	(76,1,'admin/menu_homes/favicon.png','GET','127.0.0.1','[]','2019-11-19 16:17:48','2019-11-19 16:17:48'),
	(77,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:17:57','2019-11-19 16:17:57'),
	(78,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:18:09','2019-11-19 16:18:09'),
	(79,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:18:09','2019-11-19 16:18:09'),
	(80,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:18:22','2019-11-19 16:18:22'),
	(81,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"T\\u00e0i li\\u1ec7u h\\u1ecdc v\\u1ebd\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:18:30','2019-11-19 16:18:30'),
	(82,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:18:31','2019-11-19 16:18:31'),
	(83,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:18:33','2019-11-19 16:18:33'),
	(84,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Tin t\\u1ee9c\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:18:39','2019-11-19 16:18:39'),
	(85,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:18:40','2019-11-19 16:18:40'),
	(86,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:18:43','2019-11-19 16:18:43'),
	(87,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:18:48','2019-11-19 16:18:48'),
	(88,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:18:49','2019-11-19 16:18:49'),
	(89,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:18:58','2019-11-19 16:18:58'),
	(90,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Li\\u00ean h\\u1ec7\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:19:04','2019-11-19 16:19:04'),
	(91,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:19:04','2019-11-19 16:19:04'),
	(92,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:19:08','2019-11-19 16:19:08'),
	(93,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Danh m\\u1ee5c h\\u00ecnh v\\u1ebd\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:19:14','2019-11-19 16:19:14'),
	(94,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:19:15','2019-11-19 16:19:15'),
	(95,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:19:40','2019-11-19 16:19:40'),
	(96,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:19:42','2019-11-19 16:19:42'),
	(97,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:20:09','2019-11-19 16:20:09'),
	(98,1,'admin/menu_homes/6','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"2\",\"pk\":\"6\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:20:15','2019-11-19 16:20:15'),
	(99,1,'admin/menu_homes/2','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"3\",\"pk\":\"2\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:20:22','2019-11-19 16:20:22'),
	(100,1,'admin/menu_homes/3','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"4\",\"pk\":\"3\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:20:33','2019-11-19 16:20:33'),
	(101,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"5\",\"pk\":\"4\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:20:37','2019-11-19 16:20:37'),
	(102,1,'admin/menu_homes/5','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"6\",\"pk\":\"5\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:20:39','2019-11-19 16:20:39'),
	(103,1,'admin/menu_homes/create','GET','127.0.0.1','[]','2019-11-19 16:21:29','2019-11-19 16:21:29'),
	(104,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Flight Operations\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:21:37','2019-11-19 16:21:37'),
	(105,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Flight Operations\",\"code\":null,\"order\":null,\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:21:52','2019-11-19 16:21:52'),
	(106,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:21:52','2019-11-19 16:21:52'),
	(107,1,'admin/menu_homes/7','GET','127.0.0.1','[]','2019-11-19 16:21:56','2019-11-19 16:21:56'),
	(108,1,'admin/menu_homes/7/edit','GET','127.0.0.1','[]','2019-11-19 16:21:59','2019-11-19 16:21:59'),
	(109,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:22:12','2019-11-19 16:22:12'),
	(110,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:22:26','2019-11-19 16:22:26'),
	(111,1,'admin/menu_homes/6/edit','GET','127.0.0.1','[]','2019-11-19 16:22:36','2019-11-19 16:22:36'),
	(112,1,'admin/menu_homes/6','PUT','127.0.0.1','{\"name\":\"Danh m\\u1ee5c h\\u00ecnh v\\u1ebd\",\"code\":null,\"order\":\"2\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:22:45','2019-11-19 16:22:45'),
	(113,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:22:45','2019-11-19 16:22:45'),
	(114,1,'admin/menu_homes/6/edit','GET','127.0.0.1','[]','2019-11-19 16:22:59','2019-11-19 16:22:59'),
	(115,1,'admin/menu_homes/6','PUT','127.0.0.1','{\"name\":\"Danh m\\u1ee5c h\\u00ecnh v\\u1ebd\",\"code\":\"danh-muc-hinh-ve\",\"order\":\"2\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:01','2019-11-19 16:23:01'),
	(116,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:01','2019-11-19 16:23:01'),
	(117,1,'admin/menu_homes/5/edit','GET','127.0.0.1','[]','2019-11-19 16:23:03','2019-11-19 16:23:03'),
	(118,1,'admin/menu_homes/5','PUT','127.0.0.1','{\"name\":\"Li\\u00ean h\\u1ec7\",\"code\":null,\"order\":\"6\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:05','2019-11-19 16:23:05'),
	(119,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:05','2019-11-19 16:23:05'),
	(120,1,'admin/menu_homes/4/edit','GET','127.0.0.1','[]','2019-11-19 16:23:07','2019-11-19 16:23:07'),
	(121,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"code\":null,\"order\":\"5\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:08','2019-11-19 16:23:08'),
	(122,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:09','2019-11-19 16:23:09'),
	(123,1,'admin/menu_homes/3/edit','GET','127.0.0.1','[]','2019-11-19 16:23:11','2019-11-19 16:23:11'),
	(124,1,'admin/menu_homes/3','PUT','127.0.0.1','{\"name\":\"Tin t\\u1ee9c\",\"code\":null,\"order\":\"4\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:13','2019-11-19 16:23:13'),
	(125,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:13','2019-11-19 16:23:13'),
	(126,1,'admin/menu_homes/2/edit','GET','127.0.0.1','[]','2019-11-19 16:23:15','2019-11-19 16:23:15'),
	(127,1,'admin/menu_homes/2','PUT','127.0.0.1','{\"name\":\"T\\u00e0i li\\u1ec7u h\\u1ecdc v\\u1ebd\",\"code\":null,\"order\":\"3\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:16','2019-11-19 16:23:16'),
	(128,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:16','2019-11-19 16:23:16'),
	(129,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 16:23:18','2019-11-19 16:23:18'),
	(130,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:23:19','2019-11-19 16:23:19'),
	(131,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:23:19','2019-11-19 16:23:19'),
	(132,1,'admin/menu_homes/7','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"7\",\"pk\":\"7\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 16:23:23','2019-11-19 16:23:23'),
	(133,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:24:24','2019-11-19 16:24:24'),
	(134,1,'admin/menu_homes/7/edit','GET','127.0.0.1','[]','2019-11-19 16:24:33','2019-11-19 16:24:33'),
	(135,1,'admin/menu_homes/7','PUT','127.0.0.1','{\"name\":\"Flight Operations\",\"code\":null,\"order\":\"7\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:24:34','2019-11-19 16:24:34'),
	(136,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:24:34','2019-11-19 16:24:34'),
	(137,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:24:36','2019-11-19 16:24:36'),
	(138,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:25:49','2019-11-19 16:25:49'),
	(139,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:26:12','2019-11-19 16:26:12'),
	(140,1,'admin/menu_homes/7','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\"}','2019-11-19 16:26:20','2019-11-19 16:26:20'),
	(141,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 16:26:21','2019-11-19 16:26:21'),
	(142,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:26:22','2019-11-19 16:26:22'),
	(143,1,'admin/menu_homes/7','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\"}','2019-11-19 16:26:31','2019-11-19 16:26:31'),
	(144,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 16:26:32','2019-11-19 16:26:32'),
	(145,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:26:33','2019-11-19 16:26:33'),
	(146,1,'admin/menu_homes/7','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\"}','2019-11-19 16:26:45','2019-11-19 16:26:45'),
	(147,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 16:26:46','2019-11-19 16:26:46'),
	(148,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:26:46','2019-11-19 16:26:46'),
	(149,1,'admin/menu_homes/7','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\"}','2019-11-19 16:31:06','2019-11-19 16:31:06'),
	(150,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 16:31:07','2019-11-19 16:31:07'),
	(151,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:31:08','2019-11-19 16:31:08'),
	(152,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 16:32:11','2019-11-19 16:32:11'),
	(153,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":\"hinh-ve\",\"order\":\"1\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:13','2019-11-19 16:32:13'),
	(154,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:13','2019-11-19 16:32:13'),
	(155,1,'admin/menu_homes/2/edit','GET','127.0.0.1','[]','2019-11-19 16:32:15','2019-11-19 16:32:15'),
	(156,1,'admin/menu_homes/2','PUT','127.0.0.1','{\"name\":\"T\\u00e0i li\\u1ec7u h\\u1ecdc v\\u1ebd\",\"code\":\"tai-lieu-hoc-ve\",\"order\":\"3\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:17','2019-11-19 16:32:17'),
	(157,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:17','2019-11-19 16:32:17'),
	(158,1,'admin/menu_homes/3/edit','GET','127.0.0.1','[]','2019-11-19 16:32:18','2019-11-19 16:32:18'),
	(159,1,'admin/menu_homes/3','PUT','127.0.0.1','{\"name\":\"Tin t\\u1ee9c\",\"code\":\"tin-tuc\",\"order\":\"4\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:20','2019-11-19 16:32:20'),
	(160,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:20','2019-11-19 16:32:20'),
	(161,1,'admin/menu_homes/4/edit','GET','127.0.0.1','[]','2019-11-19 16:32:21','2019-11-19 16:32:21'),
	(162,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"code\":\"gioi-thieu\",\"order\":\"5\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:23','2019-11-19 16:32:23'),
	(163,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:23','2019-11-19 16:32:23'),
	(164,1,'admin/menu_homes/5/edit','GET','127.0.0.1','[]','2019-11-19 16:32:24','2019-11-19 16:32:24'),
	(165,1,'admin/menu_homes/5','PUT','127.0.0.1','{\"name\":\"Li\\u00ean h\\u1ec7\",\"code\":\"lien-he\",\"order\":\"6\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:26','2019-11-19 16:32:26'),
	(166,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:26','2019-11-19 16:32:26'),
	(167,1,'admin/menu_homes/6/edit','GET','127.0.0.1','[]','2019-11-19 16:32:27','2019-11-19 16:32:27'),
	(168,1,'admin/menu_homes/6','PUT','127.0.0.1','{\"name\":\"Danh m\\u1ee5c h\\u00ecnh v\\u1ebd\",\"code\":\"danh-muc-hinh-ve\",\"order\":\"2\",\"path\":null,\"_token\":\"QMkCpPURm3RCmWsxmMSrN6FDQBDdyEX8HZuL2ZyB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 16:32:28','2019-11-19 16:32:28'),
	(169,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 16:32:29','2019-11-19 16:32:29'),
	(170,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 16:32:35','2019-11-19 16:32:35'),
	(171,1,'admin/auth/login','GET','127.0.0.1','[]','2019-11-19 16:37:26','2019-11-19 16:37:26'),
	(172,1,'admin','GET','127.0.0.1','[]','2019-11-19 16:38:27','2019-11-19 16:38:27'),
	(173,1,'admin/auth/logout','GET','127.0.0.1','[]','2019-11-19 16:38:31','2019-11-19 16:38:31'),
	(174,1,'admin','GET','127.0.0.1','[]','2019-11-19 16:38:43','2019-11-19 16:38:43'),
	(175,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:40:09','2019-11-19 16:40:09'),
	(176,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Tag\",\"type_id\":\"1\",\"icon\":\"fa-tag\",\"uri\":\"tags\",\"roles\":[\"1\",null],\"is_header\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 16:40:27','2019-11-19 16:40:27'),
	(177,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:40:27','2019-11-19 16:40:27'),
	(178,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:40:28','2019-11-19 16:40:28'),
	(179,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 16:40:31','2019-11-19 16:40:31'),
	(180,1,'admin/tags/create','GET','127.0.0.1','[]','2019-11-19 16:40:33','2019-11-19 16:40:33'),
	(181,1,'admin/tags/favicon.png','GET','127.0.0.1','[]','2019-11-19 16:40:34','2019-11-19 16:40:34'),
	(182,1,'admin/tags/create','GET','127.0.0.1','[]','2019-11-19 16:42:24','2019-11-19 16:42:24'),
	(183,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 16:42:27','2019-11-19 16:42:27'),
	(184,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:45:26','2019-11-19 16:45:26'),
	(185,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Config Site\",\"type_id\":\"1\",\"icon\":\"fa-connectdevelop\",\"uri\":\"config_sites\",\"roles\":[\"1\",null],\"is_header\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 16:45:49','2019-11-19 16:45:49'),
	(186,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:45:49','2019-11-19 16:45:49'),
	(187,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-11-19 16:45:50','2019-11-19 16:45:50'),
	(188,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 16:45:51','2019-11-19 16:45:51'),
	(189,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 16:46:09','2019-11-19 16:46:09'),
	(190,1,'admin/config_sites/favicon.png','GET','127.0.0.1','[]','2019-11-19 16:46:10','2019-11-19 16:46:10'),
	(191,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"tai-lieu-hoc-ve\",\"content\":\"<p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">M\\u1ed9t s\\u1ed1 th\\u1ea7y \\u0111\\u00e3 d\\u1ecbch v\\u00e0 bi\\u00ean so\\u1ea1n t\\u00e0i li\\u1ec7u h\\u1ecdc v\\u1ebd h\\u00ecnh TikZ, Asymptote b\\u1eb1ng ti\\u1ebfng Vi\\u1ec7t. C\\u1ea3m \\u01a1n c\\u00e1c th\\u1ea7y!<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.1] V\\u1ebd h\\u00ecnh h\\u1ecdc ph\\u1eb3ng b\\u1eb1ng g\\u00f3i tkz-euclide, Hu\\u1ef3nh V\\u0103n Th\\u01a1&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/tho.huynh.524?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARBg_M7ajks-wIailWPTyST-gZzNJLnBqIMxYGm3uf0uA4sCejAh9L_oRKFBOUinokAEklmRKOciJLDG&amp;dti=217239182149447&amp;hc_location=group\\\" style=\\\"color: rgb(30, 115, 190);\\\">Tho Huynh<\\/a>, c\\u1eadp nh\\u1eadt 01\\/2019.<br><a href=\\\"https:\\/\\/www.dropbox.com\\/s\\/j085zdy38k6v3wx\\/TKZ-EUCLIDE2019.pdf?fbclid=IwAR02t2GgKUI_eHoct5m-DMqZlY-0eLcpI9XAoxkhiB73ViwRlDUgfUlZiIU\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/www.dropbox.com\\/s\\/j085zdy38k6v3\\u2026\\/TKZ-EUCLIDE2019.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.2] V\\u1ebd h\\u00ecnh h\\u1ecdc ph\\u1eb3ng b\\u1eb1ng g\\u00f3i geometry trong ph\\u1ea7n m\\u1ec1m Asymptote, Hu\\u1ef3nh V\\u0103n Th\\u01a1,&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/tho.huynh.524?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARBV1LVoi0v56uKYUyDxdZ1hLplauR1jgVb5aejWGmCjema3IDw9h2b72YZYyPGOR5X6zjgxJvc-ubr8&amp;dti=217239182149447&amp;hc_location=group\\\" style=\\\"color: rgb(30, 115, 190);\\\">Tho Huynh<\\/a>&nbsp;c\\u1eadp nh\\u1eadt 06\\/2018, 71 trang.<br><a href=\\\"https:\\/\\/www.dropbox.com\\/s\\/ddalic4ajaa9coo\\/HDSD-geometry.pdf?fbclid=IwAR0ScP76lI_aCUWe9SzRCVIsTwqp2TAijK9ZWVW3ADAunIL18mm9JgBXlm0\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/www.dropbox.com\\/s\\/ddalic4ajaa9coo\\/HDSD-geometry.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.3] T\\u1ed5ng h\\u1ee3p m\\u1ed9t s\\u1ed1 t\\u00e0i li\\u1ec7u kh\\u00e1c v\\u1ec1 v\\u1ebd h\\u00ecnh b\\u1eb1ng ti\\u1ebfng Vi\\u1ec7t c\\u1ee7a c\\u00e1c th\\u1ea7y Phan V\\u0103n Ph\\u01b0\\u01a1ng, Ph\\u1ea1m V\\u0103n \\u0110\\u1ee9c, Ph\\u00f9ng Gia Lu\\u00e2n&nbsp;<br><a href=\\\"https:\\/\\/www.dropbox.com\\/s\\/mkgt484hoh4jfw7\\/ducluanphuong.rar?fbclid=IwAR0GWlJQaOOggtYdNqSgpIqxJv65rexxxBFF64jMuW0hxu45DvPuYfNtd3w\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/www.dropbox.com\\/s\\/mkgt484hoh4jfw7\\/ducluanphuong.rar<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.4]<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.5] C\\u00f4ng c\\u1ee5 v\\u1ebd h\\u00ecnh, b\\u1ea3ng bi\\u1ebfn thi\\u00ean, b\\u1ea3ng x\\u00e9t d\\u1ea5u (c\\u00f3 l\\u1ea5y m\\u00e3 TikZ) c\\u1ee7a&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/phanthanhtam295?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARCVxl5hIq3L9213Yob0-McgxIAHoJ3zAvczRV4cGjfwQ0i9JnsPtBVkSIKJqntlV-wWwg3ksuLInfMu&amp;dti=217239182149447&amp;hc_location=group\\\" style=\\\"color: rgb(30, 115, 190);\\\">Phan Thanh T\\u00e2m<\\/a><br><a rel=\\\"noreferrer noopener\\\" href=\\\"https:\\/\\/drive.google.com\\/file\\/d\\/1qS4AJLweuGONoBp6nZ_GeIr6tWirQKNW\\/view?fbclid=IwAR168Dnuh0E2ATL_u83jepcm28Uk1qXyi3xpIiW-MOPBdGjUXCs-EkOPKI8\\\" target=\\\"_blank\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/drive.google.com\\/\\u2026\\/1qS4AJLweuGONoBp6nZ_GeIr6tW\\u2026\\/view<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[0.6] TikZ v\\u00e0 LaTeX,&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/buiquyhn77?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARC8YDNQ6qifX1FdOFhMr377vALc6q8h3VQmsoP7jvzkewVcvtiiRVezoURv-gpUNqK9K2ePZsTGX9XR&amp;dti=217239182149447&amp;hc_location=group\\\" style=\\\"color: rgb(30, 115, 190);\\\">B\\u00f9i Qu\\u1ef9<\\/a>&nbsp;(\\u0111ang bi\\u00ean so\\u1ea1n)&nbsp;<a href=\\\"https:\\/\\/drive.google.com\\/file\\/d\\/1Si7Z1jX7c-kC_ZdURDLn33r7F_-D8OSq\\/view?fbclid=IwAR1iBP4eoJvBl0STVpw9oJQAdKw8blr90KC5BoP5LjkvDt294iWEkG0Xhbw\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/drive.google.com\\/\\u2026\\/1Si7Z1jX7c-kC_ZdURDLn33r7F\\u2026\\/view\\u2026<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Ph\\u1ea7n 1: TIKZ<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.1] C\\u1ea9m nang v\\u1ebd h\\u00ecnh Tikz (ti\\u1ebfng Anh) T\\u00e1c gi\\u1ea3: Till Tantao \\u2013 ng\\u01b0\\u1eddi vi\\u1ebft ra g\\u00f3i l\\u1ec7nh TikZ<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Version 3.0.1a, 1161 trang, n\\u0103m 2015&nbsp;<br><a href=\\\"http:\\/\\/mirror.kku.ac.th\\/CTAN\\/graphics\\/pgf\\/base\\/doc\\/pgfmanual.pdf?fbclid=IwAR2q11Rza6ECy9sScOM1bveoqQUi5KCI_VgaD6-kUbzzjCrQHUE6q0PmBuc\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/mirror.kku.ac.th\\/\\u2026\\/graphi\\u2026\\/pgf\\/base\\/doc\\/pgfmanual.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Version 3.0.1, unstable builds, th\\u00e1ng 11\\/ 2017&nbsp;<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fpgf.sourceforge.net%2Fpgf_CVS.pdf%3Ffbclid%3DIwAR0PgXrJKNSb_21Go7x9u-PZCZCmAdvnmXvLnml3QpTPCllLumcfw-OLu_Y&amp;h=AT0OQQdzCMMqrtEEIld_BJHA2M5BHcwMlSNUZWR-6ZfMy9A3pOwnXPxmxm_QTLzqRRNvMY0Vagx1seC1SPLZg9nvepF5LC504RBsr1zdcxnapH7JBIf0rH5-RtKEwPsNufs0fx5Hleq2wYkFElbzhA\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/pgf.sourceforge.net\\/pgf_CVS.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.2] TikZ pour l\\u2019impatient T\\u00e1c gi\\u1ea3: T. Jacques v\\u00e0 J. Duma, n\\u0103m 2017, ti\\u1ebfng Ph\\u00e1p&nbsp;<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fmath.et.info.free.fr%2FTikZ%2Fbdd%2FTikZ-Impatient.pdf%3Ffbclid%3DIwAR2pNZYOSXqfvDLSyuxAyP7eo8ONaHN7opvWXgKPcNol4BsyHaLtaL12zic&amp;h=AT332CL0WSIvIxz9A7HSvTipvyDi_5nUOML9kS_f-XeJor4eDL9r-iBLsRWTzJeBs0lBumBG1Py_G7gf9cbkYBqifViR7ETXpAYvQ0Md6GTlFctJ-MZLHf5fCoeECCk666ofkzhYcSDFElLng6FUkg\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/math.et.info.free.fr\\/TikZ\\/bdd\\/TikZ-Impatient.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.3] tkz-euclide (ti\\u1ebfng Ph\\u00e1p)&nbsp;<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fmirror.kku.ac.th%2FCTAN%2Fmacros%2Flatex%2Fcontrib%2Ftkz%2Ftkz-euclide%2Fdoc%2Ftkz-euclide-screen.pdf%3Ffbclid%3DIwAR1tbIFi89BTQqfiN2t5GZWC_HWKysC6GqSPitFYofa0ea3wDhs2DXEeJME&amp;h=AT2wQ6HI7uDQ907kI48bpDawQ4HSYgbfF5cH8NRkZcalVIZa8IC75-D8f4JBHo44cAVGj9FLk5D8tZgjb_ykOClexnzmqO0-BAYIHiVVYh2fC8ibeQT5u4i4l1bw8yiw5FxSmI8CaGjM_AL6An8p3A\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/mirror.kku.ac.th\\/\\u2026\\/tkz-eu\\u2026\\/doc\\/tkz-euclide-screen.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.4]&nbsp;<a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Ftexample.net%2F%3Ffbclid%3DIwAR30Q3GhZlf72Ijf_T0ZpGfTAl5AErT0EkucRpqDmROgmDyu7vKhJwGhlyM&amp;h=AT2kku65lFroGwBsfBAzWrCtXyaUL_SonnEp0AlEY7F7i7OZPOUC7sgXqj5-GUIzPrl-_PlP-v76e3LvYyvT5Hu4ajr_dlMacBIBdzkupgAwFE6IIhBtUj2awVmht2ln4J9FGFDf7V7o6DieGxmB5A\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/texample.net\\/<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.5] Visual TikZ, Version 0.66, Jean Pierre Casteleyn, 2018&nbsp;<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Ftug.ctan.org%2Finfo%2Fvisualtikz%2FVisualTikZ.pdf%3Ffbclid%3DIwAR2R8rBr7qdUX7Ui39Hape1Pql3KaZ-SsEbt_yxOVf3V2g9lIwhYJ_7Rgv4&amp;h=AT2OP-Zru6qiS6MEa2IpTNCemHhKxtjIBVOpSRhvcC1Rwy6Mpn3udkSvyFBM3rv21gZTDJldlB2VyI338K6qslEeVChn26OZULVMWibRqIRV8YoZ7nqpj6W4jlL1t7K40nF5kcWNx3ED5oLysaj7uQ\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/tug.ctan.org\\/info\\/visualtikz\\/VisualTikZ.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[1.6] LaTex and Friends, 292 trang, M.R.C. van Dongen, 2010<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fwww.stat.wvu.edu%2F%7Ejharner%2Fcourses%2Fstat624%2Fdocs%2FLaTeX-and-Friends.pdf%3Ffbclid%3DIwAR0kElhtxwt9ReGKcCmtNlQ0WXXiu7F18yY7MHVhBZK8axVaBe0G6cX1cEg&amp;h=AT3L8XOAgPF2Fk3cGnij_CaHXcNr2EMF-HpTFhdxajPpoTR3-f9Qwb7UVeIB5s2ZHq8VQvNjfBzzHWy5g1OiubQRTDXQlM9JbG6CfEI4DP_3fmqpF2AaA4R3JENobOnrx3Wxm4nOY3tePQCnxJDXaQ\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/www.stat.wvu.edu\\/\\u2026\\/stat624\\/docs\\/LaTeX-and-Friends.pdf<\\/a><br>*********************************************<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Ph\\u1ea7n 2: ASYMPTOTE<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Asymptote: Ng\\u00f4n ng\\u1eef l\\u1eadp tr\\u00ecnh d\\u00f9ng v\\u1ebd h\\u00ecnh 2D v\\u00e0 3D d\\u1ea1ng v\\u00e9c-t\\u01a1, c\\u00f3 th\\u1ec3 t\\u00edch h\\u1ee3p trong c\\u00e1c lo\\u1ea1i TeX (2D &amp; 3D TeX-Aware Vector Graphics&nbsp;<br>Language)&nbsp;<a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fasymptote.sourceforge.net%2F%3Ffbclid%3DIwAR37AJnCXLsILiAgRuzLIQcN7SHyPfU4rzB6Fzuir8Qh0aS1G2gutYVQXi0&amp;h=AT0DdTBkGxXk6uag7dKW2IFTgxjBo5ZzXG_c-bh8TFT_KspIzASKF2mdCjOfH0AZ2pHs6Ksih2eENDJd4bekJVSJWd53qXoyHeuIM_0GoVxwJ9MQ9aPv05NVKBrM-Cvmb98k4p_CzGOfJTpdnKN8yw\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/asymptote.sourceforge.net\\/<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[2.1]Asymptote: the vector graphic language T\\u00e1c gi\\u1ea3: Andy Hammerlindl, John Bowman, and Tom Prince, version 2.47, 189 trang, 2018<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fasymptote.sourceforge.net%2Fasymptote.pdf%3Ffbclid%3DIwAR1WbQfgwmQOn6zJnLcHhfO0_IQF1i-QUxGc7ewinGSgHo6bG8nO9nOxPgg&amp;h=AT3ZXrtYPLjsXmVWIOcqtt3axIffPsmtfqibtCwjLyVyXylY9Ozk8mhmjRe0BL456UEoyPavSh0G9L1csaJCJ8qFT0RlmA5AqOWNauBzP-ZgENrud0b--YTks3Yy5NZN0ZyZvVt4cn9Jo9Lv5dzSMw\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/asymptote.sourceforge.net\\/asymptote.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[2.2] An Asymptote tutorial T\\u00e1c gi\\u1ea3: Charles Staats III, 109 trang, 2015<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=https%3A%2F%2Fmath.uchicago.edu%2F%7Ecstaats%2FCharles_Staats_III%2FNotes_and_papers_files%2Fasymptote_tutorial.pdf%3Ffbclid%3DIwAR0QX0O2221BfxJtPjf6dVvKA718cCqTVJIzTXSjdprgjGot432RZN7_qVg&amp;h=AT2DnpfWjM9Yr57xaI7F9Sxl1AxWIfvyAkvWIE4HbwSMjDOvEBx-DGWE1dTDWKandCnans5KX4QXiGGrWr-1rTwMyW1KBJSXSMXK8wbf8Uc1tAQ7hxBvGhXtXf299vk8SnT8ggak6m50zi8zFt2VNg\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/math.uchicago.edu\\/\\u2026\\/Notes_an\\u2026\\/asymptote_tutorial.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[2.3] Euclidean geometry with asymptote, 95 trang, t\\u00e1c gi\\u1ea3 Philippe Ivaldi (d\\u1ecbch t\\u1eeb b\\u1ea3n ti\\u1ebfng Ph\\u00e1p)<br><a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fwww.piprime.fr%2Ffiles%2Fres%2Fgeometry_en.pdf%3Ffbclid%3DIwAR3Tx9s9ZmK5hUKyseSmn-BH2sXrBkNsDdECdIi82IHV7wllh977FPvmobs&amp;h=AT1oyAeWakTaaVB23wtpccfdRdN9ro8kyqXzFR-GpA0tLQK9loR3LMT7ofH4Z7RZT7JXp_ssug50I8oCoslDMd0J3-Mp7Kkvi0wgxzJ_U3XhI54Rub7emJw6idbQK54ZwZXK-pByTYGB6ZU9cBTaag\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/www.piprime.fr\\/files\\/res\\/geometry_en.pdf<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">[2.4]&nbsp;<a href=\\\"https:\\/\\/l.facebook.com\\/l.php?u=http%3A%2F%2Fwww.piprime.fr%2Fasymptote%2F%3Ffbclid%3DIwAR3WXFCPKhq4gc7C2YOk0js_xJks6S1kkGP28pS9l0Y0opAVy9kedLv3LNI&amp;h=AT2lMe_ezoQI7s-ZwQWP0nAdj1y6UdeXnGCU9e3aFL6MVAE_oHjg8VGgSXyhABpY4jCwYNpy63CKdn5-DoJqLnmQ_hfFZDz_SUj5LqzaNaX0iLEIR3sXphz3did0egG-z4e8ai1QMdFlh1rzruoxx-RlruoCObMd8DE\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/www.piprime.fr\\/asymptote\\/<\\/a>&nbsp;c\\u00f3 873 v\\u00ed d\\u1ee5 m\\u00e3 l\\u1ec7nh Asymptote<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Do tikz, asymptote \\u0111\\u1ec1u l\\u00e0 1 g\\u00f3i l\\u1ec7nh c\\u1ee7a Tex (LaTex,\\u2026), n\\u00ean n\\u1ebfu b\\u1ea1n \\u0111\\u00e3 bi\\u1ebft so\\u1ea1n th\\u1ea3o LaTex th\\u00ec \\u0111\\u00f3 l\\u00e0 l\\u1ee3i th\\u1ebf khi h\\u1ecdc v\\u1ebd h\\u00ecnh. Tuy nhi\\u00ean, ngay c\\u1ea3 khi b\\u1ea1n ch\\u01b0a h\\u1ec1 bi\\u1ebft LaTex, b\\u1ea1n v\\u1eabn c\\u00f3 th\\u1ec3 h\\u1ecdc v\\u1ebd, ch\\u1ec9 c\\u1ea7n c\\u00e0i \\u0111\\u1eb7t MikTex ho\\u1eb7c Texlive c\\u00f9ng v\\u1edbi h\\u1ec7 so\\u1ea1n th\\u1ea3o TexStudio\\/TexMaker.<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">(B\\u1ea1n mu\\u1ed1n bi\\u1ebft r\\u00f5 h\\u01a1n v\\u1ec1 LaTex th\\u00ec c\\u00f3 th\\u1ec3 \\u0111\\u1ecdc t\\u00e0i li\\u1ec7u sau&nbsp;<a href=\\\"https:\\/\\/drive.google.com\\/file\\/d\\/0B6t6keI_Xwz5a1NSM3ByZGlQTFU\\/view?fbclid=IwAR1qxB6kEg-x8-N-qoGjI7trVDf7wZo0p80e2MbkJTfnaOnMVt-J7ykkvcM\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/drive.google.com\\/\\u2026\\/0B6t6keI_Xwz5a1NSM3ByZGlQTFU\\/view<\\/a><br>ho\\u1eb7c<br><a href=\\\"https:\\/\\/nmhieupdp.files.wordpress.com\\/2014\\/11\\/gary-l-gray-a-course-of-latex.pdf?fbclid=IwAR3v9JrkuZUkpmFzaWv4Iv2s_PdEtuKMfVHCktPeU499x-lmZjsnAtjuMdQ\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/nmhieupdp.files.wordpress.com\\/\\u2026\\/gary-l-gray-a-cours\\u2026<\\/a>)<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">B\\u1ea1n c\\u00f3 th\\u1ec3 \\u0111\\u1eb7t c\\u00e2u h\\u1ecfi, th\\u1ea3o lu\\u1eadn b\\u1eb1ng ti\\u1ebfng Anh t\\u1ea1i&nbsp;<a href=\\\"https:\\/\\/tex.stackexchange.com\\/?fbclid=IwAR0ezul5hwX5mFt-S-_jVtavLWkLYvzwA_D_bRHc-m_wG0V9hkfpibMJyws\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/tex.stackexchange.com\\/<\\/a>&nbsp;\\u2013 di\\u1ec5n \\u0111\\u00e0n l\\u1edbn nh\\u1ea5t v\\u1ec1 v\\u1ebd h\\u00ecnh v\\u1edbi TikZ v\\u00e0 Asymptote.<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">C\\u00e1c c\\u00e2u h\\u1ecfi, th\\u1ea3o lu\\u1eadn b\\u1eb1ng ti\\u1ebfng Vi\\u1ec7t &lt;&lt;&lt;&lt; nh\\u00f3m FB V\\u1ebd h\\u00ecnh khoa h\\u1ecdc TikZ \\u2013 Asymptote ^^&nbsp;<br><a href=\\\"https:\\/\\/www.facebook.com\\/groups\\/217239182149447\\/?ref=gs&amp;fref=gs&amp;dti=217239182149447&amp;hc_location=group\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/www.facebook.com\\/groups\\/217239182149447\\/<\\/a><\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 16:47:13','2019-11-19 16:47:13'),
	(192,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 16:47:14','2019-11-19 16:47:14'),
	(193,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:47:17','2019-11-19 16:47:17'),
	(194,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 16:47:36','2019-11-19 16:47:36'),
	(195,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:47:38','2019-11-19 16:47:38'),
	(196,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:48:05','2019-11-19 16:48:05'),
	(197,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:48:37','2019-11-19 16:48:37'),
	(198,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:48:52','2019-11-19 16:48:52'),
	(199,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:49:10','2019-11-19 16:49:10'),
	(200,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:49:18','2019-11-19 16:49:18'),
	(201,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:49:49','2019-11-19 16:49:49'),
	(202,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:49:58','2019-11-19 16:49:58'),
	(203,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:50:00','2019-11-19 16:50:00'),
	(204,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:50:03','2019-11-19 16:50:03'),
	(205,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:50:25','2019-11-19 16:50:25'),
	(206,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:50:41','2019-11-19 16:50:41'),
	(207,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:52:01','2019-11-19 16:52:01'),
	(208,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:52:17','2019-11-19 16:52:17'),
	(209,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:52:49','2019-11-19 16:52:49'),
	(210,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:52:51','2019-11-19 16:52:51'),
	(211,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:53:32','2019-11-19 16:53:32'),
	(212,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:53:35','2019-11-19 16:53:35'),
	(213,1,'admin/config_sites/favicon.png','GET','127.0.0.1','[]','2019-11-19 16:53:36','2019-11-19 16:53:36'),
	(214,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:53:41','2019-11-19 16:53:41'),
	(215,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:53:53','2019-11-19 16:53:53'),
	(216,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:54:24','2019-11-19 16:54:24'),
	(217,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:54:54','2019-11-19 16:54:54'),
	(218,1,'admin/config_sites/1/edit','GET','127.0.0.1','[]','2019-11-19 16:55:01','2019-11-19 16:55:01'),
	(219,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:56:10','2019-11-19 16:56:10'),
	(220,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 16:56:16','2019-11-19 16:56:16'),
	(221,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:00:03','2019-11-19 17:00:03'),
	(222,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:00:58','2019-11-19 17:00:58'),
	(223,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:01:04','2019-11-19 17:01:04'),
	(224,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:01:16','2019-11-19 17:01:16'),
	(225,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:01:47','2019-11-19 17:01:47'),
	(226,1,'admin/config_sites/1/edit','GET','127.0.0.1','[]','2019-11-19 17:01:52','2019-11-19 17:01:52'),
	(227,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:01:56','2019-11-19 17:01:56'),
	(228,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:02:34','2019-11-19 17:02:34'),
	(229,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:03:04','2019-11-19 17:03:04'),
	(230,1,'admin/tags','POST','127.0.0.1','{\"name\":\"Flight Operations\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:03:10','2019-11-19 17:03:10'),
	(231,1,'admin/tags','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:03:10','2019-11-19 17:03:10'),
	(232,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:03:10','2019-11-19 17:03:10'),
	(233,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:03:18','2019-11-19 17:03:18'),
	(234,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:03:51','2019-11-19 17:03:51'),
	(235,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:04:12','2019-11-19 17:04:12'),
	(236,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:04:21','2019-11-19 17:04:21'),
	(237,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:04:39','2019-11-19 17:04:39'),
	(238,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Flight Operations\",\"order\":\"7\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:04:49','2019-11-19 17:04:49'),
	(239,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:04:50','2019-11-19 17:04:50'),
	(240,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:04:51','2019-11-19 17:04:51'),
	(241,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:05:44','2019-11-19 17:05:44'),
	(242,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:06:21','2019-11-19 17:06:21'),
	(243,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:06:29','2019-11-19 17:06:29'),
	(244,1,'admin/menu_homes/1','GET','127.0.0.1','[]','2019-11-19 17:06:31','2019-11-19 17:06:31'),
	(245,1,'admin/menu_homes/favicon.png','GET','127.0.0.1','[]','2019-11-19 17:06:32','2019-11-19 17:06:32'),
	(246,1,'admin/menu_homes/1','GET','127.0.0.1','[]','2019-11-19 17:06:57','2019-11-19 17:06:57'),
	(247,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:07:00','2019-11-19 17:07:00'),
	(248,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:07:32','2019-11-19 17:07:32'),
	(249,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:07:34','2019-11-19 17:07:34'),
	(250,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:07:59','2019-11-19 17:07:59'),
	(251,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"name\",\"value\":\"H\\u0129nh v\\u1ebd test\",\"pk\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:08:03','2019-11-19 17:08:03'),
	(252,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:08:05','2019-11-19 17:08:05'),
	(253,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"name\",\"value\":\"H\\u0129nh v\\u1ebd\",\"pk\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:08:15','2019-11-19 17:08:15'),
	(254,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:08:23','2019-11-19 17:08:23'),
	(255,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:08:27','2019-11-19 17:08:27'),
	(256,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:08:48','2019-11-19 17:08:48'),
	(257,1,'admin/tags/20','GET','127.0.0.1','[]','2019-11-19 17:08:54','2019-11-19 17:08:54'),
	(258,1,'admin/tags/favicon.png','GET','127.0.0.1','[]','2019-11-19 17:08:54','2019-11-19 17:08:54'),
	(259,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:08:57','2019-11-19 17:08:57'),
	(260,1,'admin/config_sites/1','GET','127.0.0.1','[]','2019-11-19 17:09:04','2019-11-19 17:09:04'),
	(261,1,'admin/config_sites/1/edit','GET','127.0.0.1','[]','2019-11-19 17:09:06','2019-11-19 17:09:06'),
	(262,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:09:17','2019-11-19 17:09:17'),
	(263,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"gioi-thieu\",\"content\":\"<p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Trang&nbsp;<a href=\\\"http:\\/\\/tikz.vn\\/\\\" style=\\\"color: rgb(30, 115, 190);\\\">tikz.vn<\\/a>&nbsp;l\\u00e0 web&nbsp;<span style=\\\"color: rgb(0, 0, 128);\\\"><em><span style=\\\"font-weight: 600;\\\">Ph\\u1ed5 bi\\u1ebfn v\\u1ebd h\\u00ecnh khoa h\\u1ecdc<\\/span><\\/em><\\/span>&nbsp;v\\u00e0&nbsp;<span style=\\\"color: rgb(0, 0, 128);\\\"><em><span style=\\\"font-weight: 600;\\\">N\\u00e2ng cao t\\u01b0 duy h\\u00ecnh h\\u1ecdc<\\/span><\\/em><\\/span>.<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Ch\\u00fang t\\u00f4i v\\u1ebd c\\u00e1c h\\u00ecnh v\\u1ebd khoa h\\u1ecdc m\\u1ed9t c\\u00e1ch ch\\u00ednh x\\u00e1c v\\u00e0 tinh t\\u1ebf. Ch\\u00fang t\\u00f4i tin r\\u1eb1ng t\\u01b0 duy h\\u00ecnh h\\u1ecdc l\\u00e0 m\\u1ed9t trong c\\u00e1c n\\u1ec1n t\\u1ea3ng c\\u1ee7a t\\u01b0 duy con ng\\u01b0\\u1eddi.<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">C\\u00e1c h\\u00ecnh \\u0111\\u01b0\\u1ee3c v\\u1ebd b\\u1eb1ng g\\u00f3i l\\u1ec7nh&nbsp;<span style=\\\"color: rgb(0, 0, 128);\\\">TikZ<\\/span>&nbsp;ho\\u1eb7c&nbsp;<span style=\\\"color: rgb(0, 0, 128);\\\">Asymptote<\\/span>. Ph\\u1ea7n l\\u1edbn c\\u00e1c h\\u00ecnh v\\u1ebd \\u0111\\u01b0\\u1ee3c tuy\\u1ec3n ch\\u1ecdn t\\u1eeb nh\\u00f3m Facebook&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/groups\\/217239182149447\\/\\\" style=\\\"color: rgb(30, 115, 190); outline: 0px;\\\">V\\u1ebd h\\u00ecnh khoa h\\u1ecdc TikZ \\u2013 Asymptote<\\/a>&nbsp;\\u2013 n\\u01a1i c\\u00e1c th\\u00e0nh vi\\u00ean c\\u1ee7a&nbsp;<a href=\\\"http:\\/\\/tikz.vn\\/\\\" style=\\\"color: rgb(30, 115, 190);\\\">tikz.vn<\\/a>&nbsp;th\\u1ea3o lu\\u1eadn, \\u0111\\u1ec1 xu\\u1ea5t.<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">C\\u00e1c th\\u00e0nh vi\\u00ean c\\u1ee7a&nbsp;<a href=\\\"http:\\/\\/tikz.vn\\/\\\" style=\\\"color: rgb(30, 115, 190);\\\">tikz.vn<\\/a>&nbsp;l\\u00e0 nh\\u1eefng ng\\u01b0\\u1eddi t\\u1ef1 do, c\\u00f3 t\\u01b0 duy c\\u1edfi m\\u1edf, c\\u00f3 t\\u1ea5m l\\u00f2ng v\\u1edbi gi\\u00e1o d\\u1ee5c, v\\u00e0 t\\u00f4n tr\\u1ecdng s\\u1ef1 kh\\u00e1c bi\\u1ec7t c\\u1ee7a m\\u1ed7i c\\u00e1 nh\\u00e2n.<\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:09:27','2019-11-19 17:09:27'),
	(264,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:09:28','2019-11-19 17:09:28'),
	(265,1,'admin/config_sites/2','GET','127.0.0.1','[]','2019-11-19 17:09:35','2019-11-19 17:09:35'),
	(266,1,'admin/config_sites/2','GET','127.0.0.1','[]','2019-11-19 17:09:37','2019-11-19 17:09:37'),
	(267,1,'admin/config_sites/2/edit','GET','127.0.0.1','[]','2019-11-19 17:09:42','2019-11-19 17:09:42'),
	(268,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:09:51','2019-11-19 17:09:51'),
	(269,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"lien-he\",\"content\":\"<p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\"><span style=\\\"font-weight: 600;\\\">Li\\u00ean h\\u1ec7<\\/span><br>TS. L\\u00ea Huy Ti\\u1ec5n<br>Khoa To\\u00e1n-c\\u01a1-tin h\\u1ecdc,<br>\\u0110\\u1ea1i h\\u1ecdc Khoa h\\u1ecdc t\\u1ef1 nhi\\u00ean \\u2013 \\u0110HQG H\\u00e0 N\\u1ed9i<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">\\u0110i\\u1ec7n tho\\u1ea1i: (+84) 1695 668866<\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Email:&nbsp;<a href=\\\"http:\\/\\/tikz.vn\\/contact\\/tienlh@vnu.edu.vn\\\" style=\\\"color: rgb(30, 115, 190);\\\">tienlh@vnu.edu.vn<\\/a>&nbsp;&nbsp; &nbsp;<a href=\\\"http:\\/\\/tikz.vn\\/contact\\/lehuytien78@gmail.com\\\" style=\\\"color: rgb(30, 115, 190);\\\">lehuytien78@gmail.com<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Facebook c\\u00e1 nh\\u00e2n:&nbsp;<a href=\\\"http:\\/\\/www.facebook.com\\/black.mild.779\\\" style=\\\"color: rgb(30, 115, 190);\\\">http:\\/\\/www.facebook.com\\/black.mild.779<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\">Facebook c\\u1ee7a nh\\u00f3m \\u201cV\\u1ebd h\\u00ecnh khoa h\\u1ecdc TikZ\\u201d&nbsp;<a href=\\\"https:\\/\\/www.facebook.com\\/groups\\/217239182149447\\/\\\" style=\\\"color: rgb(30, 115, 190);\\\">https:\\/\\/www.facebook.com\\/groups\\/217239182149447\\/<\\/a><\\/p><p style=\\\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\\\"><span style=\\\"font-weight: 600;\\\">Th\\u1eddi gian l\\u00e0m vi\\u1ec7c<\\/span><br>Th\\u1ee9 hai \\u2013 Th\\u1ee9 b\\u1ea3y: 9:00AM\\u20135:00PM<br>Ch\\u1ee7 nh\\u1eadt: 11:00AM\\u20133:00PM<\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:09:55','2019-11-19 17:09:55'),
	(270,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:09:55','2019-11-19 17:09:55'),
	(271,1,'admin/config_sites/3','GET','127.0.0.1','[]','2019-11-19 17:09:58','2019-11-19 17:09:58'),
	(272,1,'admin/config_sites/3/edit','GET','127.0.0.1','[]','2019-11-19 17:10:03','2019-11-19 17:10:03'),
	(273,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:10:30','2019-11-19 17:10:30'),
	(274,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:10:31','2019-11-19 17:10:31'),
	(275,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"thong-tin-chinh\",\"content\":\"<div class=\\\"titleFooter\\\" style=\\\"font-size: 20px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: tahoma;\\\"><label style=\\\"font-weight: normal; padding-top: 20px;\\\">Th\\u00f4ng Tin Ch\\u00ednh<\\/label><\\/div><div class=\\\"contentFooter\\\" style=\\\"color: rgb(51, 51, 51); font-family: tahoma;\\\"><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">\\u0110\\u1ecba ch\\u1ec9 T\\u00f2a so\\u1ea1n:<\\/label>&nbsp;To\\u00e0 nh\\u00e0 FLC Tower, s\\u1ed1 265 \\u0111\\u01b0\\u1eddng C\\u1ea7u Gi\\u1ea5y, qu\\u1eadn C\\u1ea7u Gi\\u1ea5y, H\\u00e0 N\\u1ed9i<\\/div><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">\\u0110i\\u1ec7n tho\\u1ea1i:<\\/label>&nbsp;024 3215xxxx<\\/div><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">Fax:<\\/label>&nbsp;024 3623xxxx<\\/div><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">Email g\\u1eedi b\\u00e0i:<\\/label>&nbsp;<a href=\\\"http:\\/\\/bbt@tikz.edu.vn\\/\\\" class=\\\"\\\" style=\\\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\\\">bbt@Tikz.edu.vn<\\/a><\\/div><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">Email giao d\\u1ecbch:<\\/label>&nbsp;<a href=\\\"http:\\/\\/info@tikz.edu.vn\\/\\\" class=\\\"\\\" style=\\\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\\\">info@Tikz.edu.vn<\\/a><\\/div><div style=\\\"margin-bottom: 5px;\\\"><label style=\\\"margin-bottom: 0px;\\\">Website:<\\/label>&nbsp;<a href=\\\"http:\\/\\/tikz.edu.vn\\/\\\" target=\\\"_blank\\\" style=\\\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\\\">Tikz.edu.vn<\\/a><\\/div><\\/div>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:10:44','2019-11-19 17:10:44'),
	(276,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:10:44','2019-11-19 17:10:44'),
	(277,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:10:50','2019-11-19 17:10:50'),
	(278,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"mo-ta\",\"content\":\"<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma;\\\">\\\"T\\u1ea1p ch\\u00ed to\\u00e1n h\\u1ecdc chia s\\u1ebb ki\\u1ebfn th\\u1ee9c h\\u00ecnh h\\u1ecdc ch\\u00ednh x\\u00e1c !\\\"<\\/span><br><\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:10:53','2019-11-19 17:10:53'),
	(279,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:10:53','2019-11-19 17:10:53'),
	(280,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:15:59','2019-11-19 17:15:59'),
	(281,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"so-luong-thanh-vien\",\"content\":\"<p>Th\\u00e0nh vi\\u00ean: 5000<\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:16:19','2019-11-19 17:16:19'),
	(282,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:16:19','2019-11-19 17:16:19'),
	(283,1,'admin/config_sites/6/edit','GET','127.0.0.1','[]','2019-11-19 17:17:21','2019-11-19 17:17:21'),
	(284,1,'admin/config_sites/6','PUT','127.0.0.1','{\"id\":\"6\",\"code\":\"so-luong-thanh-vien\",\"content\":\"<p>TH\\u00c0NH VI\\u00caN : 5000<\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:17:34','2019-11-19 17:17:34'),
	(285,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:17:34','2019-11-19 17:17:34'),
	(286,1,'admin/config_sites/create','GET','127.0.0.1','[]','2019-11-19 17:17:55','2019-11-19 17:17:55'),
	(287,1,'admin/config_sites','POST','127.0.0.1','{\"code\":\"copy-right\",\"content\":\"<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma; font-size: 12px; background-color: rgb(234, 234, 234);\\\">Copyright T\\u1ea1p ch\\u00ed Tikz @ 2017<\\/span><\\/p><p><br><\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:18:39','2019-11-19 17:18:39'),
	(288,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:18:40','2019-11-19 17:18:40'),
	(289,1,'admin/config_sites/7/edit','GET','127.0.0.1','[]','2019-11-19 17:19:16','2019-11-19 17:19:16'),
	(290,1,'admin/config_sites/7','PUT','127.0.0.1','{\"id\":\"7\",\"code\":\"copy-right\",\"content\":\"<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma; font-size: 12px; background-color: rgb(234, 234, 234);\\\">Copyright T\\u1ea1p ch\\u00ed Tikz @ 2017<\\/span><\\/p>\",\"files\":null,\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/config_sites\"}','2019-11-19 17:19:20','2019-11-19 17:19:20'),
	(291,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:19:20','2019-11-19 17:19:20'),
	(292,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:19:29','2019-11-19 17:19:29'),
	(293,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:20:47','2019-11-19 17:20:47'),
	(294,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"order\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:21:11','2019-11-19 17:21:11'),
	(295,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:21:12','2019-11-19 17:21:12'),
	(296,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:21:12','2019-11-19 17:21:12'),
	(297,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:21:30','2019-11-19 17:21:30'),
	(298,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:22:20','2019-11-19 17:22:20'),
	(299,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:22:49','2019-11-19 17:22:49'),
	(300,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:22:50','2019-11-19 17:22:50'),
	(301,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:22:52','2019-11-19 17:22:52'),
	(302,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:23:06','2019-11-19 17:23:06'),
	(303,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:23:08','2019-11-19 17:23:08'),
	(304,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:23:09','2019-11-19 17:23:09'),
	(305,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:23:34','2019-11-19 17:23:34'),
	(306,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:23:36','2019-11-19 17:23:36'),
	(307,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:23:37','2019-11-19 17:23:37'),
	(308,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:23:52','2019-11-19 17:23:52'),
	(309,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:23:54','2019-11-19 17:23:54'),
	(310,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:24:10','2019-11-19 17:24:10'),
	(311,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:24:30','2019-11-19 17:24:30'),
	(312,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:24:32','2019-11-19 17:24:32'),
	(313,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:24:33','2019-11-19 17:24:33'),
	(314,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:24:36','2019-11-19 17:24:36'),
	(315,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:24:37','2019-11-19 17:24:37'),
	(316,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:25:09','2019-11-19 17:25:09'),
	(317,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:25:11','2019-11-19 17:25:11'),
	(318,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:25:15','2019-11-19 17:25:15'),
	(319,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:26:12','2019-11-19 17:26:12'),
	(320,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:26:16','2019-11-19 17:26:16'),
	(321,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:26:16','2019-11-19 17:26:16'),
	(322,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:26:18','2019-11-19 17:26:18'),
	(323,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:26:20','2019-11-19 17:26:20'),
	(324,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:26:23','2019-11-19 17:26:23'),
	(325,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:26:25','2019-11-19 17:26:25'),
	(326,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:26:25','2019-11-19 17:26:25'),
	(327,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:26:28','2019-11-19 17:26:28'),
	(328,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:26:29','2019-11-19 17:26:29'),
	(329,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:26:31','2019-11-19 17:26:31'),
	(330,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:27:26','2019-11-19 17:27:26'),
	(331,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:28:04','2019-11-19 17:28:04'),
	(332,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:28:06','2019-11-19 17:28:06'),
	(333,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:28:08','2019-11-19 17:28:08'),
	(334,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:28:12','2019-11-19 17:28:12'),
	(335,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:28:15','2019-11-19 17:28:15'),
	(336,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:28:15','2019-11-19 17:28:15'),
	(337,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:29:42','2019-11-19 17:29:42'),
	(338,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:30:10','2019-11-19 17:30:10'),
	(339,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:30:26','2019-11-19 17:30:26'),
	(340,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:31:02','2019-11-19 17:31:02'),
	(341,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"0\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:31:10','2019-11-19 17:31:10'),
	(342,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:31:14','2019-11-19 17:31:14'),
	(343,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:32:52','2019-11-19 17:32:52'),
	(344,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:33:02','2019-11-19 17:33:02'),
	(345,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:02','2019-11-19 17:33:02'),
	(346,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"0\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:33:04','2019-11-19 17:33:04'),
	(347,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:07','2019-11-19 17:33:07'),
	(348,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:49','2019-11-19 17:33:49'),
	(349,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:33:51','2019-11-19 17:33:51'),
	(350,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:52','2019-11-19 17:33:52'),
	(351,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:54','2019-11-19 17:33:54'),
	(352,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:33:55','2019-11-19 17:33:55'),
	(353,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:33:57','2019-11-19 17:33:57'),
	(354,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:33:57','2019-11-19 17:33:57'),
	(355,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:34:36','2019-11-19 17:34:36'),
	(356,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:34:37','2019-11-19 17:34:37'),
	(357,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:34:38','2019-11-19 17:34:38'),
	(358,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:34:49','2019-11-19 17:34:49'),
	(359,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:35:47','2019-11-19 17:35:47'),
	(360,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:49','2019-11-19 17:35:49'),
	(361,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:49','2019-11-19 17:35:49'),
	(362,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:52','2019-11-19 17:35:52'),
	(363,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:52','2019-11-19 17:35:52'),
	(364,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:54','2019-11-19 17:35:54'),
	(365,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:35:54','2019-11-19 17:35:54'),
	(366,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:35:55','2019-11-19 17:35:55'),
	(367,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:35:58','2019-11-19 17:35:58'),
	(368,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":null,\"order\":\"1\",\"path\":\"\\/\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:36:01','2019-11-19 17:36:01'),
	(369,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:36:32','2019-11-19 17:36:32'),
	(370,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"H\\u0129nh v\\u1ebd\",\"code\":\"hinh-ve\",\"order\":\"1\",\"path\":\"\\/hinh-ve\",\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tikz.local\\/admin\\/menu_homes\"}','2019-11-19 17:36:33','2019-11-19 17:36:33'),
	(371,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:33','2019-11-19 17:36:33'),
	(372,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:36:35','2019-11-19 17:36:35'),
	(373,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:36','2019-11-19 17:36:36'),
	(374,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:36:39','2019-11-19 17:36:39'),
	(375,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:40','2019-11-19 17:36:40'),
	(376,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:36:43','2019-11-19 17:36:43'),
	(377,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:44','2019-11-19 17:36:44'),
	(378,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Danh m\\u1ee5c h\\u00ecnh v\\u1ebd\",\"order\":\"2\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:36:51','2019-11-19 17:36:51'),
	(379,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:36:52','2019-11-19 17:36:52'),
	(380,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:52','2019-11-19 17:36:52'),
	(381,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:54','2019-11-19 17:36:54'),
	(382,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:36:57','2019-11-19 17:36:57'),
	(383,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:36:59','2019-11-19 17:36:59'),
	(384,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"order\":\"3\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:37:06','2019-11-19 17:37:06'),
	(385,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:37:06','2019-11-19 17:37:06'),
	(386,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:37:07','2019-11-19 17:37:07'),
	(387,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Li\\u00ean h\\u1ec7\",\"order\":\"4\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:37:12','2019-11-19 17:37:12'),
	(388,1,'admin/menu_homes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-11-19 17:37:13','2019-11-19 17:37:13'),
	(389,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:37:13','2019-11-19 17:37:13'),
	(390,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:37:16','2019-11-19 17:37:16'),
	(391,1,'admin/menu_homes','GET','127.0.0.1','{\"name\":null}','2019-11-19 17:37:21','2019-11-19 17:37:21'),
	(392,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"T\\u00e0i li\\u1ec7u h\\u1ecdc v\\u1ebd\",\"order\":\"5\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:37:31','2019-11-19 17:37:31'),
	(393,1,'admin/menu_homes','GET','127.0.0.1','{\"name\":null,\"_pjax\":\"#pjax-container\"}','2019-11-19 17:37:31','2019-11-19 17:37:31'),
	(394,1,'admin/menu_homes','GET','127.0.0.1','{\"name\":null}','2019-11-19 17:37:32','2019-11-19 17:37:32'),
	(395,1,'admin/menu_homes/5','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"3\",\"pk\":\"5\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:37:43','2019-11-19 17:37:43'),
	(396,1,'admin/menu_homes/3','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"4\",\"pk\":\"3\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:37:48','2019-11-19 17:37:48'),
	(397,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"5\",\"pk\":\"4\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:37:51','2019-11-19 17:37:51'),
	(398,1,'admin/menu_homes','POST','127.0.0.1','{\"name\":\"Trang ch\\u1ee7\",\"order\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\"}','2019-11-19 17:38:27','2019-11-19 17:38:27'),
	(399,1,'admin/menu_homes','GET','127.0.0.1','{\"name\":null,\"_pjax\":\"#pjax-container\"}','2019-11-19 17:38:28','2019-11-19 17:38:28'),
	(400,1,'admin/menu_homes','GET','127.0.0.1','{\"name\":null}','2019-11-19 17:38:29','2019-11-19 17:38:29'),
	(401,1,'admin/menu_homes/1','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:38:34','2019-11-19 17:38:34'),
	(402,1,'admin/menu_homes/2','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"3\",\"pk\":\"2\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:38:36','2019-11-19 17:38:36'),
	(403,1,'admin/menu_homes/5','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"4\",\"pk\":\"5\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:38:48','2019-11-19 17:38:48'),
	(404,1,'admin/menu_homes/3','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"5\",\"pk\":\"3\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:38:52','2019-11-19 17:38:52'),
	(405,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"name\":\"order\",\"value\":\"6\",\"pk\":\"4\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2019-11-19 17:38:54','2019-11-19 17:38:54'),
	(406,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:39:06','2019-11-19 17:39:06'),
	(407,1,'admin/menu_homes/4','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"QJEt2OwdcScv8m5sBM9YdAs4qShQK1PEbO4VCDkt\",\"_method\":\"PUT\"}','2019-11-19 17:39:45','2019-11-19 17:39:45'),
	(408,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:40:38','2019-11-19 17:40:38'),
	(409,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:40:39','2019-11-19 17:40:39'),
	(410,1,'admin/menu_homes/1','GET','127.0.0.1','[]','2019-11-19 17:40:41','2019-11-19 17:40:41'),
	(411,1,'admin/menu_homes/1','GET','127.0.0.1','[]','2019-11-19 17:41:08','2019-11-19 17:41:08'),
	(412,1,'admin/menu_homes/1','GET','127.0.0.1','[]','2019-11-19 17:41:44','2019-11-19 17:41:44'),
	(413,1,'admin/menu_homes/1/edit','GET','127.0.0.1','[]','2019-11-19 17:41:47','2019-11-19 17:41:47'),
	(414,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:41:49','2019-11-19 17:41:49'),
	(415,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:41:54','2019-11-19 17:41:54'),
	(416,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:41:58','2019-11-19 17:41:58'),
	(417,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:42:05','2019-11-19 17:42:05'),
	(418,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:42:48','2019-11-19 17:42:48'),
	(419,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:42:52','2019-11-19 17:42:52'),
	(420,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:42:54','2019-11-19 17:42:54'),
	(421,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:43:07','2019-11-19 17:43:07'),
	(422,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:43:21','2019-11-19 17:43:21'),
	(423,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:43:23','2019-11-19 17:43:23'),
	(424,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:43:35','2019-11-19 17:43:35'),
	(425,1,'admin/auth/login','GET','127.0.0.1','[]','2019-11-19 17:45:05','2019-11-19 17:45:05'),
	(426,1,'admin','GET','127.0.0.1','[]','2019-11-19 17:45:05','2019-11-19 17:45:05'),
	(427,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:45:11','2019-11-19 17:45:11'),
	(428,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:45:13','2019-11-19 17:45:13'),
	(429,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:45:16','2019-11-19 17:45:16'),
	(430,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:45:31','2019-11-19 17:45:31'),
	(431,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:45:33','2019-11-19 17:45:33'),
	(432,1,'admin/tags','GET','127.0.0.1','[]','2019-11-19 17:45:35','2019-11-19 17:45:35'),
	(433,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:45:36','2019-11-19 17:45:36'),
	(434,1,'admin/config_sites','GET','127.0.0.1','[]','2019-11-19 17:45:47','2019-11-19 17:45:47'),
	(435,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:45:55','2019-11-19 17:45:55'),
	(436,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:46:04','2019-11-19 17:46:04'),
	(437,1,'admin/menu_homes','GET','127.0.0.1','[]','2019-11-19 17:46:30','2019-11-19 17:46:30');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*',NULL,'*',0,'2019-11-18 10:21:26','2019-11-18 10:21:26'),
	(2,'Bảng điều khiển','home',NULL,'/',0,'2019-11-18 10:21:26','2019-11-18 10:21:26'),
	(3,'Login','auth.login',NULL,'auth/loginauth/login/*\r\nauth/logout\r\noauth/*\r\noauth/*/*',0,'2019-11-18 10:21:26','2019-11-18 10:21:26'),
	(4,'User setting','auth.setting',NULL,'/auth/setting',0,'2019-11-18 10:21:26','2019-11-18 10:21:26');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,12,NULL,NULL),
	(1,13,NULL,NULL),
	(1,14,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2019-11-18 10:21:26','2019-11-18 10:21:26'),
	(2,'Manager','manager','2019-11-18 10:21:26','2019-11-18 10:21:26'),
	(3,'Member','member','2019-11-18 10:21:26','2019-11-18 10:21:26');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_translations`;

CREATE TABLE `admin_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT 0,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_social` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `email`, `password`, `name`, `avatar`, `remember_token`, `provider_id`, `provider`, `is_social`, `created_date`, `token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$QOlGAcghi77UcPynf32u9O6VAm94fJYnplIj4k6x.EniFfHa/HqUa','Administrator',NULL,'Yy7Kq0yapj5cuB8a49Fi2pnLruWjelWDefNpmHzLd9fdFRwKiOsyCiSERmEL',NULL,NULL,NULL,NULL,NULL,'2019-11-18 10:21:26','2019-11-18 10:21:26');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table config_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_sites`;

CREATE TABLE `config_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `config_sites` WRITE;
/*!40000 ALTER TABLE `config_sites` DISABLE KEYS */;

INSERT INTO `config_sites` (`id`, `code`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'tai-lieu-hoc-ve','<p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Một số thầy đã dịch và biên soạn tài liệu học vẽ hình TikZ, Asymptote bằng tiếng Việt. Cảm ơn các thầy!</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.1] Vẽ hình học phẳng bằng gói tkz-euclide, Huỳnh Văn Thơ&nbsp;<a href=\"https://www.facebook.com/tho.huynh.524?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARBg_M7ajks-wIailWPTyST-gZzNJLnBqIMxYGm3uf0uA4sCejAh9L_oRKFBOUinokAEklmRKOciJLDG&amp;dti=217239182149447&amp;hc_location=group\" style=\"color: rgb(30, 115, 190);\">Tho Huynh</a>, cập nhật 01/2019.<br><a href=\"https://www.dropbox.com/s/j085zdy38k6v3wx/TKZ-EUCLIDE2019.pdf?fbclid=IwAR02t2GgKUI_eHoct5m-DMqZlY-0eLcpI9XAoxkhiB73ViwRlDUgfUlZiIU\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://www.dropbox.com/s/j085zdy38k6v3…/TKZ-EUCLIDE2019.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.2] Vẽ hình học phẳng bằng gói geometry trong phần mềm Asymptote, Huỳnh Văn Thơ,&nbsp;<a href=\"https://www.facebook.com/tho.huynh.524?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARBV1LVoi0v56uKYUyDxdZ1hLplauR1jgVb5aejWGmCjema3IDw9h2b72YZYyPGOR5X6zjgxJvc-ubr8&amp;dti=217239182149447&amp;hc_location=group\" style=\"color: rgb(30, 115, 190);\">Tho Huynh</a>&nbsp;cập nhật 06/2018, 71 trang.<br><a href=\"https://www.dropbox.com/s/ddalic4ajaa9coo/HDSD-geometry.pdf?fbclid=IwAR0ScP76lI_aCUWe9SzRCVIsTwqp2TAijK9ZWVW3ADAunIL18mm9JgBXlm0\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://www.dropbox.com/s/ddalic4ajaa9coo/HDSD-geometry.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.3] Tổng hợp một số tài liệu khác về vẽ hình bằng tiếng Việt của các thầy Phan Văn Phương, Phạm Văn Đức, Phùng Gia Luân&nbsp;<br><a href=\"https://www.dropbox.com/s/mkgt484hoh4jfw7/ducluanphuong.rar?fbclid=IwAR0GWlJQaOOggtYdNqSgpIqxJv65rexxxBFF64jMuW0hxu45DvPuYfNtd3w\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://www.dropbox.com/s/mkgt484hoh4jfw7/ducluanphuong.rar</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.4]</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.5] Công cụ vẽ hình, bảng biến thiên, bảng xét dấu (có lấy mã TikZ) của&nbsp;<a href=\"https://www.facebook.com/phanthanhtam295?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARCVxl5hIq3L9213Yob0-McgxIAHoJ3zAvczRV4cGjfwQ0i9JnsPtBVkSIKJqntlV-wWwg3ksuLInfMu&amp;dti=217239182149447&amp;hc_location=group\" style=\"color: rgb(30, 115, 190);\">Phan Thanh Tâm</a><br><a rel=\"noreferrer noopener\" href=\"https://drive.google.com/file/d/1qS4AJLweuGONoBp6nZ_GeIr6tWirQKNW/view?fbclid=IwAR168Dnuh0E2ATL_u83jepcm28Uk1qXyi3xpIiW-MOPBdGjUXCs-EkOPKI8\" target=\"_blank\" style=\"color: rgb(30, 115, 190);\">https://drive.google.com/…/1qS4AJLweuGONoBp6nZ_GeIr6tW…/view</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[0.6] TikZ và LaTeX,&nbsp;<a href=\"https://www.facebook.com/buiquyhn77?fref=gs&amp;__tn__=%2CdK-R-R&amp;eid=ARC8YDNQ6qifX1FdOFhMr377vALc6q8h3VQmsoP7jvzkewVcvtiiRVezoURv-gpUNqK9K2ePZsTGX9XR&amp;dti=217239182149447&amp;hc_location=group\" style=\"color: rgb(30, 115, 190);\">Bùi Quỹ</a>&nbsp;(đang biên soạn)&nbsp;<a href=\"https://drive.google.com/file/d/1Si7Z1jX7c-kC_ZdURDLn33r7F_-D8OSq/view?fbclid=IwAR1iBP4eoJvBl0STVpw9oJQAdKw8blr90KC5BoP5LjkvDt294iWEkG0Xhbw\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://drive.google.com/…/1Si7Z1jX7c-kC_ZdURDLn33r7F…/view…</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Phần 1: TIKZ</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.1] Cẩm nang vẽ hình Tikz (tiếng Anh) Tác giả: Till Tantao – người viết ra gói lệnh TikZ</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Version 3.0.1a, 1161 trang, năm 2015&nbsp;<br><a href=\"http://mirror.kku.ac.th/CTAN/graphics/pgf/base/doc/pgfmanual.pdf?fbclid=IwAR2q11Rza6ECy9sScOM1bveoqQUi5KCI_VgaD6-kUbzzjCrQHUE6q0PmBuc\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://mirror.kku.ac.th/…/graphi…/pgf/base/doc/pgfmanual.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Version 3.0.1, unstable builds, tháng 11/ 2017&nbsp;<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fpgf.sourceforge.net%2Fpgf_CVS.pdf%3Ffbclid%3DIwAR0PgXrJKNSb_21Go7x9u-PZCZCmAdvnmXvLnml3QpTPCllLumcfw-OLu_Y&amp;h=AT0OQQdzCMMqrtEEIld_BJHA2M5BHcwMlSNUZWR-6ZfMy9A3pOwnXPxmxm_QTLzqRRNvMY0Vagx1seC1SPLZg9nvepF5LC504RBsr1zdcxnapH7JBIf0rH5-RtKEwPsNufs0fx5Hleq2wYkFElbzhA\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://pgf.sourceforge.net/pgf_CVS.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.2] TikZ pour l’impatient Tác giả: T. Jacques và J. Duma, năm 2017, tiếng Pháp&nbsp;<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fmath.et.info.free.fr%2FTikZ%2Fbdd%2FTikZ-Impatient.pdf%3Ffbclid%3DIwAR2pNZYOSXqfvDLSyuxAyP7eo8ONaHN7opvWXgKPcNol4BsyHaLtaL12zic&amp;h=AT332CL0WSIvIxz9A7HSvTipvyDi_5nUOML9kS_f-XeJor4eDL9r-iBLsRWTzJeBs0lBumBG1Py_G7gf9cbkYBqifViR7ETXpAYvQ0Md6GTlFctJ-MZLHf5fCoeECCk666ofkzhYcSDFElLng6FUkg\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://math.et.info.free.fr/TikZ/bdd/TikZ-Impatient.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.3] tkz-euclide (tiếng Pháp)&nbsp;<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fmirror.kku.ac.th%2FCTAN%2Fmacros%2Flatex%2Fcontrib%2Ftkz%2Ftkz-euclide%2Fdoc%2Ftkz-euclide-screen.pdf%3Ffbclid%3DIwAR1tbIFi89BTQqfiN2t5GZWC_HWKysC6GqSPitFYofa0ea3wDhs2DXEeJME&amp;h=AT2wQ6HI7uDQ907kI48bpDawQ4HSYgbfF5cH8NRkZcalVIZa8IC75-D8f4JBHo44cAVGj9FLk5D8tZgjb_ykOClexnzmqO0-BAYIHiVVYh2fC8ibeQT5u4i4l1bw8yiw5FxSmI8CaGjM_AL6An8p3A\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://mirror.kku.ac.th/…/tkz-eu…/doc/tkz-euclide-screen.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.4]&nbsp;<a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Ftexample.net%2F%3Ffbclid%3DIwAR30Q3GhZlf72Ijf_T0ZpGfTAl5AErT0EkucRpqDmROgmDyu7vKhJwGhlyM&amp;h=AT2kku65lFroGwBsfBAzWrCtXyaUL_SonnEp0AlEY7F7i7OZPOUC7sgXqj5-GUIzPrl-_PlP-v76e3LvYyvT5Hu4ajr_dlMacBIBdzkupgAwFE6IIhBtUj2awVmht2ln4J9FGFDf7V7o6DieGxmB5A\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://texample.net/</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.5] Visual TikZ, Version 0.66, Jean Pierre Casteleyn, 2018&nbsp;<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Ftug.ctan.org%2Finfo%2Fvisualtikz%2FVisualTikZ.pdf%3Ffbclid%3DIwAR2R8rBr7qdUX7Ui39Hape1Pql3KaZ-SsEbt_yxOVf3V2g9lIwhYJ_7Rgv4&amp;h=AT2OP-Zru6qiS6MEa2IpTNCemHhKxtjIBVOpSRhvcC1Rwy6Mpn3udkSvyFBM3rv21gZTDJldlB2VyI338K6qslEeVChn26OZULVMWibRqIRV8YoZ7nqpj6W4jlL1t7K40nF5kcWNx3ED5oLysaj7uQ\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://tug.ctan.org/info/visualtikz/VisualTikZ.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[1.6] LaTex and Friends, 292 trang, M.R.C. van Dongen, 2010<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.stat.wvu.edu%2F%7Ejharner%2Fcourses%2Fstat624%2Fdocs%2FLaTeX-and-Friends.pdf%3Ffbclid%3DIwAR0kElhtxwt9ReGKcCmtNlQ0WXXiu7F18yY7MHVhBZK8axVaBe0G6cX1cEg&amp;h=AT3L8XOAgPF2Fk3cGnij_CaHXcNr2EMF-HpTFhdxajPpoTR3-f9Qwb7UVeIB5s2ZHq8VQvNjfBzzHWy5g1OiubQRTDXQlM9JbG6CfEI4DP_3fmqpF2AaA4R3JENobOnrx3Wxm4nOY3tePQCnxJDXaQ\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://www.stat.wvu.edu/…/stat624/docs/LaTeX-and-Friends.pdf</a><br>*********************************************</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Phần 2: ASYMPTOTE</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Asymptote: Ngôn ngữ lập trình dùng vẽ hình 2D và 3D dạng véc-tơ, có thể tích hợp trong các loại TeX (2D &amp; 3D TeX-Aware Vector Graphics&nbsp;<br>Language)&nbsp;<a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fasymptote.sourceforge.net%2F%3Ffbclid%3DIwAR37AJnCXLsILiAgRuzLIQcN7SHyPfU4rzB6Fzuir8Qh0aS1G2gutYVQXi0&amp;h=AT0DdTBkGxXk6uag7dKW2IFTgxjBo5ZzXG_c-bh8TFT_KspIzASKF2mdCjOfH0AZ2pHs6Ksih2eENDJd4bekJVSJWd53qXoyHeuIM_0GoVxwJ9MQ9aPv05NVKBrM-Cvmb98k4p_CzGOfJTpdnKN8yw\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://asymptote.sourceforge.net/</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[2.1]Asymptote: the vector graphic language Tác giả: Andy Hammerlindl, John Bowman, and Tom Prince, version 2.47, 189 trang, 2018<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fasymptote.sourceforge.net%2Fasymptote.pdf%3Ffbclid%3DIwAR1WbQfgwmQOn6zJnLcHhfO0_IQF1i-QUxGc7ewinGSgHo6bG8nO9nOxPgg&amp;h=AT3ZXrtYPLjsXmVWIOcqtt3axIffPsmtfqibtCwjLyVyXylY9Ozk8mhmjRe0BL456UEoyPavSh0G9L1csaJCJ8qFT0RlmA5AqOWNauBzP-ZgENrud0b--YTks3Yy5NZN0ZyZvVt4cn9Jo9Lv5dzSMw\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://asymptote.sourceforge.net/asymptote.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[2.2] An Asymptote tutorial Tác giả: Charles Staats III, 109 trang, 2015<br><a href=\"https://l.facebook.com/l.php?u=https%3A%2F%2Fmath.uchicago.edu%2F%7Ecstaats%2FCharles_Staats_III%2FNotes_and_papers_files%2Fasymptote_tutorial.pdf%3Ffbclid%3DIwAR0QX0O2221BfxJtPjf6dVvKA718cCqTVJIzTXSjdprgjGot432RZN7_qVg&amp;h=AT2DnpfWjM9Yr57xaI7F9Sxl1AxWIfvyAkvWIE4HbwSMjDOvEBx-DGWE1dTDWKandCnans5KX4QXiGGrWr-1rTwMyW1KBJSXSMXK8wbf8Uc1tAQ7hxBvGhXtXf299vk8SnT8ggak6m50zi8zFt2VNg\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://math.uchicago.edu/…/Notes_an…/asymptote_tutorial.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[2.3] Euclidean geometry with asymptote, 95 trang, tác giả Philippe Ivaldi (dịch từ bản tiếng Pháp)<br><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.piprime.fr%2Ffiles%2Fres%2Fgeometry_en.pdf%3Ffbclid%3DIwAR3Tx9s9ZmK5hUKyseSmn-BH2sXrBkNsDdECdIi82IHV7wllh977FPvmobs&amp;h=AT1oyAeWakTaaVB23wtpccfdRdN9ro8kyqXzFR-GpA0tLQK9loR3LMT7ofH4Z7RZT7JXp_ssug50I8oCoslDMd0J3-Mp7Kkvi0wgxzJ_U3XhI54Rub7emJw6idbQK54ZwZXK-pByTYGB6ZU9cBTaag\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://www.piprime.fr/files/res/geometry_en.pdf</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">[2.4]&nbsp;<a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.piprime.fr%2Fasymptote%2F%3Ffbclid%3DIwAR3WXFCPKhq4gc7C2YOk0js_xJks6S1kkGP28pS9l0Y0opAVy9kedLv3LNI&amp;h=AT2lMe_ezoQI7s-ZwQWP0nAdj1y6UdeXnGCU9e3aFL6MVAE_oHjg8VGgSXyhABpY4jCwYNpy63CKdn5-DoJqLnmQ_hfFZDz_SUj5LqzaNaX0iLEIR3sXphz3did0egG-z4e8ai1QMdFlh1rzruoxx-RlruoCObMd8DE\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">http://www.piprime.fr/asymptote/</a>&nbsp;có 873 ví dụ mã lệnh Asymptote</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Do tikz, asymptote đều là 1 gói lệnh của Tex (LaTex,…), nên nếu bạn đã biết soạn thảo LaTex thì đó là lợi thế khi học vẽ hình. Tuy nhiên, ngay cả khi bạn chưa hề biết LaTex, bạn vẫn có thể học vẽ, chỉ cần cài đặt MikTex hoặc Texlive cùng với hệ soạn thảo TexStudio/TexMaker.</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">(Bạn muốn biết rõ hơn về LaTex thì có thể đọc tài liệu sau&nbsp;<a href=\"https://drive.google.com/file/d/0B6t6keI_Xwz5a1NSM3ByZGlQTFU/view?fbclid=IwAR1qxB6kEg-x8-N-qoGjI7trVDf7wZo0p80e2MbkJTfnaOnMVt-J7ykkvcM\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://drive.google.com/…/0B6t6keI_Xwz5a1NSM3ByZGlQTFU/view</a><br>hoặc<br><a href=\"https://nmhieupdp.files.wordpress.com/2014/11/gary-l-gray-a-course-of-latex.pdf?fbclid=IwAR3v9JrkuZUkpmFzaWv4Iv2s_PdEtuKMfVHCktPeU499x-lmZjsnAtjuMdQ\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://nmhieupdp.files.wordpress.com/…/gary-l-gray-a-cours…</a>)</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Bạn có thể đặt câu hỏi, thảo luận bằng tiếng Anh tại&nbsp;<a href=\"https://tex.stackexchange.com/?fbclid=IwAR0ezul5hwX5mFt-S-_jVtavLWkLYvzwA_D_bRHc-m_wG0V9hkfpibMJyws\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: rgb(30, 115, 190);\">https://tex.stackexchange.com/</a>&nbsp;– diễn đàn lớn nhất về vẽ hình với TikZ và Asymptote.</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Các câu hỏi, thảo luận bằng tiếng Việt &lt;&lt;&lt;&lt; nhóm FB Vẽ hình khoa học TikZ – Asymptote ^^&nbsp;<br><a href=\"https://www.facebook.com/groups/217239182149447/?ref=gs&amp;fref=gs&amp;dti=217239182149447&amp;hc_location=group\" style=\"color: rgb(30, 115, 190);\">https://www.facebook.com/groups/217239182149447/</a></p>','2019-11-19 16:47:14','2019-11-19 16:47:14'),
	(2,'gioi-thieu','<p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Trang&nbsp;<a href=\"http://tikz.vn/\" style=\"color: rgb(30, 115, 190);\">tikz.vn</a>&nbsp;là web&nbsp;<span style=\"color: rgb(0, 0, 128);\"><em><span style=\"font-weight: 600;\">Phổ biến vẽ hình khoa học</span></em></span>&nbsp;và&nbsp;<span style=\"color: rgb(0, 0, 128);\"><em><span style=\"font-weight: 600;\">Nâng cao tư duy hình học</span></em></span>.</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Chúng tôi vẽ các hình vẽ khoa học một cách chính xác và tinh tế. Chúng tôi tin rằng tư duy hình học là một trong các nền tảng của tư duy con người.</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Các hình được vẽ bằng gói lệnh&nbsp;<span style=\"color: rgb(0, 0, 128);\">TikZ</span>&nbsp;hoặc&nbsp;<span style=\"color: rgb(0, 0, 128);\">Asymptote</span>. Phần lớn các hình vẽ được tuyển chọn từ nhóm Facebook&nbsp;<a href=\"https://www.facebook.com/groups/217239182149447/\" style=\"color: rgb(30, 115, 190); outline: 0px;\">Vẽ hình khoa học TikZ – Asymptote</a>&nbsp;– nơi các thành viên của&nbsp;<a href=\"http://tikz.vn/\" style=\"color: rgb(30, 115, 190);\">tikz.vn</a>&nbsp;thảo luận, đề xuất.</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Các thành viên của&nbsp;<a href=\"http://tikz.vn/\" style=\"color: rgb(30, 115, 190);\">tikz.vn</a>&nbsp;là những người tự do, có tư duy cởi mở, có tấm lòng với giáo dục, và tôn trọng sự khác biệt của mỗi cá nhân.</p>','2019-11-19 17:09:27','2019-11-19 17:09:27'),
	(3,'lien-he','<p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\"><span style=\"font-weight: 600;\">Liên hệ</span><br>TS. Lê Huy Tiễn<br>Khoa Toán-cơ-tin học,<br>Đại học Khoa học tự nhiên – ĐHQG Hà Nội</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Điện thoại: (+84) 1695 668866</p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Email:&nbsp;<a href=\"http://tikz.vn/contact/tienlh@vnu.edu.vn\" style=\"color: rgb(30, 115, 190);\">tienlh@vnu.edu.vn</a>&nbsp;&nbsp; &nbsp;<a href=\"http://tikz.vn/contact/lehuytien78@gmail.com\" style=\"color: rgb(30, 115, 190);\">lehuytien78@gmail.com</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Facebook cá nhân:&nbsp;<a href=\"http://www.facebook.com/black.mild.779\" style=\"color: rgb(30, 115, 190);\">http://www.facebook.com/black.mild.779</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\">Facebook của nhóm “Vẽ hình khoa học TikZ”&nbsp;<a href=\"https://www.facebook.com/groups/217239182149447/\" style=\"color: rgb(30, 115, 190);\">https://www.facebook.com/groups/217239182149447/</a></p><p style=\"margin-bottom: 1.41575em; color: rgb(109, 109, 109); font-family: &quot;Source Sans Pro&quot;, HelveticaNeue-Light, &quot;Helvetica Neue Light&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: medium;\"><span style=\"font-weight: 600;\">Thời gian làm việc</span><br>Thứ hai – Thứ bảy: 9:00AM–5:00PM<br>Chủ nhật: 11:00AM–3:00PM</p>','2019-11-19 17:09:55','2019-11-19 17:09:55'),
	(4,'thong-tin-chinh','<div class=\"titleFooter\" style=\"font-size: 20px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: tahoma;\"><label style=\"font-weight: normal; padding-top: 20px;\">Thông Tin Chính</label></div><div class=\"contentFooter\" style=\"color: rgb(51, 51, 51); font-family: tahoma;\"><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Địa chỉ Tòa soạn:</label>&nbsp;Toà nhà FLC Tower, số 265 đường Cầu Giấy, quận Cầu Giấy, Hà Nội</div><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Điện thoại:</label>&nbsp;024 3215xxxx</div><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Fax:</label>&nbsp;024 3623xxxx</div><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Email gửi bài:</label>&nbsp;<a href=\"http://bbt@tikz.edu.vn/\" class=\"\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\">bbt@Tikz.edu.vn</a></div><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Email giao dịch:</label>&nbsp;<a href=\"http://info@tikz.edu.vn/\" class=\"\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\">info@Tikz.edu.vn</a></div><div style=\"margin-bottom: 5px;\"><label style=\"margin-bottom: 0px;\">Website:</label>&nbsp;<a href=\"http://tikz.edu.vn/\" target=\"_blank\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51);\">Tikz.edu.vn</a></div></div>','2019-11-19 17:10:44','2019-11-19 17:10:44'),
	(5,'mo-ta','<p><span style=\"color: rgb(51, 51, 51); font-family: tahoma;\">\"Tạp chí toán học chia sẻ kiến thức hình học chính xác !\"</span><br></p>','2019-11-19 17:10:53','2019-11-19 17:10:53'),
	(6,'so-luong-thanh-vien','<p>THÀNH VIÊN : 5000</p>','2019-11-19 17:16:19','2019-11-19 17:17:34'),
	(7,'copy-right','<p><span style=\"color: rgb(51, 51, 51); font-family: tahoma; font-size: 12px; background-color: rgb(234, 234, 234);\">Copyright Tạp chí Tikz @ 2017</span></p>','2019-11-19 17:18:39','2019-11-19 17:19:20');

/*!40000 ALTER TABLE `config_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table menu_homes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_homes`;

CREATE TABLE `menu_homes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_homes` WRITE;
/*!40000 ALTER TABLE `menu_homes` DISABLE KEYS */;

INSERT INTO `menu_homes` (`id`, `code`, `name`, `path`, `order`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'hinh-ve','Hĩnh vẽ','/hinh-ve',2,1,'2019-11-19 17:21:11','2019-11-19 17:38:34'),
	(2,'danh-muc-hinh-ve','Danh mục hình vẽ','/danh-muc-hinh-ve',3,1,'2019-11-19 17:36:51','2019-11-19 17:38:36'),
	(3,'gioi-thieu','Giới thiệu','/gioi-thieu',5,1,'2019-11-19 17:37:06','2019-11-19 17:38:52'),
	(4,'lien-he','Liên hệ','/lien-he',6,1,'2019-11-19 17:37:12','2019-11-19 17:39:45'),
	(5,'tai-lieu-hoc-ve','Tài liệu học vẽ','/tai-lieu-hoc-ve',4,1,'2019-11-19 17:37:31','2019-11-19 17:38:48'),
	(6,'trang-chu','Trang chủ','/trang-chu',1,1,'2019-11-19 17:38:27','2019-11-19 17:38:27');

/*!40000 ALTER TABLE `menu_homes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1),
	(4,'2019_05_26_add_column_to_admin_menu_table',1),
	(5,'2019_05_26_add_column_to_admin_permissions_table',1),
	(6,'2019_05_26_add_column_to_admin_users_table',1),
	(7,'2019_05_26_create_admin_translations_table',1),
	(8,'2019_07_31_create_admin_notifies_table',1),
	(9,'2019_07_31_create_admin_siteconfig_table',1),
	(10,'2019_08_19_000000_create_failed_jobs_table',1),
	(12,'2019_11_01_080400_create_tags_table',3),
	(13,'2019_11_01_084939_create_config_sites_table',4),
	(14,'2019_11_19_160821_create_menu_homes_table',5);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'RJ1f5qUQ0o','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(2,'uWmGa3e1vJ','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(3,'8Cym5ZGTzQ','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(4,'kYZ1yx9ILs','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(5,'4fHoRDCnt1','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(6,'blzdJnWmN4','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(7,'hEWYS7kIUm','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(8,'WdAHXi5j2V','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(9,'Ofz8xqRK30','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(10,'uSGoWXRnj8','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(11,'r43f7ygisE','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(12,'EN8xaDGg5V','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(13,'UoQrmSzFx4','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(14,'xmrLeWiyba','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(15,'lyIzN4na3r','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(16,'RdL90SMasK','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(17,'uDUQ8jx5FW','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(18,'cJgZykVaxN','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(19,'8FUykKb0vM','2019-11-19 16:42:12','2019-11-19 16:42:12'),
	(20,'Flight Operations','2019-11-19 17:03:10','2019-11-19 17:03:10');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
