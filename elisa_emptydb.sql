/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.27-MariaDB, for Linux (x86_64)
--
-- Host: dbod-adcelisa.cern.ch    Database: elisa_db
-- ------------------------------------------------------
-- Server version	8.4.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `D_ATTACH4MESSAGE`
--

DROP TABLE IF EXISTS `D_ATTACH4MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `D_ATTACH4MESSAGE` (
  `attach_id` bigint NOT NULL AUTO_INCREMENT,
  `message_id` int unsigned DEFAULT NULL,
  `logbook_id` int unsigned DEFAULT NULL,
  `filename` varchar(1024) DEFAULT NULL,
  `content` mediumblob,
  PRIMARY KEY (`attach_id`),
  KEY `message_id` (`message_id`),
  KEY `logbook_id` (`logbook_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `D_MESSAGES`
--

DROP TABLE IF EXISTS `D_MESSAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `D_MESSAGES` (
  `logbook_id` bigint DEFAULT NULL,
  `message_id` bigint DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mt` bigint DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `subject` varchar(2056) DEFAULT NULL,
  `has_replies` bigint DEFAULT NULL,
  `reply_to` bigint DEFAULT NULL,
  `thread_head` bigint DEFAULT NULL,
  `has_attachments` bigint DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `host_ip` varchar(50) DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `encoding` int DEFAULT NULL,
  `changedby` varchar(500) DEFAULT NULL,
  KEY `thread_head` (`thread_head`),
  KEY `reply_to` (`reply_to`),
  KEY `logbook_id` (`logbook_id`),
  KEY `mt` (`mt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `D_OPTION4MESSAGE`
--

DROP TABLE IF EXISTS `D_OPTION4MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `D_OPTION4MESSAGE` (
  `message_id` int unsigned DEFAULT NULL,
  `logbook_id` int unsigned DEFAULT NULL,
  `option_id` int unsigned DEFAULT NULL,
  `option_value` varchar(2056) DEFAULT NULL,
  KEY `message_id` (`message_id`),
  KEY `logbook_id` (`logbook_id`),
  KEY `option_id` (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `D_SA4MESSAGE`
--

DROP TABLE IF EXISTS `D_SA4MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `D_SA4MESSAGE` (
  `message_id` int unsigned DEFAULT NULL,
  `logbook_id` int unsigned DEFAULT NULL,
  `sa_id` int unsigned DEFAULT NULL,
  KEY `message_id` (`message_id`),
  KEY `logbook_id` (`logbook_id`),
  KEY `sa_id` (`sa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOGBOOK`
--

DROP TABLE IF EXISTS `LOGBOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGBOOK` (
  `logbookname` varchar(50) NOT NULL,
  `logbookid` int unsigned NOT NULL,
  `last_id` bigint DEFAULT NULL,
  `mail_link` varchar(2056) DEFAULT NULL,
  PRIMARY KEY (`logbookid`),
  KEY `last_id` (`last_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOGBOOK2MT`
--

DROP TABLE IF EXISTS `LOGBOOK2MT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGBOOK2MT` (
  `logbookid` int unsigned DEFAULT NULL,
  `mt_id` int unsigned DEFAULT NULL,
  KEY `logbookid` (`logbookid`),
  KEY `mt_id` (`mt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `LOGBOOK2MT_VIEW`
--

DROP TABLE IF EXISTS `LOGBOOK2MT_VIEW`;
/*!50001 DROP VIEW IF EXISTS `LOGBOOK2MT_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `LOGBOOK2MT_VIEW` AS SELECT
 1 AS `LOGBOOKID`,
  1 AS `MT_ID`,
  1 AS `LOGBOOKNAME`,
  1 AS `MT_NAME` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `LOGBOOK2SA`
--

DROP TABLE IF EXISTS `LOGBOOK2SA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGBOOK2SA` (
  `logbookid` int unsigned DEFAULT NULL,
  `sa_id` int unsigned DEFAULT NULL,
  KEY `logbookid` (`logbookid`),
  KEY `sa_id` (`sa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `LOGBOOK2SA_VIEW`
--

DROP TABLE IF EXISTS `LOGBOOK2SA_VIEW`;
/*!50001 DROP VIEW IF EXISTS `LOGBOOK2SA_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `LOGBOOK2SA_VIEW` AS SELECT
 1 AS `LOGBOOKID`,
  1 AS `SA_ID`,
  1 AS `LOGBOOKNAME`,
  1 AS `SA_NAME` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MESSAGE_TYPE`
--

DROP TABLE IF EXISTS `MESSAGE_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_TYPE` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mt_name` varchar(50) NOT NULL,
  `email` varchar(2056) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MT2OPTIONS`
--

DROP TABLE IF EXISTS `MT2OPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MT2OPTIONS` (
  `opt_id` bigint DEFAULT NULL,
  `mt_id` bigint DEFAULT NULL,
  KEY `opt_id` (`opt_id`),
  KEY `mt_id` (`mt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `MT2OPTIONS_VIEW`
--

DROP TABLE IF EXISTS `MT2OPTIONS_VIEW`;
/*!50001 DROP VIEW IF EXISTS `MT2OPTIONS_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `MT2OPTIONS_VIEW` AS SELECT
 1 AS `MT_ID`,
  1 AS `OPT_ID`,
  1 AS `MT_NAME`,
  1 AS `OPT_NAME` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MT2SA`
--

DROP TABLE IF EXISTS `MT2SA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MT2SA` (
  `sa_id` int unsigned DEFAULT NULL,
  `mt_id` int unsigned DEFAULT NULL,
  KEY `sa_id` (`sa_id`),
  KEY `mt_id` (`mt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `MT2SA_VIEW`
--

DROP TABLE IF EXISTS `MT2SA_VIEW`;
/*!50001 DROP VIEW IF EXISTS `MT2SA_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `MT2SA_VIEW` AS SELECT
 1 AS `MT_ID`,
  1 AS `SA_ID`,
  1 AS `MT_NAME`,
  1 AS `SA_NAME` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `OPTIONS`
--

DROP TABLE IF EXISTS `OPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPTIONS` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `opt_name` varchar(256) DEFAULT NULL,
  `opt_level` varchar(10) DEFAULT NULL,
  `opt_type` varchar(20) DEFAULT NULL,
  `opt_values` varchar(2056) DEFAULT NULL,
  `opt_parent_id` bigint DEFAULT NULL,
  `opt_parent_value` varchar(2056) DEFAULT NULL,
  `opt_default_value` varchar(2056) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_parent_id` (`opt_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1066 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRESET_OPTION`
--

DROP TABLE IF EXISTS `PRESET_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESET_OPTION` (
  `option_id` bigint NOT NULL,
  `preset_text` varchar(2056) DEFAULT NULL,
  `preset_subject` varchar(500) DEFAULT NULL,
  `preset_email` varchar(2056) DEFAULT NULL,
  `preset_suboption` varchar(2056) DEFAULT NULL,
  KEY `option_id` (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRESET_OPTION2SA`
--

DROP TABLE IF EXISTS `PRESET_OPTION2SA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESET_OPTION2SA` (
  `sa_id` bigint DEFAULT NULL,
  `opt_id` bigint DEFAULT NULL,
  KEY `sa_id` (`sa_id`),
  KEY `opt_id` (`opt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `PRESET_OPTION2SA_VIEW`
--

DROP TABLE IF EXISTS `PRESET_OPTION2SA_VIEW`;
/*!50001 DROP VIEW IF EXISTS `PRESET_OPTION2SA_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PRESET_OPTION2SA_VIEW` AS SELECT
 1 AS `OPT_ID`,
  1 AS `SA_ID`,
  1 AS `OPT_NAME`,
  1 AS `SA_NAME` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SYSTEM_AFFECTED`
--

DROP TABLE IF EXISTS `SYSTEM_AFFECTED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SYSTEM_AFFECTED` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sa_name` varchar(50) NOT NULL,
  `email` varchar(2056) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=501 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `LOGBOOK2MT_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `LOGBOOK2MT_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elisa_config`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LOGBOOK2MT_VIEW` AS select `LOGBOOK2MT`.`logbookid` AS `LOGBOOKID`,`LOGBOOK2MT`.`mt_id` AS `MT_ID`,`LOGBOOK`.`logbookname` AS `LOGBOOKNAME`,`MESSAGE_TYPE`.`mt_name` AS `MT_NAME` from ((`LOGBOOK2MT` join `LOGBOOK`) join `MESSAGE_TYPE`) where ((`LOGBOOK2MT`.`logbookid` = `LOGBOOK`.`logbookid`) and (`LOGBOOK2MT`.`mt_id` = `MESSAGE_TYPE`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LOGBOOK2SA_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `LOGBOOK2SA_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elisa_config`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LOGBOOK2SA_VIEW` AS select `LOGBOOK2SA`.`logbookid` AS `LOGBOOKID`,`LOGBOOK2SA`.`sa_id` AS `SA_ID`,`LOGBOOK`.`logbookname` AS `LOGBOOKNAME`,`SYSTEM_AFFECTED`.`sa_name` AS `SA_NAME` from ((`LOGBOOK2SA` join `LOGBOOK`) join `SYSTEM_AFFECTED`) where ((`LOGBOOK2SA`.`logbookid` = `LOGBOOK`.`logbookid`) and (`LOGBOOK2SA`.`sa_id` = `SYSTEM_AFFECTED`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MT2OPTIONS_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `MT2OPTIONS_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elisa_config`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MT2OPTIONS_VIEW` AS select `MT2OPTIONS`.`mt_id` AS `MT_ID`,`MT2OPTIONS`.`opt_id` AS `OPT_ID`,`MESSAGE_TYPE`.`mt_name` AS `MT_NAME`,`OPTIONS`.`opt_name` AS `OPT_NAME` from ((`MT2OPTIONS` join `MESSAGE_TYPE`) join `OPTIONS`) where ((`MT2OPTIONS`.`mt_id` = `MESSAGE_TYPE`.`id`) and (`MT2OPTIONS`.`opt_id` = `OPTIONS`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MT2SA_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `MT2SA_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elisa_config`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MT2SA_VIEW` AS select `MT2SA`.`mt_id` AS `MT_ID`,`MT2SA`.`sa_id` AS `SA_ID`,`MESSAGE_TYPE`.`mt_name` AS `MT_NAME`,`SYSTEM_AFFECTED`.`sa_name` AS `SA_NAME` from ((`MT2SA` join `MESSAGE_TYPE`) join `SYSTEM_AFFECTED`) where ((`MT2SA`.`mt_id` = `MESSAGE_TYPE`.`id`) and (`MT2SA`.`sa_id` = `SYSTEM_AFFECTED`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PRESET_OPTION2SA_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `PRESET_OPTION2SA_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elisa_config`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PRESET_OPTION2SA_VIEW` AS select `PRESET_OPTION2SA`.`opt_id` AS `OPT_ID`,`PRESET_OPTION2SA`.`sa_id` AS `SA_ID`,`OPTIONS`.`opt_name` AS `OPT_NAME`,`SYSTEM_AFFECTED`.`sa_name` AS `SA_NAME` from ((`PRESET_OPTION2SA` join `OPTIONS`) join `SYSTEM_AFFECTED`) where ((`PRESET_OPTION2SA`.`opt_id` = `OPTIONS`.`id`) and (`PRESET_OPTION2SA`.`sa_id` = `SYSTEM_AFFECTED`.`id`)) */;
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

-- Dump completed on 2025-04-04 18:32:29
