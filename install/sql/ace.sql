-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (x86_64)
--
-- Host: oil    Database: ooiill
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `bsw_admin_access_control`
--

DROP TABLE IF EXISTS `bsw_admin_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_access_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `route_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access` (`user_id`,`route_name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_access_control`
--

LOCK TABLES `bsw_admin_access_control` WRITE;
/*!40000 ALTER TABLE `bsw_admin_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_login`
--

DROP TABLE IF EXISTS `bsw_admin_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `location` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_login`
--

LOCK TABLES `bsw_admin_login` WRITE;
/*!40000 ALTER TABLE `bsw_admin_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_menu`
--

DROP TABLE IF EXISTS `bsw_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `route_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `javascript` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `json_params` json DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_menu`
--

LOCK TABLES `bsw_admin_menu` WRITE;
/*!40000 ALTER TABLE `bsw_admin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_persistence_log`
--

DROP TABLE IF EXISTS `bsw_admin_persistence_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_persistence_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `before` json NOT NULL,
  `later` json NOT NULL,
  `effect` json NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `table` (`table`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_persistence_log`
--

LOCK TABLES `bsw_admin_persistence_log` WRITE;
/*!40000 ALTER TABLE `bsw_admin_persistence_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_persistence_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_role`
--

DROP TABLE IF EXISTS `bsw_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_role`
--

LOCK TABLES `bsw_admin_role` WRITE;
/*!40000 ALTER TABLE `bsw_admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_role_access_control`
--

DROP TABLE IF EXISTS `bsw_admin_role_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_role_access_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `route_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access` (`role_id`,`route_name`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_role_access_control`
--

LOCK TABLES `bsw_admin_role_access_control` WRITE;
/*!40000 ALTER TABLE `bsw_admin_role_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_role_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_admin_user`
--

DROP TABLE IF EXISTS `bsw_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_leader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `telegram_id` bigint(20) NOT NULL DEFAULT '0',
  `google_auth_secret` char(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar_attachment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_admin_user`
--

LOCK TABLES `bsw_admin_user` WRITE;
/*!40000 ALTER TABLE `bsw_admin_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_attachment`
--

DROP TABLE IF EXISTS `bsw_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `platform` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sha1` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(10) unsigned NOT NULL,
  `deep` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `deep` (`deep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_attachment`
--

LOCK TABLES `bsw_attachment` WRITE;
/*!40000 ALTER TABLE `bsw_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_captcha`
--

DROP TABLE IF EXISTS `bsw_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_captcha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `account` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `captcha` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scene` tinyint(3) unsigned NOT NULL,
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `record` (`type`,`account`,`scene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_captcha`
--

LOCK TABLES `bsw_captcha` WRITE;
/*!40000 ALTER TABLE `bsw_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_command_queue`
--

DROP TABLE IF EXISTS `bsw_command_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_command_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `command` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` json DEFAULT NULL,
  `resource_need` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `done_percent` float unsigned NOT NULL DEFAULT '0',
  `telegram_receiver` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cron_type` tinyint(3) NOT NULL DEFAULT '1',
  `cron_date_format` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'd-H:i',
  `cron_date_value` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01-00:00',
  `cron_reuse` tinyint(3) NOT NULL DEFAULT '0',
  `file_attachment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_command_queue`
--

LOCK TABLES `bsw_command_queue` WRITE;
/*!40000 ALTER TABLE `bsw_command_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_command_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_config`
--

DROP TABLE IF EXISTS `bsw_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `value` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_client_pull` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_config`
--

LOCK TABLES `bsw_config` WRITE;
/*!40000 ALTER TABLE `bsw_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_token`
--

DROP TABLE IF EXISTS `bsw_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `scene` tinyint(3) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `effective_times` int(10) unsigned NOT NULL DEFAULT '1',
  `expires_time` int(10) unsigned NOT NULL,
  `params` json DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_token`
--

LOCK TABLES `bsw_token` WRITE;
/*!40000 ALTER TABLE `bsw_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_work_task`
--

DROP TABLE IF EXISTS `bsw_work_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_work_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `done_percent` float unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_work_task`
--

LOCK TABLES `bsw_work_task` WRITE;
/*!40000 ALTER TABLE `bsw_work_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_work_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_work_task_trail`
--

DROP TABLE IF EXISTS `bsw_work_task_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_work_task_trail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `reliable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trail` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_work_task_trail`
--

LOCK TABLES `bsw_work_task_trail` WRITE;
/*!40000 ALTER TABLE `bsw_work_task_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_work_task_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsw_work_team`
--

DROP TABLE IF EXISTS `bsw_work_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsw_work_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsw_work_team`
--

LOCK TABLES `bsw_work_team` WRITE;
/*!40000 ALTER TABLE `bsw_work_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsw_work_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-07 10:39:54
