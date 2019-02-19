-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: zabbix
-- ------------------------------------------------------
-- Server version	10.1.32-MariaDB

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
-- Table structure for table `acknowledges`
--
use zabbix;

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '1h',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  `maintenance_mode` int(11) NOT NULL DEFAULT '1',
  `ack_shortdata` varchar(255) NOT NULL DEFAULT '',
  `ack_longdata` text NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,'1h','','','','','',1,'',''),(3,'Report problems to Zabbix administrators',0,0,1,'1h','{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}','{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}','',1,'Acknowledged: {TRIGGER.NAME}','{USER.FULLNAME} acknowledged problem at {ACK.DATE} {ACK.TIME} with the following message:\r\n{ACK.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}'),(4,'Report not supported items',3,0,1,'1h','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','',1,'',''),(5,'Report not supported low level discovery rules',3,0,1,'1h','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','',1,'',''),(6,'Report unknown triggers',3,0,1,'1h','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','',1,'',''),(7,'Auto-registion',2,0,0,'1h','Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}','','','',1,'',''),(8,'auto-redis',2,0,1,'1h','Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}','','','',1,'','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  `p_eventid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  KEY `alerts_7` (`p_eventid`),
  KEY `alerts_4` (`status`),
  KEY `c_alerts_6` (`acknowledgeid`),
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_5` FOREIGN KEY (`p_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_6` FOREIGN KEY (`acknowledgeid`) REFERENCES `acknowledges` (`acknowledgeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
INSERT INTO `application_prototype` VALUES (1,23665,NULL,'Startup {#SERVICE.STARTUPNAME} services');
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (1,207,206),(2,229,228),(3,230,227),(4,231,228),(5,232,227),(6,235,234),(7,236,234),(8,237,228),(9,238,227),(10,241,240),(11,242,240),(12,252,206),(13,262,206),(14,272,206),(15,282,206),(16,292,206),(17,302,206),(18,329,206),(40,469,206),(124,576,206);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(5,10001,'Filesystems',0),(7,10001,'Network interfaces',0),(9,10001,'Processes',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(21,10001,'General',0),(23,10001,'Security',0),(179,10047,'Zabbix server',0),(206,10050,'Zabbix agent',0),(207,10001,'Zabbix agent',0),(227,10060,'Interfaces',0),(228,10065,'General',0),(229,10066,'General',0),(230,10066,'Interfaces',0),(231,10067,'General',0),(232,10067,'Interfaces',0),(234,10068,'Disk partitions',0),(235,10067,'Disk partitions',0),(236,10069,'Disk partitions',0),(237,10069,'General',0),(238,10069,'Interfaces',0),(240,10070,'Processors',0),(241,10069,'Processors',0),(242,10067,'Processors',0),(245,10071,'Voltage',0),(246,10071,'Temperature',0),(247,10071,'Fans',0),(248,10072,'Voltage',0),(249,10072,'Temperature',0),(250,10072,'Fans',0),(251,10073,'MySQL',0),(252,10074,'Zabbix agent',0),(253,10074,'CPU',0),(254,10074,'Filesystems',0),(255,10074,'General',0),(256,10074,'Memory',0),(257,10074,'Network interfaces',0),(258,10074,'OS',0),(259,10074,'Performance',0),(260,10074,'Processes',0),(261,10074,'Security',0),(262,10075,'Zabbix agent',0),(263,10075,'CPU',0),(264,10075,'Filesystems',0),(265,10075,'General',0),(266,10075,'Memory',0),(267,10075,'Network interfaces',0),(268,10075,'OS',0),(269,10075,'Performance',0),(270,10075,'Processes',0),(271,10075,'Security',0),(272,10076,'Zabbix agent',0),(273,10076,'CPU',0),(274,10076,'Filesystems',0),(275,10076,'General',0),(276,10076,'Memory',0),(277,10076,'Network interfaces',0),(278,10076,'OS',0),(279,10076,'Performance',0),(280,10076,'Processes',0),(281,10076,'Security',0),(282,10077,'Zabbix agent',0),(283,10077,'CPU',0),(284,10077,'Filesystems',0),(285,10077,'General',0),(286,10077,'Memory',0),(287,10077,'Network interfaces',0),(288,10077,'OS',0),(289,10077,'Performance',0),(290,10077,'Processes',0),(291,10077,'Security',0),(292,10078,'Zabbix agent',0),(293,10078,'CPU',0),(294,10078,'Filesystems',0),(295,10078,'General',0),(296,10078,'Memory',0),(297,10078,'Network interfaces',0),(298,10078,'OS',0),(299,10078,'Performance',0),(300,10078,'Processes',0),(301,10078,'Security',0),(302,10079,'Zabbix agent',0),(303,10079,'CPU',0),(304,10079,'Filesystems',0),(305,10079,'General',0),(306,10079,'Memory',0),(307,10079,'Network interfaces',0),(308,10079,'OS',0),(309,10079,'Performance',0),(310,10079,'Processes',0),(311,10079,'Security',0),(319,10081,'General',0),(320,10081,'Performance',0),(321,10081,'Services',0),(322,10081,'Filesystems',0),(323,10081,'OS',0),(324,10081,'Processes',0),(325,10081,'CPU',0),(328,10081,'Memory',0),(329,10081,'Zabbix agent',0),(330,10081,'Network interfaces',0),(331,10076,'Logical partitions',0),(332,10082,'Classes',0),(333,10082,'Compilation',0),(334,10082,'Garbage Collector',0),(335,10082,'Memory',0),(336,10082,'Memory Pool',0),(337,10082,'Operating System',0),(338,10082,'Runtime',0),(339,10082,'Threads',0),(340,10083,'http-8080',0),(341,10083,'http-8443',0),(342,10083,'jk-8009',0),(343,10083,'Sessions',0),(344,10083,'Tomcat',0),(356,10048,'Zabbix proxy',0),(408,10089,'CPU',0),(410,10089,'Memory',0),(412,10089,'General',0),(414,10089,'Storage',0),(416,10091,'CPU',0),(418,10091,'General',0),(420,10091,'Hardware',0),(422,10091,'Memory',0),(424,10089,'Filesystems',0),(428,10089,'Network',0),(433,10088,'Log',0),(434,10088,'Clusters',0),(435,10089,'Disks',0),(437,10089,'Interfaces',0),(443,10091,'Network',0),(445,10091,'Datastore',0),(446,10093,'FTP service',0),(447,10094,'HTTP service',0),(448,10095,'HTTPS service',0),(449,10096,'IMAP service',0),(450,10097,'LDAP service',0),(451,10098,'NNTP service',0),(452,10099,'NTP service',0),(453,10100,'POP service',0),(454,10101,'SMTP service',0),(455,10102,'SSH service',0),(456,10103,'Telnet service',0),(457,10104,'ICMP',0),(458,10088,'General',0),(469,10107,'Zabbix agent',0),(470,10107,'CPU',0),(471,10107,'Filesystems',0),(472,10107,'General',0),(473,10107,'Memory',0),(474,10107,'Network interfaces',0),(475,10107,'OS',0),(476,10107,'Performance',0),(477,10107,'Processes',0),(478,10107,'Security',0),(550,10113,'ICMP',0),(551,10114,'Packages',0),(552,10114,'Zabbix agent',0),(553,10115,'Wordpress',0),(554,10116,'DB Backup',0),(555,10117,'MySQL',0),(557,10118,'SSL certificate',0),(558,10119,'Domain',0),(559,10120,'ClamAV',0),(560,10121,'BackupPC',0),(561,10121,'BackupPC - backups',0),(562,10123,'Redis',0),(563,10124,'rabbitmq data',0),(564,10124,'rabbitmq server',0),(565,10125,'PostgreSQL',0),(566,10126,'Postfix',0),(567,10127,'OPcache',0),(568,10128,'php-fpm',0),(569,10129,'php-fpm',0),(570,10130,'Fail2Ban',0),(571,10131,'Nginx',0),(572,10132,'Memcache',0),(573,10133,'Lighttpd',0),(574,10134,'LDAP service',0),(576,10135,'Zabbix agent',0),(577,10135,'CPU',0),(578,10135,'Disk status',0),(579,10135,'Filesystems',0),(580,10135,'Memory and Swap',0),(581,10135,'Network connect status',0),(582,10135,'Network interfaces status',0),(583,10135,'Network socket status',0),(584,10135,'OS',0),(585,10135,'Performance',0),(586,10135,'Processes',0),(587,10135,'Security',0),(588,10136,'Redis_Status',0),(589,10137,'Memcached_Status',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,12,2,'Linux',''),(3,2,10,0,'0',''),(4,2,8,0,'9',''),(6,4,23,0,'0',''),(7,5,23,0,'2',''),(8,6,23,0,'4',''),(9,7,24,2,'Linux',''),(10,8,24,2,'Linux','');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` varchar(32) NOT NULL DEFAULT '10m',
  `work_period` varchar(255) NOT NULL DEFAULT '1-5,09:00-18:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` varchar(32) NOT NULL DEFAULT '1w',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` varchar(32) NOT NULL DEFAULT '30m',
  `blink_period` varchar(32) NOT NULL DEFAULT '30m',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` varchar(32) NOT NULL DEFAULT '365d',
  `hk_events_internal` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_discovery` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_autoreg` varchar(32) NOT NULL DEFAULT '1d',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` varchar(32) NOT NULL DEFAULT '365d',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` varchar(32) NOT NULL DEFAULT '365d',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` varchar(32) NOT NULL DEFAULT '365d',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` varchar(32) NOT NULL DEFAULT '90d',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` varchar(32) NOT NULL DEFAULT '365d',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'10m','1-5,09:00-18:00',7,1,'1w',100,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster','30m','30m','DC0000','DC0000','00AA00','00AA00',1,1,1,1,1,10,1,'365d','365d','365d','365d',1,'365d',1,'365d',1,'365d',1,0,'90d',1,0,'365d',-1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition`
--

DROP TABLE IF EXISTS `corr_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_1` (`correlationid`),
  CONSTRAINT `c_corr_condition_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition`
--

LOCK TABLES `corr_condition` WRITE;
/*!40000 ALTER TABLE `corr_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_group`
--

DROP TABLE IF EXISTS `corr_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_group` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_group_1` (`groupid`),
  CONSTRAINT `c_corr_condition_group_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE,
  CONSTRAINT `c_corr_condition_group_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_group`
--

LOCK TABLES `corr_condition_group` WRITE;
/*!40000 ALTER TABLE `corr_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tag`
--

DROP TABLE IF EXISTS `corr_condition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tag` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tag_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tag`
--

LOCK TABLES `corr_condition_tag` WRITE;
/*!40000 ALTER TABLE `corr_condition_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagpair`
--

DROP TABLE IF EXISTS `corr_condition_tagpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagpair` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `oldtag` varchar(255) NOT NULL DEFAULT '',
  `newtag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagpair_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagpair`
--

LOCK TABLES `corr_condition_tagpair` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagvalue`
--

DROP TABLE IF EXISTS `corr_condition_tagvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagvalue` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagvalue_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagvalue`
--

LOCK TABLES `corr_condition_tagvalue` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_operation`
--

DROP TABLE IF EXISTS `corr_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_operation` (
  `corr_operationid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_operationid`),
  KEY `corr_operation_1` (`correlationid`),
  CONSTRAINT `c_corr_operation_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_operation`
--

LOCK TABLES `corr_operation` WRITE;
/*!40000 ALTER TABLE `corr_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `correlationid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`correlationid`),
  UNIQUE KEY `correlation_2` (`name`),
  KEY `correlation_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboardid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dashboardid`),
  KEY `c_dashboard_1` (`userid`),
  CONSTRAINT `c_dashboard_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Dashboard',1,0);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_user`
--

DROP TABLE IF EXISTS `dashboard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_user` (
  `dashboard_userid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_userid`),
  UNIQUE KEY `dashboard_user_1` (`dashboardid`,`userid`),
  KEY `c_dashboard_user_2` (`userid`),
  CONSTRAINT `c_dashboard_user_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_user`
--

LOCK TABLES `dashboard_user` WRITE;
/*!40000 ALTER TABLE `dashboard_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usrgrp`
--

DROP TABLE IF EXISTS `dashboard_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usrgrp` (
  `dashboard_usrgrpid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_usrgrpid`),
  UNIQUE KEY `dashboard_usrgrp_1` (`dashboardid`,`usrgrpid`),
  KEY `c_dashboard_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_dashboard_usrgrp_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usrgrp`
--

LOCK TABLES `dashboard_usrgrp` WRITE;
/*!40000 ALTER TABLE `dashboard_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3040000,3040007);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(512) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (4,4,12,'','','0','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
INSERT INTO `dhosts` VALUES (1,4,0,1528255366,0),(2,4,0,1528255368,0),(3,4,1,0,1528291108);
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` varchar(255) NOT NULL DEFAULT '1h',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (4,NULL,'faxian','172.17.0.1-5','1h',1528346622,0);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
INSERT INTO `dservices` VALUES (1,1,'',0,0,1528255366,0,4,'172.17.0.2',''),(2,2,'',0,0,1528255368,0,4,'172.17.0.3','eba0db650d4a'),(3,3,'',0,1,0,1528291108,4,'172.17.0.4','');
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_recovery`
--

DROP TABLE IF EXISTS `event_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_recovery` (
  `eventid` bigint(20) unsigned NOT NULL,
  `r_eventid` bigint(20) unsigned NOT NULL,
  `c_eventid` bigint(20) unsigned DEFAULT NULL,
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `event_recovery_1` (`r_eventid`),
  KEY `event_recovery_2` (`c_eventid`),
  CONSTRAINT `c_event_recovery_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_3` FOREIGN KEY (`c_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_recovery`
--

LOCK TABLES `event_recovery` WRITE;
/*!40000 ALTER TABLE `event_recovery` DISABLE KEYS */;
INSERT INTO `event_recovery` VALUES (1,7,NULL,NULL,NULL),(2,8,NULL,NULL,NULL),(3,18,NULL,NULL,NULL),(4,6,NULL,NULL,NULL),(7,9,NULL,NULL,NULL),(21,24,NULL,NULL,NULL),(25,26,NULL,NULL,NULL),(27,69,NULL,NULL,NULL),(28,70,NULL,NULL,NULL),(29,71,NULL,NULL,NULL),(30,72,NULL,NULL,NULL),(31,51,NULL,NULL,NULL),(32,52,NULL,NULL,NULL),(33,35,NULL,NULL,NULL),(34,53,NULL,NULL,NULL),(36,54,NULL,NULL,NULL),(37,59,NULL,NULL,NULL),(38,60,NULL,NULL,NULL),(39,61,NULL,NULL,NULL),(40,62,NULL,NULL,NULL),(41,63,NULL,NULL,NULL),(42,64,NULL,NULL,NULL),(43,65,NULL,NULL,NULL),(44,66,NULL,NULL,NULL),(45,67,NULL,NULL,NULL),(46,68,NULL,NULL,NULL),(47,55,NULL,NULL,NULL),(48,56,NULL,NULL,NULL),(49,57,NULL,NULL,NULL),(50,58,NULL,NULL,NULL),(85,133,NULL,NULL,NULL),(86,135,NULL,NULL,NULL),(107,136,NULL,NULL,NULL),(109,144,NULL,NULL,NULL),(110,146,NULL,NULL,NULL),(111,137,NULL,NULL,NULL),(117,138,NULL,NULL,NULL),(120,139,NULL,NULL,NULL),(121,140,NULL,NULL,NULL),(124,141,NULL,NULL,NULL),(125,142,NULL,NULL,NULL),(126,143,NULL,NULL,NULL),(130,131,NULL,NULL,NULL),(134,149,NULL,NULL,NULL),(147,150,NULL,NULL,NULL),(152,164,NULL,NULL,NULL),(153,177,NULL,NULL,NULL),(165,178,NULL,NULL,NULL),(169,179,NULL,NULL,NULL),(170,180,NULL,NULL,NULL),(171,175,NULL,NULL,NULL),(172,176,NULL,NULL,NULL),(173,181,NULL,NULL,NULL),(183,203,NULL,NULL,NULL),(210,214,NULL,NULL,NULL),(211,215,NULL,NULL,NULL),(216,236,NULL,NULL,NULL),(247,248,NULL,NULL,NULL),(263,264,NULL,NULL,NULL),(286,296,NULL,NULL,NULL),(287,297,NULL,NULL,NULL),(289,305,NULL,NULL,NULL),(290,306,NULL,NULL,NULL),(291,307,NULL,NULL,NULL),(292,308,NULL,NULL,NULL),(293,298,NULL,NULL,NULL),(294,299,NULL,NULL,NULL),(295,309,NULL,NULL,NULL),(300,310,NULL,NULL,NULL),(301,311,NULL,NULL,NULL),(302,312,NULL,NULL,NULL),(303,313,NULL,NULL,NULL),(304,314,NULL,NULL,NULL),(315,327,NULL,NULL,NULL),(333,339,NULL,NULL,NULL),(334,338,NULL,NULL,NULL),(340,341,NULL,NULL,NULL),(364,382,NULL,NULL,NULL),(365,383,NULL,NULL,NULL),(366,367,NULL,NULL,NULL),(384,391,NULL,NULL,NULL),(385,392,NULL,NULL,NULL),(393,406,NULL,NULL,NULL),(394,407,NULL,NULL,NULL),(395,408,NULL,NULL,NULL),(396,409,NULL,NULL,NULL),(397,410,NULL,NULL,NULL),(423,445,NULL,NULL,NULL),(452,488,NULL,NULL,NULL),(453,489,NULL,NULL,NULL),(457,477,NULL,NULL,NULL),(484,490,NULL,NULL,NULL),(485,491,NULL,NULL,NULL),(493,494,NULL,NULL,NULL),(519,529,NULL,NULL,NULL),(520,530,NULL,NULL,NULL),(548,601,NULL,NULL,NULL),(549,602,NULL,NULL,NULL),(550,551,NULL,NULL,NULL),(573,603,NULL,NULL,NULL),(574,604,NULL,NULL,NULL),(599,605,NULL,NULL,NULL),(600,606,NULL,NULL,NULL),(610,611,NULL,NULL,NULL),(636,752,NULL,NULL,NULL),(637,753,NULL,NULL,NULL),(723,755,NULL,NULL,NULL),(724,756,NULL,NULL,NULL),(746,762,NULL,NULL,NULL),(747,763,NULL,NULL,NULL),(781,782,NULL,NULL,NULL),(828,840,NULL,NULL,NULL),(829,841,NULL,NULL,NULL),(830,842,NULL,NULL,NULL),(831,843,NULL,NULL,NULL),(832,844,NULL,NULL,NULL),(833,845,NULL,NULL,NULL),(880,881,NULL,NULL,NULL),(945,952,NULL,NULL,NULL),(946,953,NULL,NULL,NULL),(963,964,NULL,NULL,NULL),(1027,1028,NULL,NULL,NULL),(1076,1077,NULL,NULL,NULL),(1139,1140,NULL,NULL,NULL),(1166,1207,NULL,NULL,NULL),(1167,1208,NULL,NULL,NULL),(1203,1209,NULL,NULL,NULL),(1204,1210,NULL,NULL,NULL),(1205,1211,NULL,NULL,NULL),(1206,1212,NULL,NULL,NULL),(1221,1222,NULL,NULL,NULL),(1282,1314,NULL,NULL,NULL),(1283,1315,NULL,NULL,NULL),(1284,1343,NULL,NULL,NULL),(1285,1344,NULL,NULL,NULL),(1286,1345,NULL,NULL,NULL),(1287,1346,NULL,NULL,NULL),(1288,1316,NULL,NULL,NULL),(1289,1317,NULL,NULL,NULL),(1290,1347,NULL,NULL,NULL),(1291,1318,NULL,NULL,NULL),(1292,1319,NULL,NULL,NULL),(1293,1326,NULL,NULL,NULL),(1327,1332,NULL,NULL,NULL),(1328,1333,NULL,NULL,NULL),(1329,1334,NULL,NULL,NULL),(1330,1335,NULL,NULL,NULL),(1331,1336,NULL,NULL,NULL),(1337,1390,NULL,NULL,NULL),(1338,1391,NULL,NULL,NULL),(1339,1392,NULL,NULL,NULL),(1340,1393,NULL,NULL,NULL),(1341,1394,NULL,NULL,NULL),(1350,1371,NULL,NULL,NULL),(1351,1395,NULL,NULL,NULL),(1372,1396,NULL,NULL,NULL),(1376,1397,NULL,NULL,NULL),(1377,1398,NULL,NULL,NULL),(1378,1388,NULL,NULL,NULL),(1379,1389,NULL,NULL,NULL),(1380,1399,NULL,NULL,NULL),(1485,1505,NULL,NULL,NULL),(1504,1524,NULL,NULL,NULL),(1506,1525,NULL,NULL,NULL),(1510,1526,NULL,NULL,NULL),(1511,1527,NULL,NULL,NULL),(1512,1516,NULL,NULL,NULL),(1513,1517,NULL,NULL,NULL),(1514,1528,NULL,NULL,NULL),(11712,12222,NULL,NULL,NULL),(12221,12223,NULL,NULL,NULL),(12227,12229,NULL,NULL,NULL),(13246,13767,NULL,NULL,NULL),(13247,13768,NULL,NULL,NULL),(13248,13257,NULL,NULL,NULL),(13249,13769,NULL,NULL,NULL),(13250,116390,NULL,NULL,NULL),(13251,116391,NULL,NULL,NULL),(13253,13770,NULL,NULL,NULL),(13254,13771,NULL,NULL,NULL),(13255,13258,NULL,NULL,NULL),(13256,13772,NULL,NULL,NULL),(116389,116392,NULL,NULL,NULL),(119949,119950,NULL,NULL,NULL),(344487,800555,NULL,NULL,NULL),(344488,800556,NULL,NULL,NULL),(800165,800170,NULL,NULL,NULL),(800166,800389,NULL,NULL,NULL),(800167,800171,NULL,NULL,NULL),(800168,800172,NULL,NULL,NULL),(800169,800173,NULL,NULL,NULL),(800304,800305,NULL,NULL,NULL),(800386,800394,NULL,NULL,NULL),(800387,800390,NULL,NULL,NULL),(800388,800391,NULL,NULL,NULL),(800397,800403,NULL,NULL,NULL),(800398,800404,NULL,NULL,NULL),(800405,800406,NULL,NULL,NULL),(800407,800420,NULL,NULL,NULL),(800408,800416,NULL,NULL,NULL),(800409,800419,NULL,NULL,NULL),(800414,800417,NULL,NULL,NULL),(800415,800418,NULL,NULL,NULL),(800433,800504,NULL,NULL,NULL),(800505,800532,NULL,NULL,NULL),(800506,800515,NULL,NULL,NULL),(800507,800514,NULL,NULL,NULL),(800508,800509,NULL,NULL,NULL),(800516,800519,NULL,NULL,NULL),(800517,800533,NULL,NULL,NULL),(800518,800538,NULL,NULL,NULL),(800520,800529,NULL,NULL,NULL),(800521,800531,NULL,NULL,NULL),(800522,800536,NULL,NULL,NULL),(800523,800530,NULL,NULL,NULL),(800524,800535,NULL,NULL,NULL),(800534,800537,NULL,NULL,NULL),(801915,801924,NULL,NULL,NULL),(801916,801925,NULL,NULL,NULL),(801917,801919,NULL,NULL,NULL),(801918,801926,NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `eventtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventtagid`),
  KEY `event_tag_1` (`eventid`),
  CONSTRAINT `c_event_tag_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(2,2,'^lo$',4,',',1),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(4,2,'^Software Loopback Interface',4,',',1),(5,4,'^(MMCSS|gupdate|SysmonLog|clr_optimization_v2.0.50727_32|clr_optimization_v4.0.30319_32)$',4,',',1),(6,5,'^(automatic|automatic delayed)$',3,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `function` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`),
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10199,10019,10016,'diff','0'),(10204,10055,10041,'last','0'),(10207,10058,10044,'diff','0'),(10208,10057,10043,'diff','0'),(12144,22181,13000,'last','0'),(12549,22232,13025,'nodata','5m'),(12550,10020,10047,'nodata','5m'),(12553,10056,10042,'last','0'),(12580,17350,10012,'last','0'),(12583,10025,10021,'change','0'),(12592,22686,13266,'last','0'),(12598,22454,13272,'last','0'),(12641,22189,13015,'min','10m'),(12645,22183,13073,'min','10m'),(12646,22191,13074,'min','10m'),(12649,22185,13019,'min','10m'),(12651,22396,13017,'min','10m'),(12653,22219,13023,'min','10m'),(12671,22704,13287,'diff','0'),(12672,22726,13288,'diff','0'),(12673,22741,13289,'diff','0'),(12675,22757,13291,'last','0'),(12676,22756,13291,'last','0'),(12677,22766,13292,'last','0'),(12678,22764,13292,'last','0'),(12679,22773,13293,'last','0'),(12680,22771,13293,'last','0'),(12681,22785,13294,'diff','0'),(12682,22808,13295,'last','0'),(12683,22808,13296,'last','0'),(12684,22809,13297,'last','0'),(12685,22809,13298,'last','0'),(12686,22810,13299,'last','0'),(12687,22810,13300,'last','0'),(12688,22811,13301,'last','0'),(12689,22811,13302,'last','0'),(12690,22800,13303,'last','0'),(12691,22800,13304,'last','0'),(12692,22801,13305,'last','0'),(12693,22812,13306,'last','0'),(12694,22801,13307,'last','0'),(12695,22812,13308,'last','0'),(12696,22802,13309,'last','0'),(12697,22813,13310,'last','0'),(12698,22802,13311,'last','0'),(12699,22813,13312,'last','0'),(12700,22814,13313,'last','0'),(12701,22803,13314,'last','0'),(12702,22814,13315,'last','0'),(12703,22803,13316,'last','0'),(12704,22804,13317,'last','0'),(12705,22804,13318,'last','0'),(12706,22815,13319,'last','0'),(12707,22815,13320,'last','0'),(12708,22816,13321,'last','0'),(12709,22805,13322,'last','0'),(12710,22817,13323,'last','0'),(12711,22817,13324,'last','0'),(12712,22818,13325,'last','0'),(12713,22818,13326,'last','0'),(12715,22833,13328,'nodata','5m'),(12717,22835,13330,'last','0'),(12718,22836,13331,'last','0'),(12723,22853,13336,'diff','0'),(12724,22856,13337,'last','0'),(12725,22858,13338,'diff','0'),(12726,22859,13339,'change','0'),(12727,22861,13340,'diff','0'),(12728,22862,13341,'last','0'),(12729,22869,13342,'last','0'),(12730,22872,13343,'last','0'),(12731,22873,13344,'nodata','5m'),(12733,22875,13346,'last','0'),(12734,22876,13347,'last','0'),(12739,22893,13352,'diff','0'),(12740,22896,13353,'last','0'),(12741,22898,13354,'diff','0'),(12742,22899,13355,'change','0'),(12743,22901,13356,'diff','0'),(12744,22902,13357,'last','0'),(12745,22909,13358,'last','0'),(12746,22912,13359,'last','0'),(12747,22913,13360,'nodata','5m'),(12755,22933,13368,'diff','0'),(12757,22938,13370,'diff','0'),(12758,22939,13371,'change','0'),(12759,22941,13372,'diff','0'),(12760,22942,13373,'last','0'),(12761,22949,13374,'last','0'),(12762,22952,13375,'last','0'),(12763,22953,13376,'nodata','5m'),(12771,22973,13384,'diff','0'),(12773,22978,13386,'diff','0'),(12775,22981,13388,'diff','0'),(12776,22982,13389,'last','0'),(12777,22989,13390,'last','0'),(12778,22992,13391,'last','0'),(12779,22993,13392,'nodata','5m'),(12782,22996,13395,'last','0'),(12787,23013,13400,'diff','0'),(12788,23016,13401,'last','0'),(12789,23018,13402,'diff','0'),(12790,23019,13403,'change','0'),(12791,23021,13404,'diff','0'),(12792,23022,13405,'last','0'),(12793,23029,13406,'last','0'),(12794,23032,13407,'last','0'),(12795,23033,13408,'nodata','5m'),(12797,23035,13410,'last','0'),(12798,23036,13411,'last','0'),(12803,23053,13416,'diff','0'),(12805,23058,13418,'diff','0'),(12806,23059,13419,'change','0'),(12807,23061,13420,'diff','0'),(12808,23062,13421,'last','0'),(12809,23069,13422,'last','0'),(12810,23072,13423,'last','0'),(12812,23149,13425,'diff','0'),(12815,23150,13428,'change','0'),(12818,23668,13431,'min','10m'),(12820,23158,13433,'last','0'),(12824,23160,13437,'nodata','5m'),(12826,23165,13439,'last','0'),(12830,23226,13442,'last','0'),(12831,23227,13442,'last','0'),(12832,23235,13443,'last','0'),(12833,23236,13443,'last','0'),(12834,23243,13444,'last','0'),(12835,23244,13444,'last','0'),(12836,23193,13445,'last','0'),(12837,23192,13445,'last','0'),(12838,23196,13446,'last','0'),(12839,23195,13446,'last','0'),(12840,23199,13447,'last','0'),(12841,23198,13447,'last','0'),(12842,23202,13448,'last','0'),(12843,23201,13448,'last','0'),(12844,23205,13449,'last','0'),(12845,23204,13449,'last','0'),(12846,23208,13450,'last','0'),(12847,23207,13450,'last','0'),(12848,23211,13451,'last','0'),(12849,23210,13451,'last','0'),(12850,23214,13452,'last','0'),(12851,23213,13452,'last','0'),(12852,23183,13453,'last','0'),(12853,23177,13453,'last','0'),(12854,23179,13454,'last','0'),(12855,23181,13454,'last','0'),(12856,23186,13455,'last','0'),(12857,23187,13455,'last','0'),(12858,23222,13456,'str','off'),(12859,23231,13457,'str','off'),(12860,23191,13458,'last','0'),(12861,23192,13458,'last','0'),(12862,23194,13459,'last','0'),(12863,23195,13459,'last','0'),(12864,23197,13460,'last','0'),(12865,23198,13460,'last','0'),(12866,23200,13461,'last','0'),(12867,23201,13461,'last','0'),(12868,23203,13462,'last','0'),(12869,23204,13462,'last','0'),(12870,23206,13463,'last','0'),(12871,23207,13463,'last','0'),(12872,23209,13464,'last','0'),(12873,23210,13464,'last','0'),(12874,23188,13465,'nodata','5m'),(12926,22231,13026,'diff','0'),(12927,10059,10045,'diff','0'),(12929,22834,13329,'diff','0'),(12930,22874,13345,'diff','0'),(12931,22914,13361,'diff','0'),(12932,22954,13377,'diff','0'),(12933,22994,13393,'diff','0'),(12934,23034,13409,'diff','0'),(12935,23161,13438,'diff','0'),(12936,23318,13507,'diff','0'),(12937,23319,13508,'diff','0'),(12939,23320,13510,'diff','0'),(12940,23321,13511,'diff','0'),(12941,23322,13512,'diff','0'),(12942,23323,13513,'diff','0'),(12943,23324,13514,'diff','0'),(12944,23325,13515,'diff','0'),(12945,23326,13516,'diff','0'),(12946,23357,13517,'min','10m'),(12947,23342,13518,'min','10m'),(12948,23341,13519,'min','10m'),(12949,23359,13520,'min','10m'),(12965,23634,13536,'min','10m'),(12967,23212,13466,'str','Client'),(12968,23637,13538,'last','0'),(12969,23638,13539,'last','0'),(12970,23640,13539,'last','0'),(12971,23642,13540,'last','0'),(12972,23643,13540,'last','0'),(12973,23639,13541,'last','0'),(12974,23640,13541,'last','0'),(12975,23641,13542,'last','0'),(12976,23643,13542,'last','0'),(12977,23636,13543,'str','Server'),(12994,23644,13544,'max','#3'),(12995,23645,13545,'max','#3'),(12996,23646,13546,'max','#3'),(12997,23647,13547,'max','#3'),(12998,23648,13548,'max','#3'),(13068,23115,13367,'avg','5m'),(13069,22922,13366,'avg','5m'),(13070,22918,13365,'avg','5m'),(13071,22917,13364,'avg','5m'),(13072,22882,13350,'avg','5m'),(13073,22878,13349,'avg','5m'),(13074,22877,13348,'avg','5m'),(13075,22962,13382,'avg','5m'),(13078,10010,10010,'avg','5m'),(13080,17362,13243,'avg','5m'),(13082,10009,10190,'avg','5m'),(13084,10013,10011,'avg','5m'),(13086,23042,13414,'avg','5m'),(13087,22842,13334,'avg','5m'),(13088,22838,13333,'avg','5m'),(13089,22837,13332,'avg','5m'),(13090,23007,13399,'avg','5m'),(13091,23002,13398,'avg','5m'),(13092,22998,13397,'avg','5m'),(13093,22997,13396,'avg','5m'),(13094,23143,13435,'avg','5m'),(13095,23140,13430,'avg','5m'),(13096,23655,13554,'max','#3'),(13097,23656,13555,'avg','5m'),(13098,23657,13556,'min','5m'),(13152,23651,13551,'max','#3'),(13154,23649,13549,'max','#3'),(13155,22819,13327,'last','0'),(13156,23650,13550,'max','#3'),(13157,23652,13552,'max','#3'),(13158,23653,13553,'max','#3'),(13159,23654,13285,'max','#3'),(13160,23661,13557,'last',''),(13164,22424,13080,'avg','10m'),(13168,22410,13082,'avg','10m'),(13170,22412,13081,'avg','10m'),(13172,22430,13083,'avg','10m'),(13174,22422,13084,'avg','10m'),(13176,22406,13085,'avg','10m'),(13178,22408,13086,'avg','30m'),(13180,22402,13087,'avg','10m'),(13182,22418,13088,'avg','10m'),(13184,22416,13089,'avg','10m'),(13186,22689,13275,'avg','10m'),(13188,22399,13091,'avg','10m'),(13190,22420,13092,'avg','10m'),(13192,22414,13093,'min','10m'),(13194,23171,13441,'avg','10m'),(13196,23663,13559,'avg','10m'),(13198,22426,13094,'avg','10m'),(13200,22404,13095,'avg','10m'),(13202,22400,13096,'avg','10m'),(13204,22401,13097,'avg','10m'),(13206,23347,13521,'avg','10m'),(13207,23360,13534,'avg','10m'),(13208,23352,13522,'avg','10m'),(13209,23351,13535,'avg','10m'),(13210,23350,13523,'avg','10m'),(13211,23353,13524,'avg','30m'),(13212,23354,13525,'avg','10m'),(13213,23356,13526,'avg','10m'),(13214,23355,13527,'avg','10m'),(13215,23349,13528,'avg','10m'),(13216,23348,13529,'avg','10m'),(13217,23343,13530,'avg','10m'),(13218,23344,13531,'avg','10m'),(13219,23345,13532,'avg','10m'),(13220,23346,13533,'avg','10m'),(13221,23666,13561,'min','#3'),(13245,25426,13585,'diff','0'),(13246,25427,13586,'nodata','5m'),(13247,25428,13587,'diff','0'),(13248,25436,13588,'avg','5m'),(13249,25431,13589,'avg','5m'),(13250,25450,13590,'last','0'),(13251,25455,13591,'diff','0'),(13252,25453,13592,'change','0'),(13253,25430,13593,'last','0'),(13254,25429,13594,'last','0'),(13255,25447,13595,'diff','0'),(13256,25452,13596,'diff','0'),(13257,25432,13597,'avg','5m'),(13258,25456,13598,'last','0'),(13259,25441,13599,'avg','5m'),(13260,25463,13600,'last','0'),(13261,25466,13601,'last','0'),(13447,25931,13787,'max','3m'),(13448,25932,13788,'min','10m'),(13449,25933,13789,'avg','2m'),(13450,25938,13790,'last',''),(13451,25936,13791,'nodata','3m'),(13452,25940,13792,'nodata','129600'),(13453,25940,13793,'regexp','^OK$'),(13454,25942,13794,'change',''),(13455,25942,13795,'change',''),(13456,25942,13796,'last',''),(13457,25941,13797,'fuzzytime','172800'),(13458,25941,13797,'fuzzytime','259200'),(13459,25941,13797,'fuzzytime','345600'),(13460,25941,13797,'fuzzytime','432800'),(13461,25941,13798,'fuzzytime','172800'),(13462,25941,13798,'fuzzytime','259200'),(13463,25941,13798,'fuzzytime','345600'),(13464,25941,13798,'fuzzytime','432800'),(13465,25941,13799,'fuzzytime','172800'),(13466,25941,13799,'fuzzytime','259200'),(13467,25941,13799,'fuzzytime','345600'),(13468,25941,13799,'fuzzytime','432800'),(13469,25941,13800,'fuzzytime','172800'),(13470,25941,13800,'fuzzytime','259200'),(13471,25941,13800,'fuzzytime','345600'),(13472,25941,13800,'fuzzytime','432800'),(13473,25943,13801,'last','0'),(13475,25971,13803,'last','0'),(13476,25971,13804,'last','0'),(13477,25972,13805,'last','0'),(13478,25972,13806,'last','0'),(13479,25973,13807,'last','0'),(13480,26007,13808,'str','NONE'),(13481,26008,13808,'str','NONE'),(13482,26009,13808,'str','NONE'),(13483,26010,13808,'str','NONE'),(13484,26008,13809,'str','NONE'),(13485,26009,13809,'str','NONE'),(13486,26010,13809,'str','NONE'),(13487,26009,13810,'str','NONE'),(13488,26010,13810,'str','NONE'),(13489,26010,13811,'str','NONE'),(13490,26000,13812,'str','NONE'),(13491,25987,13813,'sum','#3'),(13492,26014,13814,'last',''),(13493,26021,13815,'last',''),(13494,26015,13816,'last',''),(13495,26022,13817,'last',''),(13496,26017,13818,'last',''),(13497,26024,13819,'last',''),(13498,26019,13820,'last',''),(13499,26026,13821,'last',''),(13500,26027,13822,'last','0'),(13501,26028,13823,'last','0'),(13502,26041,13824,'last','0'),(13503,26067,13825,'str','ok'),(13504,26050,13826,'last','0'),(13505,26050,13827,'last','0'),(13506,26060,13828,'last','0'),(13507,26060,13829,'last','0'),(13508,26068,13830,'last','0'),(13509,26068,13831,'last','0'),(13510,26066,13832,'last','0'),(13511,26066,13832,'nodata','5m'),(13512,26055,13833,'regexp','\\[\\]|^\\s*$'),(13513,26054,13834,'diff','0'),(13514,26074,13835,'nodata','10m'),(13515,26072,13836,'max','120'),(13516,26074,13836,'max','120'),(13517,26074,13837,'last','0'),(13518,26074,13838,'last','0'),(13519,26079,13839,'str','running,1'),(13520,26096,13840,'last',''),(13521,26119,13841,'last',''),(13522,26104,13842,'last',''),(13523,26122,13843,'last',''),(13524,26097,13844,'last',''),(13525,26129,13845,'last',''),(13526,26126,13846,'last',''),(13527,26118,13847,'last',''),(13528,26110,13848,'last',''),(13529,26090,13849,'last',''),(13530,26100,13850,'last',''),(13531,26125,13851,'last',''),(13532,26099,13852,'last',''),(13533,26133,13853,'last',''),(13534,26134,13854,'last',''),(13535,26135,13855,'last',''),(13536,26136,13856,'last',''),(13537,26164,13857,'last','0,10'),(13538,26179,13858,'last','0'),(13539,26179,13859,'last','0'),(13540,26179,13860,'last','0'),(13541,26182,13861,'last','0'),(13542,26201,13862,'diff','0'),(13543,26235,13863,'last',''),(13544,26247,13864,'last','0'),(13545,26250,13865,'sum','#3'),(13546,26254,13866,'last',''),(13547,26280,13867,'last','0'),(13548,26261,13868,'last','0'),(13549,26282,13869,'diff',''),(13550,26317,13870,'max','#6'),(13552,26330,13872,'diff','0'),(13553,26331,13873,'nodata','5m'),(13554,26332,13874,'diff','0'),(13555,26350,13875,'diff','0'),(13556,26351,13876,'diff','0'),(13557,26333,13877,'last','0'),(13558,26357,13878,'last','0'),(13559,26336,13879,'avg','5m'),(13560,26347,13880,'diff','0'),(13561,26342,13881,'diff','0'),(13562,26352,13882,'last','0'),(13563,26344,13883,'last','0'),(13564,26380,13884,'last','0'),(13565,26379,13885,'avg','5m'),(13566,26360,13886,'avg','5m'),(13567,26359,13887,'avg','5m'),(13568,26348,13888,'change','0'),(13569,26364,13889,'min','#3'),(13570,26362,13890,'min','#3'),(13571,26374,13891,'min','#3'),(13572,26407,13892,'last','0'),(13573,26405,13893,'last','0'),(13574,26415,13894,'last',''),(13575,26440,13895,'last',''),(13576,26435,13896,'last',''),(13577,26411,13897,'last',''),(13578,26455,13898,'last','');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (387,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(392,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(404,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(406,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(410,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(420,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(433,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(436,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(439,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(442,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(445,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(446,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(447,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(449,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(450,'Fan speed and ambient temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(451,'Fan speed and temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(452,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(453,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(454,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(455,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(456,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(457,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(458,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(459,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(461,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(462,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(463,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(464,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(465,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(467,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(469,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(471,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(472,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(473,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(474,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(475,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(478,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(479,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(480,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(481,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(482,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(483,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(484,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(485,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(487,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(491,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(492,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(493,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(494,'Network traffic on en0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(495,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(496,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(497,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(498,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(499,'Class Loader',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(500,'File Descriptors',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(501,'Garbage Collector collections per second',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(502,'http-8080 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(503,'http-8443 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(504,'jk-8009 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(505,'Memory Pool CMS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(506,'Memory Pool CMS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(507,'Memory Pool Code Cache',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(508,'Memory Pool Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(509,'Memory Pool PS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(510,'Memory Pool PS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(511,'Memory Pool Tenured Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(512,'sessions /',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(513,'Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(514,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(515,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,514,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(516,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,514,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(527,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(529,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(530,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(531,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(532,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(533,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,10026,0),(540,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22943,0),(541,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22903,0),(542,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22983,0),(543,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23063,0),(544,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22863,0),(545,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23023,0),(546,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23159,0),(559,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(560,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(561,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(562,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(563,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,25457,0),(564,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(565,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(664,'Backup Size',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(665,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(666,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(669,'SSL Certificate valid days',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(670,'SSL Certificate valid days',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(671,'Redis changes since last save',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(672,'Redis clients',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(673,'Redis memory usage',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(674,'Redis operations',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(675,'Redis storage: Hits/Misses',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(676,'Message count on {#VHOSTNAME}/{#QUEUENAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(677,'Message rates on {#VHOSTNAME}/{#QUEUENAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(678,'Rabbit Server Overall Message Count',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(679,'Rabbit Server Overall Message Rates',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(680,'PostgreSQL: database {#DBNAME} size',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(681,'PostgreSQL streaming replication lag with {#HOTSTANDBY}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(682,'PostgreSQL table {#TABLENAME} maintenance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(683,'PostgreSQL table {#TABLENAME} read stats',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(684,'PostgreSQL table {#TABLENAME} rows',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(685,'PostgreSQL table {#TABLENAME} scans',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(686,'PostgreSQL table {#TABLENAME} size',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(687,'PostgreSQL bgwriter',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(688,'PostgreSQL buffers',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(689,'PostgreSQL checkpoints',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(690,'PostgreSQL connections',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,100.0000,1,0,NULL,NULL,0),(691,'PostgreSQL service response',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(692,'PostgreSQL summary db stats: block hit/read',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(693,'PostgreSQL summary db stats: events',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(694,'PostgreSQL summary db stats: temp files',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(695,'PostgreSQL summary db stats: tuples',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(696,'PostgreSQL transactions',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(697,'PostgreSQL uptime',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(698,'PostgreSQL write-ahead log',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(699,'Postfix Queues',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(700,'Postfix Stat Bytes',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(701,'Postfix Stat Count Mails',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(702,'[OPcache] Hits & Misses',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(703,'[OPcache] ISU memory usage',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(704,'[OPcache] Memory usage',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(705,'[OPcache] Number of items',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(706,'[OPcache] Restarts',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(707,'php-fpm processes',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(708,'php-fpm slow requests',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(709,'php listen queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(710,'php-fpm processes',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(711,'php-fpm slow requests',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(712,'php listen queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(713,'Fail2Ban banned IP',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(714,'Active connections',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(715,'Nginx Connections\\min',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(716,'Nginx Proc_Num',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(717,'memcached: Connections per second',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(718,'memcached: Current items',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(719,'memcached: Current open connections',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(720,'memcached: Evictions',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(721,'memcached: Items per second',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(722,'memcached: Network traffic',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(723,'memcached: Requests per second',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(724,'memcached: Resource usage',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(725,'memcached: Retrieval hit and miss per second',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(726,'memcached: Storage usage',900,200,0.0000,0.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(730,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(731,'Disk space usage {#FSNAME}',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(732,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(733,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(734,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(735,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,26353,0),(736,'Swap usage',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(737,'Redis {#REDISPORT} Port instantaneous_ops_per_sec',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(738,'Redis {#REDISPORT} Port Used memory',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(739,'Redis {#REDISPORT} used_memory/used_memory_rss',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(740,'Redis {#REDISPORT} Used_memory_percent',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (1242,387,22665,1,0,'FF5555',0,2,0),(1243,387,22668,1,1,'55FF55',0,2,0),(1244,387,22671,1,2,'009999',0,2,0),(1245,387,17358,1,3,'990099',0,2,0),(1246,387,17362,1,4,'999900',0,2,0),(1247,387,17360,1,5,'990000',0,2,0),(1248,387,17356,1,6,'000099',0,2,0),(1249,387,17354,1,7,'009900',0,2,0),(1290,439,22680,0,0,'009900',0,2,0),(1291,439,22683,0,1,'000099',0,2,0),(1296,433,10010,0,0,'009900',0,2,0),(1297,433,22674,0,1,'000099',0,2,0),(1298,433,22677,0,2,'990000',0,2,0),(1323,436,10030,0,0,'AA0000',0,2,2),(1324,436,10014,0,1,'00AA00',0,2,0),(1353,420,22446,5,0,'00AA00',0,2,0),(1354,420,22448,5,1,'3333FF',0,2,0),(1411,406,22426,0,0,'00EE00',0,2,0),(1413,406,22422,0,1,'0000EE',0,2,0),(1414,406,22408,0,2,'FFAA00',0,2,0),(1415,406,22424,0,3,'00EEEE',0,2,0),(1416,406,22412,0,4,'990099',0,2,0),(1417,406,22410,0,5,'666600',0,2,0),(1418,406,22406,0,6,'EE0000',0,2,0),(1419,406,22414,0,7,'FF66FF',0,2,0),(1429,410,22185,0,0,'009900',0,2,0),(1430,410,22189,0,1,'DD0000',0,2,0),(1431,410,22396,0,2,'00DDDD',0,2,0),(1432,410,22183,0,3,'3333FF',0,2,0),(1441,392,22187,5,0,'00C800',0,2,0),(1442,392,23251,5,1,'C80000',1,2,0),(1451,445,22701,5,0,'00AA00',0,2,0),(1452,445,22702,5,1,'3333FF',0,2,0),(1453,446,22725,5,0,'00AA00',0,2,0),(1454,446,22728,5,1,'3333FF',0,2,0),(1455,447,22740,5,0,'00AA00',0,2,0),(1456,447,22743,5,1,'3333FF',0,2,0),(1457,449,22784,5,0,'00AA00',0,2,0),(1458,449,22787,5,1,'3333FF',0,2,0),(1459,442,22456,0,0,'C80000',0,2,2),(1460,442,22452,0,1,'00C800',0,2,0),(1461,450,22804,5,0,'EE0000',0,2,0),(1462,450,22807,0,1,'000000',1,2,0),(1463,451,22808,2,1,'EE00EE',0,2,0),(1464,451,22815,2,0,'EE0000',0,2,0),(1465,451,22818,4,3,'000000',1,2,0),(1466,451,22817,0,2,'000000',1,2,0),(1467,452,22803,0,4,'3333FF',0,2,0),(1468,452,22800,0,1,'009900',0,2,0),(1469,452,22801,0,2,'00CCCC',0,2,0),(1470,452,22802,0,3,'000000',0,2,0),(1471,452,22805,2,0,'880000',0,2,0),(1472,452,22806,0,5,'777700',0,2,0),(1473,453,22809,0,1,'009900',0,2,0),(1474,453,22816,2,0,'880000',0,2,0),(1475,453,22813,0,3,'000000',0,2,0),(1476,453,22814,0,4,'3333FF',0,2,0),(1477,453,22812,0,2,'00CCCC',0,2,0),(1478,454,22827,0,0,'C8C800',0,2,0),(1479,454,22826,0,1,'006400',0,2,0),(1480,454,22828,0,2,'C80000',0,2,0),(1481,454,22822,0,3,'0000EE',0,2,0),(1482,454,22825,0,4,'640000',0,2,0),(1483,454,22823,0,5,'00C800',0,2,0),(1484,454,22824,0,6,'C800C8',0,2,0),(1487,455,22830,5,0,'00AA00',0,2,0),(1488,455,22829,5,1,'3333FF',0,2,0),(1491,456,22846,1,0,'009999',0,2,0),(1492,456,22848,1,1,'990099',0,2,0),(1494,456,22851,1,2,'990000',0,2,0),(1495,456,22852,1,3,'000099',0,2,0),(1496,456,22845,1,4,'009900',0,2,0),(1497,457,22842,0,0,'009900',0,2,0),(1498,457,22843,0,1,'000099',0,2,0),(1499,457,22841,0,2,'990000',0,2,0),(1500,458,22857,0,0,'AA0000',0,2,2),(1501,458,22855,0,1,'00AA00',0,2,0),(1502,459,22844,0,0,'009900',0,2,0),(1503,459,22840,0,1,'000099',0,2,0),(1506,461,22870,0,0,'C80000',0,2,2),(1507,461,22868,0,1,'00C800',0,2,0),(1510,462,22886,1,0,'009999',0,2,0),(1511,462,22888,1,1,'990099',0,2,0),(1513,462,22891,1,2,'990000',0,2,0),(1514,462,22892,1,3,'000099',0,2,0),(1515,462,22885,1,4,'009900',0,2,0),(1516,463,22882,0,0,'009900',0,2,0),(1517,463,22883,0,1,'000099',0,2,0),(1518,463,22881,0,2,'990000',0,2,0),(1519,464,22897,0,0,'AA0000',0,2,2),(1520,464,22895,0,1,'00AA00',0,2,0),(1521,465,22884,0,0,'009900',0,2,0),(1522,465,22880,0,1,'000099',0,2,0),(1525,467,22910,0,0,'C80000',0,2,2),(1526,467,22908,0,1,'00C800',0,2,0),(1535,469,22922,0,0,'009900',0,2,0),(1536,469,22923,0,1,'000099',0,2,0),(1537,469,22921,0,2,'990000',0,2,0),(1540,471,22924,0,0,'009900',0,2,0),(1541,471,22920,0,1,'000099',0,2,0),(1542,472,22945,5,0,'00AA00',0,2,0),(1543,472,22946,5,1,'3333FF',0,2,0),(1544,473,22950,0,0,'C80000',0,2,2),(1545,473,22948,0,1,'00C800',0,2,0),(1549,474,22968,1,0,'990099',0,2,0),(1551,474,22971,1,1,'990000',0,2,0),(1552,474,22972,1,2,'000099',0,2,0),(1553,474,22965,1,3,'009900',0,2,0),(1554,475,22962,0,0,'009900',0,2,0),(1555,475,22963,0,1,'000099',0,2,0),(1556,475,22961,0,2,'990000',0,2,0),(1561,478,22985,5,0,'00AA00',0,2,0),(1562,478,22986,5,1,'3333FF',0,2,0),(1563,479,22990,0,0,'C80000',0,2,2),(1564,479,22988,0,1,'00C800',0,2,0),(1569,480,23007,1,0,'999900',0,2,0),(1570,480,23011,1,1,'990000',0,2,0),(1571,480,23012,1,2,'000099',0,2,0),(1572,480,23005,1,3,'009900',0,2,0),(1573,481,23002,0,0,'009900',0,2,0),(1574,481,23003,0,1,'000099',0,2,0),(1575,481,23001,0,2,'990000',0,2,0),(1576,482,23017,0,0,'AA0000',0,2,2),(1577,482,23015,0,1,'00AA00',0,2,0),(1578,483,23004,0,0,'009900',0,2,0),(1579,483,23000,0,1,'000099',0,2,0),(1580,484,23025,5,0,'00AA00',0,2,0),(1581,484,23026,5,1,'3333FF',0,2,0),(1582,485,23030,0,0,'C80000',0,2,2),(1583,485,23028,0,1,'00C800',0,2,0),(1592,487,23042,0,0,'009900',0,2,0),(1593,487,23043,0,1,'000099',0,2,0),(1594,487,23041,0,2,'990000',0,2,0),(1601,491,23070,0,0,'C80000',0,2,2),(1602,491,23068,0,1,'00C800',0,2,0),(1603,492,23073,5,0,'00AA00',0,2,0),(1604,492,23074,5,1,'3333FF',0,2,0),(1607,493,23075,5,0,'00AA00',0,2,0),(1608,493,23076,5,1,'3333FF',0,2,0),(1610,404,22401,0,10,'00FF00',0,2,0),(1611,494,23077,5,0,'00AA00',0,2,0),(1612,494,23078,5,1,'3333FF',0,2,0),(1613,495,23143,0,0,'009900',0,2,0),(1614,495,23145,0,1,'000099',0,2,0),(1615,495,23144,0,2,'990000',0,2,0),(1616,496,23167,0,0,'C80000',0,2,2),(1617,496,23164,0,1,'00C800',0,2,0),(1618,497,23169,5,0,'00AA00',0,2,0),(1619,497,23170,5,1,'3333FF',0,2,0),(1620,498,23109,0,0,'009999',0,2,0),(1621,498,23112,0,1,'990099',0,2,0),(1622,498,23115,0,2,'999900',0,2,0),(1623,498,23113,0,3,'990000',0,2,0),(1624,498,23114,0,4,'000099',0,2,0),(1625,498,23110,0,5,'009900',0,2,0),(1626,404,22404,0,0,'990099',0,2,0),(1627,404,22399,0,1,'990000',0,2,0),(1628,404,22416,0,2,'0000EE',0,2,0),(1629,404,22430,0,3,'FF33FF',0,2,0),(1630,404,22418,0,4,'009600',0,2,0),(1631,404,22402,0,5,'003300',0,2,0),(1632,404,22420,0,6,'CCCC00',0,2,0),(1633,404,22400,0,7,'33FFFF',0,2,0),(1634,404,22689,0,8,'DD0000',0,2,0),(1635,404,23171,0,9,'000099',0,2,0),(1636,499,23174,0,0,'C80000',0,2,0),(1637,499,23175,0,1,'00C800',0,2,0),(1638,499,23173,0,2,'0000C8',0,2,0),(1639,500,23213,0,0,'C80000',0,2,0),(1640,500,23214,0,1,'00C800',0,2,0),(1641,501,23186,0,0,'C80000',0,2,0),(1642,501,23177,0,1,'00C800',0,2,0),(1643,501,23179,0,2,'0000C8',0,2,0),(1644,501,23181,0,3,'C8C800',0,2,0),(1645,501,23187,0,4,'00C8C9',0,2,0),(1646,501,23183,0,5,'C800C8',0,2,0),(1647,502,23227,0,0,'C80000',0,2,0),(1648,502,23226,0,1,'00C800',0,2,0),(1649,502,23225,0,2,'0000C8',0,2,0),(1650,503,23236,0,0,'C80000',0,2,0),(1651,503,23235,0,1,'00C800',0,2,0),(1652,503,23234,0,2,'0000C8',0,2,0),(1653,504,23244,0,0,'C80000',0,2,0),(1654,504,23243,0,1,'00C800',0,2,0),(1655,504,23242,0,2,'0000C8',0,2,0),(1656,505,23191,0,0,'C80000',0,2,0),(1657,505,23192,0,1,'00C800',0,2,0),(1658,505,23193,0,2,'0000C8',0,2,0),(1659,506,23194,0,0,'C80000',0,2,0),(1660,506,23195,0,1,'00C800',0,2,0),(1661,506,23196,0,2,'0000C8',0,2,0),(1662,507,23197,0,0,'C80000',0,2,0),(1663,507,23198,0,1,'00C800',0,2,0),(1664,507,23199,0,2,'0000C8',0,2,0),(1665,508,23200,0,0,'C80000',0,2,0),(1666,508,23201,0,1,'00C800',0,2,0),(1667,508,23202,0,2,'0000C8',0,2,0),(1668,509,23203,0,0,'C80000',0,2,0),(1669,509,23204,0,1,'00C800',0,2,0),(1670,509,23205,0,2,'0000C8',0,2,0),(1671,510,23206,0,0,'0000C8',0,2,0),(1672,510,23207,0,1,'C80000',0,2,0),(1673,510,23208,0,2,'00C800',0,2,0),(1674,511,23209,0,0,'C80000',0,2,0),(1675,511,23210,0,1,'00C800',0,2,0),(1676,511,23211,0,2,'0000C8',0,2,0),(1677,512,23248,0,0,'C80000',0,2,0),(1678,512,23246,0,1,'00C800',0,2,0),(1679,512,23249,0,2,'0000C8',0,2,0),(1680,513,23216,0,0,'C80000',0,2,0),(1681,513,23215,0,1,'00C800',0,2,0),(1682,513,23217,0,2,'0000C8',0,2,0),(1683,514,22758,0,0,'00C800',0,2,2),(1684,514,22759,0,1,'C80000',0,2,0),(1685,515,22763,0,0,'00C800',0,2,2),(1686,515,22765,0,1,'C80000',0,2,0),(1687,516,22770,0,0,'00C800',0,2,2),(1688,516,22772,0,1,'C80000',0,2,0),(1733,410,22191,0,4,'999900',0,2,0),(1735,527,22199,0,0,'C80000',0,2,0),(1736,527,22196,0,1,'00C800',0,2,0),(1739,529,23357,0,0,'DD0000',0,2,0),(1740,529,23341,0,1,'00DDDD',0,2,0),(1741,529,23342,0,2,'3333FF',0,2,0),(1742,530,23345,0,0,'990099',0,2,0),(1743,530,23348,0,1,'990000',0,2,0),(1744,530,23355,0,2,'0000EE',0,2,0),(1745,530,23352,0,3,'FF33FF',0,2,0),(1746,530,23356,0,4,'00EE00',0,2,0),(1747,530,23354,0,5,'003300',0,2,0),(1748,530,23346,0,6,'33FFFF',0,2,0),(1749,530,23349,0,7,'DD0000',0,2,0),(1750,530,23344,0,8,'000099',0,7,0),(1751,531,23353,0,0,'FFAA00',0,2,0),(1752,531,23347,0,1,'990099',0,2,0),(1753,531,23350,0,2,'EE0000',0,2,0),(1754,531,23343,0,3,'FF66FF',0,2,0),(1755,532,23340,5,0,'00C800',0,2,0),(1756,532,23358,5,1,'C80000',1,2,0),(1757,531,23351,0,4,'960000',0,2,0),(1758,531,23360,0,5,'009600',0,2,0),(1759,410,23634,0,5,'00FF00',0,2,0),(1766,533,22181,5,0,'00C800',0,2,0),(1806,540,22942,5,0,'00C800',0,2,0),(1808,541,22902,5,0,'00C800',0,2,0),(1810,542,22982,5,0,'00C800',0,2,0),(1812,543,23062,5,0,'00C800',0,2,0),(1814,544,22862,5,0,'00C800',0,2,0),(1816,545,23022,5,0,'00C800',0,2,0),(1818,546,23158,5,0,'00C800',0,2,0),(1819,406,23663,0,8,'009900',0,2,0),(1851,559,25438,0,0,'009900',0,2,0),(1852,559,25434,0,1,'000099',0,2,0),(1853,560,25436,0,0,'009900',0,2,0),(1854,560,25437,0,1,'000099',0,2,0),(1855,560,25435,0,2,'990000',0,2,0),(1856,561,25444,1,0,'FF5555',0,2,0),(1857,561,25443,1,1,'55FF55',0,2,0),(1858,561,25440,1,2,'009999',0,2,0),(1859,561,25442,1,3,'990099',0,2,0),(1860,561,25441,1,4,'999900',0,2,0),(1861,561,25445,1,5,'990000',0,2,0),(1862,561,25446,1,6,'000099',0,2,0),(1863,561,25439,1,7,'009900',0,2,0),(1864,562,25451,0,0,'AA0000',0,2,2),(1865,562,25449,0,1,'00AA00',0,2,0),(1866,563,25456,5,0,'00C800',0,2,0),(1867,564,25459,5,0,'00AA00',0,2,0),(1868,564,25460,5,1,'3333FF',0,2,0),(1869,565,25464,0,0,'C80000',0,2,2),(1870,565,25462,0,1,'00C800',0,2,0),(2149,664,25942,0,0,'1A7C11',0,2,0),(2168,669,25971,0,0,'BB00BB',0,2,0),(2169,670,25972,0,0,'BB00BB',0,2,0),(2170,671,26040,0,0,'0000CC',0,2,0),(2171,672,26047,0,0,'00CC00',0,2,0),(2172,672,26048,0,1,'CC0000',0,2,0),(2173,673,26030,0,0,'00CC00',0,2,0),(2174,673,26049,0,1,'0000CC',0,2,0),(2175,674,26037,0,0,'0000CC',0,2,0),(2176,674,26029,0,1,'00CC00',0,2,0),(2177,675,26043,0,0,'00CC00',0,2,0),(2178,675,26042,0,1,'CC0000',0,2,0),(2179,676,26074,2,0,'00C800',0,2,0),(2180,676,26075,2,1,'C80000',0,2,0),(2181,677,26077,0,0,'C80000',0,2,0),(2182,677,26078,0,1,'00C800',0,2,0),(2183,677,26076,0,3,'0000C8',0,2,0),(2184,678,26059,0,0,'00C800',0,2,0),(2185,678,26058,0,1,'C80000',0,2,0),(2186,679,26057,0,0,'C80000',0,2,0),(2187,679,26056,0,1,'00C800',0,2,0),(2259,680,26133,0,0,'00BB00',1,2,0),(2260,681,26135,5,0,'0000CC',1,2,0),(2261,681,26136,0,1,'00CC00',0,2,0),(2262,682,26160,0,0,'00CC00',1,2,0),(2263,682,26159,0,1,'0000CC',1,2,0),(2264,682,26158,0,2,'CC0000',1,2,0),(2265,682,26139,0,3,'CCCC00',1,2,0),(2266,683,26157,0,0,'00CC00',1,2,0),(2267,683,26156,0,1,'000000',1,2,0),(2268,683,26141,0,2,'99FFFF',1,2,0),(2269,683,26143,0,3,'FFFF99',1,2,0),(2270,683,26140,0,4,'00CCCC',1,2,0),(2271,683,26142,0,5,'CCCC00',1,2,0),(2272,683,26155,0,6,'0000CC',1,2,0),(2273,683,26154,0,7,'CC0000',1,2,0),(2274,684,26149,5,0,'00CC00',1,2,0),(2275,684,26151,5,1,'666666',1,2,0),(2276,684,26138,0,2,'0000CC',1,2,0),(2277,684,26148,0,3,'CC0000',1,2,0),(2278,684,26147,0,4,'00CCCC',1,2,0),(2279,684,26146,0,5,'CCCC00',1,2,0),(2280,685,26153,0,0,'00CC00',0,2,0),(2281,685,26145,0,1,'000000',0,2,0),(2282,685,26152,0,2,'0000CC',1,2,0),(2283,685,26144,0,3,'CC0000',1,2,0),(2284,686,26150,5,0,'0000CC',1,2,0),(2285,686,26137,0,1,'CC0000',1,2,0),(2286,686,26161,0,2,'00CC00',0,2,0),(2287,687,26080,0,0,'00CC00',1,2,0),(2288,687,26109,0,1,'0000CC',1,2,0),(2289,687,26105,0,2,'CC0000',1,2,0),(2290,687,26108,0,3,'CCCC00',1,2,0),(2291,687,26114,0,4,'777777',0,2,0),(2292,687,26107,0,5,'CC00CC',0,2,0),(2293,688,26106,5,0,'EEEEEE',1,2,0),(2294,688,26117,1,1,'0000EE',1,2,0),(2295,688,26115,1,2,'00EE00',1,2,0),(2296,688,26116,1,3,'EE0000',1,2,0),(2297,689,26111,0,0,'00CC00',0,2,0),(2298,689,26110,0,1,'CC0000',0,2,0),(2299,689,26112,0,2,'000000',1,2,0),(2300,689,26113,0,3,'0000CC',1,2,0),(2301,690,26124,5,0,'EEEEEE',1,2,0),(2302,690,26120,0,1,'00BB00',1,2,0),(2303,690,26121,0,2,'0000BB',1,2,0),(2304,690,26122,0,3,'CC00CC',1,2,0),(2305,690,26125,0,4,'000000',0,2,0),(2306,690,26126,0,5,'BB0000',1,2,0),(2307,691,26090,5,0,'00CC00',1,2,0),(2308,691,26089,0,1,'CC0000',1,2,0),(2309,692,26127,0,0,'00CC00',1,2,0),(2310,692,26128,0,1,'CC0000',1,2,0),(2311,693,26087,5,0,'00CC00',1,2,0),(2312,693,26118,0,1,'0000CC',1,2,0),(2313,693,26104,0,2,'000000',1,2,0),(2314,693,26088,0,3,'CC0000',1,2,0),(2315,694,26092,5,0,'CC0000',0,2,0),(2316,694,26103,0,1,'0000CC',1,2,0),(2317,695,26082,0,0,'000000',1,2,0),(2318,695,26084,0,1,'00CC00',1,2,0),(2319,695,26086,0,2,'CC0000',1,2,0),(2320,695,26083,0,3,'0000CC',1,2,0),(2321,695,26085,0,4,'CC00CC',1,2,0),(2322,696,26096,0,0,'00CC00',1,2,0),(2323,696,26097,0,1,'000000',1,2,0),(2324,696,26098,0,2,'00CCCC',1,2,0),(2325,696,26099,0,3,'CC0000',1,2,0),(2326,697,26119,0,0,'00CC00',0,2,0),(2327,697,26100,0,1,'0000CC',1,2,0),(2328,698,26101,0,0,'0000CC',1,2,0),(2329,698,26102,0,1,'00CC00',0,2,0),(2330,699,26179,2,0,'00C8C8',0,2,0),(2331,699,26162,0,1,'C80000',0,2,0),(2332,699,26173,0,2,'00C800',0,2,0),(2333,699,26181,0,3,'0000C8',0,2,0),(2334,699,26180,0,4,'C800C8',0,2,0),(2335,700,26177,0,0,'C80000',0,2,0),(2336,700,26176,0,1,'00C800',0,2,0),(2337,701,26175,0,0,'00DDDD',0,2,0),(2338,701,26172,0,1,'00EE00',0,2,0),(2339,701,26169,0,2,'EE0000',0,2,0),(2340,701,26167,0,3,'6666FF',0,2,0),(2341,701,26165,0,4,'969696',0,2,0),(2342,701,26168,0,5,'960096',0,2,0),(2343,701,26178,0,6,'0000C8',0,2,0),(2344,701,26174,0,7,'C800C8',0,2,0),(2345,701,26163,0,8,'999900',0,2,0),(2346,701,26171,0,9,'C8C8C8',0,2,0),(2347,701,26170,0,10,'960000',0,2,0),(2348,701,26166,0,11,'777700',0,2,0),(2349,702,26217,0,0,'00C800',0,2,0),(2350,702,26187,0,1,'C80000',0,2,0),(2351,703,26220,0,0,'C80000',0,2,0),(2352,703,26219,5,1,'00C800',0,2,0),(2353,704,26198,0,0,'C80000',0,2,0),(2354,704,26215,5,1,'00C800',0,2,0),(2355,705,26189,0,0,'00C800',0,2,0),(2356,705,26190,0,1,'C80000',0,2,0),(2357,705,26203,0,2,'0000C8',0,2,0),(2358,705,26193,0,3,'C800C8',0,2,0),(2359,705,26188,0,4,'00C8C8',0,2,0),(2360,706,26216,0,0,'0000C8',0,2,0),(2361,706,26214,0,1,'C800C8',0,2,0),(2362,706,26191,0,2,'00C8C8',0,2,0),(2363,707,26225,0,0,'00C800',0,2,0),(2364,707,26226,0,1,'C80000',0,2,0),(2365,707,26229,0,2,'0000C8',0,2,0),(2366,707,26234,0,3,'C800C8',0,2,0),(2367,708,26232,0,0,'00C800',0,2,0),(2368,709,26228,0,0,'00C800',0,2,0),(2369,709,26227,0,1,'C80000',0,2,0),(2370,709,26231,0,2,'0000C8',0,2,0),(2371,710,26237,0,0,'00C800',0,2,0),(2372,710,26238,0,1,'C80000',0,2,0),(2373,710,26241,0,2,'0000C8',0,2,0),(2374,710,26246,0,3,'C800C8',0,2,0),(2375,711,26244,0,0,'00C800',0,2,0),(2376,712,26240,0,0,'00C800',0,2,0),(2377,712,26239,0,1,'C80000',0,2,0),(2378,712,26243,0,2,'0000C8',0,2,0),(2379,713,26248,0,0,'1A7C11',0,2,0),(2380,713,26249,0,1,'F63100',0,2,0),(2381,714,26252,0,0,'00C800',0,2,0),(2382,714,26257,0,1,'C80000',0,2,0),(2383,715,26251,0,0,'00C800',0,2,0),(2384,715,26253,0,1,'C80000',0,2,0),(2385,715,26256,0,2,'0000C8',0,2,0),(2386,716,26254,0,0,'00C800',0,2,0),(2387,717,26264,2,0,'009900',0,2,0),(2388,718,26273,2,0,'009900',0,2,0),(2389,719,26274,2,0,'009900',0,2,0),(2390,720,26272,2,0,'990000',0,2,0),(2391,721,26263,2,0,'009900',0,2,0),(2392,722,26270,2,0,'009900',0,2,0),(2393,722,26279,2,1,'990000',0,2,0),(2394,723,26278,2,0,'009900',0,2,0),(2395,723,26277,2,1,'990000',0,2,0),(2396,724,26266,2,0,'009900',0,2,0),(2397,724,26267,2,1,'000099',0,2,0),(2398,725,26271,2,0,'009900',0,2,0),(2399,725,26269,2,1,'990000',0,2,0),(2400,726,26260,1,0,'009900',0,2,0),(2401,726,26259,1,1,'990000',0,2,0),(2402,665,25944,5,0,'00AA00',0,2,0),(2403,665,25945,5,1,'3333FF',0,2,0),(2404,666,25946,0,0,'C8C800',0,2,0),(2405,666,25947,0,1,'006400',0,2,0),(2406,666,25948,0,2,'C80000',0,2,0),(2407,666,25949,0,3,'0000EE',0,2,0),(2408,666,25950,0,4,'640000',0,2,0),(2409,666,25951,0,5,'00C800',0,2,0),(2410,666,25952,0,6,'C800C8',0,2,0),(2419,730,26398,5,0,'00AA00',0,2,0),(2420,730,26400,5,1,'3333FF',0,2,0),(2421,731,26408,5,0,'00C800',0,2,2),(2422,731,26406,5,1,'009900',0,2,0),(2423,732,26345,0,0,'009900',0,2,0),(2424,732,26378,0,1,'000099',0,2,0),(2425,733,26379,0,0,'009900',0,2,0),(2426,733,26369,0,1,'000099',0,2,0),(2427,733,26356,0,2,'990000',0,2,0),(2428,734,26339,1,0,'FF5555',0,2,0),(2429,734,26338,1,1,'55FF55',0,2,0),(2430,734,26335,1,2,'009999',0,2,0),(2431,734,26337,1,3,'990099',0,2,0),(2432,734,26336,1,4,'999900',0,2,0),(2433,734,26340,1,5,'990000',0,2,0),(2434,734,26341,1,6,'000099',0,2,0),(2435,734,26355,1,7,'009900',0,2,0),(2436,735,26352,5,0,'00C800',0,2,0),(2437,736,26346,5,0,'00C800',0,2,2),(2438,736,26334,5,1,'000099',0,2,0),(2439,737,26431,0,0,'FF6666',0,2,0),(2440,738,26415,0,0,'1A7C11',0,2,0),(2441,739,26415,0,0,'1A7C11',0,2,0),(2442,739,26413,0,1,'F63100',0,2,0),(2443,740,26440,0,0,'1A7C11',0,2,0),(2762,731,26409,5,2,'000099',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
INSERT INTO `group_prototype` VALUES (1,10090,'{#HV.NAME}',NULL,NULL),(2,10090,'',6,NULL),(4,10092,'',7,NULL),(6,10090,'{#CLUSTER.NAME} (vm)',NULL,NULL),(7,10092,'{#CLUSTER.NAME}',NULL,NULL),(13,10092,'{#DATACENTER.NAME}',NULL,NULL),(15,10090,'{#DATACENTER.NAME} (vm)',NULL,NULL);
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Discovered Containers',0,0),(9,'Websites',0,0),(10,'DB - Backup',0,0),(11,'DB - Maria',0,0),(12,'Domains',0,0),(13,'Backup',0,0),(14,'DB - Redis',0,0),(15,'Rabbit Servers',0,0),(16,'DB - Postgres',0,0),(17,'SMTP',0,0),(18,'VPN',0,0),(19,'DB - Memcached',0,0),(20,'Template For Base',0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
INSERT INTO `host_discovery` VALUES (10090,NULL,23542,'',0,0),(10092,NULL,23554,'',0,0);
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
INSERT INTO `hostmacro` VALUES (1,10118,'{$SSL_PORT}','443'),(2,10124,'{$RABBIT_QUEUE_MESSAGES_CRIT}','200000'),(3,10124,'{$RABBIT_QUEUE_MESSAGES_WARN}','100000'),(4,10125,'{$PG_CACHE_HIT_RATIO}','90'),(5,10125,'{$PG_CHECKPOINTS_REQ_THRESHOLD}','5'),(6,10125,'{$PG_CONFLICTS_THRESHOLD}','0'),(7,10125,'{$PG_CONNINFO}','-h 127.0.0.1 -p 5432 -U postgres'),(8,10125,'{$PG_CONNINFO_STANDBY}','-p 5432 -U postgres'),(9,10125,'{$PG_CONN_IDLE_IN_TRANSACTION}','3'),(10,10125,'{$PG_CONN_TOTAL_PCT}','90'),(11,10125,'{$PG_CONN_WAITING}','0'),(12,10125,'{$PG_DATABASE_SIZE_THRESHOLD}','100000000000'),(13,10125,'{$PG_DEADLOCKS_THRESHOLD}','0'),(14,10125,'{$PG_LONG_QUERY_THRESHOLD}','30'),(15,10125,'{$PG_PING_THRESHOLD_MS}','1000'),(16,10125,'{$PG_PROCESS_NAME}','postgres'),(17,10125,'{$PG_SR_LAG_BYTE}','50000000'),(18,10125,'{$PG_SR_LAG_SEC}','600'),(19,10125,'{$PG_SR_PACKET_LOSS}','10'),(20,10125,'{$PG_UPTIME_THRESHOLD}','600');
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '-1',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,NULL,'Template OS Linux',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux',0,NULL,'',1,1,'','','',''),(10047,NULL,'Template App Zabbix Server',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','',''),(10048,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','',''),(10050,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','',''),(10060,NULL,'Template SNMP Interfaces',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Interfaces',0,NULL,'',1,1,'','','',''),(10065,NULL,'Template SNMP Generic',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Generic',0,NULL,'',1,1,'','','',''),(10066,NULL,'Template SNMP Device',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Device',0,NULL,'',1,1,'','','',''),(10067,NULL,'Template SNMP OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP OS Windows',0,NULL,'',1,1,'','','',''),(10068,NULL,'Template SNMP Disks',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Disks',0,NULL,'',1,1,'','','',''),(10069,NULL,'Template SNMP OS Linux',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP OS Linux',0,NULL,'',1,1,'','','',''),(10070,NULL,'Template SNMP Processors',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Processors',0,NULL,'',1,1,'','','',''),(10071,NULL,'Template IPMI Intel SR1530',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template IPMI Intel SR1530',0,NULL,'',1,1,'','','',''),(10072,NULL,'Template IPMI Intel SR1630',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template IPMI Intel SR1630',0,NULL,'',1,1,'','','',''),(10073,NULL,'Template App MySQL',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App MySQL',0,NULL,'',1,1,'','','',''),(10074,NULL,'Template OS OpenBSD',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS OpenBSD',0,NULL,'',1,1,'','','',''),(10075,NULL,'Template OS FreeBSD',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS FreeBSD',0,NULL,'',1,1,'','','',''),(10076,NULL,'Template OS AIX',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS AIX',0,NULL,'',1,1,'','','',''),(10077,NULL,'Template OS HP-UX',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS HP-UX',0,NULL,'',1,1,'','','',''),(10078,NULL,'Template OS Solaris',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Solaris',0,NULL,'',1,1,'','','',''),(10079,NULL,'Template OS Mac OS X',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Mac OS X',0,NULL,'',1,1,'','','',''),(10081,NULL,'Template OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','',''),(10082,NULL,'Template JMX Generic',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template JMX Generic',0,NULL,'',1,1,'','','',''),(10083,NULL,'Template JMX Tomcat',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template JMX Tomcat',0,NULL,'',1,1,'','','',''),(10088,NULL,'Template Virt VMware',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware',0,NULL,'',1,1,'','','',''),(10089,NULL,'Template Virt VMware Guest',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware Guest',0,NULL,'',1,1,'','','',''),(10090,NULL,'{#VM.UUID}',0,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#VM.NAME}',2,NULL,'',1,1,'','','',''),(10091,NULL,'Template Virt VMware Hypervisor',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware Hypervisor',0,NULL,'',1,1,'','','',''),(10092,NULL,'{#HV.UUID}',0,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#HV.NAME}',2,NULL,'',1,1,'','','',''),(10093,NULL,'Template App FTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App FTP Service',0,NULL,'',1,1,'','','',''),(10094,NULL,'Template App HTTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTP Service',0,NULL,'',1,1,'','','',''),(10095,NULL,'Template App HTTPS Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTPS Service',0,NULL,'',1,1,'','','',''),(10096,NULL,'Template App IMAP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IMAP Service',0,NULL,'',1,1,'','','',''),(10097,NULL,'Template App LDAP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App LDAP Service',0,NULL,'',1,1,'','','',''),(10098,NULL,'Template App NNTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NNTP Service',0,NULL,'',1,1,'','','',''),(10099,NULL,'Template App NTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NTP Service',0,NULL,'',1,1,'','','',''),(10100,NULL,'Template App POP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App POP Service',0,NULL,'',1,1,'','','',''),(10101,NULL,'Template App SMTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SMTP Service',0,NULL,'',1,1,'','','',''),(10102,NULL,'Template App SSH Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','',''),(10103,NULL,'Template App Telnet Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Telnet Service',0,NULL,'',1,1,'','','',''),(10104,NULL,'Template ICMP Ping',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template ICMP Ping',0,NULL,'',1,1,'','','',''),(10107,NULL,'Template OS Linux agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux agent',0,NULL,'',1,1,'','','',''),(10113,NULL,'Service - ICMP',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Service - ICMP (Ping)',0,NULL,'',1,1,'','','',''),(10114,NULL,'Zabbix - Container Agent',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Zabbix - Container Agent',0,NULL,'',1,1,'','','',''),(10115,NULL,'APP - Wordpress',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Wordpress',0,NULL,'',1,1,'','','',''),(10116,NULL,'Service - DB Backup',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Service - DB Backup',0,NULL,'',1,1,'','','',''),(10117,NULL,'APP - MySQL',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - MySQL',0,NULL,'',1,1,'','','',''),(10118,NULL,'Check - SSL Certificate',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Check - SSL Certificate Expiry',0,NULL,'',1,1,'','','',''),(10119,NULL,'Check - Domain Expiry',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Check - Domain Name Expiry',0,NULL,'',1,1,'','','',''),(10120,NULL,'APP - ClamAV',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - ClamAV',0,NULL,'',1,1,'','','',''),(10121,NULL,'APP - BackupPC',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - BackupPC',0,NULL,'',1,1,'','','',''),(10122,NULL,'APP - SpamAssassin',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - SpamAssassin',0,NULL,'',1,1,'','','',''),(10123,NULL,'APP - Redis',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Redis',0,NULL,'',1,1,'','','',''),(10124,NULL,'APP - RabbitMQ',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - RabbitMQ',0,NULL,'',1,1,'','','',''),(10125,NULL,'APP - PostgreSQL',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - PostgreSQL',0,NULL,'',1,1,'','','',''),(10126,NULL,'APP - Postfix',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Postfix',0,NULL,'',1,1,'','','',''),(10127,NULL,'APP - PHP-OPCache',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - PHP-OPCache',0,NULL,'',1,1,'','','',''),(10128,NULL,'APP - PHP-FPM7',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - PHP-FPM7',0,NULL,'php-fpm Template - http://www.netkiller.cn',1,1,'','','',''),(10129,NULL,'APP - PHP-FPM5',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - PHP-FPM5',0,NULL,'php-fpm Template',1,1,'','','',''),(10130,NULL,'APP - Fail2Ban',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Fail2Ban',0,NULL,'',1,1,'','','',''),(10131,NULL,'APP - Nginx',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Nginx',0,NULL,'',1,1,'','','',''),(10132,NULL,'APP - Memcached',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Memcached',0,NULL,'',1,1,'','','',''),(10133,NULL,'APP - Lighttpd',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - Lighttpd',0,NULL,'',1,1,'','','',''),(10134,NULL,'APP - LDAP',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','APP - LDAP',0,NULL,'LDAP data',1,1,'','','',''),(10135,NULL,'Template Linux System Base',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Linux System Base',0,NULL,'',1,1,'','','',''),(10136,NULL,'Template Linux Redis Discovery',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Linux Redis Discovery',0,NULL,'',1,1,'','','',''),(10137,NULL,'Template Linux Memcached Discovery',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Linux Memcached Discovery',0,NULL,'',1,1,'','','','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (1,10001,1),(47,10047,1),(98,10048,1),(50,10050,1),(70,10060,1),(73,10065,1),(74,10066,1),(75,10067,1),(76,10068,1),(77,10069,1),(78,10070,1),(79,10071,1),(80,10072,1),(81,10073,1),(82,10074,1),(83,10075,1),(84,10076,1),(85,10077,1),(86,10078,1),(87,10079,1),(89,10081,1),(90,10082,1),(91,10083,1),(95,10088,1),(96,10089,1),(97,10091,1),(99,10093,1),(100,10094,1),(101,10095,1),(102,10096,1),(103,10097,1),(104,10098,1),(105,10099,1),(106,10100,1),(107,10101,1),(108,10102,1),(109,10103,1),(110,10104,1),(112,10107,1),(118,10113,1),(120,10114,1),(119,10114,8),(121,10115,1),(122,10115,9),(124,10116,1),(123,10116,10),(126,10117,1),(125,10117,11),(129,10118,1),(130,10118,9),(132,10119,1),(131,10119,12),(133,10120,1),(135,10121,1),(134,10121,13),(136,10122,1),(138,10123,1),(300,10123,5),(137,10123,14),(140,10124,1),(139,10124,15),(142,10125,1),(141,10125,16),(144,10126,1),(143,10126,17),(145,10127,1),(146,10128,1),(147,10129,1),(148,10130,1),(149,10131,1),(151,10131,9),(150,10131,18),(153,10132,1),(152,10132,19),(154,10133,1),(155,10134,1),(156,10135,20),(301,10136,5),(157,10136,20),(302,10137,5),(158,10137,20);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (4,10001,10050),(22,10066,10060),(21,10066,10065),(24,10067,10060),(23,10067,10065),(25,10067,10068),(30,10067,10070),(28,10069,10060),(27,10069,10065),(26,10069,10068),(29,10069,10070),(31,10074,10050),(32,10075,10050),(33,10076,10050),(34,10077,10050),(35,10078,10050),(36,10079,10050),(37,10081,10050),(41,10090,10089),(42,10092,10091),(44,10107,10050),(56,10135,10050);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
INSERT INTO `housekeeper` VALUES (27292,'events','triggerid',14934),(27293,'events','triggerid',14935),(27294,'events','triggerid',14936),(27295,'events','triggerid',14937),(27296,'events','triggerid',14938),(27297,'events','triggerid',14939),(27298,'events','triggerid',14940),(27299,'events','triggerid',14941),(27300,'events','triggerid',14950),(27301,'events','triggerid',14951),(27302,'events','triggerid',14952),(27303,'events','triggerid',14953),(27304,'events','triggerid',14954),(27305,'events','triggerid',14955),(27306,'events','triggerid',14956),(27307,'events','triggerid',14957),(27308,'events','triggerid',15016),(27309,'events','triggerid',15017),(27310,'trends','itemid',30422),(27311,'trends_uint','itemid',30422),(27312,'history_text','itemid',30422),(27313,'history_log','itemid',30422),(27314,'history_uint','itemid',30422),(27315,'history_str','itemid',30422),(27316,'history','itemid',30422),(27317,'events','itemid',30422),(27318,'trends','itemid',30423),(27319,'trends_uint','itemid',30423),(27320,'history_text','itemid',30423),(27321,'history_log','itemid',30423),(27322,'history_uint','itemid',30423),(27323,'history_str','itemid',30423),(27324,'history','itemid',30423),(27325,'events','itemid',30423),(27326,'trends','itemid',30424),(27327,'trends_uint','itemid',30424),(27328,'history_text','itemid',30424),(27329,'history_log','itemid',30424),(27330,'history_uint','itemid',30424),(27331,'history_str','itemid',30424),(27332,'history','itemid',30424),(27333,'events','itemid',30424),(27334,'trends','itemid',30425),(27335,'trends_uint','itemid',30425),(27336,'history_text','itemid',30425),(27337,'history_log','itemid',30425),(27338,'history_uint','itemid',30425),(27339,'history_str','itemid',30425),(27340,'history','itemid',30425),(27341,'events','itemid',30425),(27342,'trends','itemid',30426),(27343,'trends_uint','itemid',30426),(27344,'history_text','itemid',30426),(27345,'history_log','itemid',30426),(27346,'history_uint','itemid',30426),(27347,'history_str','itemid',30426),(27348,'history','itemid',30426),(27349,'events','itemid',30426),(27350,'trends','itemid',30427),(27351,'trends_uint','itemid',30427),(27352,'history_text','itemid',30427),(27353,'history_log','itemid',30427),(27354,'history_uint','itemid',30427),(27355,'history_str','itemid',30427),(27356,'history','itemid',30427),(27357,'events','itemid',30427),(27358,'trends','itemid',30428),(27359,'trends_uint','itemid',30428),(27360,'history_text','itemid',30428),(27361,'history_log','itemid',30428),(27362,'history_uint','itemid',30428),(27363,'history_str','itemid',30428),(27364,'history','itemid',30428),(27365,'events','itemid',30428),(27366,'trends','itemid',30429),(27367,'trends_uint','itemid',30429),(27368,'history_text','itemid',30429),(27369,'history_log','itemid',30429),(27370,'history_uint','itemid',30429),(27371,'history_str','itemid',30429),(27372,'history','itemid',30429),(27373,'events','itemid',30429),(27374,'trends','itemid',30430),(27375,'trends_uint','itemid',30430),(27376,'history_text','itemid',30430),(27377,'history_log','itemid',30430),(27378,'history_uint','itemid',30430),(27379,'history_str','itemid',30430),(27380,'history','itemid',30430),(27381,'events','itemid',30430),(27382,'trends','itemid',30431),(27383,'trends_uint','itemid',30431),(27384,'history_text','itemid',30431),(27385,'history_log','itemid',30431),(27386,'history_uint','itemid',30431),(27387,'history_str','itemid',30431),(27388,'history','itemid',30431),(27389,'events','itemid',30431),(27390,'trends','itemid',30432),(27391,'trends_uint','itemid',30432),(27392,'history_text','itemid',30432),(27393,'history_log','itemid',30432),(27394,'history_uint','itemid',30432),(27395,'history_str','itemid',30432),(27396,'history','itemid',30432),(27397,'events','itemid',30432),(27398,'trends','itemid',30433),(27399,'trends_uint','itemid',30433),(27400,'history_text','itemid',30433),(27401,'history_log','itemid',30433),(27402,'history_uint','itemid',30433),(27403,'history_str','itemid',30433),(27404,'history','itemid',30433),(27405,'events','itemid',30433),(27406,'trends','itemid',30434),(27407,'trends_uint','itemid',30434),(27408,'history_text','itemid',30434),(27409,'history_log','itemid',30434),(27410,'history_uint','itemid',30434),(27411,'history_str','itemid',30434),(27412,'history','itemid',30434),(27413,'events','itemid',30434),(27414,'trends','itemid',30435),(27415,'trends_uint','itemid',30435),(27416,'history_text','itemid',30435),(27417,'history_log','itemid',30435),(27418,'history_uint','itemid',30435),(27419,'history_str','itemid',30435),(27420,'history','itemid',30435),(27421,'events','itemid',30435),(27422,'trends','itemid',30436),(27423,'trends_uint','itemid',30436),(27424,'history_text','itemid',30436),(27425,'history_log','itemid',30436),(27426,'history_uint','itemid',30436),(27427,'history_str','itemid',30436),(27428,'history','itemid',30436),(27429,'events','itemid',30436),(27430,'trends','itemid',30437),(27431,'trends_uint','itemid',30437),(27432,'history_text','itemid',30437),(27433,'history_log','itemid',30437),(27434,'history_uint','itemid',30437),(27435,'history_str','itemid',30437),(27436,'history','itemid',30437),(27437,'events','itemid',30437),(27438,'trends','itemid',30438),(27439,'trends_uint','itemid',30438),(27440,'history_text','itemid',30438),(27441,'history_log','itemid',30438),(27442,'history_uint','itemid',30438),(27443,'history_str','itemid',30438),(27444,'history','itemid',30438),(27445,'events','itemid',30438),(27446,'trends','itemid',30439),(27447,'trends_uint','itemid',30439),(27448,'history_text','itemid',30439),(27449,'history_log','itemid',30439),(27450,'history_uint','itemid',30439),(27451,'history_str','itemid',30439),(27452,'history','itemid',30439),(27453,'events','itemid',30439),(27454,'trends','itemid',30440),(27455,'trends_uint','itemid',30440),(27456,'history_text','itemid',30440),(27457,'history_log','itemid',30440),(27458,'history_uint','itemid',30440),(27459,'history_str','itemid',30440),(27460,'history','itemid',30440),(27461,'events','itemid',30440),(27462,'trends','itemid',30441),(27463,'trends_uint','itemid',30441),(27464,'history_text','itemid',30441),(27465,'history_log','itemid',30441),(27466,'history_uint','itemid',30441),(27467,'history_str','itemid',30441),(27468,'history','itemid',30441),(27469,'events','itemid',30441),(27470,'trends','itemid',30442),(27471,'trends_uint','itemid',30442),(27472,'history_text','itemid',30442),(27473,'history_log','itemid',30442),(27474,'history_uint','itemid',30442),(27475,'history_str','itemid',30442),(27476,'history','itemid',30442),(27477,'events','itemid',30442),(27478,'trends','itemid',30443),(27479,'trends_uint','itemid',30443),(27480,'history_text','itemid',30443),(27481,'history_log','itemid',30443),(27482,'history_uint','itemid',30443),(27483,'history_str','itemid',30443),(27484,'history','itemid',30443),(27485,'events','itemid',30443),(27486,'trends','itemid',30444),(27487,'trends_uint','itemid',30444),(27488,'history_text','itemid',30444),(27489,'history_log','itemid',30444),(27490,'history_uint','itemid',30444),(27491,'history_str','itemid',30444),(27492,'history','itemid',30444),(27493,'events','itemid',30444),(27494,'trends','itemid',30445),(27495,'trends_uint','itemid',30445),(27496,'history_text','itemid',30445),(27497,'history_log','itemid',30445),(27498,'history_uint','itemid',30445),(27499,'history_str','itemid',30445),(27500,'history','itemid',30445),(27501,'events','itemid',30445),(27502,'trends','itemid',30446),(27503,'trends_uint','itemid',30446),(27504,'history_text','itemid',30446),(27505,'history_log','itemid',30446),(27506,'history_uint','itemid',30446),(27507,'history_str','itemid',30446),(27508,'history','itemid',30446),(27509,'events','itemid',30446),(27510,'trends','itemid',30447),(27511,'trends_uint','itemid',30447),(27512,'history_text','itemid',30447),(27513,'history_log','itemid',30447),(27514,'history_uint','itemid',30447),(27515,'history_str','itemid',30447),(27516,'history','itemid',30447),(27517,'events','itemid',30447),(27518,'trends','itemid',30448),(27519,'trends_uint','itemid',30448),(27520,'history_text','itemid',30448),(27521,'history_log','itemid',30448),(27522,'history_uint','itemid',30448),(27523,'history_str','itemid',30448),(27524,'history','itemid',30448),(27525,'events','itemid',30448),(27526,'trends','itemid',30449),(27527,'trends_uint','itemid',30449),(27528,'history_text','itemid',30449),(27529,'history_log','itemid',30449),(27530,'history_uint','itemid',30449),(27531,'history_str','itemid',30449),(27532,'history','itemid',30449),(27533,'events','itemid',30449),(27534,'trends','itemid',30478),(27535,'trends_uint','itemid',30478),(27536,'history_text','itemid',30478),(27537,'history_log','itemid',30478),(27538,'history_uint','itemid',30478),(27539,'history_str','itemid',30478),(27540,'history','itemid',30478),(27541,'events','itemid',30478),(27542,'trends','itemid',30479),(27543,'trends_uint','itemid',30479),(27544,'history_text','itemid',30479),(27545,'history_log','itemid',30479),(27546,'history_uint','itemid',30479),(27547,'history_str','itemid',30479),(27548,'history','itemid',30479),(27549,'events','itemid',30479),(27550,'trends','itemid',30480),(27551,'trends_uint','itemid',30480),(27552,'history_text','itemid',30480),(27553,'history_log','itemid',30480),(27554,'history_uint','itemid',30480),(27555,'history_str','itemid',30480),(27556,'history','itemid',30480),(27557,'events','itemid',30480),(27558,'trends','itemid',30481),(27559,'trends_uint','itemid',30481),(27560,'history_text','itemid',30481),(27561,'history_log','itemid',30481),(27562,'history_uint','itemid',30481),(27563,'history_str','itemid',30481),(27564,'history','itemid',30481),(27565,'events','itemid',30481),(27566,'trends','itemid',30482),(27567,'trends_uint','itemid',30482),(27568,'history_text','itemid',30482),(27569,'history_log','itemid',30482),(27570,'history_uint','itemid',30482),(27571,'history_str','itemid',30482),(27572,'history','itemid',30482),(27573,'events','itemid',30482),(27574,'trends','itemid',30483),(27575,'trends_uint','itemid',30483),(27576,'history_text','itemid',30483),(27577,'history_log','itemid',30483),(27578,'history_uint','itemid',30483),(27579,'history_str','itemid',30483),(27580,'history','itemid',30483),(27581,'events','itemid',30483),(27582,'trends','itemid',30484),(27583,'trends_uint','itemid',30484),(27584,'history_text','itemid',30484),(27585,'history_log','itemid',30484),(27586,'history_uint','itemid',30484),(27587,'history_str','itemid',30484),(27588,'history','itemid',30484),(27589,'events','itemid',30484),(27590,'trends','itemid',30485),(27591,'trends_uint','itemid',30485),(27592,'history_text','itemid',30485),(27593,'history_log','itemid',30485),(27594,'history_uint','itemid',30485),(27595,'history_str','itemid',30485),(27596,'history','itemid',30485),(27597,'events','itemid',30485),(27598,'trends','itemid',30486),(27599,'trends_uint','itemid',30486),(27600,'history_text','itemid',30486),(27601,'history_log','itemid',30486),(27602,'history_uint','itemid',30486),(27603,'history_str','itemid',30486),(27604,'history','itemid',30486),(27605,'events','itemid',30486),(27606,'trends','itemid',30487),(27607,'trends_uint','itemid',30487),(27608,'history_text','itemid',30487),(27609,'history_log','itemid',30487),(27610,'history_uint','itemid',30487),(27611,'history_str','itemid',30487),(27612,'history','itemid',30487),(27613,'events','itemid',30487),(27614,'trends','itemid',30488),(27615,'trends_uint','itemid',30488),(27616,'history_text','itemid',30488),(27617,'history_log','itemid',30488),(27618,'history_uint','itemid',30488),(27619,'history_str','itemid',30488),(27620,'history','itemid',30488),(27621,'events','itemid',30488),(27622,'trends','itemid',30489),(27623,'trends_uint','itemid',30489),(27624,'history_text','itemid',30489),(27625,'history_log','itemid',30489),(27626,'history_uint','itemid',30489),(27627,'history_str','itemid',30489),(27628,'history','itemid',30489),(27629,'events','itemid',30489),(27630,'trends','itemid',30490),(27631,'trends_uint','itemid',30490),(27632,'history_text','itemid',30490),(27633,'history_log','itemid',30490),(27634,'history_uint','itemid',30490),(27635,'history_str','itemid',30490),(27636,'history','itemid',30490),(27637,'events','itemid',30490),(27638,'trends','itemid',30491),(27639,'trends_uint','itemid',30491),(27640,'history_text','itemid',30491),(27641,'history_log','itemid',30491),(27642,'history_uint','itemid',30491),(27643,'history_str','itemid',30491),(27644,'history','itemid',30491),(27645,'events','itemid',30491),(27646,'trends','itemid',30492),(27647,'trends_uint','itemid',30492),(27648,'history_text','itemid',30492),(27649,'history_log','itemid',30492),(27650,'history_uint','itemid',30492),(27651,'history_str','itemid',30492),(27652,'history','itemid',30492),(27653,'events','itemid',30492),(27654,'trends','itemid',30493),(27655,'trends_uint','itemid',30493),(27656,'history_text','itemid',30493),(27657,'history_log','itemid',30493),(27658,'history_uint','itemid',30493),(27659,'history_str','itemid',30493),(27660,'history','itemid',30493),(27661,'events','itemid',30493),(27662,'trends','itemid',30494),(27663,'trends_uint','itemid',30494),(27664,'history_text','itemid',30494),(27665,'history_log','itemid',30494),(27666,'history_uint','itemid',30494),(27667,'history_str','itemid',30494),(27668,'history','itemid',30494),(27669,'events','itemid',30494),(27670,'trends','itemid',30495),(27671,'trends_uint','itemid',30495),(27672,'history_text','itemid',30495),(27673,'history_log','itemid',30495),(27674,'history_uint','itemid',30495),(27675,'history_str','itemid',30495),(27676,'history','itemid',30495),(27677,'events','itemid',30495),(27678,'trends','itemid',30496),(27679,'trends_uint','itemid',30496),(27680,'history_text','itemid',30496),(27681,'history_log','itemid',30496),(27682,'history_uint','itemid',30496),(27683,'history_str','itemid',30496),(27684,'history','itemid',30496),(27685,'events','itemid',30496),(27686,'trends','itemid',30497),(27687,'trends_uint','itemid',30497),(27688,'history_text','itemid',30497),(27689,'history_log','itemid',30497),(27690,'history_uint','itemid',30497),(27691,'history_str','itemid',30497),(27692,'history','itemid',30497),(27693,'events','itemid',30497),(27694,'trends','itemid',30498),(27695,'trends_uint','itemid',30498),(27696,'history_text','itemid',30498),(27697,'history_log','itemid',30498),(27698,'history_uint','itemid',30498),(27699,'history_str','itemid',30498),(27700,'history','itemid',30498),(27701,'events','itemid',30498),(27702,'trends','itemid',30499),(27703,'trends_uint','itemid',30499),(27704,'history_text','itemid',30499),(27705,'history_log','itemid',30499),(27706,'history_uint','itemid',30499),(27707,'history_str','itemid',30499),(27708,'history','itemid',30499),(27709,'events','itemid',30499),(27710,'trends','itemid',30500),(27711,'trends_uint','itemid',30500),(27712,'history_text','itemid',30500),(27713,'history_log','itemid',30500),(27714,'history_uint','itemid',30500),(27715,'history_str','itemid',30500),(27716,'history','itemid',30500),(27717,'events','itemid',30500),(27718,'trends','itemid',30501),(27719,'trends_uint','itemid',30501),(27720,'history_text','itemid',30501),(27721,'history_log','itemid',30501),(27722,'history_uint','itemid',30501),(27723,'history_str','itemid',30501),(27724,'history','itemid',30501),(27725,'events','itemid',30501),(27726,'trends','itemid',30502),(27727,'trends_uint','itemid',30502),(27728,'history_text','itemid',30502),(27729,'history_log','itemid',30502),(27730,'history_uint','itemid',30502),(27731,'history_str','itemid',30502),(27732,'history','itemid',30502),(27733,'events','itemid',30502),(27734,'trends','itemid',30503),(27735,'trends_uint','itemid',30503),(27736,'history_text','itemid',30503),(27737,'history_log','itemid',30503),(27738,'history_uint','itemid',30503),(27739,'history_str','itemid',30503),(27740,'history','itemid',30503),(27741,'events','itemid',30503),(27742,'trends','itemid',30504),(27743,'trends_uint','itemid',30504),(27744,'history_text','itemid',30504),(27745,'history_log','itemid',30504),(27746,'history_uint','itemid',30504),(27747,'history_str','itemid',30504),(27748,'history','itemid',30504),(27749,'events','itemid',30504),(27750,'trends','itemid',30505),(27751,'trends_uint','itemid',30505),(27752,'history_text','itemid',30505),(27753,'history_log','itemid',30505),(27754,'history_uint','itemid',30505),(27755,'history_str','itemid',30505),(27756,'history','itemid',30505),(27757,'events','itemid',30505),(27758,'trends','itemid',30747),(27759,'trends_uint','itemid',30747),(27760,'history_text','itemid',30747),(27761,'history_log','itemid',30747),(27762,'history_uint','itemid',30747),(27763,'history_str','itemid',30747),(27764,'history','itemid',30747),(27765,'events','itemid',30747),(27766,'trends','itemid',30748),(27767,'trends_uint','itemid',30748),(27768,'history_text','itemid',30748),(27769,'history_log','itemid',30748),(27770,'history_uint','itemid',30748),(27771,'history_str','itemid',30748),(27772,'history','itemid',30748),(27773,'events','itemid',30748),(27774,'trends','itemid',30749),(27775,'trends_uint','itemid',30749),(27776,'history_text','itemid',30749),(27777,'history_log','itemid',30749),(27778,'history_uint','itemid',30749),(27779,'history_str','itemid',30749),(27780,'history','itemid',30749),(27781,'events','itemid',30749),(27782,'trends','itemid',30750),(27783,'trends_uint','itemid',30750),(27784,'history_text','itemid',30750),(27785,'history_log','itemid',30750),(27786,'history_uint','itemid',30750),(27787,'history_str','itemid',30750),(27788,'history','itemid',30750),(27789,'events','itemid',30750),(27790,'trends','itemid',30751),(27791,'trends_uint','itemid',30751),(27792,'history_text','itemid',30751),(27793,'history_log','itemid',30751),(27794,'history_uint','itemid',30751),(27795,'history_str','itemid',30751),(27796,'history','itemid',30751),(27797,'events','itemid',30751),(27798,'trends','itemid',30752),(27799,'trends_uint','itemid',30752),(27800,'history_text','itemid',30752),(27801,'history_log','itemid',30752),(27802,'history_uint','itemid',30752),(27803,'history_str','itemid',30752),(27804,'history','itemid',30752),(27805,'events','itemid',30752),(27806,'trends','itemid',30753),(27807,'trends_uint','itemid',30753),(27808,'history_text','itemid',30753),(27809,'history_log','itemid',30753),(27810,'history_uint','itemid',30753),(27811,'history_str','itemid',30753),(27812,'history','itemid',30753),(27813,'events','itemid',30753),(27814,'trends','itemid',30754),(27815,'trends_uint','itemid',30754),(27816,'history_text','itemid',30754),(27817,'history_log','itemid',30754),(27818,'history_uint','itemid',30754),(27819,'history_str','itemid',30754),(27820,'history','itemid',30754),(27821,'events','itemid',30754),(27822,'trends','itemid',30755),(27823,'trends_uint','itemid',30755),(27824,'history_text','itemid',30755),(27825,'history_log','itemid',30755),(27826,'history_uint','itemid',30755),(27827,'history_str','itemid',30755),(27828,'history','itemid',30755),(27829,'events','itemid',30755),(27830,'trends','itemid',30756),(27831,'trends_uint','itemid',30756),(27832,'history_text','itemid',30756),(27833,'history_log','itemid',30756),(27834,'history_uint','itemid',30756),(27835,'history_str','itemid',30756),(27836,'history','itemid',30756),(27837,'events','itemid',30756),(27838,'trends','itemid',30757),(27839,'trends_uint','itemid',30757),(27840,'history_text','itemid',30757),(27841,'history_log','itemid',30757),(27842,'history_uint','itemid',30757),(27843,'history_str','itemid',30757),(27844,'history','itemid',30757),(27845,'events','itemid',30757),(27846,'trends','itemid',30758),(27847,'trends_uint','itemid',30758),(27848,'history_text','itemid',30758),(27849,'history_log','itemid',30758),(27850,'history_uint','itemid',30758),(27851,'history_str','itemid',30758),(27852,'history','itemid',30758),(27853,'events','itemid',30758),(27854,'trends','itemid',30759),(27855,'trends_uint','itemid',30759),(27856,'history_text','itemid',30759),(27857,'history_log','itemid',30759),(27858,'history_uint','itemid',30759),(27859,'history_str','itemid',30759),(27860,'history','itemid',30759),(27861,'events','itemid',30759),(27862,'trends','itemid',30760),(27863,'trends_uint','itemid',30760),(27864,'history_text','itemid',30760),(27865,'history_log','itemid',30760),(27866,'history_uint','itemid',30760),(27867,'history_str','itemid',30760),(27868,'history','itemid',30760),(27869,'events','itemid',30760),(27870,'trends','itemid',30761),(27871,'trends_uint','itemid',30761),(27872,'history_text','itemid',30761),(27873,'history_log','itemid',30761),(27874,'history_uint','itemid',30761),(27875,'history_str','itemid',30761),(27876,'history','itemid',30761),(27877,'events','itemid',30761),(27878,'trends','itemid',30762),(27879,'trends_uint','itemid',30762),(27880,'history_text','itemid',30762),(27881,'history_log','itemid',30762),(27882,'history_uint','itemid',30762),(27883,'history_str','itemid',30762),(27884,'history','itemid',30762),(27885,'events','itemid',30762),(27886,'trends','itemid',30763),(27887,'trends_uint','itemid',30763),(27888,'history_text','itemid',30763),(27889,'history_log','itemid',30763),(27890,'history_uint','itemid',30763),(27891,'history_str','itemid',30763),(27892,'history','itemid',30763),(27893,'events','itemid',30763),(27894,'trends','itemid',30764),(27895,'trends_uint','itemid',30764),(27896,'history_text','itemid',30764),(27897,'history_log','itemid',30764),(27898,'history_uint','itemid',30764),(27899,'history_str','itemid',30764),(27900,'history','itemid',30764),(27901,'events','itemid',30764),(27902,'trends','itemid',30765),(27903,'trends_uint','itemid',30765),(27904,'history_text','itemid',30765),(27905,'history_log','itemid',30765),(27906,'history_uint','itemid',30765),(27907,'history_str','itemid',30765),(27908,'history','itemid',30765),(27909,'events','itemid',30765),(27910,'trends','itemid',30766),(27911,'trends_uint','itemid',30766),(27912,'history_text','itemid',30766),(27913,'history_log','itemid',30766),(27914,'history_uint','itemid',30766),(27915,'history_str','itemid',30766),(27916,'history','itemid',30766),(27917,'events','itemid',30766),(27918,'trends','itemid',30767),(27919,'trends_uint','itemid',30767),(27920,'history_text','itemid',30767),(27921,'history_log','itemid',30767),(27922,'history_uint','itemid',30767),(27923,'history_str','itemid',30767),(27924,'history','itemid',30767),(27925,'events','itemid',30767),(27926,'trends','itemid',30768),(27927,'trends_uint','itemid',30768),(27928,'history_text','itemid',30768),(27929,'history_log','itemid',30768),(27930,'history_uint','itemid',30768),(27931,'history_str','itemid',30768),(27932,'history','itemid',30768),(27933,'events','itemid',30768),(27934,'trends','itemid',30769),(27935,'trends_uint','itemid',30769),(27936,'history_text','itemid',30769),(27937,'history_log','itemid',30769),(27938,'history_uint','itemid',30769),(27939,'history_str','itemid',30769),(27940,'history','itemid',30769),(27941,'events','itemid',30769),(27942,'trends','itemid',30770),(27943,'trends_uint','itemid',30770),(27944,'history_text','itemid',30770),(27945,'history_log','itemid',30770),(27946,'history_uint','itemid',30770),(27947,'history_str','itemid',30770),(27948,'history','itemid',30770),(27949,'events','itemid',30770),(27950,'trends','itemid',30771),(27951,'trends_uint','itemid',30771),(27952,'history_text','itemid',30771),(27953,'history_log','itemid',30771),(27954,'history_uint','itemid',30771),(27955,'history_str','itemid',30771),(27956,'history','itemid',30771),(27957,'events','itemid',30771),(27958,'trends','itemid',30772),(27959,'trends_uint','itemid',30772),(27960,'history_text','itemid',30772),(27961,'history_log','itemid',30772),(27962,'history_uint','itemid',30772),(27963,'history_str','itemid',30772),(27964,'history','itemid',30772),(27965,'events','itemid',30772),(27966,'trends','itemid',30773),(27967,'trends_uint','itemid',30773),(27968,'history_text','itemid',30773),(27969,'history_log','itemid',30773),(27970,'history_uint','itemid',30773),(27971,'history_str','itemid',30773),(27972,'history','itemid',30773),(27973,'events','itemid',30773),(27974,'trends','itemid',30774),(27975,'trends_uint','itemid',30774),(27976,'history_text','itemid',30774),(27977,'history_log','itemid',30774),(27978,'history_uint','itemid',30774),(27979,'history_str','itemid',30774),(27980,'history','itemid',30774),(27981,'events','itemid',30774),(27982,'trends','itemid',30775),(27983,'trends_uint','itemid',30775),(27984,'history_text','itemid',30775),(27985,'history_log','itemid',30775),(27986,'history_uint','itemid',30775),(27987,'history_str','itemid',30775),(27988,'history','itemid',30775),(27989,'events','itemid',30775),(27990,'trends','itemid',30776),(27991,'trends_uint','itemid',30776),(27992,'history_text','itemid',30776),(27993,'history_log','itemid',30776),(27994,'history_uint','itemid',30776),(27995,'history_str','itemid',30776),(27996,'history','itemid',30776),(27997,'events','itemid',30776),(27998,'trends','itemid',30777),(27999,'trends_uint','itemid',30777),(28000,'history_text','itemid',30777),(28001,'history_log','itemid',30777),(28002,'history_uint','itemid',30777),(28003,'history_str','itemid',30777),(28004,'history','itemid',30777),(28005,'events','itemid',30777),(28006,'trends','itemid',30778),(28007,'trends_uint','itemid',30778),(28008,'history_text','itemid',30778),(28009,'history_log','itemid',30778),(28010,'history_uint','itemid',30778),(28011,'history_str','itemid',30778),(28012,'history','itemid',30778),(28013,'events','itemid',30778),(28014,'trends','itemid',30779),(28015,'trends_uint','itemid',30779),(28016,'history_text','itemid',30779),(28017,'history_log','itemid',30779),(28018,'history_uint','itemid',30779),(28019,'history_str','itemid',30779),(28020,'history','itemid',30779),(28021,'events','itemid',30779),(28022,'trends','itemid',30780),(28023,'trends_uint','itemid',30780),(28024,'history_text','itemid',30780),(28025,'history_log','itemid',30780),(28026,'history_uint','itemid',30780),(28027,'history_str','itemid',30780),(28028,'history','itemid',30780),(28029,'events','itemid',30780),(28030,'trends','itemid',30781),(28031,'trends_uint','itemid',30781),(28032,'history_text','itemid',30781),(28033,'history_log','itemid',30781),(28034,'history_uint','itemid',30781),(28035,'history_str','itemid',30781),(28036,'history','itemid',30781),(28037,'events','itemid',30781),(28038,'trends','itemid',30782),(28039,'trends_uint','itemid',30782),(28040,'history_text','itemid',30782),(28041,'history_log','itemid',30782),(28042,'history_uint','itemid',30782),(28043,'history_str','itemid',30782),(28044,'history','itemid',30782),(28045,'events','itemid',30782),(28046,'trends','itemid',30783),(28047,'trends_uint','itemid',30783),(28048,'history_text','itemid',30783),(28049,'history_log','itemid',30783),(28050,'history_uint','itemid',30783),(28051,'history_str','itemid',30783),(28052,'history','itemid',30783),(28053,'events','itemid',30783),(28054,'trends','itemid',30784),(28055,'trends_uint','itemid',30784),(28056,'history_text','itemid',30784),(28057,'history_log','itemid',30784),(28058,'history_uint','itemid',30784),(28059,'history_str','itemid',30784),(28060,'history','itemid',30784),(28061,'events','itemid',30784),(28062,'trends','itemid',30785),(28063,'trends_uint','itemid',30785),(28064,'history_text','itemid',30785),(28065,'history_log','itemid',30785),(28066,'history_uint','itemid',30785),(28067,'history_str','itemid',30785),(28068,'history','itemid',30785),(28069,'events','itemid',30785),(28070,'trends','itemid',30786),(28071,'trends_uint','itemid',30786),(28072,'history_text','itemid',30786),(28073,'history_log','itemid',30786),(28074,'history_uint','itemid',30786),(28075,'history_str','itemid',30786),(28076,'history','itemid',30786),(28077,'events','itemid',30786),(28078,'trends','itemid',30787),(28079,'trends_uint','itemid',30787),(28080,'history_text','itemid',30787),(28081,'history_log','itemid',30787),(28082,'history_uint','itemid',30787),(28083,'history_str','itemid',30787),(28084,'history','itemid',30787),(28085,'events','itemid',30787),(28086,'trends','itemid',30788),(28087,'trends_uint','itemid',30788),(28088,'history_text','itemid',30788),(28089,'history_log','itemid',30788),(28090,'history_uint','itemid',30788),(28091,'history_str','itemid',30788),(28092,'history','itemid',30788),(28093,'events','itemid',30788),(28094,'trends','itemid',30789),(28095,'trends_uint','itemid',30789),(28096,'history_text','itemid',30789),(28097,'history_log','itemid',30789),(28098,'history_uint','itemid',30789),(28099,'history_str','itemid',30789),(28100,'history','itemid',30789),(28101,'events','itemid',30789),(28102,'trends','itemid',30790),(28103,'trends_uint','itemid',30790),(28104,'history_text','itemid',30790),(28105,'history_log','itemid',30790),(28106,'history_uint','itemid',30790),(28107,'history_str','itemid',30790),(28108,'history','itemid',30790),(28109,'events','itemid',30790),(28110,'trends','itemid',30791),(28111,'trends_uint','itemid',30791),(28112,'history_text','itemid',30791),(28113,'history_log','itemid',30791),(28114,'history_uint','itemid',30791),(28115,'history_str','itemid',30791),(28116,'history','itemid',30791),(28117,'events','itemid',30791),(28118,'trends','itemid',30792),(28119,'trends_uint','itemid',30792),(28120,'history_text','itemid',30792),(28121,'history_log','itemid',30792),(28122,'history_uint','itemid',30792),(28123,'history_str','itemid',30792),(28124,'history','itemid',30792),(28125,'events','itemid',30792),(28126,'trends','itemid',30793),(28127,'trends_uint','itemid',30793),(28128,'history_text','itemid',30793),(28129,'history_log','itemid',30793),(28130,'history_uint','itemid',30793),(28131,'history_str','itemid',30793),(28132,'history','itemid',30793),(28133,'events','itemid',30793),(28134,'trends','itemid',30794),(28135,'trends_uint','itemid',30794),(28136,'history_text','itemid',30794),(28137,'history_log','itemid',30794),(28138,'history_uint','itemid',30794),(28139,'history_str','itemid',30794),(28140,'history','itemid',30794),(28141,'events','itemid',30794),(28142,'trends','itemid',30795),(28143,'trends_uint','itemid',30795),(28144,'history_text','itemid',30795),(28145,'history_log','itemid',30795),(28146,'history_uint','itemid',30795),(28147,'history_str','itemid',30795),(28148,'history','itemid',30795),(28149,'events','itemid',30795),(28150,'trends','itemid',30796),(28151,'trends_uint','itemid',30796),(28152,'history_text','itemid',30796),(28153,'history_log','itemid',30796),(28154,'history_uint','itemid',30796),(28155,'history_str','itemid',30796),(28156,'history','itemid',30796),(28157,'events','itemid',30796),(28158,'trends','itemid',30797),(28159,'trends_uint','itemid',30797),(28160,'history_text','itemid',30797),(28161,'history_log','itemid',30797),(28162,'history_uint','itemid',30797),(28163,'history_str','itemid',30797),(28164,'history','itemid',30797),(28165,'events','itemid',30797),(28166,'trends','itemid',30798),(28167,'trends_uint','itemid',30798),(28168,'history_text','itemid',30798),(28169,'history_log','itemid',30798),(28170,'history_uint','itemid',30798),(28171,'history_str','itemid',30798),(28172,'history','itemid',30798),(28173,'events','itemid',30798),(28174,'trends','itemid',30799),(28175,'trends_uint','itemid',30799),(28176,'history_text','itemid',30799),(28177,'history_log','itemid',30799),(28178,'history_uint','itemid',30799),(28179,'history_str','itemid',30799),(28180,'history','itemid',30799),(28181,'events','itemid',30799),(28182,'events','lldruleid',30185),(28183,'events','lldruleid',30201),(28184,'events','lldruleid',30252),(28185,'events','lldruleid',30345),(28186,'events','lldruleid',30361),(28187,'events','lldruleid',30412),(28188,'events','lldruleid',30670),(28189,'events','lldruleid',30686),(28190,'events','lldruleid',30737),(28191,'events','triggerid',14868),(28192,'events','triggerid',14869),(28193,'events','triggerid',14870),(28194,'events','triggerid',14871),(28195,'events','triggerid',14872),(28196,'events','triggerid',14873),(28197,'events','triggerid',14874),(28198,'events','triggerid',14875),(28199,'events','triggerid',14876),(28200,'events','triggerid',14877),(28201,'events','triggerid',14878),(28202,'events','triggerid',14879),(28203,'events','triggerid',14880),(28204,'events','triggerid',14881),(28205,'events','triggerid',14882),(28206,'events','triggerid',14883),(28207,'events','triggerid',14884),(28208,'events','triggerid',14885),(28209,'events','triggerid',14888),(28210,'events','triggerid',14889),(28211,'events','triggerid',14912),(28212,'events','triggerid',14913),(28213,'events','triggerid',14914),(28214,'events','triggerid',14915),(28215,'events','triggerid',14916),(28216,'events','triggerid',14917),(28217,'events','triggerid',14918),(28218,'events','triggerid',14919),(28219,'events','triggerid',14920),(28220,'events','triggerid',14921),(28221,'events','triggerid',14922),(28222,'events','triggerid',14923),(28223,'events','triggerid',14924),(28224,'events','triggerid',14925),(28225,'events','triggerid',14926),(28226,'events','triggerid',14927),(28227,'events','triggerid',14928),(28228,'events','triggerid',14929),(28229,'events','triggerid',14932),(28230,'events','triggerid',14933),(28231,'events','triggerid',14994),(28232,'events','triggerid',14995),(28233,'events','triggerid',14996),(28234,'events','triggerid',14997),(28235,'events','triggerid',14998),(28236,'events','triggerid',14999),(28237,'events','triggerid',15000),(28238,'events','triggerid',15001),(28239,'events','triggerid',15002),(28240,'events','triggerid',15003),(28241,'events','triggerid',15004),(28242,'events','triggerid',15005),(28243,'events','triggerid',15006),(28244,'events','triggerid',15007),(28245,'events','triggerid',15008),(28246,'events','triggerid',15009),(28247,'events','triggerid',15010),(28248,'events','triggerid',15011),(28249,'events','triggerid',15014),(28250,'events','triggerid',15015),(28251,'trends','itemid',30182),(28252,'trends_uint','itemid',30182),(28253,'history_text','itemid',30182),(28254,'history_log','itemid',30182),(28255,'history_uint','itemid',30182),(28256,'history_str','itemid',30182),(28257,'history','itemid',30182),(28258,'events','itemid',30182),(28259,'trends','itemid',30183),(28260,'trends_uint','itemid',30183),(28261,'history_text','itemid',30183),(28262,'history_log','itemid',30183),(28263,'history_uint','itemid',30183),(28264,'history_str','itemid',30183),(28265,'history','itemid',30183),(28266,'events','itemid',30183),(28267,'trends','itemid',30184),(28268,'trends_uint','itemid',30184),(28269,'history_text','itemid',30184),(28270,'history_log','itemid',30184),(28271,'history_uint','itemid',30184),(28272,'history_str','itemid',30184),(28273,'history','itemid',30184),(28274,'events','itemid',30184),(28275,'trends','itemid',30199),(28276,'trends_uint','itemid',30199),(28277,'history_text','itemid',30199),(28278,'history_log','itemid',30199),(28279,'history_uint','itemid',30199),(28280,'history_str','itemid',30199),(28281,'history','itemid',30199),(28282,'events','itemid',30199),(28283,'trends','itemid',30200),(28284,'trends_uint','itemid',30200),(28285,'history_text','itemid',30200),(28286,'history_log','itemid',30200),(28287,'history_uint','itemid',30200),(28288,'history_str','itemid',30200),(28289,'history','itemid',30200),(28290,'events','itemid',30200),(28291,'trends','itemid',30210),(28292,'trends_uint','itemid',30210),(28293,'history_text','itemid',30210),(28294,'history_log','itemid',30210),(28295,'history_uint','itemid',30210),(28296,'history_str','itemid',30210),(28297,'history','itemid',30210),(28298,'events','itemid',30210),(28299,'trends','itemid',30211),(28300,'trends_uint','itemid',30211),(28301,'history_text','itemid',30211),(28302,'history_log','itemid',30211),(28303,'history_uint','itemid',30211),(28304,'history_str','itemid',30211),(28305,'history','itemid',30211),(28306,'events','itemid',30211),(28307,'trends','itemid',30212),(28308,'trends_uint','itemid',30212),(28309,'history_text','itemid',30212),(28310,'history_log','itemid',30212),(28311,'history_uint','itemid',30212),(28312,'history_str','itemid',30212),(28313,'history','itemid',30212),(28314,'events','itemid',30212),(28315,'trends','itemid',30213),(28316,'trends_uint','itemid',30213),(28317,'history_text','itemid',30213),(28318,'history_log','itemid',30213),(28319,'history_uint','itemid',30213),(28320,'history_str','itemid',30213),(28321,'history','itemid',30213),(28322,'events','itemid',30213),(28323,'trends','itemid',30214),(28324,'trends_uint','itemid',30214),(28325,'history_text','itemid',30214),(28326,'history_log','itemid',30214),(28327,'history_uint','itemid',30214),(28328,'history_str','itemid',30214),(28329,'history','itemid',30214),(28330,'events','itemid',30214),(28331,'trends','itemid',30215),(28332,'trends_uint','itemid',30215),(28333,'history_text','itemid',30215),(28334,'history_log','itemid',30215),(28335,'history_uint','itemid',30215),(28336,'history_str','itemid',30215),(28337,'history','itemid',30215),(28338,'events','itemid',30215),(28339,'trends','itemid',30216),(28340,'trends_uint','itemid',30216),(28341,'history_text','itemid',30216),(28342,'history_log','itemid',30216),(28343,'history_uint','itemid',30216),(28344,'history_str','itemid',30216),(28345,'history','itemid',30216),(28346,'events','itemid',30216),(28347,'trends','itemid',30217),(28348,'trends_uint','itemid',30217),(28349,'history_text','itemid',30217),(28350,'history_log','itemid',30217),(28351,'history_uint','itemid',30217),(28352,'history_str','itemid',30217),(28353,'history','itemid',30217),(28354,'events','itemid',30217),(28355,'trends','itemid',30218),(28356,'trends_uint','itemid',30218),(28357,'history_text','itemid',30218),(28358,'history_log','itemid',30218),(28359,'history_uint','itemid',30218),(28360,'history_str','itemid',30218),(28361,'history','itemid',30218),(28362,'events','itemid',30218),(28363,'trends','itemid',30219),(28364,'trends_uint','itemid',30219),(28365,'history_text','itemid',30219),(28366,'history_log','itemid',30219),(28367,'history_uint','itemid',30219),(28368,'history_str','itemid',30219),(28369,'history','itemid',30219),(28370,'events','itemid',30219),(28371,'trends','itemid',30220),(28372,'trends_uint','itemid',30220),(28373,'history_text','itemid',30220),(28374,'history_log','itemid',30220),(28375,'history_uint','itemid',30220),(28376,'history_str','itemid',30220),(28377,'history','itemid',30220),(28378,'events','itemid',30220),(28379,'trends','itemid',30221),(28380,'trends_uint','itemid',30221),(28381,'history_text','itemid',30221),(28382,'history_log','itemid',30221),(28383,'history_uint','itemid',30221),(28384,'history_str','itemid',30221),(28385,'history','itemid',30221),(28386,'events','itemid',30221),(28387,'trends','itemid',30222),(28388,'trends_uint','itemid',30222),(28389,'history_text','itemid',30222),(28390,'history_log','itemid',30222),(28391,'history_uint','itemid',30222),(28392,'history_str','itemid',30222),(28393,'history','itemid',30222),(28394,'events','itemid',30222),(28395,'trends','itemid',30223),(28396,'trends_uint','itemid',30223),(28397,'history_text','itemid',30223),(28398,'history_log','itemid',30223),(28399,'history_uint','itemid',30223),(28400,'history_str','itemid',30223),(28401,'history','itemid',30223),(28402,'events','itemid',30223),(28403,'trends','itemid',30224),(28404,'trends_uint','itemid',30224),(28405,'history_text','itemid',30224),(28406,'history_log','itemid',30224),(28407,'history_uint','itemid',30224),(28408,'history_str','itemid',30224),(28409,'history','itemid',30224),(28410,'events','itemid',30224),(28411,'trends','itemid',30225),(28412,'trends_uint','itemid',30225),(28413,'history_text','itemid',30225),(28414,'history_log','itemid',30225),(28415,'history_uint','itemid',30225),(28416,'history_str','itemid',30225),(28417,'history','itemid',30225),(28418,'events','itemid',30225),(28419,'trends','itemid',30226),(28420,'trends_uint','itemid',30226),(28421,'history_text','itemid',30226),(28422,'history_log','itemid',30226),(28423,'history_uint','itemid',30226),(28424,'history_str','itemid',30226),(28425,'history','itemid',30226),(28426,'events','itemid',30226),(28427,'trends','itemid',30227),(28428,'trends_uint','itemid',30227),(28429,'history_text','itemid',30227),(28430,'history_log','itemid',30227),(28431,'history_uint','itemid',30227),(28432,'history_str','itemid',30227),(28433,'history','itemid',30227),(28434,'events','itemid',30227),(28435,'trends','itemid',30228),(28436,'trends_uint','itemid',30228),(28437,'history_text','itemid',30228),(28438,'history_log','itemid',30228),(28439,'history_uint','itemid',30228),(28440,'history_str','itemid',30228),(28441,'history','itemid',30228),(28442,'events','itemid',30228),(28443,'trends','itemid',30229),(28444,'trends_uint','itemid',30229),(28445,'history_text','itemid',30229),(28446,'history_log','itemid',30229),(28447,'history_uint','itemid',30229),(28448,'history_str','itemid',30229),(28449,'history','itemid',30229),(28450,'events','itemid',30229),(28451,'trends','itemid',30230),(28452,'trends_uint','itemid',30230),(28453,'history_text','itemid',30230),(28454,'history_log','itemid',30230),(28455,'history_uint','itemid',30230),(28456,'history_str','itemid',30230),(28457,'history','itemid',30230),(28458,'events','itemid',30230),(28459,'trends','itemid',30231),(28460,'trends_uint','itemid',30231),(28461,'history_text','itemid',30231),(28462,'history_log','itemid',30231),(28463,'history_uint','itemid',30231),(28464,'history_str','itemid',30231),(28465,'history','itemid',30231),(28466,'events','itemid',30231),(28467,'trends','itemid',30232),(28468,'trends_uint','itemid',30232),(28469,'history_text','itemid',30232),(28470,'history_log','itemid',30232),(28471,'history_uint','itemid',30232),(28472,'history_str','itemid',30232),(28473,'history','itemid',30232),(28474,'events','itemid',30232),(28475,'trends','itemid',30233),(28476,'trends_uint','itemid',30233),(28477,'history_text','itemid',30233),(28478,'history_log','itemid',30233),(28479,'history_uint','itemid',30233),(28480,'history_str','itemid',30233),(28481,'history','itemid',30233),(28482,'events','itemid',30233),(28483,'trends','itemid',30234),(28484,'trends_uint','itemid',30234),(28485,'history_text','itemid',30234),(28486,'history_log','itemid',30234),(28487,'history_uint','itemid',30234),(28488,'history_str','itemid',30234),(28489,'history','itemid',30234),(28490,'events','itemid',30234),(28491,'trends','itemid',30235),(28492,'trends_uint','itemid',30235),(28493,'history_text','itemid',30235),(28494,'history_log','itemid',30235),(28495,'history_uint','itemid',30235),(28496,'history_str','itemid',30235),(28497,'history','itemid',30235),(28498,'events','itemid',30235),(28499,'trends','itemid',30236),(28500,'trends_uint','itemid',30236),(28501,'history_text','itemid',30236),(28502,'history_log','itemid',30236),(28503,'history_uint','itemid',30236),(28504,'history_str','itemid',30236),(28505,'history','itemid',30236),(28506,'events','itemid',30236),(28507,'trends','itemid',30237),(28508,'trends_uint','itemid',30237),(28509,'history_text','itemid',30237),(28510,'history_log','itemid',30237),(28511,'history_uint','itemid',30237),(28512,'history_str','itemid',30237),(28513,'history','itemid',30237),(28514,'events','itemid',30237),(28515,'trends','itemid',30238),(28516,'trends_uint','itemid',30238),(28517,'history_text','itemid',30238),(28518,'history_log','itemid',30238),(28519,'history_uint','itemid',30238),(28520,'history_str','itemid',30238),(28521,'history','itemid',30238),(28522,'events','itemid',30238),(28523,'trends','itemid',30239),(28524,'trends_uint','itemid',30239),(28525,'history_text','itemid',30239),(28526,'history_log','itemid',30239),(28527,'history_uint','itemid',30239),(28528,'history_str','itemid',30239),(28529,'history','itemid',30239),(28530,'events','itemid',30239),(28531,'trends','itemid',30240),(28532,'trends_uint','itemid',30240),(28533,'history_text','itemid',30240),(28534,'history_log','itemid',30240),(28535,'history_uint','itemid',30240),(28536,'history_str','itemid',30240),(28537,'history','itemid',30240),(28538,'events','itemid',30240),(28539,'trends','itemid',30241),(28540,'trends_uint','itemid',30241),(28541,'history_text','itemid',30241),(28542,'history_log','itemid',30241),(28543,'history_uint','itemid',30241),(28544,'history_str','itemid',30241),(28545,'history','itemid',30241),(28546,'events','itemid',30241),(28547,'trends','itemid',30242),(28548,'trends_uint','itemid',30242),(28549,'history_text','itemid',30242),(28550,'history_log','itemid',30242),(28551,'history_uint','itemid',30242),(28552,'history_str','itemid',30242),(28553,'history','itemid',30242),(28554,'events','itemid',30242),(28555,'trends','itemid',30243),(28556,'trends_uint','itemid',30243),(28557,'history_text','itemid',30243),(28558,'history_log','itemid',30243),(28559,'history_uint','itemid',30243),(28560,'history_str','itemid',30243),(28561,'history','itemid',30243),(28562,'events','itemid',30243),(28563,'trends','itemid',30244),(28564,'trends_uint','itemid',30244),(28565,'history_text','itemid',30244),(28566,'history_log','itemid',30244),(28567,'history_uint','itemid',30244),(28568,'history_str','itemid',30244),(28569,'history','itemid',30244),(28570,'events','itemid',30244),(28571,'trends','itemid',30245),(28572,'trends_uint','itemid',30245),(28573,'history_text','itemid',30245),(28574,'history_log','itemid',30245),(28575,'history_uint','itemid',30245),(28576,'history_str','itemid',30245),(28577,'history','itemid',30245),(28578,'events','itemid',30245),(28579,'trends','itemid',30246),(28580,'trends_uint','itemid',30246),(28581,'history_text','itemid',30246),(28582,'history_log','itemid',30246),(28583,'history_uint','itemid',30246),(28584,'history_str','itemid',30246),(28585,'history','itemid',30246),(28586,'events','itemid',30246),(28587,'trends','itemid',30247),(28588,'trends_uint','itemid',30247),(28589,'history_text','itemid',30247),(28590,'history_log','itemid',30247),(28591,'history_uint','itemid',30247),(28592,'history_str','itemid',30247),(28593,'history','itemid',30247),(28594,'events','itemid',30247),(28595,'trends','itemid',30248),(28596,'trends_uint','itemid',30248),(28597,'history_text','itemid',30248),(28598,'history_log','itemid',30248),(28599,'history_uint','itemid',30248),(28600,'history_str','itemid',30248),(28601,'history','itemid',30248),(28602,'events','itemid',30248),(28603,'trends','itemid',30249),(28604,'trends_uint','itemid',30249),(28605,'history_text','itemid',30249),(28606,'history_log','itemid',30249),(28607,'history_uint','itemid',30249),(28608,'history_str','itemid',30249),(28609,'history','itemid',30249),(28610,'events','itemid',30249),(28611,'trends','itemid',30250),(28612,'trends_uint','itemid',30250),(28613,'history_text','itemid',30250),(28614,'history_log','itemid',30250),(28615,'history_uint','itemid',30250),(28616,'history_str','itemid',30250),(28617,'history','itemid',30250),(28618,'events','itemid',30250),(28619,'trends','itemid',30251),(28620,'trends_uint','itemid',30251),(28621,'history_text','itemid',30251),(28622,'history_log','itemid',30251),(28623,'history_uint','itemid',30251),(28624,'history_str','itemid',30251),(28625,'history','itemid',30251),(28626,'events','itemid',30251),(28627,'trends','itemid',30258),(28628,'trends_uint','itemid',30258),(28629,'history_text','itemid',30258),(28630,'history_log','itemid',30258),(28631,'history_uint','itemid',30258),(28632,'history_str','itemid',30258),(28633,'history','itemid',30258),(28634,'events','itemid',30258),(28635,'trends','itemid',30259),(28636,'trends_uint','itemid',30259),(28637,'history_text','itemid',30259),(28638,'history_log','itemid',30259),(28639,'history_uint','itemid',30259),(28640,'history_str','itemid',30259),(28641,'history','itemid',30259),(28642,'events','itemid',30259),(28643,'trends','itemid',30260),(28644,'trends_uint','itemid',30260),(28645,'history_text','itemid',30260),(28646,'history_log','itemid',30260),(28647,'history_uint','itemid',30260),(28648,'history_str','itemid',30260),(28649,'history','itemid',30260),(28650,'events','itemid',30260),(28651,'trends','itemid',30261),(28652,'trends_uint','itemid',30261),(28653,'history_text','itemid',30261),(28654,'history_log','itemid',30261),(28655,'history_uint','itemid',30261),(28656,'history_str','itemid',30261),(28657,'history','itemid',30261),(28658,'events','itemid',30261),(28659,'trends','itemid',30342),(28660,'trends_uint','itemid',30342),(28661,'history_text','itemid',30342),(28662,'history_log','itemid',30342),(28663,'history_uint','itemid',30342),(28664,'history_str','itemid',30342),(28665,'history','itemid',30342),(28666,'events','itemid',30342),(28667,'trends','itemid',30343),(28668,'trends_uint','itemid',30343),(28669,'history_text','itemid',30343),(28670,'history_log','itemid',30343),(28671,'history_uint','itemid',30343),(28672,'history_str','itemid',30343),(28673,'history','itemid',30343),(28674,'events','itemid',30343),(28675,'trends','itemid',30344),(28676,'trends_uint','itemid',30344),(28677,'history_text','itemid',30344),(28678,'history_log','itemid',30344),(28679,'history_uint','itemid',30344),(28680,'history_str','itemid',30344),(28681,'history','itemid',30344),(28682,'events','itemid',30344),(28683,'trends','itemid',30359),(28684,'trends_uint','itemid',30359),(28685,'history_text','itemid',30359),(28686,'history_log','itemid',30359),(28687,'history_uint','itemid',30359),(28688,'history_str','itemid',30359),(28689,'history','itemid',30359),(28690,'events','itemid',30359),(28691,'trends','itemid',30360),(28692,'trends_uint','itemid',30360),(28693,'history_text','itemid',30360),(28694,'history_log','itemid',30360),(28695,'history_uint','itemid',30360),(28696,'history_str','itemid',30360),(28697,'history','itemid',30360),(28698,'events','itemid',30360),(28699,'trends','itemid',30370),(28700,'trends_uint','itemid',30370),(28701,'history_text','itemid',30370),(28702,'history_log','itemid',30370),(28703,'history_uint','itemid',30370),(28704,'history_str','itemid',30370),(28705,'history','itemid',30370),(28706,'events','itemid',30370),(28707,'trends','itemid',30371),(28708,'trends_uint','itemid',30371),(28709,'history_text','itemid',30371),(28710,'history_log','itemid',30371),(28711,'history_uint','itemid',30371),(28712,'history_str','itemid',30371),(28713,'history','itemid',30371),(28714,'events','itemid',30371),(28715,'trends','itemid',30372),(28716,'trends_uint','itemid',30372),(28717,'history_text','itemid',30372),(28718,'history_log','itemid',30372),(28719,'history_uint','itemid',30372),(28720,'history_str','itemid',30372),(28721,'history','itemid',30372),(28722,'events','itemid',30372),(28723,'trends','itemid',30373),(28724,'trends_uint','itemid',30373),(28725,'history_text','itemid',30373),(28726,'history_log','itemid',30373),(28727,'history_uint','itemid',30373),(28728,'history_str','itemid',30373),(28729,'history','itemid',30373),(28730,'events','itemid',30373),(28731,'trends','itemid',30374),(28732,'trends_uint','itemid',30374),(28733,'history_text','itemid',30374),(28734,'history_log','itemid',30374),(28735,'history_uint','itemid',30374),(28736,'history_str','itemid',30374),(28737,'history','itemid',30374),(28738,'events','itemid',30374),(28739,'trends','itemid',30375),(28740,'trends_uint','itemid',30375),(28741,'history_text','itemid',30375),(28742,'history_log','itemid',30375),(28743,'history_uint','itemid',30375),(28744,'history_str','itemid',30375),(28745,'history','itemid',30375),(28746,'events','itemid',30375),(28747,'trends','itemid',30376),(28748,'trends_uint','itemid',30376),(28749,'history_text','itemid',30376),(28750,'history_log','itemid',30376),(28751,'history_uint','itemid',30376),(28752,'history_str','itemid',30376),(28753,'history','itemid',30376),(28754,'events','itemid',30376),(28755,'trends','itemid',30377),(28756,'trends_uint','itemid',30377),(28757,'history_text','itemid',30377),(28758,'history_log','itemid',30377),(28759,'history_uint','itemid',30377),(28760,'history_str','itemid',30377),(28761,'history','itemid',30377),(28762,'events','itemid',30377),(28763,'trends','itemid',30378),(28764,'trends_uint','itemid',30378),(28765,'history_text','itemid',30378),(28766,'history_log','itemid',30378),(28767,'history_uint','itemid',30378),(28768,'history_str','itemid',30378),(28769,'history','itemid',30378),(28770,'events','itemid',30378),(28771,'trends','itemid',30379),(28772,'trends_uint','itemid',30379),(28773,'history_text','itemid',30379),(28774,'history_log','itemid',30379),(28775,'history_uint','itemid',30379),(28776,'history_str','itemid',30379),(28777,'history','itemid',30379),(28778,'events','itemid',30379),(28779,'trends','itemid',30380),(28780,'trends_uint','itemid',30380),(28781,'history_text','itemid',30380),(28782,'history_log','itemid',30380),(28783,'history_uint','itemid',30380),(28784,'history_str','itemid',30380),(28785,'history','itemid',30380),(28786,'events','itemid',30380),(28787,'trends','itemid',30381),(28788,'trends_uint','itemid',30381),(28789,'history_text','itemid',30381),(28790,'history_log','itemid',30381),(28791,'history_uint','itemid',30381),(28792,'history_str','itemid',30381),(28793,'history','itemid',30381),(28794,'events','itemid',30381),(28795,'trends','itemid',30382),(28796,'trends_uint','itemid',30382),(28797,'history_text','itemid',30382),(28798,'history_log','itemid',30382),(28799,'history_uint','itemid',30382),(28800,'history_str','itemid',30382),(28801,'history','itemid',30382),(28802,'events','itemid',30382),(28803,'trends','itemid',30383),(28804,'trends_uint','itemid',30383),(28805,'history_text','itemid',30383),(28806,'history_log','itemid',30383),(28807,'history_uint','itemid',30383),(28808,'history_str','itemid',30383),(28809,'history','itemid',30383),(28810,'events','itemid',30383),(28811,'trends','itemid',30384),(28812,'trends_uint','itemid',30384),(28813,'history_text','itemid',30384),(28814,'history_log','itemid',30384),(28815,'history_uint','itemid',30384),(28816,'history_str','itemid',30384),(28817,'history','itemid',30384),(28818,'events','itemid',30384),(28819,'trends','itemid',30385),(28820,'trends_uint','itemid',30385),(28821,'history_text','itemid',30385),(28822,'history_log','itemid',30385),(28823,'history_uint','itemid',30385),(28824,'history_str','itemid',30385),(28825,'history','itemid',30385),(28826,'events','itemid',30385),(28827,'trends','itemid',30386),(28828,'trends_uint','itemid',30386),(28829,'history_text','itemid',30386),(28830,'history_log','itemid',30386),(28831,'history_uint','itemid',30386),(28832,'history_str','itemid',30386),(28833,'history','itemid',30386),(28834,'events','itemid',30386),(28835,'trends','itemid',30387),(28836,'trends_uint','itemid',30387),(28837,'history_text','itemid',30387),(28838,'history_log','itemid',30387),(28839,'history_uint','itemid',30387),(28840,'history_str','itemid',30387),(28841,'history','itemid',30387),(28842,'events','itemid',30387),(28843,'trends','itemid',30388),(28844,'trends_uint','itemid',30388),(28845,'history_text','itemid',30388),(28846,'history_log','itemid',30388),(28847,'history_uint','itemid',30388),(28848,'history_str','itemid',30388),(28849,'history','itemid',30388),(28850,'events','itemid',30388),(28851,'trends','itemid',30389),(28852,'trends_uint','itemid',30389),(28853,'history_text','itemid',30389),(28854,'history_log','itemid',30389),(28855,'history_uint','itemid',30389),(28856,'history_str','itemid',30389),(28857,'history','itemid',30389),(28858,'events','itemid',30389),(28859,'trends','itemid',30390),(28860,'trends_uint','itemid',30390),(28861,'history_text','itemid',30390),(28862,'history_log','itemid',30390),(28863,'history_uint','itemid',30390),(28864,'history_str','itemid',30390),(28865,'history','itemid',30390),(28866,'events','itemid',30390),(28867,'trends','itemid',30391),(28868,'trends_uint','itemid',30391),(28869,'history_text','itemid',30391),(28870,'history_log','itemid',30391),(28871,'history_uint','itemid',30391),(28872,'history_str','itemid',30391),(28873,'history','itemid',30391),(28874,'events','itemid',30391),(28875,'trends','itemid',30392),(28876,'trends_uint','itemid',30392),(28877,'history_text','itemid',30392),(28878,'history_log','itemid',30392),(28879,'history_uint','itemid',30392),(28880,'history_str','itemid',30392),(28881,'history','itemid',30392),(28882,'events','itemid',30392),(28883,'trends','itemid',30393),(28884,'trends_uint','itemid',30393),(28885,'history_text','itemid',30393),(28886,'history_log','itemid',30393),(28887,'history_uint','itemid',30393),(28888,'history_str','itemid',30393),(28889,'history','itemid',30393),(28890,'events','itemid',30393),(28891,'trends','itemid',30394),(28892,'trends_uint','itemid',30394),(28893,'history_text','itemid',30394),(28894,'history_log','itemid',30394),(28895,'history_uint','itemid',30394),(28896,'history_str','itemid',30394),(28897,'history','itemid',30394),(28898,'events','itemid',30394),(28899,'trends','itemid',30395),(28900,'trends_uint','itemid',30395),(28901,'history_text','itemid',30395),(28902,'history_log','itemid',30395),(28903,'history_uint','itemid',30395),(28904,'history_str','itemid',30395),(28905,'history','itemid',30395),(28906,'events','itemid',30395),(28907,'trends','itemid',30396),(28908,'trends_uint','itemid',30396),(28909,'history_text','itemid',30396),(28910,'history_log','itemid',30396),(28911,'history_uint','itemid',30396),(28912,'history_str','itemid',30396),(28913,'history','itemid',30396),(28914,'events','itemid',30396),(28915,'trends','itemid',30397),(28916,'trends_uint','itemid',30397),(28917,'history_text','itemid',30397),(28918,'history_log','itemid',30397),(28919,'history_uint','itemid',30397),(28920,'history_str','itemid',30397),(28921,'history','itemid',30397),(28922,'events','itemid',30397),(28923,'trends','itemid',30398),(28924,'trends_uint','itemid',30398),(28925,'history_text','itemid',30398),(28926,'history_log','itemid',30398),(28927,'history_uint','itemid',30398),(28928,'history_str','itemid',30398),(28929,'history','itemid',30398),(28930,'events','itemid',30398),(28931,'trends','itemid',30399),(28932,'trends_uint','itemid',30399),(28933,'history_text','itemid',30399),(28934,'history_log','itemid',30399),(28935,'history_uint','itemid',30399),(28936,'history_str','itemid',30399),(28937,'history','itemid',30399),(28938,'events','itemid',30399),(28939,'trends','itemid',30400),(28940,'trends_uint','itemid',30400),(28941,'history_text','itemid',30400),(28942,'history_log','itemid',30400),(28943,'history_uint','itemid',30400),(28944,'history_str','itemid',30400),(28945,'history','itemid',30400),(28946,'events','itemid',30400),(28947,'trends','itemid',30401),(28948,'trends_uint','itemid',30401),(28949,'history_text','itemid',30401),(28950,'history_log','itemid',30401),(28951,'history_uint','itemid',30401),(28952,'history_str','itemid',30401),(28953,'history','itemid',30401),(28954,'events','itemid',30401),(28955,'trends','itemid',30402),(28956,'trends_uint','itemid',30402),(28957,'history_text','itemid',30402),(28958,'history_log','itemid',30402),(28959,'history_uint','itemid',30402),(28960,'history_str','itemid',30402),(28961,'history','itemid',30402),(28962,'events','itemid',30402),(28963,'trends','itemid',30403),(28964,'trends_uint','itemid',30403),(28965,'history_text','itemid',30403),(28966,'history_log','itemid',30403),(28967,'history_uint','itemid',30403),(28968,'history_str','itemid',30403),(28969,'history','itemid',30403),(28970,'events','itemid',30403),(28971,'trends','itemid',30404),(28972,'trends_uint','itemid',30404),(28973,'history_text','itemid',30404),(28974,'history_log','itemid',30404),(28975,'history_uint','itemid',30404),(28976,'history_str','itemid',30404),(28977,'history','itemid',30404),(28978,'events','itemid',30404),(28979,'trends','itemid',30405),(28980,'trends_uint','itemid',30405),(28981,'history_text','itemid',30405),(28982,'history_log','itemid',30405),(28983,'history_uint','itemid',30405),(28984,'history_str','itemid',30405),(28985,'history','itemid',30405),(28986,'events','itemid',30405),(28987,'trends','itemid',30406),(28988,'trends_uint','itemid',30406),(28989,'history_text','itemid',30406),(28990,'history_log','itemid',30406),(28991,'history_uint','itemid',30406),(28992,'history_str','itemid',30406),(28993,'history','itemid',30406),(28994,'events','itemid',30406),(28995,'trends','itemid',30407),(28996,'trends_uint','itemid',30407),(28997,'history_text','itemid',30407),(28998,'history_log','itemid',30407),(28999,'history_uint','itemid',30407),(29000,'history_str','itemid',30407),(29001,'history','itemid',30407),(29002,'events','itemid',30407),(29003,'trends','itemid',30408),(29004,'trends_uint','itemid',30408),(29005,'history_text','itemid',30408),(29006,'history_log','itemid',30408),(29007,'history_uint','itemid',30408),(29008,'history_str','itemid',30408),(29009,'history','itemid',30408),(29010,'events','itemid',30408),(29011,'trends','itemid',30409),(29012,'trends_uint','itemid',30409),(29013,'history_text','itemid',30409),(29014,'history_log','itemid',30409),(29015,'history_uint','itemid',30409),(29016,'history_str','itemid',30409),(29017,'history','itemid',30409),(29018,'events','itemid',30409),(29019,'trends','itemid',30410),(29020,'trends_uint','itemid',30410),(29021,'history_text','itemid',30410),(29022,'history_log','itemid',30410),(29023,'history_uint','itemid',30410),(29024,'history_str','itemid',30410),(29025,'history','itemid',30410),(29026,'events','itemid',30410),(29027,'trends','itemid',30411),(29028,'trends_uint','itemid',30411),(29029,'history_text','itemid',30411),(29030,'history_log','itemid',30411),(29031,'history_uint','itemid',30411),(29032,'history_str','itemid',30411),(29033,'history','itemid',30411),(29034,'events','itemid',30411),(29035,'trends','itemid',30418),(29036,'trends_uint','itemid',30418),(29037,'history_text','itemid',30418),(29038,'history_log','itemid',30418),(29039,'history_uint','itemid',30418),(29040,'history_str','itemid',30418),(29041,'history','itemid',30418),(29042,'events','itemid',30418),(29043,'trends','itemid',30419),(29044,'trends_uint','itemid',30419),(29045,'history_text','itemid',30419),(29046,'history_log','itemid',30419),(29047,'history_uint','itemid',30419),(29048,'history_str','itemid',30419),(29049,'history','itemid',30419),(29050,'events','itemid',30419),(29051,'trends','itemid',30420),(29052,'trends_uint','itemid',30420),(29053,'history_text','itemid',30420),(29054,'history_log','itemid',30420),(29055,'history_uint','itemid',30420),(29056,'history_str','itemid',30420),(29057,'history','itemid',30420),(29058,'events','itemid',30420),(29059,'trends','itemid',30421),(29060,'trends_uint','itemid',30421),(29061,'history_text','itemid',30421),(29062,'history_log','itemid',30421),(29063,'history_uint','itemid',30421),(29064,'history_str','itemid',30421),(29065,'history','itemid',30421),(29066,'events','itemid',30421),(29067,'trends','itemid',30667),(29068,'trends_uint','itemid',30667),(29069,'history_text','itemid',30667),(29070,'history_log','itemid',30667),(29071,'history_uint','itemid',30667),(29072,'history_str','itemid',30667),(29073,'history','itemid',30667),(29074,'events','itemid',30667),(29075,'trends','itemid',30668),(29076,'trends_uint','itemid',30668),(29077,'history_text','itemid',30668),(29078,'history_log','itemid',30668),(29079,'history_uint','itemid',30668),(29080,'history_str','itemid',30668),(29081,'history','itemid',30668),(29082,'events','itemid',30668),(29083,'trends','itemid',30669),(29084,'trends_uint','itemid',30669),(29085,'history_text','itemid',30669),(29086,'history_log','itemid',30669),(29087,'history_uint','itemid',30669),(29088,'history_str','itemid',30669),(29089,'history','itemid',30669),(29090,'events','itemid',30669),(29091,'trends','itemid',30684),(29092,'trends_uint','itemid',30684),(29093,'history_text','itemid',30684),(29094,'history_log','itemid',30684),(29095,'history_uint','itemid',30684),(29096,'history_str','itemid',30684),(29097,'history','itemid',30684),(29098,'events','itemid',30684),(29099,'trends','itemid',30685),(29100,'trends_uint','itemid',30685),(29101,'history_text','itemid',30685),(29102,'history_log','itemid',30685),(29103,'history_uint','itemid',30685),(29104,'history_str','itemid',30685),(29105,'history','itemid',30685),(29106,'events','itemid',30685),(29107,'trends','itemid',30695),(29108,'trends_uint','itemid',30695),(29109,'history_text','itemid',30695),(29110,'history_log','itemid',30695),(29111,'history_uint','itemid',30695),(29112,'history_str','itemid',30695),(29113,'history','itemid',30695),(29114,'events','itemid',30695),(29115,'trends','itemid',30696),(29116,'trends_uint','itemid',30696),(29117,'history_text','itemid',30696),(29118,'history_log','itemid',30696),(29119,'history_uint','itemid',30696),(29120,'history_str','itemid',30696),(29121,'history','itemid',30696),(29122,'events','itemid',30696),(29123,'trends','itemid',30697),(29124,'trends_uint','itemid',30697),(29125,'history_text','itemid',30697),(29126,'history_log','itemid',30697),(29127,'history_uint','itemid',30697),(29128,'history_str','itemid',30697),(29129,'history','itemid',30697),(29130,'events','itemid',30697),(29131,'trends','itemid',30698),(29132,'trends_uint','itemid',30698),(29133,'history_text','itemid',30698),(29134,'history_log','itemid',30698),(29135,'history_uint','itemid',30698),(29136,'history_str','itemid',30698),(29137,'history','itemid',30698),(29138,'events','itemid',30698),(29139,'trends','itemid',30699),(29140,'trends_uint','itemid',30699),(29141,'history_text','itemid',30699),(29142,'history_log','itemid',30699),(29143,'history_uint','itemid',30699),(29144,'history_str','itemid',30699),(29145,'history','itemid',30699),(29146,'events','itemid',30699),(29147,'trends','itemid',30700),(29148,'trends_uint','itemid',30700),(29149,'history_text','itemid',30700),(29150,'history_log','itemid',30700),(29151,'history_uint','itemid',30700),(29152,'history_str','itemid',30700),(29153,'history','itemid',30700),(29154,'events','itemid',30700),(29155,'trends','itemid',30701),(29156,'trends_uint','itemid',30701),(29157,'history_text','itemid',30701),(29158,'history_log','itemid',30701),(29159,'history_uint','itemid',30701),(29160,'history_str','itemid',30701),(29161,'history','itemid',30701),(29162,'events','itemid',30701),(29163,'trends','itemid',30702),(29164,'trends_uint','itemid',30702),(29165,'history_text','itemid',30702),(29166,'history_log','itemid',30702),(29167,'history_uint','itemid',30702),(29168,'history_str','itemid',30702),(29169,'history','itemid',30702),(29170,'events','itemid',30702),(29171,'trends','itemid',30703),(29172,'trends_uint','itemid',30703),(29173,'history_text','itemid',30703),(29174,'history_log','itemid',30703),(29175,'history_uint','itemid',30703),(29176,'history_str','itemid',30703),(29177,'history','itemid',30703),(29178,'events','itemid',30703),(29179,'trends','itemid',30704),(29180,'trends_uint','itemid',30704),(29181,'history_text','itemid',30704),(29182,'history_log','itemid',30704),(29183,'history_uint','itemid',30704),(29184,'history_str','itemid',30704),(29185,'history','itemid',30704),(29186,'events','itemid',30704),(29187,'trends','itemid',30705),(29188,'trends_uint','itemid',30705),(29189,'history_text','itemid',30705),(29190,'history_log','itemid',30705),(29191,'history_uint','itemid',30705),(29192,'history_str','itemid',30705),(29193,'history','itemid',30705),(29194,'events','itemid',30705),(29195,'trends','itemid',30706),(29196,'trends_uint','itemid',30706),(29197,'history_text','itemid',30706),(29198,'history_log','itemid',30706),(29199,'history_uint','itemid',30706),(29200,'history_str','itemid',30706),(29201,'history','itemid',30706),(29202,'events','itemid',30706),(29203,'trends','itemid',30707),(29204,'trends_uint','itemid',30707),(29205,'history_text','itemid',30707),(29206,'history_log','itemid',30707),(29207,'history_uint','itemid',30707),(29208,'history_str','itemid',30707),(29209,'history','itemid',30707),(29210,'events','itemid',30707),(29211,'trends','itemid',30708),(29212,'trends_uint','itemid',30708),(29213,'history_text','itemid',30708),(29214,'history_log','itemid',30708),(29215,'history_uint','itemid',30708),(29216,'history_str','itemid',30708),(29217,'history','itemid',30708),(29218,'events','itemid',30708),(29219,'trends','itemid',30709),(29220,'trends_uint','itemid',30709),(29221,'history_text','itemid',30709),(29222,'history_log','itemid',30709),(29223,'history_uint','itemid',30709),(29224,'history_str','itemid',30709),(29225,'history','itemid',30709),(29226,'events','itemid',30709),(29227,'trends','itemid',30710),(29228,'trends_uint','itemid',30710),(29229,'history_text','itemid',30710),(29230,'history_log','itemid',30710),(29231,'history_uint','itemid',30710),(29232,'history_str','itemid',30710),(29233,'history','itemid',30710),(29234,'events','itemid',30710),(29235,'trends','itemid',30711),(29236,'trends_uint','itemid',30711),(29237,'history_text','itemid',30711),(29238,'history_log','itemid',30711),(29239,'history_uint','itemid',30711),(29240,'history_str','itemid',30711),(29241,'history','itemid',30711),(29242,'events','itemid',30711),(29243,'trends','itemid',30712),(29244,'trends_uint','itemid',30712),(29245,'history_text','itemid',30712),(29246,'history_log','itemid',30712),(29247,'history_uint','itemid',30712),(29248,'history_str','itemid',30712),(29249,'history','itemid',30712),(29250,'events','itemid',30712),(29251,'trends','itemid',30713),(29252,'trends_uint','itemid',30713),(29253,'history_text','itemid',30713),(29254,'history_log','itemid',30713),(29255,'history_uint','itemid',30713),(29256,'history_str','itemid',30713),(29257,'history','itemid',30713),(29258,'events','itemid',30713),(29259,'trends','itemid',30714),(29260,'trends_uint','itemid',30714),(29261,'history_text','itemid',30714),(29262,'history_log','itemid',30714),(29263,'history_uint','itemid',30714),(29264,'history_str','itemid',30714),(29265,'history','itemid',30714),(29266,'events','itemid',30714),(29267,'trends','itemid',30715),(29268,'trends_uint','itemid',30715),(29269,'history_text','itemid',30715),(29270,'history_log','itemid',30715),(29271,'history_uint','itemid',30715),(29272,'history_str','itemid',30715),(29273,'history','itemid',30715),(29274,'events','itemid',30715),(29275,'trends','itemid',30716),(29276,'trends_uint','itemid',30716),(29277,'history_text','itemid',30716),(29278,'history_log','itemid',30716),(29279,'history_uint','itemid',30716),(29280,'history_str','itemid',30716),(29281,'history','itemid',30716),(29282,'events','itemid',30716),(29283,'trends','itemid',30717),(29284,'trends_uint','itemid',30717),(29285,'history_text','itemid',30717),(29286,'history_log','itemid',30717),(29287,'history_uint','itemid',30717),(29288,'history_str','itemid',30717),(29289,'history','itemid',30717),(29290,'events','itemid',30717),(29291,'trends','itemid',30718),(29292,'trends_uint','itemid',30718),(29293,'history_text','itemid',30718),(29294,'history_log','itemid',30718),(29295,'history_uint','itemid',30718),(29296,'history_str','itemid',30718),(29297,'history','itemid',30718),(29298,'events','itemid',30718),(29299,'trends','itemid',30719),(29300,'trends_uint','itemid',30719),(29301,'history_text','itemid',30719),(29302,'history_log','itemid',30719),(29303,'history_uint','itemid',30719),(29304,'history_str','itemid',30719),(29305,'history','itemid',30719),(29306,'events','itemid',30719),(29307,'trends','itemid',30720),(29308,'trends_uint','itemid',30720),(29309,'history_text','itemid',30720),(29310,'history_log','itemid',30720),(29311,'history_uint','itemid',30720),(29312,'history_str','itemid',30720),(29313,'history','itemid',30720),(29314,'events','itemid',30720),(29315,'trends','itemid',30721),(29316,'trends_uint','itemid',30721),(29317,'history_text','itemid',30721),(29318,'history_log','itemid',30721),(29319,'history_uint','itemid',30721),(29320,'history_str','itemid',30721),(29321,'history','itemid',30721),(29322,'events','itemid',30721),(29323,'trends','itemid',30722),(29324,'trends_uint','itemid',30722),(29325,'history_text','itemid',30722),(29326,'history_log','itemid',30722),(29327,'history_uint','itemid',30722),(29328,'history_str','itemid',30722),(29329,'history','itemid',30722),(29330,'events','itemid',30722),(29331,'trends','itemid',30723),(29332,'trends_uint','itemid',30723),(29333,'history_text','itemid',30723),(29334,'history_log','itemid',30723),(29335,'history_uint','itemid',30723),(29336,'history_str','itemid',30723),(29337,'history','itemid',30723),(29338,'events','itemid',30723),(29339,'trends','itemid',30724),(29340,'trends_uint','itemid',30724),(29341,'history_text','itemid',30724),(29342,'history_log','itemid',30724),(29343,'history_uint','itemid',30724),(29344,'history_str','itemid',30724),(29345,'history','itemid',30724),(29346,'events','itemid',30724),(29347,'trends','itemid',30725),(29348,'trends_uint','itemid',30725),(29349,'history_text','itemid',30725),(29350,'history_log','itemid',30725),(29351,'history_uint','itemid',30725),(29352,'history_str','itemid',30725),(29353,'history','itemid',30725),(29354,'events','itemid',30725),(29355,'trends','itemid',30726),(29356,'trends_uint','itemid',30726),(29357,'history_text','itemid',30726),(29358,'history_log','itemid',30726),(29359,'history_uint','itemid',30726),(29360,'history_str','itemid',30726),(29361,'history','itemid',30726),(29362,'events','itemid',30726),(29363,'trends','itemid',30727),(29364,'trends_uint','itemid',30727),(29365,'history_text','itemid',30727),(29366,'history_log','itemid',30727),(29367,'history_uint','itemid',30727),(29368,'history_str','itemid',30727),(29369,'history','itemid',30727),(29370,'events','itemid',30727),(29371,'trends','itemid',30728),(29372,'trends_uint','itemid',30728),(29373,'history_text','itemid',30728),(29374,'history_log','itemid',30728),(29375,'history_uint','itemid',30728),(29376,'history_str','itemid',30728),(29377,'history','itemid',30728),(29378,'events','itemid',30728),(29379,'trends','itemid',30729),(29380,'trends_uint','itemid',30729),(29381,'history_text','itemid',30729),(29382,'history_log','itemid',30729),(29383,'history_uint','itemid',30729),(29384,'history_str','itemid',30729),(29385,'history','itemid',30729),(29386,'events','itemid',30729),(29387,'trends','itemid',30730),(29388,'trends_uint','itemid',30730),(29389,'history_text','itemid',30730),(29390,'history_log','itemid',30730),(29391,'history_uint','itemid',30730),(29392,'history_str','itemid',30730),(29393,'history','itemid',30730),(29394,'events','itemid',30730),(29395,'trends','itemid',30731),(29396,'trends_uint','itemid',30731),(29397,'history_text','itemid',30731),(29398,'history_log','itemid',30731),(29399,'history_uint','itemid',30731),(29400,'history_str','itemid',30731),(29401,'history','itemid',30731),(29402,'events','itemid',30731),(29403,'trends','itemid',30732),(29404,'trends_uint','itemid',30732),(29405,'history_text','itemid',30732),(29406,'history_log','itemid',30732),(29407,'history_uint','itemid',30732),(29408,'history_str','itemid',30732),(29409,'history','itemid',30732),(29410,'events','itemid',30732),(29411,'trends','itemid',30733),(29412,'trends_uint','itemid',30733),(29413,'history_text','itemid',30733),(29414,'history_log','itemid',30733),(29415,'history_uint','itemid',30733),(29416,'history_str','itemid',30733),(29417,'history','itemid',30733),(29418,'events','itemid',30733),(29419,'trends','itemid',30734),(29420,'trends_uint','itemid',30734),(29421,'history_text','itemid',30734),(29422,'history_log','itemid',30734),(29423,'history_uint','itemid',30734),(29424,'history_str','itemid',30734),(29425,'history','itemid',30734),(29426,'events','itemid',30734),(29427,'trends','itemid',30735),(29428,'trends_uint','itemid',30735),(29429,'history_text','itemid',30735),(29430,'history_log','itemid',30735),(29431,'history_uint','itemid',30735),(29432,'history_str','itemid',30735),(29433,'history','itemid',30735),(29434,'events','itemid',30735),(29435,'trends','itemid',30736),(29436,'trends_uint','itemid',30736),(29437,'history_text','itemid',30736),(29438,'history_log','itemid',30736),(29439,'history_uint','itemid',30736),(29440,'history_str','itemid',30736),(29441,'history','itemid',30736),(29442,'events','itemid',30736),(29443,'trends','itemid',30743),(29444,'trends_uint','itemid',30743),(29445,'history_text','itemid',30743),(29446,'history_log','itemid',30743),(29447,'history_uint','itemid',30743),(29448,'history_str','itemid',30743),(29449,'history','itemid',30743),(29450,'events','itemid',30743),(29451,'trends','itemid',30744),(29452,'trends_uint','itemid',30744),(29453,'history_text','itemid',30744),(29454,'history_log','itemid',30744),(29455,'history_uint','itemid',30744),(29456,'history_str','itemid',30744),(29457,'history','itemid',30744),(29458,'events','itemid',30744),(29459,'trends','itemid',30745),(29460,'trends_uint','itemid',30745),(29461,'history_text','itemid',30745),(29462,'history_log','itemid',30745),(29463,'history_uint','itemid',30745),(29464,'history_str','itemid',30745),(29465,'history','itemid',30745),(29466,'events','itemid',30745),(29467,'trends','itemid',30746),(29468,'trends_uint','itemid',30746),(29469,'history_text','itemid',30746),(29470,'history_log','itemid',30746),(29471,'history_uint','itemid',30746),(29472,'history_str','itemid',30746),(29473,'history','itemid',30746),(29474,'events','itemid',30746);
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` varchar(255) NOT NULL DEFAULT '15s',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep_field`
--

DROP TABLE IF EXISTS `httpstep_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep_field` (
  `httpstep_fieldid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httpstep_fieldid`),
  KEY `httpstep_field_1` (`httpstepid`),
  CONSTRAINT `c_httpstep_field_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep_field`
--

LOCK TABLES `httpstep_field` WRITE;
/*!40000 ALTER TABLE `httpstep_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(255) NOT NULL DEFAULT '1m',
  `status` int(11) NOT NULL DEFAULT '0',
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest_field`
--

DROP TABLE IF EXISTS `httptest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest_field` (
  `httptest_fieldid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httptest_fieldid`),
  KEY `httptest_field_1` (`httptestid`),
  CONSTRAINT `c_httptest_field_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest_field`
--

LOCK TABLES `httptest_field` WRITE;
/*!40000 ALTER TABLE `httptest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('actions','actionid',8),('applications','applicationid',1094),('application_template','application_templateid',665),('auditlog','auditid',2379),('auditlog_details','auditdetailid',105),('conditions','conditionid',10),('dchecks','dcheckid',4),('drules','druleid',4),('functions','functionid',14697),('graphs','graphid',1199),('graphs_items','gitemid',3820),('groups','groupid',23),('hostmacro','hostmacroid',20),('hosts','hostid',10177),('hosts_groups','hostgroupid',312),('hosts_templates','hosttemplateid',115),('housekeeper','housekeeperid',29474),('interface','interfaceid',47),('items','itemid',30799),('items_applications','itemappid',12311),('item_condition','item_conditionid',134),('item_discovery','itemdiscoveryid',2542),('item_preproc','item_preprocid',1285),('operations','operationid',19),('opgroup','opgroupid',5),('opmessage_grp','opmessage_grpid',6),('opmessage_usr','opmessage_usrid',2),('optemplate','optemplateid',6),('profiles','profileid',428),('screens','screenid',23),('screens_items','screenitemid',94),('triggers','triggerid',15017),('trigger_depends','triggerdepid',51);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(64) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
INSERT INTO `item_application_prototype` VALUES (1,1,23666);
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,22444,8,'{#IFNAME}','@Network interfaces for discovery'),(2,22450,8,'{#FSTYPE}','@File systems for discovery'),(3,22746,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(4,22867,8,'{#FSTYPE}','@File systems for discovery'),(5,22907,8,'{#FSTYPE}','@File systems for discovery'),(6,22944,8,'{#IFNAME}','@Network interfaces for discovery'),(7,22947,8,'{#FSTYPE}','@File systems for discovery'),(8,22984,8,'{#IFNAME}','@Network interfaces for discovery'),(9,22987,8,'{#FSTYPE}','@File systems for discovery'),(10,23024,8,'{#IFNAME}','@Network interfaces for discovery'),(11,23027,8,'{#FSTYPE}','@File systems for discovery'),(12,23067,8,'{#FSTYPE}','@File systems for discovery'),(13,23162,8,'{#FSTYPE}','@File systems for discovery'),(14,23163,8,'{#IFNAME}','@Network interfaces for discovery'),(15,23329,8,'{#IFNAME}','@Network interfaces for discovery'),(16,23540,8,'{#IFNAME}','@Network interfaces for discovery'),(17,22760,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(18,22767,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(21,23665,8,'{#SERVICE.NAME}','@Windows service names for discovery'),(22,23665,8,'{#SERVICE.STARTUPNAME}','@Windows service startup states for discovery'),(25,25458,8,'{#IFNAME}','@Network interfaces for discovery'),(26,25461,8,'{#FSTYPE}','@File systems for discovery'),(41,26012,8,'{#BACKUPHOST}','.*'),(42,26070,8,'{#VHOSTNAME}',''),(43,26071,8,'{#VHOSTNAME}',''),(44,26130,8,'{#DBNAME}','(zabbix|db_.*)'),(45,26131,8,'{#HOTSTANDBY}',''),(46,26132,8,'{#TABLENAME}','^public.(products|customers|sessions)$'),(47,26382,8,'{#IFNAME}','@Network interfaces for discovery'),(48,26383,8,'{#FSTYPE}','@File systems for discovery'),(49,26410,8,'{#REDISPORT}','');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (1,22446,22444,'',0,0),(3,22448,22444,'',0,0),(5,22452,22450,'',0,0),(7,22454,22450,'',0,0),(9,22456,22450,'',0,0),(11,22458,22450,'',0,0),(65,22686,22450,'',0,0),(68,22701,22700,'',0,0),(69,22702,22700,'',0,0),(70,22703,22700,'',0,0),(71,22704,22700,'',0,0),(72,22705,22700,'',0,0),(73,22706,22700,'',0,0),(74,22707,22700,'',0,0),(75,22708,22700,'',0,0),(76,22721,22720,'',0,0),(77,22722,22720,'',0,0),(78,22723,22720,'',0,0),(79,22724,22720,'',0,0),(80,22725,22720,'',0,0),(81,22726,22720,'',0,0),(82,22727,22720,'',0,0),(83,22728,22720,'',0,0),(84,22736,22735,'',0,0),(85,22737,22735,'',0,0),(86,22738,22735,'',0,0),(87,22739,22735,'',0,0),(88,22740,22735,'',0,0),(89,22741,22735,'',0,0),(90,22742,22735,'',0,0),(91,22743,22735,'',0,0),(94,22749,22746,'',0,0),(100,22755,22746,'',0,0),(101,22756,22746,'',0,0),(102,22757,22746,'',0,0),(103,22758,22746,'',0,0),(104,22759,22746,'',0,0),(105,22761,22760,'',0,0),(106,22762,22760,'',0,0),(107,22763,22760,'',0,0),(108,22764,22760,'',0,0),(109,22765,22760,'',0,0),(110,22766,22760,'',0,0),(111,22768,22767,'',0,0),(112,22769,22767,'',0,0),(113,22770,22767,'',0,0),(114,22771,22767,'',0,0),(115,22772,22767,'',0,0),(116,22773,22767,'',0,0),(117,22780,22779,'',0,0),(118,22781,22779,'',0,0),(119,22782,22779,'',0,0),(120,22783,22779,'',0,0),(121,22784,22779,'',0,0),(122,22785,22779,'',0,0),(123,22786,22779,'',0,0),(124,22787,22779,'',0,0),(128,22793,22789,'',0,0),(131,22797,22796,'',0,0),(132,22799,22798,'',0,0),(135,22868,22867,'',0,0),(136,22869,22867,'',0,0),(137,22870,22867,'',0,0),(138,22871,22867,'',0,0),(139,22872,22867,'',0,0),(142,22908,22907,'',0,0),(143,22909,22907,'',0,0),(144,22910,22907,'',0,0),(145,22911,22907,'',0,0),(146,22912,22907,'',0,0),(147,22945,22944,'',0,0),(148,22946,22944,'',0,0),(149,22948,22947,'',0,0),(150,22949,22947,'',0,0),(151,22950,22947,'',0,0),(152,22951,22947,'',0,0),(153,22952,22947,'',0,0),(154,22985,22984,'',0,0),(155,22986,22984,'',0,0),(156,22988,22987,'',0,0),(157,22989,22987,'',0,0),(158,22990,22987,'',0,0),(159,22991,22987,'',0,0),(160,22992,22987,'',0,0),(161,23025,23024,'',0,0),(162,23026,23024,'',0,0),(163,23028,23027,'',0,0),(164,23029,23027,'',0,0),(165,23030,23027,'',0,0),(166,23031,23027,'',0,0),(167,23032,23027,'',0,0),(170,23068,23067,'',0,0),(171,23069,23067,'',0,0),(172,23070,23067,'',0,0),(173,23071,23067,'',0,0),(174,23072,23067,'',0,0),(175,23164,23162,'',0,0),(176,23165,23162,'',0,0),(178,23167,23162,'',0,0),(179,23168,23162,'',0,0),(180,23169,23163,'',0,0),(181,23170,23163,'',0,0),(189,23073,23540,'',0,0),(190,23074,23540,'',0,0),(191,23075,23329,'',0,0),(192,23076,23329,'',0,0),(193,23576,23575,'',0,0),(194,23577,23575,'',0,0),(195,23578,23575,'',0,0),(196,23579,23575,'',0,0),(201,23596,23595,'',0,0),(202,23601,23599,'',0,0),(203,23602,23599,'',0,0),(204,23603,23599,'',0,0),(205,23604,23599,'',0,0),(206,23605,23600,'',0,0),(207,23606,23600,'',0,0),(208,23607,23600,'',0,0),(209,23608,23600,'',0,0),(218,23632,23631,'',0,0),(219,23633,23631,'',0,0),(220,23666,23665,'',0,0),(221,23669,23631,'',0,0),(222,23670,23631,'',0,0),(249,25459,25458,'',0,0),(250,25460,25458,'',0,0),(251,25462,25461,'',0,0),(252,25463,25461,'',0,0),(253,25464,25461,'',0,0),(254,25465,25461,'',0,0),(255,25466,25461,'',0,0),(450,25940,25939,'',0,0),(451,26013,26012,'',0,0),(452,26014,26012,'',0,0),(453,26015,26012,'',0,0),(454,26016,26012,'',0,0),(455,26017,26012,'',0,0),(456,26018,26012,'',0,0),(457,26019,26012,'',0,0),(458,26020,26012,'',0,0),(459,26021,26012,'',0,0),(460,26022,26012,'',0,0),(461,26023,26012,'',0,0),(462,26024,26012,'',0,0),(463,26025,26012,'',0,0),(464,26026,26012,'',0,0),(465,26072,26070,'',0,0),(466,26073,26070,'',0,0),(467,26074,26070,'',0,0),(468,26075,26070,'',0,0),(469,26076,26070,'',0,0),(470,26077,26070,'',0,0),(471,26078,26070,'',0,0),(472,26079,26071,'',0,0),(473,26133,26130,'',0,0),(474,26134,26131,'',0,0),(475,26135,26131,'',0,0),(476,26136,26131,'',0,0),(477,26137,26132,'',0,0),(478,26138,26132,'',0,0),(479,26139,26132,'',0,0),(480,26140,26132,'',0,0),(481,26141,26132,'',0,0),(482,26142,26132,'',0,0),(483,26143,26132,'',0,0),(484,26144,26132,'',0,0),(485,26145,26132,'',0,0),(486,26146,26132,'',0,0),(487,26147,26132,'',0,0),(488,26148,26132,'',0,0),(489,26149,26132,'',0,0),(490,26150,26132,'',0,0),(491,26151,26132,'',0,0),(492,26152,26132,'',0,0),(493,26153,26132,'',0,0),(494,26154,26132,'',0,0),(495,26155,26132,'',0,0),(496,26156,26132,'',0,0),(497,26157,26132,'',0,0),(498,26158,26132,'',0,0),(499,26159,26132,'',0,0),(500,26160,26132,'',0,0),(501,26161,26132,'',0,0),(502,26384,26381,'',0,0),(503,26385,26381,'',0,0),(504,26386,26381,'',0,0),(505,26387,26381,'',0,0),(506,26388,26381,'',0,0),(507,26389,26381,'',0,0),(508,26390,26381,'',0,0),(509,26391,26381,'',0,0),(510,26392,26381,'',0,0),(511,26393,26381,'',0,0),(512,26394,26381,'',0,0),(513,26395,26381,'',0,0),(514,26396,26381,'',0,0),(515,26397,26382,'',0,0),(516,26398,26382,'',0,0),(517,26399,26382,'',0,0),(518,26400,26382,'',0,0),(519,26401,26382,'',0,0),(520,26402,26382,'',0,0),(521,26403,26382,'',0,0),(522,26404,26382,'',0,0),(523,26405,26383,'',0,0),(524,26406,26383,'',0,0),(525,26407,26383,'',0,0),(526,26408,26383,'',0,0),(527,26409,26383,'',0,0),(528,26411,26410,'',0,0),(529,26412,26410,'',0,0),(530,26413,26410,'',0,0),(531,26414,26410,'',0,0),(532,26415,26410,'',0,0),(533,26416,26410,'',0,0),(534,26417,26410,'',0,0),(535,26418,26410,'',0,0),(536,26419,26410,'',0,0),(537,26420,26410,'',0,0),(538,26421,26410,'',0,0),(539,26422,26410,'',0,0),(540,26423,26410,'',0,0),(541,26424,26410,'',0,0),(542,26425,26410,'',0,0),(543,26426,26410,'',0,0),(544,26427,26410,'',0,0),(545,26428,26410,'',0,0),(546,26429,26410,'',0,0),(547,26430,26410,'',0,0),(548,26431,26410,'',0,0),(549,26432,26410,'',0,0),(550,26433,26410,'',0,0),(551,26434,26410,'',0,0),(552,26435,26410,'',0,0),(553,26436,26410,'',0,0),(554,26437,26410,'',0,0),(555,26438,26410,'',0,0),(556,26439,26410,'',0,0),(557,26440,26410,'',0,0),(558,26442,26441,'',0,0),(559,26443,26441,'',0,0),(560,26444,26441,'',0,0),(561,26445,26441,'',0,0),(562,26446,26441,'',0,0),(563,26447,26441,'',0,0),(564,26448,26441,'',0,0),(565,26449,26441,'',0,0),(566,26450,26441,'',0,0),(567,26451,26441,'',0,0),(568,26452,26441,'',0,0),(569,26453,26441,'',0,0),(570,26454,26441,'',0,0),(571,26455,26441,'',0,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_preproc`
--

DROP TABLE IF EXISTS `item_preproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_preproc` (
  `item_preprocid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_preprocid`),
  KEY `item_preproc_1` (`itemid`,`step`),
  CONSTRAINT `c_item_preproc_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_preproc`
--

LOCK TABLES `item_preproc` WRITE;
/*!40000 ALTER TABLE `item_preproc` DISABLE KEYS */;
INSERT INTO `item_preproc` VALUES (1,22187,1,10,''),(2,22196,1,10,''),(3,22199,1,10,''),(4,22446,1,10,''),(5,22446,2,1,'8'),(6,22448,1,10,''),(7,22448,2,1,'8'),(8,22680,1,10,''),(9,22683,1,10,''),(10,22701,1,10,''),(11,22701,2,1,'8'),(12,22702,1,10,''),(13,22702,2,1,'8'),(14,22706,1,10,''),(15,22707,1,10,''),(16,22714,1,1,'0.01'),(17,22719,1,1,'0.01'),(18,22724,1,10,''),(19,22725,1,10,''),(20,22725,2,1,'8'),(21,22727,1,10,''),(22,22728,1,10,''),(23,22728,2,1,'8'),(24,22734,1,1,'0.01'),(25,22739,1,10,''),(26,22740,1,10,''),(27,22740,2,1,'8'),(28,22742,1,10,''),(29,22743,1,10,''),(30,22743,2,1,'8'),(31,22778,1,1,'0.01'),(32,22783,1,10,''),(33,22784,1,10,''),(34,22784,2,1,'8'),(35,22786,1,10,''),(36,22787,1,10,''),(37,22787,2,1,'8'),(38,22822,1,10,''),(39,22823,1,10,''),(40,22824,1,10,''),(41,22825,1,10,''),(42,22826,1,10,''),(43,22827,1,10,''),(44,22828,1,10,''),(45,22829,1,10,''),(46,22830,1,10,''),(47,22831,1,10,''),(48,22840,1,10,''),(49,22844,1,10,''),(50,22880,1,10,''),(51,22884,1,10,''),(52,22920,1,10,''),(53,22924,1,10,''),(54,22945,1,10,''),(55,22945,2,1,'8'),(56,22946,1,10,''),(57,22946,2,1,'8'),(58,22985,1,10,''),(59,22985,2,1,'8'),(60,22986,1,10,''),(61,22986,2,1,'8'),(62,23000,1,10,''),(63,23004,1,10,''),(64,23025,1,10,''),(65,23025,2,1,'8'),(66,23026,1,10,''),(67,23026,2,1,'8'),(68,23073,1,10,''),(69,23073,2,1,'8'),(70,23074,1,10,''),(71,23074,2,1,'8'),(72,23075,1,10,''),(73,23075,2,1,'8'),(74,23076,1,10,''),(75,23076,2,1,'8'),(76,23077,1,10,''),(77,23077,2,1,'8'),(78,23078,1,10,''),(79,23078,2,1,'8'),(80,23169,1,10,''),(81,23169,2,1,'8'),(82,23170,1,10,''),(83,23170,2,1,'8'),(84,23172,1,1,'0.001'),(85,23176,1,1,'0.001'),(86,23177,1,10,''),(87,23178,1,1,'0.001'),(88,23179,1,10,''),(89,23180,1,1,'0.001'),(90,23181,1,10,''),(91,23182,1,1,'0.001'),(92,23183,1,10,''),(93,23184,1,1,'0.001'),(94,23185,1,1,'0.001'),(95,23186,1,10,''),(96,23187,1,10,''),(97,23188,1,1,'0.001'),(98,23219,1,10,''),(99,23220,1,10,''),(100,23221,1,10,''),(101,23223,1,1,'0.001'),(102,23224,1,10,''),(103,23228,1,10,''),(104,23229,1,10,''),(105,23230,1,10,''),(106,23232,1,1,'0.001'),(107,23233,1,10,''),(108,23237,1,10,''),(109,23238,1,10,''),(110,23239,1,10,''),(111,23240,1,1,'0.001'),(112,23241,1,10,''),(113,23247,1,10,''),(115,23340,1,10,''),(118,23637,1,1,'100'),(119,25434,1,10,''),(120,25438,1,10,''),(121,25459,1,10,''),(122,25459,2,1,'8'),(123,25460,1,10,''),(124,25460,2,1,'8'),(290,25980,1,1,'1024'),(291,25999,2,1,'1024'),(292,26029,1,9,''),(293,26037,2,9,''),(294,26042,3,10,''),(295,26043,4,10,''),(296,26044,5,9,''),(297,26050,1,1,'100'),(298,26056,2,10,''),(299,26057,3,10,''),(300,26060,4,1,'100'),(301,26068,5,1,'100'),(302,26076,1,10,''),(303,26077,2,10,''),(304,26078,3,10,''),(359,26080,1,10,''),(360,26080,2,1,'8192'),(361,26082,3,10,''),(362,26083,4,10,''),(363,26084,5,10,''),(364,26085,6,10,''),(365,26086,7,10,''),(366,26087,8,10,''),(367,26088,9,10,''),(368,26092,10,9,''),(369,26102,11,9,''),(370,26103,12,9,''),(371,26104,13,9,''),(372,26105,14,10,''),(373,26105,15,1,'8192'),(374,26106,16,1,'8192'),(375,26107,17,9,''),(376,26108,18,10,''),(377,26108,19,1,'8192'),(378,26109,20,10,''),(379,26109,21,1,'8192'),(380,26110,22,9,''),(381,26111,23,9,''),(382,26112,24,9,''),(383,26113,25,9,''),(384,26114,26,9,''),(385,26115,27,1,'8192'),(386,26116,28,1,'8192'),(387,26117,29,1,'8192'),(388,26118,30,9,''),(389,26127,31,10,''),(390,26128,32,10,''),(391,26138,1,10,''),(392,26139,2,9,''),(393,26140,3,10,''),(394,26141,4,10,''),(395,26142,5,10,''),(396,26143,6,10,''),(397,26144,7,10,''),(398,26145,8,9,''),(399,26146,9,10,''),(400,26147,10,10,''),(401,26148,11,10,''),(402,26149,12,9,''),(403,26151,13,9,''),(404,26152,14,10,''),(405,26153,15,9,''),(406,26154,16,10,''),(407,26155,17,10,''),(408,26156,18,10,''),(409,26157,19,10,''),(410,26158,20,9,''),(411,26159,21,9,''),(412,26160,22,9,''),(413,26232,1,9,''),(414,26244,1,9,''),(415,26247,1,6,''),(416,26251,1,9,''),(417,26253,2,9,''),(418,26256,3,9,''),(419,26263,1,10,''),(420,26264,2,10,''),(421,26266,3,9,''),(422,26267,4,9,''),(423,26269,5,10,''),(424,26270,6,10,''),(425,26271,7,10,''),(426,26272,8,10,''),(427,26277,9,10,''),(428,26278,10,10,''),(429,26279,11,10,''),(430,25944,1,10,''),(431,25945,2,10,''),(432,25946,3,10,''),(433,25947,4,10,''),(434,25948,5,10,''),(435,25949,6,10,''),(436,25950,7,10,''),(437,25951,8,10,''),(438,25952,9,10,''),(439,25953,10,10,''),(441,26345,1,10,''),(442,26378,2,10,''),(443,26397,1,10,''),(444,26398,2,10,''),(445,26398,3,1,'8'),(446,26399,4,10,''),(447,26400,5,10,''),(448,26400,6,1,'8'),(449,26402,7,10,''),(450,26403,8,10,''),(451,26404,9,10,''),(452,26428,1,10,''),(453,26429,2,10,''),(454,26442,1,10,''),(455,26443,2,10,''),(456,26444,3,10,''),(457,26445,4,10,''),(458,26449,5,10,''),(459,26450,6,10,'');
/*!40000 ALTER TABLE `item_preproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(512) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(1024) NOT NULL DEFAULT '0',
  `history` varchar(255) NOT NULL DEFAULT '90d',
  `trends` varchar(255) NOT NULL DEFAULT '365d',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(255) NOT NULL DEFAULT '30d',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `jmx_endpoint` varchar(255) NOT NULL DEFAULT '',
  `master_itemid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  KEY `items_7` (`master_itemid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_5` FOREIGN KEY (`master_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (10009,7,'','',10001,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'0',0,0,0,'',0,'',NULL),(10010,7,'','',10001,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(10013,7,'','',10001,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'0',0,0,0,'',0,'',NULL),(10014,7,'','',10001,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10016,7,'','',10001,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'0',0,0,0,'',0,'',NULL),(10019,7,'','',10001,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10020,7,'','',10001,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(10025,7,'','',10001,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10026,7,'','',10001,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10030,7,'','',10001,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10055,7,'','',10001,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0,'',NULL),(10056,7,'','',10001,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0,'',NULL),(10057,7,'','',10001,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'0',0,0,0,'',0,'',NULL),(10058,7,'','',10001,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'0',0,0,0,'',0,'',NULL),(10059,7,'','',10001,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17318,7,'','',10001,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17350,7,'','',10001,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17352,7,'','',10001,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17354,7,'','',10001,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'0',0,0,0,'',0,'',NULL),(17356,7,'','',10001,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'0',0,0,0,'',0,'',NULL),(17358,7,'','',10001,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'0',0,0,0,'',0,'',NULL),(17360,7,'','',10001,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'0',0,0,0,'',0,'',NULL),(17362,7,'','',10001,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'0',0,0,0,'',0,'',NULL),(22181,7,'','',10001,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'0',0,0,0,'',0,'',NULL),(22183,5,'','',10047,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22185,5,'','',10047,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22187,5,'','',10047,'Values processed by Zabbix server per second','zabbix[wcache,values]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22189,5,'','',10047,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22191,5,'','',10047,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22196,5,'','',10047,'Zabbix value cache hits','zabbix[vcache,cache,hits]','1m','1w','365d',0,0,'','vps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22199,5,'','',10047,'Zabbix value cache misses','zabbix[vcache,cache,misses]','1m','1w','365d',0,0,'','vps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22219,5,'','',10047,'Zabbix queue over $2','zabbix[queue,10m]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22231,7,'','',10050,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22232,7,'','',10050,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22396,5,'','',10047,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22399,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22400,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22401,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22402,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22404,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22406,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22408,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22410,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22412,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22414,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22416,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22418,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22420,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22422,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22424,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22426,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22430,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22444,7,'','',10001,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22446,7,'','',10001,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22448,7,'','',10001,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22450,7,'','',10001,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22452,7,'','',10001,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22454,7,'','',10001,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22456,7,'','',10001,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22458,7,'','',10001,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22665,7,'','',10001,'CPU $2 time','system.cpu.util[,steal]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'0',0,0,0,'',0,'',NULL),(22668,7,'','',10001,'CPU $2 time','system.cpu.util[,softirq]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing software interrupts.',0,'0',0,0,0,'',0,'',NULL),(22671,7,'','',10001,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'0',0,0,0,'',0,'',NULL),(22674,7,'','',10001,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(22677,7,'','',10001,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(22680,7,'','',10001,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22683,7,'','',10001,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22686,7,'','',10001,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22689,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22700,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10060,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22701,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10060,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22702,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10060,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22703,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10060,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22704,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10060,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22705,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10060,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22706,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10060,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22707,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10060,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22708,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10060,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22709,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10060,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22710,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10065,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22711,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10065,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22712,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10065,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22713,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10065,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22714,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10065,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22715,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10066,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22716,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10066,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22717,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10066,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22718,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10066,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22719,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10066,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22720,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10066,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22721,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10066,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22722,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10066,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22723,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10066,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22724,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10066,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22725,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10066,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22726,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10066,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22727,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10066,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22728,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10066,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22729,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10066,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22730,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10067,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22731,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10067,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22732,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10067,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22733,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10067,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22734,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10067,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22735,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10067,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22736,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10067,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22737,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10067,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22738,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10067,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22739,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10067,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22740,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10067,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22741,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10067,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22742,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10067,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22743,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10067,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22744,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10067,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22746,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10068,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22749,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10068,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22755,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10068,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22756,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10068,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22757,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10068,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22758,15,'','',10068,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22759,15,'','',10068,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22760,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10067,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22746,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22761,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10067,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22755,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22762,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10067,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22749,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22763,15,'','',10067,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22758,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22764,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10067,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',22756,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22765,15,'','',10067,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',22759,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22766,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10067,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',22757,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22767,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10069,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22746,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22768,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10069,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22755,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22769,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10069,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22749,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22770,15,'','',10069,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22758,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22771,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10069,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',22756,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22772,15,'','',10069,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',22759,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22773,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10069,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',22757,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22774,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10069,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22775,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10069,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22776,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10069,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22777,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10069,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22778,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10069,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22779,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10069,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22780,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10069,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22781,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10069,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22782,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10069,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22783,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10069,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22784,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10069,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22785,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10069,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22786,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10069,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22787,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10069,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22788,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10069,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22789,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10070,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22793,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10070,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22796,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10069,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',22789,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22797,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10069,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',22793,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22798,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10067,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',22789,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22799,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10067,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',22793,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22800,12,'','',10071,'BB +1.8V SM','bb_1.8v_sm','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.8V SM',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22801,12,'','',10071,'BB +3.3V','bb_3.3v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22802,12,'','',10071,'BB +3.3V STBY','bb_3.3v_stby','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V STBY',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22803,12,'','',10071,'BB +5.0V','bb_5.0v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +5.0V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22804,12,'','',10071,'BB Ambient Temp','bb_ambient_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','BB Ambient Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22805,12,'','',10071,'Power','power','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','power',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22806,12,'','',10071,'Processor Vcc','processor_vcc','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','Processor Vcc',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22807,12,'','',10071,'System Fan 3','system_fan_3','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22808,12,'','',10072,'Baseboard Temp','baseboard_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','Baseboard Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22809,12,'','',10072,'BB +1.05V PCH','bb_1.05v_pch','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.05V PCH',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22810,12,'','',10072,'BB +1.1V P1 Vccp','bb_1.1v_p1_vccp','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.1V P1 Vccp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22811,12,'','',10072,'BB +1.5V P1 DDR3','bb_1.5v_p1_ddr3','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.5V P1 DDR3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22812,12,'','',10072,'BB +3.3V','bb_3.3v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22813,12,'','',10072,'BB +3.3V STBY','bb_3.3v_stby','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V STBY',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22814,12,'','',10072,'BB +5.0V','bb_5.0v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +5.0V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22815,12,'','',10072,'Front Panel Temp','front_panel_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','Front Panel Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22816,12,'','',10072,'Power','power','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','power',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22817,12,'','',10072,'System Fan 2','system_fan_2','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 2',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22818,12,'','',10072,'System Fan 3','system_fan_3','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22819,7,'','',10073,'MySQL status','mysql.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.ping, which is defined in userparameter_mysql.conf.\r\n\r\n0 - MySQL server is down\r\n1 - MySQL server is up',0,'30d',0,0,0,'',0,'',NULL),(22820,7,'','',10073,'MySQL uptime','mysql.status[Uptime]','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22821,7,'','',10073,'MySQL version','mysql.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.version, which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22822,7,'','',10073,'MySQL insert operations per second','mysql.status[Com_insert]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22823,7,'','',10073,'MySQL select operations per second','mysql.status[Com_select]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22824,7,'','',10073,'MySQL update operations per second','mysql.status[Com_update]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22825,7,'','',10073,'MySQL rollback operations per second','mysql.status[Com_rollback]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22826,7,'','',10073,'MySQL commit operations per second','mysql.status[Com_commit]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22827,7,'','',10073,'MySQL begin operations per second','mysql.status[Com_begin]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22828,7,'','',10073,'MySQL delete operations per second','mysql.status[Com_delete]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22829,7,'','',10073,'MySQL bytes sent per second','mysql.status[Bytes_sent]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes sent to all clients.\r\n\r\nIt requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22830,7,'','',10073,'MySQL bytes received per second','mysql.status[Bytes_received]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes received from all clients. \r\n\r\nIt requires user parameter mysql.status[*], which is defined in \r\nuserparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22831,7,'','',10073,'MySQL queries per second','mysql.status[Questions]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22832,7,'','',10073,'MySQL slow queries','mysql.status[Slow_queries]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22833,7,'','',10074,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22834,7,'','',10074,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22835,7,'','',10074,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22836,7,'','',10074,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22837,7,'','',10074,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22838,7,'','',10074,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22839,7,'','',10074,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22840,7,'','',10074,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22841,7,'','',10074,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22842,7,'','',10074,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22843,7,'','',10074,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22844,7,'','',10074,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22845,7,'','',10074,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22846,7,'','',10074,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(22848,7,'','',10074,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22851,7,'','',10074,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22852,7,'','',10074,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22853,7,'','',10074,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22854,7,'','',10074,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22855,7,'','',10074,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22856,7,'','',10074,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22857,7,'','',10074,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22858,7,'','',10074,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22859,7,'','',10074,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22860,7,'','',10074,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22861,7,'','',10074,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22862,7,'','',10074,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22863,7,'','',10074,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22867,7,'','',10074,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22868,7,'','',10074,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22869,7,'','',10074,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22870,7,'','',10074,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22871,7,'','',10074,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22872,7,'','',10074,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22873,7,'','',10075,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22874,7,'','',10075,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22875,7,'','',10075,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22876,7,'','',10075,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22877,7,'','',10075,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22878,7,'','',10075,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22879,7,'','',10075,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22880,7,'','',10075,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22881,7,'','',10075,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22882,7,'','',10075,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22883,7,'','',10075,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22884,7,'','',10075,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22885,7,'','',10075,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22886,7,'','',10075,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(22888,7,'','',10075,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22891,7,'','',10075,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22892,7,'','',10075,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22893,7,'','',10075,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22894,7,'','',10075,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22895,7,'','',10075,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22896,7,'','',10075,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22897,7,'','',10075,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22898,7,'','',10075,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22899,7,'','',10075,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22900,7,'','',10075,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22901,7,'','',10075,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22902,7,'','',10075,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22903,7,'','',10075,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22907,7,'','',10075,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22908,7,'','',10075,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22909,7,'','',10075,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22910,7,'','',10075,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22911,7,'','',10075,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22912,7,'','',10075,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22913,7,'','',10076,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22914,7,'','',10076,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22917,7,'','',10076,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22918,7,'','',10076,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22920,7,'','',10076,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22921,7,'','',10076,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22922,7,'','',10076,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22923,7,'','',10076,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22924,7,'','',10076,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22933,7,'','',10076,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22934,7,'','',10076,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22938,7,'','',10076,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22939,7,'','',10076,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22940,7,'','',10076,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22941,7,'','',10076,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22942,7,'','',10076,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22943,7,'','',10076,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22944,7,'','',10076,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22945,7,'','',10076,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22946,7,'','',10076,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22947,7,'','',10076,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22948,7,'','',10076,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22949,7,'','',10076,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22950,7,'','',10076,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22951,7,'','',10076,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22952,7,'','',10076,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22953,7,'','',10077,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22954,7,'','',10077,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22961,7,'','',10077,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22962,7,'','',10077,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22963,7,'','',10077,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22965,7,'','',10077,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22968,7,'','',10077,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22971,7,'','',10077,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22972,7,'','',10077,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22973,7,'','',10077,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22974,7,'','',10077,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22978,7,'','',10077,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22980,7,'','',10077,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22981,7,'','',10077,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22982,7,'','',10077,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22983,7,'','',10077,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22984,7,'','',10077,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22985,7,'','',10077,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22986,7,'','',10077,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22987,7,'','',10077,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22988,7,'','',10077,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22989,7,'','',10077,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22990,7,'','',10077,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22991,7,'','',10077,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22992,7,'','',10077,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22993,7,'','',10078,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22994,7,'','',10078,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22996,7,'','',10078,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22997,7,'','',10078,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22998,7,'','',10078,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22999,7,'','',10078,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23000,7,'','',10078,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23001,7,'','',10078,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23002,7,'','',10078,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23003,7,'','',10078,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23004,7,'','',10078,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23005,7,'','',10078,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(23007,7,'','',10078,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'30d',0,0,0,'',0,'',NULL),(23011,7,'','',10078,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(23012,7,'','',10078,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(23013,7,'','',10078,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(23014,7,'','',10078,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23015,7,'','',10078,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23016,7,'','',10078,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23017,7,'','',10078,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23018,7,'','',10078,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(23019,7,'','',10078,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23020,7,'','',10078,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(23021,7,'','',10078,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23022,7,'','',10078,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(23023,7,'','',10078,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23024,7,'','',10078,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23025,7,'','',10078,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23026,7,'','',10078,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23027,7,'','',10078,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23028,7,'','',10078,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23029,7,'','',10078,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23030,7,'','',10078,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23031,7,'','',10078,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23032,7,'','',10078,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23033,7,'','',10079,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(23034,7,'','',10079,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23035,7,'','',10079,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(23036,7,'','',10079,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(23039,7,'','',10079,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23041,7,'','',10079,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23042,7,'','',10079,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23043,7,'','',10079,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23053,7,'','',10079,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(23054,7,'','',10079,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23058,7,'','',10079,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(23059,7,'','',10079,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23060,7,'','',10079,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(23061,7,'','',10079,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23062,7,'','',10079,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(23063,7,'','',10079,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23067,7,'','',10079,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23068,7,'','',10079,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23069,7,'','',10079,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23070,7,'','',10079,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23071,7,'','',10079,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23072,7,'','',10079,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23073,7,'','',10075,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23074,7,'','',10075,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23075,7,'','',10074,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23076,7,'','',10074,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23077,7,'','',10079,'Incoming network traffic on $1','net.if.in[en0]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23078,7,'','',10079,'Outgoing network traffic on $1','net.if.out[en0]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23108,7,'','',10076,'CPU available physical processors in the shared pool','system.stat[cpu,app]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23109,7,'','',10076,'CPU entitled capacity consumed','system.stat[cpu,ec]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23110,7,'','',10076,'CPU idle time','system.stat[cpu,id]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23111,7,'','',10076,'CPU logical processor utilization','system.stat[cpu,lbusy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23112,7,'','',10076,'CPU number of physical processors consumed','system.stat[cpu,pc]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23113,7,'','',10076,'CPU system time','system.stat[cpu,sy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23114,7,'','',10076,'CPU user time','system.stat[cpu,us]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23115,7,'','',10076,'CPU iowait time','system.stat[cpu,wa]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23116,7,'','',10076,'Amount of data transferred','system.stat[disk,bps]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23117,7,'','',10076,'Number of transfers','system.stat[disk,tps]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23118,7,'','',10076,'Processor units is entitled to receive','system.stat[ent]','1h','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23119,7,'','',10076,'Kernel thread context switches','system.stat[faults,cs]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23120,7,'','',10076,'Device interrupts','system.stat[faults,in]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23121,7,'','',10076,'System calls','system.stat[faults,sy]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23122,7,'','',10076,'Length of the swap queue','system.stat[kthr,b]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23123,7,'','',10076,'Length of the run queue','system.stat[kthr,r]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23124,7,'','',10076,'Active virtual pages','system.stat[memory,avm]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23125,7,'','',10076,'Free real memory','system.stat[memory,fre]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23126,7,'','',10076,'File page-ins per second','system.stat[page,fi]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23127,7,'','',10076,'File page-outs per second','system.stat[page,fo]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23128,7,'','',10076,'Pages freed (page replacement)','system.stat[page,fr]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23129,7,'','',10076,'Pages paged in from paging space','system.stat[page,pi]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23130,7,'','',10076,'Pages paged out to paging space','system.stat[page,po]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23131,7,'','',10076,'Pages scanned by page-replacement algorithm','system.stat[page,sr]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23134,7,'','',10081,'Average disk read queue length','perf_counter[\\234(_Total)\\1402]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Read Queue Length',0,'30d',0,0,0,'',0,'',NULL),(23135,7,'','',10081,'Average disk write queue length','perf_counter[\\234(_Total)\\1404]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Write Queue Length',0,'30d',0,0,0,'',0,'',NULL),(23136,7,'','',10081,'File read bytes per second','perf_counter[\\2\\16]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Read Bytes/sec',0,'30d',0,0,0,'',0,'',NULL),(23137,7,'','',10081,'File write bytes per second','perf_counter[\\2\\18]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Write Bytes/sec',0,'30d',0,0,0,'',0,'',NULL),(23138,7,'','',10081,'Number of threads','perf_counter[\\2\\250]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\Threads',0,'30d',0,0,0,'',0,'',NULL),(23140,7,'','',10081,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23143,7,'','',10081,'Processor load (1 min average)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23144,7,'','',10081,'Processor load (15 min average)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23145,7,'','',10081,'Processor load (5 min average)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23147,7,'','',10081,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23148,7,'','',10081,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23149,7,'','',10081,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',5,'30d',0,0,0,'',0,'',NULL),(23150,7,'','',10081,'System uptime','system.uptime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23158,7,'','',10081,'Free memory','vm.memory.size[free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23159,7,'','',10081,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23160,7,'','',10081,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(23161,7,'','',10081,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23162,7,'','',10081,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23163,7,'','',10081,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23164,7,'','',10081,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23165,7,'','',10081,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23167,7,'','',10081,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23168,7,'','',10081,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23169,7,'','',10081,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23170,7,'','',10081,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23171,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23172,16,'','',10082,'comp Accumulated time spent in compilation','jmx[\"java.lang:type=Compilation\",TotalCompilationTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23173,16,'','',10082,'cl Loaded Class Count','jmx[\"java.lang:type=ClassLoading\",LoadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23174,16,'','',10082,'cl Total Loaded Class Count','jmx[\"java.lang:type=ClassLoading\",TotalLoadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23175,16,'','',10082,'cl Unloaded Class Count','jmx[\"java.lang:type=ClassLoading\",UnloadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23176,16,'','',10082,'gc ConcurrentMarkSweep accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=ConcurrentMarkSweep\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23177,16,'','',10082,'gc ConcurrentMarkSweep number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=ConcurrentMarkSweep\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23178,16,'','',10082,'gc Copy accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=Copy\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23179,16,'','',10082,'gc Copy number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=Copy\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23180,16,'','',10082,'gc MarkSweepCompact accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=MarkSweepCompact\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23181,16,'','',10082,'gc MarkSweepCompact number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=MarkSweepCompact\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23182,16,'','',10082,'gc ParNew accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=ParNew\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23183,16,'','',10082,'gc ParNew number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=ParNew\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23184,16,'','',10082,'gc PS MarkSweep accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=PS MarkSweep\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23185,16,'','',10082,'gc PS Scavenge accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=PS Scavenge\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23186,16,'','',10082,'gc PS Scavenge number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=PS Scavenge\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23187,16,'','',10082,'gc PS MarkSweep number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=PS MarkSweep\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23188,16,'','',10082,'jvm Uptime','jmx[\"java.lang:type=Runtime\",Uptime]','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23189,16,'','',10082,'jvm Version','jmx[\"java.lang:type=Runtime\",VmVersion]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23190,16,'','',10082,'mem Object Pending Finalization Count','jmx[\"java.lang:type=Memory\",ObjectPendingFinalizationCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23191,16,'','',10082,'mp CMS Old Gen committed','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23192,16,'','',10082,'mp CMS Old Gen max','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23193,16,'','',10082,'mp CMS Old Gen used','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23194,16,'','',10082,'mp CMS Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23195,16,'','',10082,'mp CMS Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23196,16,'','',10082,'mp CMS Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23197,16,'','',10082,'mp Code Cache committed','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23198,16,'','',10082,'mp Code Cache max','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23199,16,'','',10082,'mp Code Cache used','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23200,16,'','',10082,'mp Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23201,16,'','',10082,'mp Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23202,16,'','',10082,'mp Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23203,16,'','',10082,'mp PS Old Gen committed','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23204,16,'','',10082,'mp PS Old Gen max','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23205,16,'','',10082,'mp PS Old Gen used','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23206,16,'','',10082,'mp PS Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23207,16,'','',10082,'mp PS Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23208,16,'','',10082,'mp PS Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23209,16,'','',10082,'mp Tenured Gen committed','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23210,16,'','',10082,'mp Tenured Gen max','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23211,16,'','',10082,'mp Tenured Gen used','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23212,16,'','',10082,'comp Name of the current JIT compiler','jmx[\"java.lang:type=Compilation\",Name]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23213,16,'','',10082,'os Max File Descriptor Count','jmx[\"java.lang:type=OperatingSystem\",MaxFileDescriptorCount]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23214,16,'','',10082,'os Open File Descriptor Count','jmx[\"java.lang:type=OperatingSystem\",OpenFileDescriptorCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23215,16,'','',10082,'th Daemon Thread Count','jmx[\"java.lang:type=Threading\",DaemonThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23216,16,'','',10082,'th Peak Thread Count','jmx[\"java.lang:type=Threading\",PeakThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23217,16,'','',10082,'th Thread Count','jmx[\"java.lang:type=Threading\",ThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23218,16,'','',10082,'th Total Started Thread Count','jmx[\"java.lang:type=Threading\",TotalStartedThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23219,16,'','',10083,'http-8080 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23220,16,'','',10083,'http-8080 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23221,16,'','',10083,'http-8080 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23222,16,'','',10083,'http-8080 gzip compression','jmx[\"Catalina:type=ProtocolHandler,port=8080\",compression]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23223,16,'','',10083,'http-8080 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23224,16,'','',10083,'http-8080 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23225,16,'','',10083,'http-8080 threads allocated','jmx[\"Catalina:type=ThreadPool,name=http-8080\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23226,16,'','',10083,'http-8080 threads busy','jmx[\"Catalina:type=ThreadPool,name=http-8080\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23227,16,'','',10083,'http-8080 threads max','jmx[\"Catalina:type=ThreadPool,name=http-8080\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23228,16,'','',10083,'http-8443 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23229,16,'','',10083,'http-8443 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\", bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23230,16,'','',10083,'http-8443 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23231,16,'','',10083,'http-8443 gzip compression','jmx[\"Catalina:type=ProtocolHandler,port=8443\",compression]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23232,16,'','',10083,'http-8443 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23233,16,'','',10083,'http-8443 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23234,16,'','',10083,'http-8443 threads allocated','jmx[\"Catalina:type=ThreadPool,name=http-8443\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23235,16,'','',10083,'http-8443 threads busy','jmx[\"Catalina:type=ThreadPool,name=http-8443\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23236,16,'','',10083,'http-8443 threads max','jmx[\"Catalina:type=ThreadPool,name=http-8443\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23237,16,'','',10083,'jk-8009 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\", bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23238,16,'','',10083,'jk-8009 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23239,16,'','',10083,'jk-8009 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23240,16,'','',10083,'jk-8009 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23241,16,'','',10083,'jk-8009 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23242,16,'','',10083,'jk-8009 threads allocated','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23243,16,'','',10083,'jk-8009 threads busy','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23244,16,'','',10083,'jk-8009 threads max','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23245,16,'','',10083,'Maximum number of active sessions so far','jmx[\"Catalina:type=Manager,path=/,host=localhost\",maxActive]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23246,16,'','',10083,'Number of active sessions at this moment','jmx[\"Catalina:type=Manager,path=/,host=localhost\",activeSessions]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23247,16,'','',10083,'Number of sessions created by this manager per second','jmx[\"Catalina:type=Manager,path=/,host=localhost\",sessionCounter]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23248,16,'','',10083,'Number of sessions we rejected due to maxActive being reached','jmx[\"Catalina:type=Manager,path=/,host=localhost\",rejectedSessions]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23249,16,'','',10083,'The maximum number of active Sessions allowed, or -1 for no limit','jmx[\"Catalina:type=Manager,path=/,host=localhost\",maxActiveSessions]','1h','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23250,16,'','',10083,'Tomcat version','jmx[\"Catalina:type=Server\",serverInfo]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23251,5,'','',10047,'Zabbix queue','zabbix[queue]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23318,7,'','',10050,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23319,7,'','',10001,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23320,7,'','',10074,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23321,7,'','',10075,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23322,7,'','',10076,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23323,7,'','',10077,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23324,7,'','',10078,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23325,7,'','',10079,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23326,7,'','',10081,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23329,7,'','',10074,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23340,5,'','',10048,'Values processed by Zabbix proxy per second','zabbix[wcache,values]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23341,5,'','',10048,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23342,5,'','',10048,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23343,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23344,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23345,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23346,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23347,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23348,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]','1m','1w','365d',0,0,'localhost','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23349,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23350,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23351,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,heartbeat sender,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23352,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]','1m','1w','365d',0,0,'localhost','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23353,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23354,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23355,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23356,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23357,5,'','',10048,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23358,5,'','',10048,'Zabbix queue','zabbix[queue]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23359,5,'','',10048,'Zabbix queue over $2','zabbix[queue,10m]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23360,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,data sender,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23540,7,'','',10075,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23542,3,'','',10088,'Discover VMware VMs','vmware.vm.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of guest virtual machines.',0,'30d',0,0,0,'',0,'',NULL),(23543,3,'','',10089,'Ballooned memory','vmware.vm.memory.size.ballooned[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is currently reclaimed through the balloon driver.',0,'30d',0,0,0,'',0,'',NULL),(23544,3,'','',10089,'Compressed memory','vmware.vm.memory.size.compressed[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of memory currently in the compression cache for this VM.',0,'30d',0,0,0,'',0,'',NULL),(23545,3,'','',10089,'Memory size','vmware.vm.memory.size[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total size of configured memory.',0,'30d',0,0,0,'',0,'',NULL),(23546,3,'','',10089,'Swapped memory','vmware.vm.memory.size.swapped[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory swapped out to the VM\'s swap device by ESX.',0,'30d',0,0,0,'',0,'',NULL),(23547,3,'','',10089,'Committed storage space','vmware.vm.storage.committed[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total storage space, in bytes, committed to this virtual machine across all datastores.',0,'30d',0,0,0,'',0,'',NULL),(23548,3,'','',10089,'Uncommitted storage space','vmware.vm.storage.uncommitted[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Additional storage space, in bytes, potentially used by this virtual machine on all datastores.',0,'30d',0,0,0,'',0,'',NULL),(23549,3,'','',10089,'Unshared storage space','vmware.vm.storage.unshared[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total storage space, in bytes, occupied by the virtual machine across all datastores, that is not shared with any other virtual machine.',0,'30d',0,0,0,'',0,'',NULL),(23550,3,'','',10089,'CPU usage','vmware.vm.cpu.usage[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Current upper-bound on CPU usage. The upper-bound is based on the host the virtual machine is current running on, as well as limits configured on the virtual machine itself or any parent resource pool. Valid while the virtual machine is running.',0,'30d',0,0,0,'',0,'',NULL),(23551,3,'','',10089,'Number of virtual CPUs','vmware.vm.cpu.num[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of virtual CPUs assigned to the guest.',0,'30d',0,0,0,'',0,'',NULL),(23552,3,'','',10089,'Power state','vmware.vm.powerstate[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,12,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The current power state of the virtual machine.',0,'30d',0,0,0,'',0,'',NULL),(23553,3,'','',10089,'Uptime','vmware.vm.uptime[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','System uptime.',0,'30d',0,0,0,'',0,'',NULL),(23554,3,'','',10088,'Discover VMware hypervisors','vmware.hv.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of hypervisors.',0,'30d',0,0,0,'',0,'',NULL),(23555,3,'','',10091,'Bios UUID','vmware.hv.hw.uuid[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The hardware BIOS identification.',0,'30d',0,0,0,'',0,'',NULL),(23556,3,'','',10091,'CPU cores','vmware.hv.hw.cpu.num[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.',0,'30d',0,0,0,'',0,'',NULL),(23557,3,'','',10091,'CPU frequency','vmware.hv.hw.cpu.freq[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.',0,'30d',0,0,0,'',0,'',NULL),(23558,3,'','',10091,'CPU model','vmware.hv.hw.cpu.model[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The CPU model.',0,'30d',0,0,0,'',0,'',NULL),(23559,3,'','',10091,'CPU threads','vmware.hv.hw.cpu.threads[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of physical CPU threads on the host.',0,'30d',0,0,0,'',0,'',NULL),(23560,3,'','',10091,'CPU usage','vmware.hv.cpu.usage[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.',0,'30d',0,0,0,'',0,'',NULL),(23561,3,'','',10091,'Full name','vmware.hv.fullname[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The complete product name, including the version information.',0,'30d',0,0,0,'',0,'',NULL),(23562,3,'','',10091,'Model','vmware.hv.hw.model[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The system model identification.',0,'30d',0,0,0,'',0,'',NULL),(23563,3,'','',10091,'Overall status','vmware.hv.status[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.',0,'30d',0,0,0,'',0,'',NULL),(23564,3,'','',10091,'Total memory','vmware.hv.hw.memory[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The physical memory size.',0,'30d',0,0,0,'',0,'',NULL),(23565,3,'','',10091,'Uptime','vmware.hv.uptime[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','System uptime.',0,'30d',0,0,0,'',0,'',NULL),(23566,3,'','',10091,'Used memory','vmware.hv.memory.used[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Physical memory usage on the host.',0,'30d',0,0,0,'',0,'',NULL),(23567,3,'','',10091,'Vendor','vmware.hv.hw.vendor[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The hardware vendor identification.',0,'30d',0,0,0,'',0,'',NULL),(23568,3,'','',10091,'Version','vmware.hv.version[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Dot-separated version string.',0,'30d',0,0,0,'',0,'',NULL),(23569,3,'','',10091,'Number of guest VMs','vmware.hv.vm.num[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of guest virtual machines.',0,'30d',0,0,0,'',0,'',NULL),(23572,3,'','',10091,'Ballooned memory','vmware.hv.memory.size.ballooned[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.',0,'30d',0,0,0,'',0,'',NULL),(23573,3,'','',10089,'Hypervisor name','vmware.vm.hv.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Hypervisor name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23575,3,'','',10089,'Mounted filesystem discovery','vmware.vm.vfs.fs.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all guest file systems.',0,'30d',0,0,0,'',0,'',NULL),(23576,3,'','',10089,'Free disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},free]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23577,3,'','',10089,'Free disk space on {#FSNAME} (percentage)','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},pfree]','1m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23578,3,'','',10089,'Total disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},total]','1h','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23579,3,'','',10089,'Used disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},used]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23585,3,'','',10089,'Guest memory usage','vmware.vm.memory.size.usage.guest[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is being used by the VM.',0,'30d',0,0,0,'',0,'',NULL),(23586,3,'','',10089,'Host memory usage','vmware.vm.memory.size.usage.host[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of host physical memory allocated to the VM, accounting for saving from memory sharing with other VMs.',0,'30d',0,0,0,'',0,'',NULL),(23587,3,'','',10089,'Private memory','vmware.vm.memory.size.private[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Amount of memory backed by host memory and not being shared.',0,'30d',0,0,0,'',0,'',NULL),(23588,3,'','',10089,'Shared memory','vmware.vm.memory.size.shared[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory shared through transparent page sharing.',0,'30d',0,0,0,'',0,'',NULL),(23593,3,'','',10088,'Event log','vmware.eventlog[{$URL}]','1m','90d','0',0,2,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23595,3,'','',10088,'Discover VMware clusters','vmware.cluster.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of clusters',0,'30d',0,0,0,'',0,'',NULL),(23596,3,'','',10088,'Status of \"$2\" cluster','vmware.cluster.status[{$URL},{#CLUSTER.NAME}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23597,3,'','',10089,'Cluster name','vmware.vm.cluster.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Cluster name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23598,3,'','',10091,'Cluster name','vmware.hv.cluster.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Cluster name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23599,3,'','',10089,'Disk device discovery','vmware.vm.vfs.dev.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all disk devices.',0,'30d',0,0,0,'',0,'',NULL),(23600,3,'','',10089,'Network device discovery','vmware.vm.net.if.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all network devices.',0,'30d',0,0,0,'',0,'',NULL),(23601,3,'','',10089,'Average number of bytes read from the disk {#DISKDESC}','vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23602,3,'','',10089,'Average number of bytes written to the disk {#DISKDESC}','vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23603,3,'','',10089,'Average number of reads from the disk {#DISKDESC}','vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},ops]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23604,3,'','',10089,'Average number of writes to the disk {#DISKDESC}','vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},ops]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23605,3,'','',10089,'Number of packets received on interface {#IFDESC}','vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},pps]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23606,3,'','',10089,'Number of packets transmitted on interface {#IFDESC}','vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},pps]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23607,3,'','',10089,'Number of bytes received on interface {#IFDESC}','vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23608,3,'','',10089,'Number of bytes transmitted on interface {#IFDESC}','vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23629,3,'','',10091,'Number of bytes received','vmware.hv.network.in[{$URL},{HOST.HOST},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23630,3,'','',10091,'Number of bytes transmitted','vmware.hv.network.out[{$URL},{HOST.HOST},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23631,3,'','',10091,'Datastore discovery','vmware.hv.datastore.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23632,3,'','',10091,'Average read latency of the datastore $3','vmware.hv.datastore.read[{$URL},{HOST.HOST},{#DATASTORE},latency]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23633,3,'','',10091,'Average write latency of the datastore $3','vmware.hv.datastore.write[{$URL},{HOST.HOST},{#DATASTORE},latency]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23634,5,'','',10047,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23636,16,'','',10082,'jvm Name','jmx[\"java.lang:type=Runtime\",VmName]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23637,16,'','',10082,'os Process CPU Load','jmx[\"java.lang:type=OperatingSystem\",ProcessCpuLoad]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23638,16,'','',10082,'mem Heap Memory used','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23639,16,'','',10082,'mem Heap Memory committed','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23640,16,'','',10082,'mem Heap Memory max','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23641,16,'','',10082,'mem Non-Heap Memory committed','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23642,16,'','',10082,'mem Non-Heap Memory used','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23643,16,'','',10082,'mem Non-Heap Memory max','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23644,3,'','',10093,'FTP service is running','net.tcp.service[ftp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23645,3,'','',10094,'HTTP service is running','net.tcp.service[http]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23646,3,'','',10095,'HTTPS service is running','net.tcp.service[https]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23647,3,'','',10096,'IMAP service is running','net.tcp.service[imap]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23648,3,'','',10097,'LDAP service is running','net.tcp.service[ldap]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23649,3,'','',10098,'NNTP service is running','net.tcp.service[nntp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23650,3,'','',10099,'NTP service is running','net.udp.service[ntp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23651,3,'','',10100,'POP service is running','net.tcp.service[pop]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23652,3,'','',10101,'SMTP service is running','net.tcp.service[smtp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23653,3,'','',10102,'SSH service is running','net.tcp.service[ssh]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23654,3,'','',10103,'Telnet service is running','net.tcp.service[telnet]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23655,3,'','',10104,'ICMP ping','icmpping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23656,3,'','',10104,'ICMP response time','icmppingsec','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23657,3,'','',10104,'ICMP loss','icmppingloss','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23658,3,'','',10088,'Full name','vmware.fullname[{$URL}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23659,3,'','',10088,'Version','vmware.version[{$URL}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23660,3,'','',10089,'CPU ready','vmware.vm.cpu.ready[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Time that the virtual machine was ready, but could not get scheduled to run on the physical CPU during last measurement interval (VMware vCenter/ESXi Server performance counter sampling interval - 20 seconds)',0,'30d',0,0,0,'',0,'',NULL),(23661,5,'','',10047,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,15,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23663,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,task manager,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23665,7,'','',10081,'Windows service discovery','service.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of Windows services of different types as defined in global regular expressions \"Windows service names for discovery\" and \"Windows service startup states for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23666,7,'','',10081,'State of service \"{#SERVICE.NAME}\" ({#SERVICE.DISPLAYNAME})','service.info[{#SERVICE.NAME},state]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,3,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23667,3,'','',10091,'Health state rollup','vmware.hv.sensor.health.state[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The host health state rollup sensor value: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.',0,'30d',0,0,0,'',0,'',NULL),(23668,7,'','',10081,'Free virtual memory, in %','vm.vmemory.size[pavailable]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23669,3,'','',10091,'Total size of datastore $3','vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23670,3,'','',10091,'Free space on datastore $3 (percentage)','vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},pfree]','1m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25330,3,'','',10089,'Datacenter name','vmware.vm.datacenter.name[{$URL},{HOST.HOST}]','1m','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Datacenter name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(25365,3,'','',10091,'Datacenter name','vmware.hv.datacenter.name[{$URL},{HOST.HOST}]','1m','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Datacenter name of the hypervisor.',0,'30d',0,0,0,'',0,'',NULL),(25426,7,'','',10107,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',1,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25427,7,'','',10107,'Agent ping','agent.ping','1m','1w','365d',1,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(25428,7,'','',10107,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',1,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(25429,7,'','',10107,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(25430,7,'','',10107,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(25431,7,'','',10107,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(25432,7,'','',10107,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(25433,7,'','',10107,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25434,7,'','',10107,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25435,7,'','',10107,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25436,7,'','',10107,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25437,7,'','',10107,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25438,7,'','',10107,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25439,7,'','',10107,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(25440,7,'','',10107,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(25441,7,'','',10107,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'30d',0,0,0,'',0,'',NULL),(25442,7,'','',10107,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(25443,7,'','',10107,'CPU $2 time','system.cpu.util[,softirq]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing software interrupts.',0,'30d',0,0,0,'',0,'',NULL),(25444,7,'','',10107,'CPU $2 time','system.cpu.util[,steal]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'30d',0,0,0,'',0,'',NULL),(25445,7,'','',10107,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(25446,7,'','',10107,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(25447,7,'','',10107,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(25448,7,'','',10107,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25449,7,'','',10107,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25450,7,'','',10107,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25451,7,'','',10107,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25452,7,'','',10107,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(25453,7,'','',10107,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25454,7,'','',10107,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(25455,7,'','',10107,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25456,7,'','',10107,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(25457,7,'','',10107,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25458,7,'','',10107,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(25459,7,'','',10107,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25460,7,'','',10107,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25461,7,'','',10107,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(25462,7,'','',10107,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25463,7,'','',10107,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25464,7,'','',10107,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25465,7,'','',10107,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25466,7,'','',10107,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25931,3,'','',10113,'ICMP ping','icmpping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25932,3,'','',10113,'ICMP loss','icmppingloss','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25933,3,'','',10113,'ICMP response time','icmppingsec','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25934,7,'','',10114,'Hostname of Container','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',3,'30d',0,0,0,'',0,'',NULL),(25935,7,'','',10114,'Contaner OS','agent.os','6h','30d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',5,'30d',0,0,0,'',0,'',NULL),(25936,7,'','',10114,'Zabbix Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30d',0,0,0,'',0,'',NULL),(25937,7,'','',10114,'Zabbix Agent Version','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25938,7,'','',10114,'Upgradable Packages','packages.upgradable','6h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25939,7,'','',10115,'Wordpress instances','file.discovery[/www/wordpress,XndwLWNvbmZpZy5waHAk]','1d','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(25940,7,'','',10115,'Update Status','wp.update_available[{#FDIR}]','0;wd1-5h10','30d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25941,2,'','',10116,'Backup Time','dbbackup.datetime','0','365d','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25942,2,'','',10116,'Backup Size','dbbackup.size','0','365d','365d',0,3,'','byte','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25943,7,'','',10117,'MySQL status','mysql.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.ping, which is defined in userparameter_mysql.conf.\r\n\r\n0 - MySQL server is down\r\n1 - MySQL server is up',0,'30d',0,0,0,'',0,'',NULL),(25944,7,'','',10117,'MySQL bytes received per second','mysql.status[Bytes_received]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes received from all clients. \r\n\r\nIt requires user parameter mysql.status[*], which is defined in \r\nuserparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25945,7,'','',10117,'MySQL bytes sent per second','mysql.status[Bytes_sent]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes sent to all clients.\r\n\r\nIt requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25946,7,'','',10117,'MySQL begin operations per second','mysql.status[Com_begin]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25947,7,'','',10117,'MySQL commit operations per second','mysql.status[Com_commit]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25948,7,'','',10117,'MySQL delete operations per second','mysql.status[Com_delete]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25949,7,'','',10117,'MySQL insert operations per second','mysql.status[Com_insert]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25950,7,'','',10117,'MySQL rollback operations per second','mysql.status[Com_rollback]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25951,7,'','',10117,'MySQL select operations per second','mysql.status[Com_select]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25952,7,'','',10117,'MySQL update operations per second','mysql.status[Com_update]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25953,7,'','',10117,'MySQL queries per second','mysql.status[Questions]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25954,7,'','',10117,'MySQL slow queries','mysql.status[Slow_queries]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25955,7,'','',10117,'MySQL uptime','mysql.status[Uptime]','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25956,7,'','',10117,'MySQL version','mysql.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.version, which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(25971,10,'','',10118,'SSL certificate validity','check-ssl-expiry.sh[{$SSL_URL}]','1d','1w','365d',0,0,'','days','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25972,10,'','',10119,'Domain Expiration','check-domain-expiry.sh[{$DOMAIN}]','1d','1w','365d',0,0,'','days','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25973,7,'','',10120,'ClamAV service is running','proc.num[clamd]','90s','1w','365d',1,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25974,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Config Uptime','backuppc.config_load_time','0','10d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25975,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Queue (Command)','backuppc.queue_command','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25976,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Count','backuppc.pool_file_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25977,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Max Links','backuppc.pool_file_link_max','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25978,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Repeat','backuppc.pool_file_repeat','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25979,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Repeat Max','backuppc.pool_file_repeat_max','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25980,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool Size','backuppc.pool_size','0','10d','365d',0,3,'','kbytes','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25981,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Queue (Background)','backuppc.queue_background','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25982,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Queue (User)','backuppc.queue_user','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25983,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Jobs (Other Backup)','backuppc.jobs_other','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25984,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Uptime','backuppc.uptime','0','10d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25985,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Version','backuppc.version','0','10d','0',0,4,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25986,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Memory Usage','proc.mem[,backuppc]','2m','90d','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25987,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - BackupPC Process','proc.num[BackupPC]','2m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25988,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - BackupPC_dump Process','proc.num[BackupPC_dump]','2m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25989,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - BackupPC_link Process','proc.num[BackupPC_link]','2m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25990,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - BackupPC_nightly Process','system.run[\"ps waux | grep BackupPC_nightly | grep -v grep | wc -l\"]','2m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25991,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool Directory Count','backuppc.pool_dir_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25992,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Jobs (Incremental Backup)','backuppc.jobs_incr','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25993,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool Directory Count (Compressed)','backuppc.cpool_dir_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25994,2,'','',10121,'BackupPC - Full Backup Size','backuppc.hosts_full_size','0','10d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25995,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Count (Compressed)','backuppc.cpool_file_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25996,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Max Links (Compressed)','backuppc.cpool_file_link_max','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25997,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Repeat (Compressed)','backuppc.cpool_file_repeat','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25998,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool File Repeat Max (Compressed)','backuppc.cpool_file_repeat_max','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25999,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Pool Size (Compressed)','backuppc.cpool_size','0','10d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26000,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Hosts with full age more than 1 week','backuppc.hosts_full_age_days','0','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26001,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Full Backup Count','backuppc.hosts_full_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26002,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Average Backup Speed (Full)','backuppc.hosts_full_speed','0','10d','0',0,0,'','B/sec','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26003,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Jobs (Full Backup)','backuppc.jobs_full','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26004,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Incremental Backup Count','backuppc.hosts_incr_count','0','10d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26005,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Incremental Backup Size','backuppc.hosts_incr_size','0','10d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26006,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Average Backup Speed (Incremental)','backuppc.hosts_incr_speed','0','10d','0',0,0,'','B/sec','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26007,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Hosts with No backups (2 Days)','backuppc.hosts_nobackup_2','0','10d','0',0,4,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26008,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Hosts with No backups (3 Days)','backuppc.hosts_nobackup_3','0','10d','0',0,4,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26009,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Hosts with No backups (4 Days)','backuppc.hosts_nobackup_4','0','10d','0',0,4,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26010,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10121,'BackupPC - Hosts with No backups (5 Days)','backuppc.hosts_nobackup_5','0','10d','0',0,4,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26011,7,'','',10121,'BackupPC - Collect Data','system.run[\"sudo -u backuppc /etc/zabbix/zabbix_agentd.conf.d/backuppc.pl\"]','5m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26012,7,'','',10121,'Discover backup hosts','system.run[\"sudo -u backuppc /etc/zabbix/zabbix_agentd.conf.d/backuppc-discover.pl\"]','30s','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26013,2,'','',10121,'{#BACKUPHOST} full backup age','backuppc.fullage[{#BACKUPHOST}]','0','90d','365d',0,0,'','days','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26014,2,'','',10121,'{#BACKUPHOST} full backup BadFile','backuppc.fullbadfile[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26015,2,'','',10121,'{#BACKUPHOST} full backup BadShare','backuppc.fullbadshare[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26016,2,'','',10121,'{#BACKUPHOST} full backup duration','backuppc.fulldur[{#BACKUPHOST}]','0','90d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26017,2,'','',10121,'{#BACKUPHOST} full backup xfer errors','backuppc.fullerrs[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26018,2,'','',10121,'{#BACKUPHOST} full backup size','backuppc.fullsize[{#BACKUPHOST}]','0','90d','365d',0,0,'','byte','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26019,2,'','',10121,'{#BACKUPHOST} full backup tar errors','backuppc.fulltarerrs[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26020,2,'','',10121,'{#BACKUPHOST} incremental backup age','backuppc.incrage[{#BACKUPHOST}]','0','90d','365d',0,0,'','days','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26021,2,'','',10121,'{#BACKUPHOST} incremental backup BadFile','backuppc.incrbadfile[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26022,2,'','',10121,'{#BACKUPHOST} incremental backup BadShare','backuppc.incrbadshare[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26023,2,'','',10121,'{#BACKUPHOST} incremental backup duration','backuppc.incrdur[{#BACKUPHOST}]','0','90d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26024,2,'','',10121,'{#BACKUPHOST} incremental backup xfer errors','backuppc.increrrs[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26025,2,'','',10121,'{#BACKUPHOST} incremental backup size','backuppc.incrsize[{#BACKUPHOST}]','0','90d','365d',0,0,'','byte','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26026,2,'','',10121,'{#BACKUPHOST} incremental backup tar errors','backuppc.incrtarerrs[{#BACKUPHOST}]','0','90d','365d',0,0,'','p','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26027,7,'','',10122,'SpamAssasin service is running','proc.num[spamd child]','90s','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26028,7,'','',10123,'Number of running processes redis','proc.num[redis-server]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26029,7,'','',10123,'Redis commands processed per minute','redis[total_commands_processed]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26030,7,'','',10123,'Redis used memory','redis[used_memory]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26031,7,'','',10123,'Redis children used CPU user','redis[used_cpu_user_children]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26032,7,'','',10123,'Redis used CPU user','redis[used_cpu_user]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26033,7,'','',10123,'Redis children used CPU sys','redis[used_cpu_sys_children]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26034,7,'','',10123,'Redis used CPU sys','redis[used_cpu_sys]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26035,7,'','',10123,'Redis uptime in seconds','redis[uptime_in_seconds]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26036,7,'','',10123,'Redis uptime in days','redis[uptime_in_days]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26037,7,'','',10123,'Redis connections per minute','redis[total_connections_received]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26038,7,'','',10123,'Version of redis running','redis[redis_version]','86400','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26039,7,'','',10123,'Redis storage keys','redis.keys','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26040,7,'','',10123,'Redis changes since last save','redis[rdb_changes_since_last_save]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26041,7,'','',10123,'Redis memory fragmentation ratio','redis[mem_fragmentation_ratio]','120','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26042,7,'','',10123,'Redis storage misses','redis[keyspace_misses]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26043,7,'','',10123,'Redis storage hits','redis[keyspace_hits]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26044,7,'','',10123,'Redis storage expired keys','redis[expired_keys]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26045,7,'','',10123,'Redis storage evicted keys','redis[evicted_keys]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26046,7,'','',10123,'Redis connected slaves','redis[connected_slaves]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26047,7,'','',10123,'Redis connected clients','redis[connected_clients]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26048,7,'','',10123,'Redis blocked clients','redis[blocked_clients]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26049,7,'','',10123,'Redis used RSS memory','redis[used_memory_rss]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26050,15,'','',10124,'RabbitMQ Server File Desc Percent Used','rabbitmq.server.filedesc.percentused','5m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'last(\"rabbitmq[server,fd_used]\")/last(\"rabbitmq[server,fd_total]\")','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26051,7,'','',10124,'RabbitMQ Messages Total Count','rabbitmq[server,message_count_total]','30s','1w','365d',0,3,'','msgs','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','This is the total number of messages',0,'30d',0,0,0,'',0,'',NULL),(26052,7,'','',10124,'RabbitMQ Server Sockets Used','rabbitmq[server,sockets_used]','5m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26053,7,'','',10124,'RabbitMQ Server Sockets Limit','rabbitmq[server,sockets_total]','30m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26054,7,'','',10124,'RabbitMQ Server Version','rabbitmq[server,rabbitmq_version]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','RabbitMQ Server Version',18,'30d',0,0,0,'',0,'',NULL),(26055,7,'','',10124,'RabbitMQ Server Partitions','rabbitmq[server,partitions]','30s','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Server partitions - SHOULD be [] which is none, so if something shows up here, partition has occurred.',0,'30d',0,0,0,'',0,'',NULL),(26056,7,'','',10124,'RabbitMQ Message Receive Rates','rabbitmq[server,message_stats_publish]','1m','1w','365d',0,0,'','msgs/s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','This is the number of messages published TO the rabbit server',0,'30d',0,0,0,'',0,'',NULL),(26057,7,'','',10124,'RabbitMQ Message Deliver Rates','rabbitmq[server,message_stats_deliver_get]','1m','1w','365d',0,0,'','msgs/s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26058,7,'','',10124,'RabbitMQ Messages Total Unacknowledged','rabbitmq[server,message_count_unacknowledged]','30s','1w','365d',0,3,'','msgs','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','This is the total number of unacknowledged messages',0,'30d',0,0,0,'',0,'',NULL),(26059,7,'','',10124,'RabbitMQ Messages Total Ready','rabbitmq[server,message_count_ready]','30s','1w','365d',0,3,'','msgs','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','This is the total number of ready messages',0,'30d',0,0,0,'',0,'',NULL),(26060,15,'','',10124,'RabbitMQ Server Memory Percent Used','rabbitmq.server.mem.percentused','5m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'last(\"rabbitmq[server,mem_used]\")/last(\"rabbitmq[server,mem_limit]\")','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26061,7,'','',10124,'RabbitMQ Server Memory Used','rabbitmq[server,mem_used]','5m','90d','365d',0,3,'','bytes','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26062,7,'','',10124,'RabbitMQ Server Memory Limit','rabbitmq[server,mem_limit]','30m','90d','365d',0,3,'','bytes','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26063,7,'','',10124,'RabbitMQ Server File Desc Used','rabbitmq[server,fd_used]','5m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26064,7,'','',10124,'RabbitMQ Server File Desc Limit','rabbitmq[server,fd_total]','30m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26065,7,'','',10124,'RabbitMQ Server Disk Free','rabbitmq[server,disk_free]','5m','90d','365d',0,3,'','bytes','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26066,7,'','',10124,'RabbitMQ Refresh Rabbit Queue Status','rabbitmq[queues]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26067,7,'','',10124,'RabbitMQ Check Aliveness','rabbitmq[check_aliveness]','1m','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26068,15,'','',10124,'RabbitMQ Server Sockets Percent Used','rabbitmq.server.sockets.percentused','5m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'last(\"rabbitmq[server,sockets_used]\")/last(\"rabbitmq[server,sockets_total]\")','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26069,7,'','',10124,'RabbitMQ Refresh Rabbit Shovel Status','rabbitmq[shovels]','30s','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26070,7,'','',10124,'rabbitmq queues','rabbitmq.discovery_queues','6m','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','',0,'0',0,0,0,'',1,'',NULL),(26071,7,'','',10124,'rabbitmq shovels','rabbitmq.discovery_shovels','6m','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','',0,'1d',0,0,0,'',1,'',NULL),(26072,2,'','',10124,'RabbitMQ  $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_consumers,{#QUEUENAME}]','0','1w','90d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26073,2,'','',10124,'RabbitMQ  $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_memory,{#QUEUENAME}]','0','1w','90d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26074,2,'','',10124,'RabbitMQ  $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_messages,{#QUEUENAME}]','0','1w','90d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26075,2,'','',10124,'RabbitMQ  $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_messages_unacknowledged,{#QUEUENAME}]','0','1w','90d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26076,2,'','',10124,'RabbitMQ $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_message_stats_ack,{#QUEUENAME}]','0','1w','365d',0,0,'','msgs/s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Rate of message acknowledgement per queue',0,'30d',0,0,0,'',0,'',NULL),(26077,2,'','',10124,'RabbitMQ $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_message_stats_deliver_get,{#QUEUENAME}]','0','1w','365d',0,0,'','msgs/s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Rate of message delivery to a consumer per queue',0,'30d',0,0,0,'',0,'',NULL),(26078,2,'','',10124,'RabbitMQ $2 on vhost $1, queue $3','rabbitmq.queues[{#VHOSTNAME},queue_message_stats_publish,{#QUEUENAME}]','0','1w','365d',0,0,'','msgs/s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Rate of message delivery to a consumer per queue',0,'30d',0,0,0,'',0,'',NULL),(26079,2,'','',10124,'RabbitMQ  $2 on vhost $1, shovel $3 status','rabbitmq.shovels[{#VHOSTNAME},shovel_state,{#SHOVELNAME}]','0','1w','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Shovel Status',0,'30d',0,0,0,'',0,'',NULL),(26080,7,'','',10125,'PostgreSQL bgwriter: buffers allocated','pgsql.bgwriter.buffers_alloc[{$PG_CONNINFO}]','600','7d','365d',1,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26081,7,'','',10125,'PostgreSQL config: $2','pgsql.setting[{$PG_CONNINFO},fsync]','21600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','http://www.postgresql.org/docs/9.2/static/runtime-config-wal.html#GUC-FSYNC',0,'30d',0,0,0,'',0,'',NULL),(26082,7,'','',10125,'PostgreSQL dbstat: tuples deleted per second','pgsql.dbstat.sum.tup_deleted[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of rows deleted by queries.',0,'30d',0,0,0,'',0,'',NULL),(26083,7,'','',10125,'PostgreSQL dbstat: tuples fetched per second','pgsql.dbstat.sum.tup_fetched[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of rows fetched by queries.',0,'30d',0,0,0,'',0,'',NULL),(26084,7,'','',10125,'PostgreSQL dbstat: tuples inserted per second','pgsql.dbstat.sum.tup_inserted[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of rows inserted by queries.',0,'30d',0,0,0,'',0,'',NULL),(26085,7,'','',10125,'PostgreSQL dbstat: tuples returned per second','pgsql.dbstat.sum.tup_returned[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of rows returned by queries.',0,'30d',0,0,0,'',0,'',NULL),(26086,7,'','',10125,'PostgreSQL dbstat: tuples updated per second','pgsql.dbstat.sum.tup_updated[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of rows updated by queries.',0,'30d',0,0,0,'',0,'',NULL),(26087,7,'','',10125,'PostgresSQL dbstat: commits per second','pgsql.dbstat.sum.xact_commit[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of transactions that have been committed.',0,'30d',0,0,0,'',0,'',NULL),(26088,7,'','',10125,'PostgreSQL dbstat: rollbacks per second','pgsql.dbstat.sum.xact_rollback[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of transactions that have been rolled back.',0,'30d',0,0,0,'',0,'',NULL),(26089,7,'','',10125,'PostgreSQL pg_stat_statements: average query time','pgsql.pgstatstatements.avg_query_time[{$PG_CONNINFO}]','60','7d','365d',0,0,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26090,7,'','',10125,'PostgreSQL: ping','pgsql.ping[{$PG_CONNINFO}]','60','7d','365d',0,0,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26091,7,'','',10125,'PostgreSQL config: $2','pgsql.setting[{$PG_CONNINFO},full_page_writes]','21600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','http://www.postgresql.org/docs/9.2/static/runtime-config-wal.html#GUC-FULL-PAGE-WRITES',0,'30d',0,0,0,'',0,'',NULL),(26092,7,'','',10125,'PostgreSQL dbstat: temp_bytes written','pgsql.dbstat.sum.temp_bytes[{$PG_CONNINFO}]','120','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total amount of data written to temporary files by queries. All temporary files are counted, regardless of why the temporary file was created, and regardless of the log_temp_files setting.',0,'30d',0,0,0,'',0,'',NULL),(26093,7,'','',10125,'PostgreSQL config: $2','pgsql.setting[{$PG_CONNINFO},synchronous_commit]','21600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','http://www.postgresql.org/docs/9.2/static/runtime-config-wal.html#GUC-SYNCHRONOUS-COMMIT',0,'30d',0,0,0,'',0,'',NULL),(26094,7,'','',10125,'PostgreSQL streaming replication: stand-by count','pgsql.streaming.count[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Streaming replication stand-bys count.',0,'30d',0,0,0,'',0,'',NULL),(26095,7,'','',10125,'PostgreSQL streaming replication: recovery state','pgsql.streaming.state[{$PG_CONNINFO}]','3600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Streaming replication state: t (true) if service is in recovery mode, and f (false) if server in master mode.',0,'30d',0,0,0,'',0,'',NULL),(26096,7,'','',10125,'PostgreSQL transactions: current max active transaction time','pgsql.transactions.active[{$PG_CONNINFO}]','60','7d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26097,7,'','',10125,'PostgreSQL transactions: current max idle transaction time','pgsql.transactions.idle[{$PG_CONNINFO}]','60','7d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26098,7,'','',10125,'PostgreSQL transactions: current max prepared transaction time','pgsql.transactions.prepared[{$PG_CONNINFO}]','60','7d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26099,7,'','',10125,'PostgreSQL transactions: current max waiting transaction time','pgsql.transactions.waiting[{$PG_CONNINFO}]','60','7d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26100,7,'','',10125,'PostgreSQL: service uptime','pgsql.uptime[{$PG_CONNINFO}]','60','7d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26101,7,'','',10125,'PostgreSQL: WAL segments count','pgsql.wal.count[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of WAL segments stored in pg_xlog directory.',0,'30d',0,0,0,'',0,'',NULL),(26102,7,'','',10125,'PostgreSQL: WAL write','pgsql.wal.write[{$PG_CONNINFO}]','120','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','WAL write in bytes,.',0,'30d',0,0,0,'',0,'',NULL),(26103,7,'','',10125,'PostgreSQL dbstat: temp_files created','pgsql.dbstat.sum.temp_files[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of temporary files created by queries. All temporary files are counted, regardless of why the temporary file was created (e.g., sorting or hashing), and regardless of the log_temp_files setting.',0,'30d',0,0,0,'',0,'',NULL),(26104,7,'','',10125,'PostgreSQL dbstat: registered deadlocks','pgsql.dbstat.sum.deadlocks[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of deadlocks detected.',0,'30d',0,0,0,'',0,'',NULL),(26105,7,'','',10125,'PostgreSQL bgwriter: buffers written directly by a backend','pgsql.bgwriter.buffers_backend[{$PG_CONNINFO}]','600','7d','365d',1,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26106,7,'','',10125,'PostgreSQL buffers: total','pgsql.buffercache.total[{$PG_CONNINFO}]','300','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26107,7,'','',10125,'PostgreSQL bgwriter: times a backend had to execute its own fsync','pgsql.bgwriter.buffers_backend_fsync[{$PG_CONNINFO}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26108,7,'','',10125,'PostgreSQL bgwriter: buffers written during checkpoints','pgsql.bgwriter.buffers_checkpoint[{$PG_CONNINFO}]','600','7d','365d',1,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26109,7,'','',10125,'PostgreSQL bgwriter: buffers written by the bgwriter','pgsql.bgwriter.buffers_clean[{$PG_CONNINFO}]','600','7d','365d',1,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26110,7,'','',10125,'PostgreSQL bgwriter: required checkpoints','pgsql.bgwriter.checkpoints_req[{$PG_CONNINFO}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26111,7,'','',10125,'PostgreSQL bgwriter: checkpoints by timeout','pgsql.bgwriter.checkpoints_timed[{$PG_CONNINFO}]','600','7d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26112,7,'','',10125,'PostgreSQL bgwriter: sync time','pgsql.bgwriter.checkpoint_sync_time[{$PG_CONNINFO}]','600','7d','365d',0,3,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26113,7,'','',10125,'PostgreSQL bgwriter: write time','pgsql.bgwriter.checkpoint_write_time[{$PG_CONNINFO}]','600','7d','365d',0,3,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26114,7,'','',10125,'PostgreSQL bgwriter: max written','pgsql.bgwriter.maxwritten_clean[{$PG_CONNINFO}]','600','7d','365d',1,3,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26115,7,'','',10125,'PostgreSQL buffers: clear','pgsql.buffercache.clear[{$PG_CONNINFO}]','300','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26116,7,'','',10125,'PostgreSQL buffers: dirty','pgsql.buffercache.dirty[{$PG_CONNINFO}]','300','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26117,7,'','',10125,'PostgreSQL buffers: used','pgsql.buffercache.used[{$PG_CONNINFO}]','300','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26118,7,'','',10125,'PostgreSQL dbstat: registered conflicts','pgsql.dbstat.sum.conflicts[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of queries canceled due to conflicts with recovery in this database. (Conflicts occur only on standby servers; see pg_stat_database_conflicts for details.).',0,'30d',0,0,0,'',0,'',NULL),(26119,7,'','',10125,'PostgreSQL: cache hit ratio','pgsql.cache.hit[{$PG_CONNINFO}]','3600','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Check cache hit ratio in %.',0,'30d',0,0,0,'',0,'',NULL),(26120,7,'','',10125,'PostgreSQL: number of active connections','pgsql.connections.active[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of active clients who connected to the PostgreSQL service and performing work.',0,'30d',0,0,0,'',0,'',NULL),(26121,7,'','',10125,'PostgreSQL: number of idle connections','pgsql.connections.idle[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of idle clients connected to the PostgreSQL service.',0,'30d',0,0,0,'',0,'',NULL),(26122,7,'','',10125,'PostgreSQL: number of idle in transaction connections','pgsql.connections.idle_in_transaction[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of idle clients who connected to the PostgreSQL service and have unfinished transaction. This client must be disconnected.',0,'30d',0,0,0,'',0,'',NULL),(26123,7,'','',10125,'PostgreSQL: number of prepared connections','pgsql.connections.prepared[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of clients connected to the PostgreSQL service and blocked by others clients.',0,'30d',0,0,0,'',0,'',NULL),(26124,7,'','',10125,'PostgreSQL: total connections','pgsql.connections.total[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of clients connected to the PostgreSQL service.',0,'30d',0,0,0,'',0,'',NULL),(26125,7,'','',10125,'PostgreSQL: total connections (%)','pgsql.connections.total_pct[{$PG_CONNINFO}]','60','7d','365d',0,3,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Connections percentage of the maximum number of allowed connections (max_connections).',0,'30d',0,0,0,'',0,'',NULL),(26126,7,'','',10125,'PostgreSQL: number of waiting connections','pgsql.connections.waiting[{$PG_CONNINFO}]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total count of clients connected to the PostgreSQL service and blocked by others clients.',0,'30d',0,0,0,'',0,'',NULL),(26127,7,'','',10125,'PostgreSQL dbstat: blocks hit per second','pgsql.dbstat.sum.blks_hit[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of times disk blocks were found already in the buffer cache, so that a read was not necessary (this only includes hits in the PostgreSQL buffer cache, not the operating system\'s file system cache)',0,'30d',0,0,0,'',0,'',NULL),(26128,7,'','',10125,'PostgreSQL dbstat: blocks read per second','pgsql.dbstat.sum.blks_read[{$PG_CONNINFO}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of disk blocks read',0,'30d',0,0,0,'',0,'',NULL),(26129,7,'','',10125,'PostgreSQL: number of running processes $1','proc.num[{$PG_PROCESS_NAME}]','30','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26130,7,'','',10125,'PostgreSQL databases discovery','pgsql.db.discovery[{$PG_CONNINFO}]','3600','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','PostgreSQL database discovery. Use regular expressions to configure search.',0,'7d',0,0,0,'',0,'',NULL),(26131,7,'','',10125,'PostgreSQL streaming stand-by discovery','pgsql.streaming.discovery[{$PG_CONNINFO}]','3600','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Low level discovery for streaming replication servers which connected to this server.',0,'1d',0,0,0,'',0,'',NULL),(26132,7,'','',10125,'PostgreSQL database tables discovery','pgsql.table.discovery[{$PG_CONNINFO}]','3600','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','PostgreSQL tables discovery. Use regular expressions to configure search.\r\nDisabled by default because may add too many items.',0,'1d',0,0,0,'',0,'',NULL),(26133,7,'','',10125,'PostgreSQL: database {#DBNAME} size','pgsql.db.size[{$PG_CONNINFO},{#DBNAME}]','1800','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Single database size.',0,'30d',0,0,0,'',0,'',NULL),(26134,3,'','',10125,'PostgreSQL packet loss with {#HOTSTANDBY}, %','icmppingloss[{#HOTSTANDBY},10,100,,]','60','7d','365d',0,3,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26135,7,'','',10125,'PostgreSQL streaming lag with {#HOTSTANDBY} in bytes','pgsql.streaming.lag.bytes[{$PG_CONNINFO},{#HOTSTANDBY}]','60','7d','365d',0,3,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26136,7,'','',10125,'PostgreSQL streaming lag with {#HOTSTANDBY} in seconds','pgsql.streaming.lag.seconds[{$PG_CONNINFO_STANDBY},{#HOTSTANDBY}]','60','7d','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','ATTENTION: This check requires access to the remote server postgresql service, respectively, should be determined access in pg_hba.conf on remote server.\r\nExample:\r\nhost zabbix postgres 1.2.3.4/32 trust',0,'30d',0,0,0,'',0,'',NULL),(26137,7,'','',10125,'PostgreSQL: table {#TABLENAME} indexes size','pgsql.index.size[{$PG_CONNINFO},{#TABLENAME}]','900','7d','365d',0,0,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','PostgreSQL all indexes size which belongs to a single table.',0,'30d',0,0,0,'',0,'',NULL),(26138,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: rows deleted per second','pgsql.table.stat.n_tup_del[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of rows deleted.',0,'30d',0,0,0,'',0,'',NULL),(26139,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: vacuums','pgsql.table.stat.vacuum_count[{$PG_CONNINFO},{#TABLENAME}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of vacuum operations performed on this table.',0,'30d',0,0,0,'',0,'',NULL),(26140,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: disk blocks read per second from TOAST','pgsql.table.stat.toast_blks_read[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of disk blocks read from this table\'s TOAST table (if any).',0,'30d',0,0,0,'',0,'',NULL),(26141,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: disk blocks hits per second from TOAST','pgsql.table.stat.toast_blks_hit[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of buffer hits in this table\'s TOAST table (if any).',0,'30d',0,0,0,'',0,'',NULL),(26142,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: disk blocks read per second from TOAST indexes','pgsql.table.stat.tidx_blks_read[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of disk blocks read from this table\'s TOAST table index (if any).',0,'30d',0,0,0,'',0,'',NULL),(26143,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: disk blocks hits per second from TOAST indexes','pgsql.table.stat.tidx_blks_hit[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of buffer hits in this table\'s TOAST table index (if any).',0,'30d',0,0,0,'',0,'',NULL),(26144,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: tuples read per second by sequential scans','pgsql.table.stat.seq_tup_read[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of live rows fetched by sequential scans.',0,'30d',0,0,0,'',0,'',NULL),(26145,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: sequential scans','pgsql.table.stat.seq_scan[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of sequential scans initiated on this table.',0,'30d',0,0,0,'',0,'',NULL),(26146,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: rows updated per second','pgsql.table.stat.n_tup_upd[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of rows updated.',0,'30d',0,0,0,'',0,'',NULL),(26147,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: rows inserted per second','pgsql.table.stat.n_tup_ins[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of rows inserted.',0,'30d',0,0,0,'',0,'',NULL),(26148,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: rows HOT updated per second','pgsql.table.stat.n_tup_hot_upd[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of rows HOT updated (i.e., with no separate index update required).',0,'30d',0,0,0,'',0,'',NULL),(26149,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: live rows','pgsql.table.stat.n_live_tup[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Estimated number of live rows.',0,'30d',0,0,0,'',0,'',NULL),(26150,7,'','',10125,'PostgreSQL: table {#TABLENAME} size','pgsql.table.size[{$PG_CONNINFO},{#TABLENAME}]','900','7d','365d',0,0,'','b','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','PostgreSQL single table size.',0,'30d',0,0,0,'',0,'',NULL),(26151,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: dead rows','pgsql.table.stat.n_dead_tup[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Estimated number of dead rows.',0,'30d',0,0,0,'',0,'',NULL),(26152,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: tuples read per second by index scans','pgsql.table.stat.idx_tup_fetch[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of live rows fetched by index scans.',0,'30d',0,0,0,'',0,'',NULL),(26153,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: index scans','pgsql.table.stat.idx_scan[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of index scans initiated on this table.',0,'30d',0,0,0,'',0,'',NULL),(26154,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: index blocks read per second','pgsql.table.stat.idx_blks_read[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of disk blocks read from all indexes on this table.',0,'30d',0,0,0,'',0,'',NULL),(26155,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: index blocks hit per second','pgsql.table.stat.idx_blks_hit[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of buffer hits in all indexes on this table.',0,'30d',0,0,0,'',0,'',NULL),(26156,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: cache blocks read per second','pgsql.table.stat.heap_blks_read[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of disk blocks read from this table.',0,'30d',0,0,0,'',0,'',NULL),(26157,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: cache blocks hits per second','pgsql.table.stat.heap_blks_hit[{$PG_CONNINFO},{#TABLENAME}]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of buffer hits in this table',0,'30d',0,0,0,'',0,'',NULL),(26158,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: autovacuums','pgsql.table.stat.autovacuum_count[{$PG_CONNINFO},{#TABLENAME}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of autovacuum operations performed on this table.',0,'30d',0,0,0,'',0,'',NULL),(26159,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: autoanalyzes','pgsql.table.stat.autoanalyze_count[{$PG_CONNINFO},{#TABLENAME}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of autoanalyze operations performed on this table.',0,'30d',0,0,0,'',0,'',NULL),(26160,7,'','',10125,'PostgreSQL table {#TABLENAME} stat: analyzes','pgsql.table.stat.analyze_count[{$PG_CONNINFO},{#TABLENAME}]','600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','Number of analyze operations performed on this table.',0,'30d',0,0,0,'',0,'',NULL),(26161,7,'','',10125,'PostgreSQL: table {#TABLENAME} rows count','pgsql.table.tuples[{$PG_CONNINFO},{#TABLENAME}]','900','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','PostgreSQL single table rows count.',0,'30d',0,0,0,'',0,'',NULL),(26162,7,'','',10126,'Postfix active queue','postfix.active','5m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26163,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Discarded','postfix[discarded]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26164,7,'','',10126,'Postfix processes','proc.num[,postfix]','30s','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26165,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Senders','postfix[senders]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26166,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Reject Warnings','postfix[reject_warnings]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26167,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Rejected','postfix[rejected]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26168,2,'','',10126,'Postfix Recipients','postfix[recipients]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26169,2,'','',10126,'Postfix Received','postfix[received]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26170,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Held','postfix[held]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26171,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Forwarded','postfix[forwarded]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26172,2,'','',10126,'Postfix Delivered','postfix[delivered]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26173,7,'','',10126,'Postfix deferred queue','postfix.deferred','5m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26174,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Deferred','postfix[deferred]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26175,2,'','',10126,'Postfix Connections','postfix[connections]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26176,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10126,'Postfix Bytes Received','postfix[bytes_received]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26177,2,'','',10126,'Postfix Bytes Delivered','postfix[bytes_delivered]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26178,2,'','',10126,'Postfix Bounced','postfix[bounced]','0','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26179,7,'','',10126,'Postfix mail queue','postfix.queue','5m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26180,7,'','',10126,'Postfix maildrop queue','postfix.maildrop','5m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26181,7,'','',10126,'Postfix incoming queue','postfix.incoming','5m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26182,7,'','',10126,'Postgrey processes','proc.num[,postgrey]','30s','1w','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26183,7,'','',10127,'[OPcache] Blacklist misses','opcache[blacklist_misses]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26184,7,'','',10127,'[OPcache] Hit rate','opcache[opcache_hit_rate]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26185,7,'','',10127,'[OPcache] Max wasted percentage','opcache[max_wasted_percentage]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26186,7,'','',10127,'[OPcache] Memory consumption','opcache[memory_consumption]','30m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26187,7,'','',10127,'[OPcache] Misses','opcache[misses]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26188,7,'','',10127,'[OPcache] Number of strings','opcache[number_of_strings]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26189,7,'','',10127,'[OPcache] Number of cached keys','opcache[num_cached_keys]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26190,7,'','',10127,'[OPcache] Number of cached scripts','opcache[num_cached_scripts]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26191,7,'','',10127,'[OPcache] Restarts','opcache[oom_restarts]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26192,7,'','',10127,'[OPcache] Optimization level','opcache[optimization_level]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26193,7,'','',10127,'[OPcache] Max cached keys','opcache[max_cached_keys]','1m','1800d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26194,7,'','',10127,'[OPcache] Protect memory','opcache[protect_memory]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26195,7,'','',10127,'[OPcache] Revalidate freq','opcache[revalidate_freq]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26196,7,'','',10127,'[OPcache] Revalidate PATH','opcache[revalidate_path]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26197,7,'','',10127,'[OPcache] Save comments','opcache[save_comments]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26198,7,'','',10127,'[OPcache] Used memory','opcache[used_memory]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26199,7,'','',10127,'[OPcache] Use CWD','opcache[use_cwd]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26200,7,'','',10127,'[OPcache] Validate timestamps','opcache[validate_timestamps]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26201,7,'','',10127,'[OPcache] Version','opcache[version]','1h','30d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26202,7,'','',10127,'[OPcache] Max file size','opcache[max_file_size]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26203,7,'','',10127,'[OPcache] Max accelerated files','opcache[max_accelerated_files]','1m','1800d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26204,7,'','',10127,'[OPcache] Blacklist miss ratio','opcache[blacklist_miss_ratio]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26205,7,'','',10127,'[OPcache] Fast shutdown','opcache[fast_shutdown]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26206,7,'','',10127,'[OPcache] Buffer size','opcache[buffer_size]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26207,7,'','',10127,'[OPcache] Consistency checks','opcache[consistency_checks]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26208,7,'','',10127,'[OPcache] Current wasted percentage','opcache[current_wasted_percentage]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26209,7,'','',10127,'[OPcache] Dups fix','opcache[dups_fix]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26210,7,'','',10127,'[OPcache] Enable','opcache[enable]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26211,7,'','',10127,'[OPcache] Enable CLI','opcache[enable_cli]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26212,7,'','',10127,'[OPcache] Enable file override','opcache[enable_file_override]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26213,7,'','',10127,'[OPcache] Force restart timeout','opcache[force_restart_timeout]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26214,7,'','',10127,'[OPcache] Manual restarts','opcache[manual_restarts]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26215,7,'','',10127,'[OPcache] Free memory','opcache[free_memory]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26216,7,'','',10127,'[OPcache] Hash restart','opcache[hash_restart]','1m','1w','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26217,7,'','',10127,'[OPcache] Hits','opcache[hits]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26218,7,'','',10127,'[OPcache] Inherited hack','opcache[inherited_hack]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26219,7,'','',10127,'[OPcache] ISU free memory','opcache[isu.free_memory]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26220,7,'','',10127,'[OPcache] ISU used memory','opcache[isu.used_memory]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26221,7,'','',10127,'[OPcache] Load comments','opcache[load_comments]','1m','1w','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26222,7,'','',10127,'[OPcache] Log verbosity level','opcache[log_verbosity_level]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26223,7,'','',10127,'[OPcache] Wasted memory','opcache[wasted_memory]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26224,7,'','',10128,'php-fpm status $1','php-fpm.status[accepted-conn]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','accepted-conn',0,'30d',0,0,0,'',0,'',NULL),(26225,7,'','',10128,'php-fpm status $1','php-fpm.status[active-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','active-processes',0,'30d',0,0,0,'',0,'',NULL),(26226,7,'','',10128,'php-fpm status $1','php-fpm.status[idle-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','idle-processes',0,'30d',0,0,0,'',0,'',NULL),(26227,7,'','',10128,'php-fpm status $1','php-fpm.status[listen-queue-len]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','accepts',0,'30d',0,0,0,'',0,'',NULL),(26228,7,'','',10128,'php-fpm status $1','php-fpm.status[listen-queue]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','listen-queue',0,'30d',0,0,0,'',0,'',NULL),(26229,7,'','',10128,'php-fpm status $1','php-fpm.status[max-active-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-active-processes',0,'30d',0,0,0,'',0,'',NULL),(26230,7,'','',10128,'php-fpm status $1','php-fpm.status[max-children-reached]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-children-reached',0,'30d',0,0,0,'',0,'',NULL),(26231,7,'','',10128,'php-fpm status $1','php-fpm.status[max-listen-queue]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-listen-queue',0,'30d',0,0,0,'',0,'',NULL),(26232,7,'','',10128,'php-fpm status $1','php-fpm.status[slow-requests]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','slow-requests',0,'30d',0,0,0,'',0,'',NULL),(26233,7,'','',10128,'php-fpm status $1','php-fpm.status[start-since]','1m','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','start-since',0,'30d',0,0,0,'',0,'',NULL),(26234,7,'','',10128,'php-fpm status $1','php-fpm.status[total-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','total-processes',0,'30d',0,0,0,'',0,'',NULL),(26235,7,'','',10128,'php-fpm is running','proc.num[php-fpm7,,,]','1m','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','is live',0,'30d',0,0,0,'',0,'',NULL),(26236,7,'','',10129,'php-fpm status $1','php-fpm.status[accepted-conn]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','accepted-conn',0,'30d',0,0,0,'',0,'',NULL),(26237,7,'','',10129,'php-fpm status $1','php-fpm.status[active-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','active-processes',0,'30d',0,0,0,'',0,'',NULL),(26238,7,'','',10129,'php-fpm status $1','php-fpm.status[idle-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','idle-processes',0,'30d',0,0,0,'',0,'',NULL),(26239,7,'','',10129,'php-fpm status $1','php-fpm.status[listen-queue-len]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','accepts',0,'30d',0,0,0,'',0,'',NULL),(26240,7,'','',10129,'php-fpm status $1','php-fpm.status[listen-queue]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','listen-queue',0,'30d',0,0,0,'',0,'',NULL),(26241,7,'','',10129,'php-fpm status $1','php-fpm.status[max-active-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-active-processes',0,'30d',0,0,0,'',0,'',NULL),(26242,7,'','',10129,'php-fpm status $1','php-fpm.status[max-children-reached]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-children-reached',0,'30d',0,0,0,'',0,'',NULL),(26243,7,'','',10129,'php-fpm status $1','php-fpm.status[max-listen-queue]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','max-listen-queue',0,'30d',0,0,0,'',0,'',NULL),(26244,7,'','',10129,'php-fpm status $1','php-fpm.status[slow-requests]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','slow-requests',0,'30d',0,0,0,'',0,'',NULL),(26245,7,'','',10129,'php-fpm status $1','php-fpm.status[start-since]','1m','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','start-since',0,'30d',0,0,0,'',0,'',NULL),(26246,7,'','',10129,'php-fpm status $1','php-fpm.status[total-processes]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','total-processes',0,'30d',0,0,0,'',0,'',NULL),(26247,7,'','',10130,'Fail2ban is enabled in autostart','chkconfig[fail2ban]','30m','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26248,7,'','',10130,'Temporary banned IP','fail2ban[banned]','5m','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26249,7,'','',10130,'Permanent banned IP','fail2ban[permanent]','5m','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26250,7,'','',10130,'Fail2Ban service is running','proc.num[fail2ban-server]','1m','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26251,7,'','',10131,'Nginx Accepted connections\\min','nginx.status[accepts]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26252,7,'','',10131,'Nginx Active connections','nginx.status[active]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26253,7,'','',10131,'Nginx Handled connections\\min','nginx.status[handled]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26254,7,'','',10131,'Nginx Proc_Num','nginx.status[proc_num]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26255,7,'','',10131,'Nginx Reading Connections','nginx.status[reading]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26256,7,'','',10131,'Nginx Requests\\min','nginx.status[requests]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26257,7,'','',10131,'Nginx Waiting Connections','nginx.status[waiting]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26258,7,'','',10131,'Nginx Writing Connections','nginx.status[writing]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26259,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Current number of bytes used to store items','memcache[bytes]','120','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26260,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Bytes this server is allowed to use for storage','memcache[limit_maxbytes]','3600','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26261,7,'','',10132,'Memcache tcp port listening','net.tcp.service[tcp,,11211]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26262,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of seconds since the server started','memcache[uptime]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26263,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of new items stored per second','memcache[total_items]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26264,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of connections opened per second','memcache[total_connections]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26265,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of worker threads requested','memcache[threads]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26266,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'User time for this process','memcache[rusage_user]','120','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26267,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'System time for this process','memcache[rusage_system]','120','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26268,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Process id of this server process','memcache[pid]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26269,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Items requested and not found per second','memcache[get_misses]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26270,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Bytes read by this server per second','memcache[bytes_read]','120','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26271,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Keys requested and found present per second','memcache[get_hits]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26272,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Items removed to free memory per second','memcache[evictions]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26273,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Current number of items stored','memcache[curr_items]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26274,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of open connections','memcache[curr_connections]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26275,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of connection structures allocated by the server','memcache[connection_structures]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26276,15,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Total number of retrieval and storage requests per second','memcache[cmd_total]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'last(\"memcache[cmd_get]\")+last(\"memcache[cmd_set]\")','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26277,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of storage requests per second','memcache[cmd_set]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26278,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Number of retrieval requests per second','memcache[cmd_get]','120','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26279,7,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'Bytes sent by this server per second','memcache[bytes_written]','120','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26280,7,'','',10132,'Memcached process number','proc.num[memcached]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26281,7,'','',10133,'Lighttpd - Processes','proc.num[lighttpd]','2m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26282,7,'','',10133,'Lighttpd - Version','system.run[\"/usr/sbin/lighttpd -v | head -1\"]','5m','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26283,7,'','',10134,'ldap[abandon,operations,monitorOpCompleted]','ldap[abandon,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26284,7,'','',10134,'ldap[search,operations,monitorOpInitiated]','ldap[search,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26285,7,'','',10134,'ldap[modrdn,operations,monitorOpInitiated]','ldap[modrdn,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26286,7,'','',10134,'ldap[open,threads,monitoredInfo]','ldap[open,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26287,7,'','',10134,'ldap[pending,threads,monitoredInfo]','ldap[pending,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26288,7,'','',10134,'ldap[read,waiters]','ldap[read,waiters]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26289,7,'','',10134,'ldap[runqueue,threads,monitoredInfo]','ldap[runqueue,threads,monitoredInfo]','30s','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26290,7,'','',10134,'ldap[search,operations,monitorOpCompleted]','ldap[search,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26291,7,'','',10134,'ldap[starting,threads,monitoredInfo]','ldap[starting,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26292,7,'','',10134,'ldap[modify,operations,monitorOpInitiated]','ldap[modify,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26293,7,'','',10134,'ldap[state,threads,monitoredInfo]','ldap[state,threads,monitoredInfo]','30s','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26294,7,'','',10134,'ldap[tasklist,threads,monitoredInfo]','ldap[tasklist,threads,monitoredInfo]','30s','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26295,7,'','',10134,'ldap[total,connections]','ldap[total,connections]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26296,7,'','',10134,'ldap[unbind,operations,monitorOpCompleted]','ldap[unbind,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26297,7,'','',10134,'ldap[unbind,operations,monitorOpInitiated]','ldap[unbind,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26298,7,'','',10134,'ldap[write,waiters]','ldap[write,waiters]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26299,7,'','',10134,'ldap[modrdn,operations,monitorOpCompleted]','ldap[modrdn,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26300,7,'','',10134,'ldap[modify,operations,monitorOpCompleted]','ldap[modify,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26301,7,'','',10134,'ldap[abandon,operations,monitorOpInitiated]','ldap[abandon,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26302,7,'','',10134,'ldap[compare,operations,monitorOpCompleted]','ldap[compare,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26303,7,'','',10134,'ldap[active,threads,monitoredInfo]','ldap[active,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26304,7,'','',10134,'ldap[add,operations,monitorOpCompleted]','ldap[add,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26305,7,'','',10134,'ldap[add,operations,monitorOpInitiated]','ldap[add,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26306,7,'','',10134,'ldap[backload,threads,monitoredInfo]','ldap[backload,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26307,7,'','',10134,'ldap[bind,operations,monitorOpCompleted]','ldap[bind,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26308,7,'','',10134,'ldap[bind,operations,monitorOpInitiated]','ldap[bind,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26309,7,'','',10134,'ldap[compare,operations,monitorOpInitiated]','ldap[compare,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26310,7,'','',10134,'ldap[max,threads,monitoredInfo]','ldap[max,threads,monitoredInfo]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26311,7,'','',10134,'ldap[current,connections]','ldap[current,connections]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26312,7,'','',10134,'ldap[delete,operations,monitorOpCompleted]','ldap[delete,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26313,7,'','',10134,'ldap[delete,operations,monitorOpInitiated]','ldap[delete,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26314,7,'','',10134,'ldap[entries,statistics]','ldap[entries,statistics]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26315,7,'','',10134,'ldap[extended,operations,monitorOpCompleted]','ldap[extended,operations,monitorOpCompleted]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26316,7,'','',10134,'ldap[extended,operations,monitorOpInitiated]','ldap[extended,operations,monitorOpInitiated]','30s','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26317,3,'','',10134,'LDAP service is running','net.tcp.service[ldap]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26330,7,'','',10135,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26331,7,'','',10135,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(26332,7,'','',10135,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(26333,7,'','',10135,'Maximum number of opened files','kernel.maxfiles','3600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(26334,7,'','',10135,'Swap free space','system.swap.size[,free]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26335,7,'','',10135,'CPU $2 time','system.cpu.util[,interrupt]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(26336,7,'','',10135,'CPU $2 time','system.cpu.util[,iowait]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'30d',0,0,0,'',0,'',NULL),(26337,7,'','',10135,'CPU $2 time','system.cpu.util[,nice]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(26338,7,'','',10135,'CPU $2 time','system.cpu.util[,softirq]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing software interrupts.',0,'30d',0,0,0,'',0,'',NULL),(26339,7,'','',10135,'CPU $2 time','system.cpu.util[,steal]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'30d',0,0,0,'',0,'',NULL),(26340,7,'','',10135,'CPU $2 time','system.cpu.util[,system]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(26341,7,'','',10135,'CPU $2 time','system.cpu.util[,user]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(26342,7,'','',10135,'Host name','system.hostname','3600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(26343,7,'','',10135,'Host local time','system.localtime','60','7d','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26344,7,'','',10135,'Swap free space percent','system.swap.size[,pfree]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26345,7,'','',10135,'Context switches per second','system.cpu.switches','60','7d','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26346,7,'','',10135,'Swap space total','system.swap.size[,total]','3600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26347,7,'','',10135,'System information','system.uname','3600','7d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(26348,7,'','',10135,'System uptime','system.uptime','600','7d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26349,7,'','',10135,'Number of logged in users','system.users.num','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(26350,7,'','',10135,'Checksum of /etc/hosts','vfs.file.cksum[/etc/hosts]','600','30d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26351,7,'','',10135,'Checksum of $1','vfs.file.cksum[/etc/passwd]','3600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26352,7,'','',10135,'Memory available','vm.memory.size[available]','60','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(26353,7,'','',10135,'Memory total','vm.memory.size[total]','3600','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26354,7,'','',10135,'Memory used','vm.memory.size[used]','60','30d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26355,7,'','',10135,'CPU $2 time','system.cpu.util[,idle]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(26356,7,'','',10135,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(26357,7,'','',10135,'Maximum number of processes','kernel.maxproc','3600','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(26358,7,'','',10135,'socket.tcp_lastack','socket.tcp_lastack','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26359,7,'','',10135,'Number of running processes','proc.num[,,run]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(26360,7,'','',10135,'Number of processes','proc.num[]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(26361,7,'','',10135,'socket.tcp_alloc','socket.tcp_alloc','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26362,7,'','',10135,'socket.tcp_closewait','socket.tcp_closewait','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26363,7,'','',10135,'socket.tcp_closing','socket.tcp_closing','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26364,7,'','',10135,'socket.tcp_established','socket.tcp_established','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26365,7,'','',10135,'socket.tcp_finwait1','socket.tcp_finwait1','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26366,7,'','',10135,'socket.tcp_finwait2','socket.tcp_finwait2','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26367,7,'','',10135,'socket.tcp_inuse','socket.tcp_inuse','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26368,7,'','',10135,'socket.tcp_listen','socket.tcp_listen','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26369,7,'','',10135,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(26370,7,'','',10135,'socket.tcp_mem','socket.tcp_mem','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26371,7,'','',10135,'socket.tcp_orphan','socket.tcp_orphan','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26372,7,'','',10135,'socket.tcp_synrecv','socket.tcp_synrecv','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26373,7,'','',10135,'socket.tcp_synsent','socket.tcp_synsent','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26374,7,'','',10135,'socket.tcp_timewait','socket.tcp_timewait','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26375,7,'','',10135,'socket.total_sockets','socket.total_sockets','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26376,7,'','',10135,'socket.udp_inuse','socket.udp_inuse','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26377,7,'','',10135,'Host boot time','system.boottime','600','7d','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26378,7,'','',10135,'Interrupts per second','system.cpu.intr','60','7d','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26379,7,'','',10135,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','60','7d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(26380,7,'','',10135,'Memory used percent','vm.memory.usepercent','60','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26381,7,'','',10135,'Disk discovery','disk.discovery','60','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26382,7,'','',10135,'Network interface discovery','net.if.discovery','60','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(26383,7,'','',10135,'Mounted filesystem discovery','vfs.fs.discovery','60','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(26384,7,'','',10135,'disk.status.avgqu-sz.{#DISK_NAME}','disk.status[{#DISK_NAME},avgqu-sz]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26385,7,'','',10135,'disk.status.avgrq-sz.{#DISK_NAME}','disk.status[{#DISK_NAME},avgrq-sz]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26386,7,'','',10135,'disk.status.await.{#DISK_NAME}','disk.status[{#DISK_NAME},await]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26387,7,'','',10135,'disk.status.rKBps.{#DISK_NAME}','disk.status[{#DISK_NAME},rKBps]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26388,7,'','',10135,'disk.status.rps.{#DISK_NAME}','disk.status[{#DISK_NAME},rps]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26389,7,'','',10135,'disk.status.rrqm.{#DISK_NAME}','disk.status[{#DISK_NAME},rrqm]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26390,7,'','',10135,'disk.status.r_await.{#DISK_NAME}','disk.status[{#DISK_NAME},r_await]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26391,7,'','',10135,'disk.status.svctm.{#DISK_NAME}','disk.status[{#DISK_NAME},svctm]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26392,7,'','',10135,'disk.status.util.{#DISK_NAME}','disk.status[{#DISK_NAME},util]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26393,7,'','',10135,'disk.status.wKBps.{#DISK_NAME}','disk.status[{#DISK_NAME},wKBps]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26394,7,'','',10135,'disk.status.wps.{#DISK_NAME}','disk.status[{#DISK_NAME},wps]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26395,7,'','',10135,'disk.status.wrqm.{#DISK_NAME}','disk.status[{#DISK_NAME},wrqm]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26396,7,'','',10135,'disk.status.w_await.{#DISK_NAME}','disk.status[{#DISK_NAME},w_await]','30','30d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26397,7,'','',10135,'Packets QPS in interface traffic on {#IFNAME}','net.if.in[{#IFNAME},packets]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26398,7,'','',10135,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','60','7d','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26399,7,'','',10135,'Packets QPS out interface traffic on {#IFNAME}','net.if.out[{#IFNAME},packets]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26400,7,'','',10135,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','60','7d','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26401,7,'','',10135,'Total traffic statistics interface traffic on {#IFNAME}','net.if.total[{#IFNAME},bytes]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26402,7,'','',10135,'Dropped traffic statistics interface traffic on {#IFNAME}','net.if.total[{#IFNAME},dropped]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26403,7,'','',10135,'Errors traffic statistics interface traffic on {#IFNAME}','net.if.total[{#IFNAME},errors]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26404,7,'','',10135,'Packets traffic statistics interface traffic on {#IFNAME}','net.if.total[{#IFNAME},packets]','60','7d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26405,7,'','',10135,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26406,7,'','',10135,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','60','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26407,7,'','',10135,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','60','7d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26408,7,'','',10135,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','3600','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26409,7,'','',10135,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','60','7d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26410,7,'','',10136,'Linux Redis Discovery','redis.discovery','30','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of redis ports on Linux',0,'30d',0,0,0,'',0,'',NULL),(26411,7,'','',10136,'Redis-$1-shutdown','net.tcp.listen[{#REDISPORT}]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26412,7,'','',10136,'Redis-$1-slave-master_link_status','redis[{#REDISPORT},master_link_status]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26413,7,'','',10136,'Redis-$1-used_memory_rss','redis[{#REDISPORT},used_memory_rss]','60','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26414,7,'','',10136,'Redis-$1-used_memory_peak','redis[{#REDISPORT},used_memory_peak]','60','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26415,7,'','',10136,'Redis-$1-used_memory','redis[{#REDISPORT},used_memory]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26416,7,'','',10136,'Redis-$1-uptime_in_days','redis[{#REDISPORT},uptime_in_days]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26417,7,'','',10136,'Redis-$1-total_system_memory','redis[{#REDISPORT},total_system_memory]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26418,7,'','',10136,'Redis-$1-role','redis[{#REDISPORT},role]','60','90d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26419,7,'','',10136,'Redis-$1-redis_version','redis[{#REDISPORT},redis_version]','60','90d','365d',1,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26420,7,'','',10136,'Redis-$1-rdb_last_save_time','redis[{#REDISPORT},rdb_last_save_time]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26421,7,'','',10136,'Redis-$1-rdb_last_bgsave_time_sec','redis[{#REDISPORT},rdb_last_bgsave_time_sec]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26422,7,'','',10136,'Redis-$1-maxmemory','redis[{#REDISPORT},maxmemory]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26423,7,'','',10136,'Redis-$1-maxclients','redis[{#REDISPORT},maxclients]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26424,7,'','',10136,'Redis-$1-slave-master_port','redis[{#REDISPORT},master_port]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26425,7,'','',10136,'Redis-$1-slave-master_host','redis[{#REDISPORT},master_host]','60','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26426,7,'','',10136,'Redis-$1-aof_enabled','redis[{#REDISPORT},aof_enabled]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26427,7,'','',10136,'Redis-$1-db0-keys','redis[{#REDISPORT},keys]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26428,7,'','',10136,'Redis-$1-keyspace_misses','redis[{#REDISPORT},keyspace_misses]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26429,7,'','',10136,'Redis-$1-keyspace_hits','redis[{#REDISPORT},keyspace_hits]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26430,7,'','',10136,'Redis-$1-instantaneous_output_kbps','redis[{#REDISPORT},instantaneous_output_kbps]','60','90d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26431,7,'','',10136,'Redis-$1-instantaneous_ops_per_sec','redis[{#REDISPORT},instantaneous_ops_per_sec]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26432,7,'','',10136,'Redis-$1-instantaneous_input_kbps','redis[{#REDISPORT},instantaneous_input_kbps]','60','90d','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26433,7,'','',10136,'Redis-$1-expired_keys','redis[{#REDISPORT},expired_keys]','60','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26434,7,'','',10136,'Redis-$1-evicted_keys','redis[{#REDISPORT},evicted_keys]','60','90d','365d',1,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26435,7,'','',10136,'Redis-$1-connected_slaves','redis[{#REDISPORT},connected_slaves]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26436,7,'','',10136,'Redis-$1-connected_clients','redis[{#REDISPORT},connected_clients]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26437,7,'','',10136,'Redis-$1-cluster_enabled','redis[{#REDISPORT},cluster_enabled]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26438,7,'','',10136,'Redis-$1-blocked_clients','redis[{#REDISPORT},blocked_clients]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26439,7,'','',10136,'Redis-$1-aof_last_rewrite_time_sec','redis[{#REDISPORT},aof_last_rewrite_time_sec]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26440,7,'','',10136,'Redis-$1-use_memory_percent','redis[{#REDISPORT},use_memory_percent]','60','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26441,7,'','',10137,'Linux Memcached Discovery','memcached.discovery','60','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of redis ports on Linux',0,'30d',0,0,0,'',0,'',NULL),(26442,7,'','',10137,'Memcached-$1-bytes_read','memcached[{#MCPORT},bytes_read]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26443,7,'','',10137,'Memcached-$1-bytes_written','memcached[{#MCPORT},bytes_written]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26444,7,'','',10137,'Memcached-$1-cmd_get','memcached[{#MCPORT},cmd_get]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26445,7,'','',10137,'Memcached-$1-cmd_set','memcached[{#MCPORT},cmd_set]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26446,7,'','',10137,'Memcached-$1-curr_connections','memcached[{#MCPORT},curr_connections]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26447,7,'','',10137,'Memcached-$1-evicted_unfetched','memcached[{#MCPORT},evicted_unfetched]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26448,7,'','',10137,'Memcached-$1-expired_unfetched','memcached[{#MCPORT},expired_unfetched]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26449,7,'','',10137,'Memcached-$1-get_hits','memcached[{#MCPORT},get_hits]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26450,7,'','',10137,'Memcached-$1-get_misses','memcached[{#MCPORT},get_misses]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26451,7,'','',10137,'Memcached-$1-total_connections','memcached[{#MCPORT},total_connections]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26452,7,'','',10137,'Memcached-$1-total_items','memcached[{#MCPORT},total_items]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26453,7,'','',10137,'Memcached-$1-uptime','memcached[{#MCPORT},uptime]','3600','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26454,7,'','',10137,'Memcached-$1-version','memcached[{#MCPORT},version]','3600','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(26455,7,'','',10137,'Memcached-$1-shutdown','net.tcp.listen[{#MCPORT}]','60','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (4653,1,10016),(694,1,10025),(636,1,10055),(634,1,10056),(448,1,10057),(444,1,10058),(646,1,17318),(642,1,17352),(4462,5,22452),(4464,5,22454),(4466,5,22456),(4468,5,22458),(4704,5,22686),(4458,7,22446),(4460,7,22448),(600,9,10009),(804,9,10013),(587,13,10010),(689,13,17354),(671,13,17356),(675,13,17358),(679,13,17360),(683,13,17362),(4659,13,22665),(4665,13,22668),(4671,13,22671),(4677,13,22674),(4683,13,22677),(4692,13,22680),(4698,13,22683),(4587,15,10014),(4593,15,10026),(4595,15,10030),(4589,15,17350),(4583,15,22181),(588,17,10010),(690,17,17354),(672,17,17356),(676,17,17358),(680,17,17360),(684,17,17362),(4660,17,22665),(4666,17,22668),(4672,17,22671),(4678,17,22674),(4684,17,22677),(4693,17,22680),(4699,17,22683),(693,21,10025),(447,21,10057),(443,21,10058),(645,21,17318),(641,21,17352),(4654,23,10016),(654,23,10019),(4447,179,22183),(4443,179,22185),(4441,179,22187),(4097,179,22189),(5813,179,22191),(5814,179,22196),(5815,179,22199),(4451,179,22219),(4445,179,22396),(4398,179,22399),(4400,179,22400),(4401,179,22401),(4402,179,22402),(4404,179,22404),(4406,179,22406),(4408,179,22408),(4410,179,22410),(4412,179,22412),(4414,179,22414),(4416,179,22416),(4418,179,22418),(4420,179,22420),(4422,179,22422),(4424,179,22424),(4426,179,22426),(4430,179,22430),(4707,179,22689),(5341,179,23171),(5421,179,23251),(5849,179,23634),(5883,179,23661),(5885,179,23663),(4548,206,22231),(4544,206,22232),(5514,206,23318),(4545,207,10020),(4549,207,10059),(5515,207,23319),(4719,227,22701),(4720,227,22702),(4721,227,22703),(4722,227,22704),(4723,227,22705),(4724,227,22706),(4725,227,22707),(4726,227,22708),(4762,227,22709),(4727,228,22710),(4728,228,22711),(4729,228,22712),(4730,228,22713),(4731,228,22714),(4732,229,22715),(4733,229,22716),(4734,229,22717),(4735,229,22718),(4736,229,22719),(4737,230,22721),(4738,230,22722),(4739,230,22723),(4740,230,22724),(4741,230,22725),(4742,230,22726),(4743,230,22727),(4744,230,22728),(4763,230,22729),(4745,231,22730),(4746,231,22731),(4747,231,22732),(4748,231,22733),(4749,231,22734),(4750,232,22736),(4751,232,22737),(4752,232,22738),(4753,232,22739),(4754,232,22740),(4755,232,22741),(4756,232,22742),(4757,232,22743),(4764,232,22744),(4758,234,22749),(4759,234,22755),(4760,234,22756),(4761,234,22757),(4765,234,22758),(4766,234,22759),(4767,235,22761),(4768,235,22762),(4769,235,22763),(4770,235,22764),(4771,235,22765),(4772,235,22766),(4773,236,22768),(4774,236,22769),(4775,236,22770),(4776,236,22771),(4777,236,22772),(4778,236,22773),(4779,237,22774),(4780,237,22775),(4781,237,22776),(4782,237,22777),(4783,237,22778),(4784,238,22780),(4785,238,22781),(4786,238,22782),(4787,238,22783),(4788,238,22784),(4789,238,22785),(4790,238,22786),(4791,238,22787),(4792,238,22788),(4793,240,22793),(4794,241,22797),(4795,242,22799),(4817,245,22800),(4818,245,22801),(4819,245,22802),(4820,245,22803),(4821,245,22805),(4823,245,22806),(4822,246,22804),(4824,247,22807),(4825,248,22809),(4826,248,22810),(4827,248,22811),(4828,248,22812),(4829,248,22813),(4830,248,22814),(4831,248,22816),(4832,249,22808),(4833,249,22815),(4834,250,22817),(4835,250,22818),(4836,251,22819),(4837,251,22820),(4838,251,22821),(4839,251,22822),(4840,251,22823),(4841,251,22824),(4842,251,22825),(4843,251,22826),(4844,251,22827),(4845,251,22828),(4846,251,22829),(4847,251,22830),(4848,251,22831),(4849,251,22832),(4850,252,22833),(4851,252,22834),(5516,252,23320),(4858,253,22840),(4860,253,22841),(4862,253,22842),(4864,253,22843),(4866,253,22844),(4868,253,22845),(4870,253,22846),(4874,253,22848),(4880,253,22851),(4882,253,22852),(5276,254,22868),(5278,254,22869),(5279,254,22870),(5280,254,22871),(5277,254,22872),(4857,255,22839),(4885,255,22853),(4887,255,22854),(4892,255,22858),(4894,255,22859),(4888,256,22855),(4889,256,22856),(4890,256,22857),(4898,256,22862),(4899,256,22863),(5152,257,23075),(5153,257,23076),(4852,258,22835),(4853,258,22836),(4856,258,22839),(4884,258,22853),(4886,258,22854),(4891,258,22858),(4893,258,22859),(4895,258,22860),(4859,259,22840),(4861,259,22841),(4863,259,22842),(4865,259,22843),(4867,259,22844),(4869,259,22845),(4871,259,22846),(4875,259,22848),(4881,259,22851),(4883,259,22852),(4854,260,22837),(4855,260,22838),(4896,261,22860),(4897,261,22861),(4900,262,22873),(4901,262,22874),(5517,262,23321),(4908,263,22880),(4910,263,22881),(4912,263,22882),(4914,263,22883),(4916,263,22884),(4918,263,22885),(4920,263,22886),(4924,263,22888),(4930,263,22891),(4932,263,22892),(5256,264,22908),(5258,264,22909),(5259,264,22910),(5260,264,22911),(5257,264,22912),(4907,265,22879),(4935,265,22893),(4937,265,22894),(4942,265,22898),(4944,265,22899),(4938,266,22895),(4939,266,22896),(4940,266,22897),(4948,266,22902),(4949,266,22903),(5150,267,23073),(5151,267,23074),(4902,268,22875),(4903,268,22876),(4906,268,22879),(4934,268,22893),(4936,268,22894),(4941,268,22898),(4943,268,22899),(4945,268,22900),(4909,269,22880),(4911,269,22881),(4913,269,22882),(4915,269,22883),(4917,269,22884),(4919,269,22885),(4921,269,22886),(4925,269,22888),(4931,269,22891),(4933,269,22892),(4904,270,22877),(4905,270,22878),(4946,271,22900),(4947,271,22901),(4950,272,22913),(4951,272,22914),(5518,272,23322),(4958,273,22920),(4960,273,22921),(4962,273,22922),(4964,273,22923),(4966,273,22924),(5310,273,23108),(5307,273,23109),(5290,273,23110),(5313,273,23111),(5304,273,23112),(5296,273,23113),(5292,273,23114),(5294,273,23115),(5330,273,23118),(5332,273,23119),(5334,273,23120),(5336,273,23121),(5877,273,23123),(5248,274,22948),(5250,274,22949),(5251,274,22950),(5252,274,22951),(5249,274,22952),(5323,274,23116),(5326,274,23117),(5512,275,22933),(4987,275,22934),(4992,275,22938),(4994,275,22939),(4998,276,22942),(4999,276,22943),(5879,276,23122),(5193,276,23124),(5194,276,23125),(5319,276,23126),(5321,276,23127),(5322,276,23128),(5316,276,23129),(5317,276,23130),(5325,276,23131),(5254,277,22945),(5255,277,22946),(5513,278,22933),(4986,278,22934),(4991,278,22938),(4993,278,22939),(4995,278,22940),(4959,279,22920),(4961,279,22921),(4963,279,22922),(4965,279,22923),(4967,279,22924),(5312,279,23108),(5309,279,23109),(5291,279,23110),(5315,279,23111),(5305,279,23112),(5297,279,23113),(5293,279,23114),(5295,279,23115),(5324,279,23116),(5327,279,23117),(5333,279,23119),(5335,279,23120),(5337,279,23121),(5880,279,23122),(5878,279,23123),(4954,280,22917),(4955,280,22918),(4996,281,22940),(4997,281,22941),(5000,282,22953),(5001,282,22954),(5519,282,23323),(5010,283,22961),(5012,283,22962),(5014,283,22963),(5018,283,22965),(5024,283,22968),(5030,283,22971),(5032,283,22972),(5262,284,22988),(5264,284,22989),(5265,284,22990),(5267,284,22991),(5263,284,22992),(5035,285,22973),(5037,285,22974),(5042,285,22978),(5048,286,22982),(5049,286,22983),(5268,287,22985),(5269,287,22986),(5034,288,22973),(5036,288,22974),(5041,288,22978),(5045,288,22980),(5011,289,22961),(5013,289,22962),(5015,289,22963),(5019,289,22965),(5025,289,22968),(5031,289,22971),(5033,289,22972),(5046,291,22980),(5047,291,22981),(5050,292,22993),(5051,292,22994),(5520,292,23324),(5058,293,23000),(5060,293,23001),(5062,293,23002),(5064,293,23003),(5066,293,23004),(5068,293,23005),(5072,293,23007),(5080,293,23011),(5082,293,23012),(5281,294,23028),(5284,294,23029),(5285,294,23030),(5286,294,23031),(5283,294,23032),(5057,295,22999),(5085,295,23013),(5087,295,23014),(5092,295,23018),(5094,295,23019),(5088,296,23015),(5089,296,23016),(5090,296,23017),(5098,296,23022),(5099,296,23023),(5287,297,23025),(5288,297,23026),(5053,298,22996),(5056,298,22999),(5084,298,23013),(5086,298,23014),(5091,298,23018),(5093,298,23019),(5095,298,23020),(5059,299,23000),(5061,299,23001),(5063,299,23002),(5065,299,23003),(5067,299,23004),(5069,299,23005),(5073,299,23007),(5081,299,23011),(5083,299,23012),(5054,300,22997),(5055,300,22998),(5096,301,23020),(5097,301,23021),(5100,302,23033),(5101,302,23034),(5521,302,23325),(5110,303,23041),(5112,303,23042),(5114,303,23043),(5271,304,23068),(5273,304,23069),(5274,304,23070),(5275,304,23071),(5272,304,23072),(5107,305,23039),(5135,305,23053),(5137,305,23054),(5142,305,23058),(5144,305,23059),(5148,306,23062),(5149,306,23063),(5154,307,23077),(5155,307,23078),(5102,308,23035),(5103,308,23036),(5106,308,23039),(5134,308,23053),(5136,308,23054),(5141,308,23058),(5143,308,23059),(5145,308,23060),(5111,309,23041),(5113,309,23042),(5115,309,23043),(5146,311,23060),(5147,311,23061),(5510,319,23149),(5217,319,23150),(5229,320,23134),(5231,320,23135),(5424,320,23136),(5426,320,23137),(5233,320,23143),(5246,320,23144),(5244,320,23145),(5236,321,23666),(5228,322,23134),(5230,322,23135),(5423,322,23136),(5425,322,23137),(5247,322,23164),(5253,322,23165),(5266,322,23167),(5270,322,23168),(5204,323,23138),(5511,323,23149),(5206,324,23140),(5232,325,23143),(5245,325,23144),(5243,325,23145),(5234,328,23147),(5235,328,23148),(5226,328,23158),(5240,328,23159),(5890,328,23668),(5241,329,23160),(5242,329,23161),(5522,329,23326),(5282,330,23169),(5289,330,23170),(5311,331,23108),(5308,331,23109),(5314,331,23111),(5306,331,23112),(5331,331,23118),(5343,332,23173),(5344,332,23174),(5345,332,23175),(5342,333,23172),(5382,333,23212),(5346,334,23176),(5347,334,23177),(5348,334,23178),(5349,334,23179),(5350,334,23180),(5351,334,23181),(5352,334,23182),(5353,334,23183),(5354,334,23184),(5355,334,23185),(5356,334,23186),(5357,334,23187),(5360,335,23190),(5853,335,23638),(5854,335,23639),(5855,335,23640),(5856,335,23641),(5857,335,23642),(5858,335,23643),(5361,336,23191),(5362,336,23192),(5363,336,23193),(5364,336,23194),(5365,336,23195),(5366,336,23196),(5367,336,23197),(5368,336,23198),(5369,336,23199),(5370,336,23200),(5371,336,23201),(5372,336,23202),(5373,336,23203),(5374,336,23204),(5375,336,23205),(5376,336,23206),(5377,336,23207),(5378,336,23208),(5379,336,23209),(5380,336,23210),(5381,336,23211),(5383,337,23213),(5384,337,23214),(5852,337,23637),(5358,338,23188),(5359,338,23189),(5851,338,23636),(5385,339,23215),(5386,339,23216),(5387,339,23217),(5388,339,23218),(5389,340,23219),(5390,340,23220),(5391,340,23221),(5392,340,23222),(5393,340,23223),(5394,340,23224),(5395,340,23225),(5396,340,23226),(5397,340,23227),(5398,341,23228),(5399,341,23229),(5400,341,23230),(5401,341,23231),(5402,341,23232),(5403,341,23233),(5404,341,23234),(5405,341,23235),(5406,341,23236),(5407,342,23237),(5408,342,23238),(5409,342,23239),(5410,342,23240),(5411,342,23241),(5412,342,23242),(5413,342,23243),(5414,342,23244),(5415,343,23245),(5416,343,23246),(5417,343,23247),(5418,343,23248),(5419,343,23249),(5420,344,23250),(5816,356,23340),(5817,356,23341),(5818,356,23342),(5819,356,23343),(5820,356,23344),(5821,356,23345),(5822,356,23346),(5823,356,23347),(5824,356,23348),(5825,356,23349),(5826,356,23350),(5827,356,23351),(5828,356,23352),(5829,356,23353),(5830,356,23354),(5831,356,23355),(5832,356,23356),(5833,356,23357),(5834,356,23358),(5835,356,23359),(5836,356,23360),(5747,408,23550),(5748,408,23551),(5875,408,23660),(5740,410,23543),(5741,410,23544),(5742,410,23545),(5743,410,23546),(5841,410,23585),(5842,410,23586),(5843,410,23587),(5844,410,23588),(5749,412,23552),(5750,412,23553),(5774,412,23573),(5795,412,23597),(5887,412,25330),(5744,414,23547),(5745,414,23548),(5746,414,23549),(5752,416,23556),(5754,416,23557),(5756,416,23558),(5758,416,23559),(5760,416,23560),(5761,418,23561),(5763,418,23563),(5766,418,23565),(5769,418,23568),(5770,418,23569),(5796,418,23598),(5889,418,23667),(5888,418,25365),(5751,420,23555),(5753,420,23556),(5755,420,23557),(5757,420,23558),(5759,420,23559),(5762,420,23562),(5764,420,23564),(5768,420,23567),(5765,422,23564),(5767,422,23566),(5773,422,23572),(5776,424,23576),(5777,424,23577),(5778,424,23578),(5779,424,23579),(5793,433,23593),(5794,434,23596),(5797,435,23601),(5798,435,23602),(5799,435,23603),(5800,435,23604),(5801,437,23605),(5802,437,23606),(5803,437,23607),(5804,437,23608),(5845,443,23629),(5846,443,23630),(5847,445,23632),(5848,445,23633),(5891,445,23669),(5892,445,23670),(5859,446,23644),(5860,447,23645),(5861,448,23646),(5862,449,23647),(5863,450,23648),(5864,451,23649),(5865,452,23650),(5866,453,23651),(5867,454,23652),(5868,455,23653),(5869,456,23654),(5870,457,23655),(5871,457,23656),(5872,457,23657),(5873,458,23658),(5874,458,23659),(5970,469,25426),(5971,469,25427),(5972,469,25428),(5979,470,25434),(5981,470,25435),(5983,470,25436),(5985,470,25437),(5987,470,25438),(5989,470,25439),(5991,470,25440),(5993,470,25441),(5995,470,25442),(5997,470,25443),(5999,470,25444),(6001,470,25445),(6003,470,25446),(6023,471,25462),(6024,471,25463),(6025,471,25464),(6026,471,25465),(6027,471,25466),(5978,472,25433),(6006,472,25447),(6008,472,25448),(6013,472,25452),(6015,472,25453),(6009,473,25449),(6010,473,25450),(6011,473,25451),(6019,473,25456),(6020,473,25457),(6021,474,25459),(6022,474,25460),(5973,475,25429),(5974,475,25430),(5977,475,25433),(6005,475,25447),(6007,475,25448),(6012,475,25452),(6014,475,25453),(6016,475,25454),(5980,476,25434),(5982,476,25435),(5984,476,25436),(5986,476,25437),(5988,476,25438),(5990,476,25439),(5992,476,25440),(5994,476,25441),(5996,476,25442),(5998,476,25443),(6000,476,25444),(6002,476,25445),(6004,476,25446),(5975,477,25431),(5976,477,25432),(6017,478,25454),(6018,478,25455),(6669,550,25931),(6670,550,25932),(6671,550,25933),(6676,551,25938),(6672,552,25934),(6673,552,25935),(6674,552,25936),(6675,552,25937),(6677,553,25940),(6678,554,25941),(6679,554,25942),(7090,555,25943),(7091,555,25944),(7092,555,25945),(7093,555,25946),(7094,555,25947),(7095,555,25948),(7096,555,25949),(7097,555,25950),(7098,555,25951),(7099,555,25952),(7100,555,25953),(7101,555,25954),(7102,555,25955),(7103,555,25956),(6708,557,25971),(6709,558,25972),(6710,559,25973),(6711,560,25974),(6712,560,25975),(6713,560,25976),(6714,560,25977),(6715,560,25978),(6716,560,25979),(6717,560,25980),(6718,560,25981),(6719,560,25982),(6720,560,25983),(6721,560,25984),(6722,560,25985),(6723,560,25986),(6724,560,25987),(6725,560,25988),(6726,560,25989),(6727,560,25990),(6728,560,25991),(6729,560,25992),(6730,560,25993),(6731,560,25994),(6732,560,25995),(6733,560,25996),(6734,560,25997),(6735,560,25998),(6736,560,25999),(6737,560,26000),(6738,560,26001),(6739,560,26002),(6740,560,26003),(6741,560,26004),(6742,560,26005),(6743,560,26006),(6744,560,26007),(6745,560,26008),(6746,560,26009),(6747,560,26010),(6748,560,26011),(6749,561,26013),(6750,561,26014),(6751,561,26015),(6752,561,26016),(6753,561,26017),(6754,561,26018),(6755,561,26019),(6756,561,26020),(6757,561,26021),(6758,561,26022),(6759,561,26023),(6760,561,26024),(6761,561,26025),(6762,561,26026),(6763,562,26028),(6764,562,26029),(6765,562,26030),(6766,562,26031),(6767,562,26032),(6768,562,26033),(6769,562,26034),(6770,562,26035),(6771,562,26036),(6772,562,26037),(6773,562,26038),(6774,562,26039),(6775,562,26040),(6776,562,26041),(6777,562,26042),(6778,562,26043),(6779,562,26044),(6780,562,26045),(6781,562,26046),(6782,562,26047),(6783,562,26048),(6784,562,26049),(6805,563,26072),(6806,563,26073),(6807,563,26074),(6808,563,26075),(6809,563,26076),(6810,563,26077),(6811,563,26078),(6812,563,26079),(6785,564,26050),(6786,564,26051),(6787,564,26052),(6788,564,26053),(6789,564,26054),(6790,564,26055),(6791,564,26056),(6792,564,26057),(6793,564,26058),(6794,564,26059),(6795,564,26060),(6796,564,26061),(6797,564,26062),(6798,564,26063),(6799,564,26064),(6800,564,26065),(6801,564,26066),(6802,564,26067),(6803,564,26068),(6804,564,26069),(6892,565,26080),(6893,565,26081),(6894,565,26082),(6895,565,26083),(6896,565,26084),(6897,565,26085),(6898,565,26086),(6899,565,26087),(6900,565,26088),(6901,565,26089),(6902,565,26090),(6903,565,26091),(6904,565,26092),(6905,565,26093),(6906,565,26094),(6907,565,26095),(6908,565,26096),(6909,565,26097),(6910,565,26098),(6911,565,26099),(6912,565,26100),(6913,565,26101),(6914,565,26102),(6915,565,26103),(6916,565,26104),(6917,565,26105),(6918,565,26106),(6919,565,26107),(6920,565,26108),(6921,565,26109),(6922,565,26110),(6923,565,26111),(6924,565,26112),(6925,565,26113),(6926,565,26114),(6927,565,26115),(6928,565,26116),(6929,565,26117),(6930,565,26118),(6931,565,26119),(6932,565,26120),(6933,565,26121),(6934,565,26122),(6935,565,26123),(6936,565,26124),(6937,565,26125),(6938,565,26126),(6939,565,26127),(6940,565,26128),(6941,565,26129),(6942,565,26133),(6943,565,26134),(6944,565,26135),(6945,565,26136),(6946,565,26137),(6947,565,26138),(6948,565,26139),(6949,565,26140),(6950,565,26141),(6951,565,26142),(6952,565,26143),(6953,565,26144),(6954,565,26145),(6955,565,26146),(6956,565,26147),(6957,565,26148),(6958,565,26149),(6959,565,26150),(6960,565,26151),(6961,565,26152),(6962,565,26153),(6963,565,26154),(6964,565,26155),(6965,565,26156),(6966,565,26157),(6967,565,26158),(6968,565,26159),(6969,565,26160),(6970,565,26161),(6971,566,26162),(6972,566,26163),(6973,566,26164),(6974,566,26165),(6975,566,26166),(6976,566,26167),(6977,566,26168),(6978,566,26169),(6979,566,26170),(6980,566,26171),(6981,566,26172),(6982,566,26173),(6983,566,26174),(6984,566,26175),(6985,566,26176),(6986,566,26177),(6987,566,26178),(6988,566,26179),(6989,566,26180),(6990,566,26181),(6991,566,26182),(6992,567,26183),(6993,567,26184),(6994,567,26185),(6995,567,26186),(6996,567,26187),(6997,567,26188),(6998,567,26189),(6999,567,26190),(7000,567,26191),(7001,567,26192),(7002,567,26193),(7003,567,26194),(7004,567,26195),(7005,567,26196),(7006,567,26197),(7007,567,26198),(7008,567,26199),(7009,567,26200),(7010,567,26201),(7011,567,26202),(7012,567,26203),(7013,567,26204),(7014,567,26205),(7015,567,26206),(7016,567,26207),(7017,567,26208),(7018,567,26209),(7019,567,26210),(7020,567,26211),(7021,567,26212),(7022,567,26213),(7023,567,26214),(7024,567,26215),(7025,567,26216),(7026,567,26217),(7027,567,26218),(7028,567,26219),(7029,567,26220),(7030,567,26221),(7031,567,26222),(7032,567,26223),(7033,568,26224),(7034,568,26225),(7035,568,26226),(7036,568,26227),(7037,568,26228),(7038,568,26229),(7039,568,26230),(7040,568,26231),(7041,568,26232),(7042,568,26233),(7043,568,26234),(7044,568,26235),(7045,569,26236),(7046,569,26237),(7047,569,26238),(7048,569,26239),(7049,569,26240),(7050,569,26241),(7051,569,26242),(7052,569,26243),(7053,569,26244),(7054,569,26245),(7055,569,26246),(7056,570,26247),(7057,570,26248),(7058,570,26249),(7059,570,26250),(7060,571,26251),(7061,571,26252),(7062,571,26253),(7063,571,26254),(7064,571,26255),(7065,571,26256),(7066,571,26257),(7067,571,26258),(7068,572,26259),(7069,572,26260),(7070,572,26261),(7071,572,26262),(7072,572,26263),(7073,572,26264),(7074,572,26265),(7075,572,26266),(7076,572,26267),(7077,572,26268),(7078,572,26269),(7079,572,26270),(7080,572,26271),(7081,572,26272),(7082,572,26273),(7083,572,26274),(7084,572,26275),(7085,572,26276),(7086,572,26277),(7087,572,26278),(7088,572,26279),(7089,572,26280),(7104,573,26281),(7105,573,26282),(7106,574,26283),(7107,574,26284),(7108,574,26285),(7109,574,26286),(7110,574,26287),(7111,574,26288),(7112,574,26289),(7113,574,26290),(7114,574,26291),(7115,574,26292),(7116,574,26293),(7117,574,26294),(7118,574,26295),(7119,574,26296),(7120,574,26297),(7121,574,26298),(7122,574,26299),(7123,574,26300),(7124,574,26301),(7125,574,26302),(7126,574,26303),(7127,574,26304),(7128,574,26305),(7129,574,26306),(7130,574,26307),(7131,574,26308),(7132,574,26309),(7133,574,26310),(7134,574,26311),(7135,574,26312),(7136,574,26313),(7137,574,26314),(7138,574,26315),(7139,574,26316),(7140,574,26317),(7153,576,26330),(7154,576,26331),(7155,576,26332),(7158,577,26335),(7160,577,26336),(7162,577,26337),(7164,577,26338),(7166,577,26339),(7168,577,26340),(7170,577,26341),(7175,577,26345),(7187,577,26355),(7189,577,26356),(7203,577,26369),(7213,577,26378),(7215,577,26379),(7218,578,26384),(7219,578,26385),(7220,578,26386),(7221,578,26387),(7222,578,26388),(7223,578,26389),(7224,578,26390),(7225,578,26391),(7226,578,26392),(7227,578,26393),(7228,578,26394),(7229,578,26395),(7230,578,26396),(7239,579,26405),(7240,579,26406),(7241,579,26407),(7242,579,26408),(7243,579,26409),(7157,580,26334),(7174,580,26344),(7177,580,26346),(7184,580,26352),(7185,580,26353),(7186,580,26354),(7217,580,26380),(7192,581,26358),(7196,581,26362),(7197,581,26363),(7198,581,26364),(7199,581,26365),(7200,581,26366),(7202,581,26368),(7207,581,26372),(7208,581,26373),(7209,581,26374),(7231,582,26397),(7232,582,26398),(7233,582,26399),(7234,582,26400),(7235,582,26401),(7236,582,26402),(7237,582,26403),(7238,582,26404),(7195,583,26361),(7201,583,26367),(7205,583,26370),(7206,583,26371),(7210,583,26375),(7211,583,26376),(7156,584,26333),(7172,584,26342),(7173,584,26343),(7178,584,26347),(7179,584,26348),(7180,584,26349),(7191,584,26357),(7212,584,26377),(7159,585,26335),(7161,585,26336),(7163,585,26337),(7165,585,26338),(7167,585,26339),(7169,585,26340),(7171,585,26341),(7176,585,26345),(7188,585,26355),(7190,585,26356),(7204,585,26369),(7214,585,26378),(7216,585,26379),(7193,586,26359),(7194,586,26360),(7181,587,26349),(7182,587,26350),(7183,587,26351),(7244,588,26411),(7245,588,26412),(7246,588,26413),(7247,588,26414),(7248,588,26415),(7249,588,26416),(7250,588,26417),(7251,588,26418),(7252,588,26419),(7253,588,26420),(7254,588,26421),(7255,588,26422),(7256,588,26423),(7257,588,26424),(7258,588,26425),(7259,588,26426),(7260,588,26427),(7261,588,26428),(7262,588,26429),(7263,588,26430),(7264,588,26431),(7265,588,26432),(7266,588,26433),(7267,588,26434),(7268,588,26435),(7269,588,26436),(7270,588,26437),(7271,588,26438),(7272,588,26439),(7273,588,26440),(7274,589,26442),(7275,589,26443),(7276,589,26444),(7277,589,26445),(7278,589,26446),(7279,589,26447),(7280,589,26448),(7281,589,26449),(7282,589,26450),(7283,589,26451),(7284,589,26452),(7285,589,26453),(7286,589,26454),(7287,589,26455);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(1024) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  `maxsessions` int(11) NOT NULL DEFAULT '1',
  `maxattempts` int(11) NOT NULL DEFAULT '3',
  `attempt_interval` varchar(32) NOT NULL DEFAULT '10s',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.company.com','company.com','zabbix@company.com','','','','',0,25,0,0,0,0,'',1,3,'10s'),(2,3,'Jabber','','','','','','jabber@company.com','zabbix',0,25,0,0,0,0,'',1,3,'10s'),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,'',1,3,'10s');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `recovery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,2,6,'0',1,1,0,0),(2,2,4,'0',1,1,0,0),(3,3,0,'0',1,1,0,0),(4,4,0,'0',1,1,0,0),(5,5,0,'0',1,1,0,0),(6,6,0,'0',1,1,0,0),(7,3,11,'0',1,1,0,1),(8,4,11,'0',1,1,0,1),(9,5,11,'0',1,1,0,1),(10,6,11,'0',1,1,0,1),(11,7,0,'0',1,1,0,0),(12,7,4,'0',1,1,0,0),(13,7,6,'0',1,1,0,0),(15,8,0,'0',1,1,0,0),(16,8,4,'0',1,1,0,0),(17,8,6,'0',1,1,0,0),(18,8,6,'0',1,1,0,0),(19,7,2,'0',1,1,0,0);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2),(5,12,2),(3,16,14);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(7,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',NULL),(8,1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',NULL),(9,1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',NULL),(10,1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',NULL),(11,1,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',NULL),(15,1,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',NULL);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7),(5,11,7),(6,15,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
INSERT INTO `opmessage_usr` VALUES (1,11,1),(2,15,1);
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (1,1,10135),(2,13,10135),(5,17,10136),(6,18,10123);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `r_clock` int(11) NOT NULL DEFAULT '0',
  `r_ns` int(11) NOT NULL DEFAULT '0',
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `problem_1` (`source`,`object`,`objectid`),
  KEY `problem_2` (`r_clock`),
  KEY `problem_3` (`r_eventid`),
  CONSTRAINT `c_problem_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_problem_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,3,0,14883,1528338619,416553699,7,1528339219,171874010,NULL,0),(2,3,0,14884,1528338622,422616728,8,1528339222,172550959,NULL,0),(3,3,0,14913,1528339200,52397651,18,1528339252,977163937,NULL,0),(4,3,0,14995,1528339200,52416031,6,1528339222,793575551,NULL,0),(5,3,4,30249,1528339199,157749056,NULL,0,0,NULL,NULL),(7,3,0,14913,1528343040,247017697,9,1528343082,222706081,NULL,0),(8,3,0,14995,1528343040,247028199,NULL,0,0,NULL,NULL),(9,3,4,30749,1528339222,794871179,NULL,0,0,NULL,NULL),(10,3,4,30753,1528339222,794891871,NULL,0,0,NULL,NULL),(11,3,4,30757,1528339222,794912685,NULL,0,0,NULL,NULL),(12,3,4,30761,1528339222,794934609,NULL,0,0,NULL,NULL),(13,3,4,30765,1528339222,794848707,NULL,0,0,NULL,NULL),(14,3,4,30769,1528339222,794826311,NULL,0,0,NULL,NULL),(15,3,4,30773,1528339222,794804092,NULL,0,0,NULL,NULL),(16,3,4,30777,1528339222,794779827,NULL,0,0,NULL,NULL),(17,3,0,14912,1528339252,976697437,NULL,0,0,NULL,NULL),(19,3,0,14914,1528339252,977171314,NULL,0,0,NULL,NULL),(20,3,0,14924,1528339253,386320784,NULL,0,0,NULL,NULL),(21,3,0,14926,1528339253,386341893,NULL,0,0,NULL,NULL),(22,3,0,14927,1528339253,386344952,NULL,0,0,NULL,NULL),(23,3,0,14928,1528339253,387856318,NULL,0,0,NULL,NULL),(24,3,0,14929,1528339253,387871429,NULL,0,0,NULL,NULL),(25,3,0,15009,1528339643,120545925,NULL,0,0,NULL,NULL),(26,3,0,15010,1528339643,120567114,NULL,0,0,NULL,NULL),(1223,3,0,14921,1528275858,417276390,NULL,0,0,NULL,NULL),(1224,0,0,14933,1528275858,413486302,NULL,0,0,NULL,NULL),(1225,3,5,30185,1528275858,870341648,NULL,0,0,NULL,NULL),(1226,3,4,30212,1528275858,870344547,NULL,0,0,NULL,NULL),(1227,3,4,30213,1528275858,870347387,NULL,0,0,NULL,NULL),(1228,3,4,30214,1528275858,870349790,NULL,0,0,NULL,NULL),(1229,3,4,30215,1528275858,870352959,NULL,0,0,NULL,NULL),(1230,3,4,30216,1528275858,870355262,NULL,0,0,NULL,NULL),(1231,3,4,30217,1528275858,870358061,NULL,0,0,NULL,NULL),(1232,3,4,30218,1528275858,870360253,NULL,0,0,NULL,NULL),(1233,3,4,30219,1528275858,870362505,NULL,0,0,NULL,NULL),(1234,3,4,30220,1528275858,870383864,NULL,0,0,NULL,NULL),(1235,3,4,30221,1528275858,870387054,NULL,0,0,NULL,NULL),(1236,3,4,30222,1528275858,870389439,NULL,0,0,NULL,NULL),(1237,3,4,30223,1528275858,870391610,NULL,0,0,NULL,NULL),(1238,3,4,30224,1528275858,870393510,NULL,0,0,NULL,NULL),(1239,3,4,30225,1528275858,870395563,NULL,0,0,NULL,NULL),(1240,3,4,30226,1528275858,870397510,NULL,0,0,NULL,NULL),(1241,3,4,30227,1528275858,870399428,NULL,0,0,NULL,NULL),(1242,3,4,30261,1528275858,870401875,NULL,0,0,NULL,NULL),(1243,3,0,14875,1528275858,870347387,NULL,0,0,NULL,NULL),(1244,3,0,14876,1528275858,870352959,NULL,0,0,NULL,NULL),(1245,3,0,14877,1528275858,870395563,NULL,0,0,NULL,NULL),(1246,3,0,14889,1528275858,870401875,NULL,0,0,NULL,NULL),(1270,3,4,30373,1528275916,476529460,NULL,0,0,NULL,NULL),(1271,3,4,30374,1528275916,477964694,NULL,0,0,NULL,NULL),(1272,3,4,30375,1528275916,479365332,NULL,0,0,NULL,NULL),(1273,3,4,30376,1528275916,480682463,NULL,0,0,NULL,NULL),(1274,3,4,30377,1528275916,481942661,NULL,0,0,NULL,NULL),(1275,3,4,30379,1528275916,483186523,NULL,0,0,NULL,NULL),(1276,3,4,30380,1528275916,484415303,NULL,0,0,NULL,NULL),(1277,3,4,30383,1528275916,485635835,NULL,0,0,NULL,NULL),(1278,3,4,30384,1528275916,486757733,NULL,0,0,NULL,NULL),(1279,3,4,30409,1528275916,487516075,NULL,0,0,NULL,NULL),(1280,3,0,14919,1528275916,476529460,NULL,0,0,NULL,NULL),(1281,3,0,14920,1528275916,479365332,NULL,0,0,NULL,NULL),(1284,3,0,14912,1528276275,397354244,1343,1528279875,361332465,NULL,0),(1285,3,0,14914,1528276275,397967979,1344,1528279875,361893894,NULL,0),(1286,3,0,14924,1528276275,398037916,1345,1528279875,361960465,NULL,0),(1287,3,0,14926,1528276275,398026702,1346,1528279875,361947507,NULL,0),(1288,3,0,14927,1528276275,398019342,1316,1528276875,969814830,NULL,0),(1289,3,0,14928,1528276275,398080737,1317,1528276875,970498123,NULL,0),(1290,3,0,14929,1528276275,398069260,1347,1528279875,361998478,NULL,0),(1291,3,0,14883,1528276338,398605045,1318,1528276938,768353440,NULL,0),(1292,3,0,14884,1528276338,397219333,1319,1528276938,766889362,NULL,0),(1337,3,0,14868,1528279337,705738463,1390,1528282937,145379239,NULL,0),(1338,3,0,14870,1528279337,706369805,1391,1528282937,146003064,NULL,0),(1339,3,0,14880,1528279337,706475226,1392,1528282937,146104147,NULL,0),(1340,3,0,14882,1528279337,706466629,1393,1528282937,146095821,NULL,0),(1341,3,0,14885,1528279337,706459364,1394,1528282937,146086421,NULL,0),(1485,3,0,14995,1528291530,322247555,1505,1528291642,298991388,NULL,0),(1486,3,5,30670,1528291642,298996799,NULL,0,0,NULL,NULL),(1487,3,4,30697,1528291642,305010068,NULL,0,0,NULL,NULL),(1488,3,4,30698,1528291642,305011242,NULL,0,0,NULL,NULL),(1489,3,4,30699,1528291642,305012166,NULL,0,0,NULL,NULL),(1490,3,4,30700,1528291642,305013073,NULL,0,0,NULL,NULL),(1491,3,4,30701,1528291642,305014443,NULL,0,0,NULL,NULL),(1492,3,4,30702,1528291642,305015841,NULL,0,0,NULL,NULL),(1493,3,4,30703,1528291642,305016834,NULL,0,0,NULL,NULL),(1494,3,4,30704,1528291642,305017996,NULL,0,0,NULL,NULL),(1495,3,4,30705,1528291642,305018864,NULL,0,0,NULL,NULL),(1496,3,4,30706,1528291642,305019883,NULL,0,0,NULL,NULL),(1497,3,4,30707,1528291642,305020900,NULL,0,0,NULL,NULL),(1498,3,4,30708,1528291642,305021769,NULL,0,0,NULL,NULL),(1499,3,4,30709,1528291642,305022669,NULL,0,0,NULL,NULL),(1500,3,4,30710,1528291642,305023518,NULL,0,0,NULL,NULL),(1501,3,4,30711,1528291642,305024460,NULL,0,0,NULL,NULL),(1502,3,4,30712,1528291642,305025304,NULL,0,0,NULL,NULL),(1503,3,4,30746,1528291642,315629724,NULL,0,0,NULL,NULL),(1504,3,0,14994,1528291642,298986759,1524,1528295242,61594827,NULL,0),(1506,3,0,14996,1528291642,298994071,1525,1528295242,62483671,NULL,0),(1507,3,0,15001,1528291642,305011242,NULL,0,0,NULL,NULL),(1508,3,0,15002,1528291642,305013073,NULL,0,0,NULL,NULL),(1509,3,0,15003,1528291642,305023518,NULL,0,0,NULL,NULL),(1510,3,0,15006,1528291642,305180131,1526,1528295242,63082272,NULL,0),(1511,3,0,15008,1528291642,305197423,1527,1528295242,63090498,NULL,0),(1512,3,0,15009,1528291642,305199709,1516,1528292243,5968701,NULL,0),(1513,3,0,15010,1528291642,315422562,1517,1528292243,9133674,NULL,0),(1514,3,0,15011,1528291642,315436339,1528,1528295242,63105994,NULL,0),(1515,3,0,15015,1528291642,315629724,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tag`
--

DROP TABLE IF EXISTS `problem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_tag` (
  `problemtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`problemtagid`),
  KEY `problem_tag_1` (`eventid`),
  KEY `problem_tag_2` (`tag`,`value`),
  CONSTRAINT `c_problem_tag_1` FOREIGN KEY (`eventid`) REFERENCES `problem` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tag`
--

LOCK TABLES `problem_tag` WRITE;
/*!40000 ALTER TABLE `problem_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.problem.sort',0,0,0,'clock','',3),(2,1,'web.problem.sortorder',0,0,0,'DESC','',3),(3,1,'web.discovery.php.sort',0,0,0,'ip','',3),(4,1,'web.discovery.php.sortorder',0,0,0,'ASC','',3),(5,1,'web..druleid',0,0,0,'','',1),(6,1,'web.latest.druleid',0,0,0,'','',1),(7,1,'web.menu.login.last',0,0,0,'index.php','',3),(8,1,'web.messages',0,0,0,'0','enabled',3),(9,1,'web.messages',0,0,0,'0','triggers.recovery',3),(10,1,'web.messages',0,0,0,'a:0:{}','triggers.severities',3),(11,1,'web.menu.config.last',0,0,0,'hosts.php','',3),(12,1,'web.discoveryconf.php.sort',0,0,0,'name','',3),(13,1,'web.discoveryconf.php.sortorder',0,0,0,'ASC','',3),(14,1,'web.paging.lastpage',0,0,0,'hosts.php','',3),(15,1,'web.menu.cm.last',0,0,0,'hostinventories.php','',3),(16,1,'web.hostinventories.php.sort',0,0,0,'name','',3),(17,1,'web.hostinventories.php.sortorder',0,0,0,'ASC','',3),(18,1,'web.cm.groupid',0,0,0,'','',1),(19,1,'web.latest.groupid',0,0,0,'','',1),(20,1,'web.hostinventoriesoverview.php.sort',0,0,0,'host_count','',3),(21,1,'web.hostinventoriesoverview.php.sortorder',0,0,0,'DESC','',3),(22,1,'web.hostgroups.php.sort',0,0,0,'name','',3),(23,1,'web.hostgroups.php.sortorder',0,0,0,'ASC','',3),(24,1,'web.config.groupid',0,0,0,'','',1),(25,1,'web.hosts.php.sort',0,0,0,'name','',3),(26,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(27,1,'web.menu.view.last',0,0,0,'charts.php','',3),(28,1,'web.view.groupid',0,2,0,'','',1),(29,1,'web.view.hostid',0,10173,0,'','',1),(30,1,'web.latest.hostid',0,10173,0,'','',1),(31,1,'web.view.graphid',0,1150,0,'','',1),(32,1,'web.latest.graphid',0,1150,0,'','',1),(33,1,'web.screens.period',524,0,21600,'','',2),(34,1,'web.screens.stime',524,0,0,'20180121163733','',3),(35,1,'web.screens.isnow',524,0,1,'','',2),(36,1,'web.screens.graphid',0,1150,0,'','',1),(37,1,'web.screens.period',525,0,3600,'','',2),(38,1,'web.screens.stime',525,0,0,'20180121204855','',3),(39,1,'web.screens.isnow',525,0,1,'','',2),(40,1,'web.screenconf.config',0,0,0,'','',2),(41,1,'web.screenconf.php.sort',0,0,0,'name','',3),(42,1,'web.screenconf.php.sortorder',0,0,0,'ASC','',3),(43,1,'web.menu.reports.last',0,0,0,'report4.php','',3),(44,1,'web.avail_report.mode',0,0,0,'','',2),(45,1,'web.avail_report.0.groupid',0,0,0,'','',1),(46,1,'web.avail_report.0.timesince',0,0,0,'0','',3),(47,1,'web.avail_report.0.timetill',0,0,0,'0','',3),(48,1,'web.avail_report.0.hostid',0,0,0,'','',1),(49,1,'web.correlation.php.sort',0,0,0,'name','',3),(50,1,'web.correlation.php.sortorder',0,0,0,'ASC','',3),(51,1,'web.screens.period',523,0,3600,'','',2),(52,1,'web.screens.stime',523,0,0,'20180121211445','',3),(53,1,'web.screens.isnow',523,0,1,'','',2),(54,1,'web.sysmaps.php.sort',0,0,0,'name','',3),(55,1,'web.sysmaps.php.sortorder',0,0,0,'ASC','',3),(56,1,'web.screens.period',534,0,7200,'','',2),(57,1,'web.screens.stime',534,0,0,'20180121090521','',3),(58,1,'web.screens.isnow',534,0,1,'','',2),(59,1,'web.tr_status.php.sort',0,0,0,'lastchange','',3),(60,1,'web.tr_status.php.sortorder',0,0,0,'DESC','',3),(61,1,'web.latest.php.sort',0,0,0,'name','',3),(62,1,'web.latest.php.sortorder',0,0,0,'ASC','',3),(63,1,'web.actionconf.php.sort',0,0,0,'name','',3),(64,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(65,1,'web.maintenance.php.sort',0,0,0,'name','',3),(66,1,'web.maintenance.php.sortorder',0,0,0,'ASC','',3),(67,1,'web.screens.period',526,0,3600,'','',2),(68,1,'web.screens.stime',526,0,0,'20180121100539','',3),(69,1,'web.screens.isnow',526,0,1,'','',2),(70,1,'web.httpmon.php.sort',0,0,0,'name','',3),(71,1,'web.httpmon.php.sortorder',0,0,0,'ASC','',3),(72,1,'web..groupid',0,0,0,'','',1),(73,1,'web.maps.sysmapid',0,1,0,'','',1),(74,1,'web.screens.period',519,0,3600,'','',2),(75,1,'web.screens.stime',519,0,0,'20180121080558','',3),(76,1,'web.screens.isnow',519,0,1,'','',2),(77,1,'web.screens.period',518,0,3600,'','',2),(78,1,'web.screens.stime',518,0,0,'20180120214355','',3),(79,1,'web.screens.isnow',518,0,1,'','',2),(80,1,'web.screens.period',517,0,3600,'','',2),(81,1,'web.screens.stime',517,0,0,'20180121080553','',3),(82,1,'web.screens.isnow',517,0,1,'','',2),(83,1,'web.scripts.php.sort',0,0,0,'name','',3),(84,1,'web.scripts.php.sortorder',0,0,0,'ASC','',3),(85,1,'web.media_type.php.sort',0,0,0,'description','',3),(86,1,'web.media_types.php.sortorder',0,0,0,'ASC','',3),(87,1,'web.menu.admin.last',0,0,0,'authentication.php','',3),(88,1,'web.usergrps.php.sort',0,0,0,'name','',3),(89,1,'web.usergrps.php.sortorder',0,0,0,'ASC','',3),(90,1,'web.proxies.php.sort',0,0,0,'host','',3),(91,1,'web.proxies.php.sortorder',0,0,0,'ASC','',3),(92,1,'web.screens.period',548,0,3600,'','',2),(93,1,'web.screens.stime',548,0,0,'20180121100929','',3),(94,1,'web.screens.isnow',548,0,1,'','',2),(95,1,'web.screens.period',547,0,43200,'','',2),(96,1,'web.screens.stime',547,0,0,'20180121095112','',3),(97,1,'web.screens.isnow',547,0,1,'','',2),(98,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(99,1,'web.users.php.sort',0,0,0,'alias','',3),(100,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(101,1,'web.screens.period',528,0,3600,'','',2),(102,1,'web.screens.stime',528,0,0,'20180312124745','',3),(103,1,'web.screens.isnow',528,0,1,'','',2),(104,1,'web.screens.period',520,0,3600,'','',2),(105,1,'web.screens.stime',520,0,0,'20180413164637','',3),(106,1,'web.screens.isnow',520,0,1,'','',2),(107,1,'web.screens.period',550,0,3600,'','',2),(108,1,'web.screens.stime',550,0,0,'20180121211443','',3),(109,1,'web.screens.isnow',550,0,1,'','',2),(110,1,'web.screens.period',551,0,3600,'','',2),(111,1,'web.screens.stime',551,0,0,'20180121205110','',3),(112,1,'web.screens.isnow',551,0,1,'','',2),(113,1,'web.screens.period',549,0,3600,'','',2),(114,1,'web.screens.stime',549,0,0,'20180121100949','',3),(115,1,'web.screens.isnow',549,0,1,'','',2),(116,1,'web.templates.php.groupid',0,0,0,'','',1),(117,1,'web.templates.php.sort',0,0,0,'name','',3),(118,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(119,1,'web.host_discovery.php.sort',0,0,0,'name','',3),(120,1,'web.host_discovery.php.sortorder',0,0,0,'ASC','',3),(121,1,'web.reports.groupid',0,14,0,'','',1),(122,1,'web.screens.period',555,0,3600,'','',2),(123,1,'web.screens.stime',555,0,0,'20180121205906','',3),(124,1,'web.screens.isnow',555,0,1,'','',2),(125,1,'web.screens.period',556,0,3600,'','',2),(126,1,'web.screens.stime',556,0,0,'20180121205559','',3),(127,1,'web.screens.isnow',556,0,1,'','',2),(128,1,'web.config.hostid',0,10177,0,'','',1),(129,1,'web.graphs.php.sort',0,0,0,'name','',3),(130,1,'web.graphs.php.sortorder',0,0,0,'ASC','',3),(131,1,'web.items.filter_groupid',0,0,0,'','',1),(132,1,'web.items.filter_hostid',0,10123,0,'','',1),(133,1,'web.items.filter_application',0,0,0,'','',3),(134,1,'web.items.filter_name',0,0,0,'','',3),(135,1,'web.items.filter_type',0,0,-1,'','',2),(136,1,'web.items.filter_key',0,0,0,'','',3),(137,1,'web.items.filter_snmp_community',0,0,0,'','',3),(138,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(139,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(140,1,'web.items.filter_port',0,0,0,'','',3),(141,1,'web.items.filter_value_type',0,0,-1,'','',2),(142,1,'web.items.filter_data_type',0,0,-1,'','',2),(146,1,'web.items.filter_status',0,0,-1,'','',2),(147,1,'web.items.filter_state',0,0,-1,'','',2),(148,1,'web.items.filter_templated_items',0,0,-1,'','',2),(149,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(150,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(151,1,'web.items.subfilter_apps',0,0,0,'','',3),(152,1,'web.items.subfilter_types',0,0,0,'','',3),(153,1,'web.items.subfilter_value_types',0,0,0,'','',3),(154,1,'web.items.subfilter_status',0,0,0,'','',3),(155,1,'web.items.subfilter_state',0,0,0,'','',3),(156,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(157,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(158,1,'web.items.subfilter_hosts',0,0,0,'','',3),(162,1,'web.items.php.sort',0,0,0,'name','',3),(163,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(164,1,'web.screens.period',554,0,3600,'','',2),(165,1,'web.screens.stime',554,0,0,'20180121205903','',3),(166,1,'web.screens.isnow',554,0,1,'','',2),(167,1,'web.screens.period',557,0,3600,'','',2),(168,1,'web.screens.stime',557,0,0,'20180121203447','',3),(169,1,'web.screens.isnow',557,0,1,'','',2),(170,1,'web.screens.period',558,0,3600,'','',2),(171,1,'web.screens.stime',558,0,0,'20180121203452','',3),(172,1,'web.screens.isnow',558,0,1,'','',2),(173,1,'web.applications.php.sort',0,0,0,'name','',3),(174,1,'web.applications.php.sortorder',0,0,0,'ASC','',3),(175,1,'web.screens.period',569,0,3600,'','',2),(176,1,'web.screens.stime',569,0,0,'20180307084025','',3),(177,1,'web.screens.isnow',569,0,1,'','',2),(178,1,'web.screens.period',568,0,3600,'','',2),(179,1,'web.screens.stime',568,0,0,'20180308103124','',3),(180,1,'web.screens.isnow',568,0,1,'','',2),(181,1,'web.triggers.php.sort',0,0,0,'description','',3),(182,1,'web.triggers.php.sortorder',0,0,0,'ASC','',3),(183,1,'web.screens.period',570,0,3600,'','',2),(184,1,'web.screens.stime',570,0,0,'20180307084030','',3),(185,1,'web.screens.isnow',570,0,1,'','',2),(186,1,'web.screens.period',572,0,21600,'','',2),(187,1,'web.screens.stime',572,0,0,'20180121163751','',3),(188,1,'web.screens.isnow',572,0,1,'','',2),(189,1,'web.disc_prototypes.php.sort',0,0,0,'name','',3),(190,1,'web.disc_prototypes.php.sortorder',0,0,0,'DESC','',3),(191,1,'web.screens.period',571,0,3600,'','',2),(192,1,'web.screens.stime',571,0,0,'20180307084028','',3),(193,1,'web.screens.isnow',571,0,1,'','',2),(194,1,'web.screens.period',578,0,3600,'','',2),(195,1,'web.screens.stime',578,0,0,'20180129085620','',3),(196,1,'web.screens.isnow',578,0,1,'','',2),(197,1,'web.screens.period',575,0,3600,'','',2),(198,1,'web.screens.stime',575,0,0,'20180327104200','',3),(199,1,'web.screens.isnow',575,0,1,'','',2),(200,1,'web.screens.period',576,0,21600,'','',2),(201,1,'web.screens.stime',576,0,0,'20180413050237','',3),(202,1,'web.screens.isnow',576,0,1,'','',2),(203,1,'web.screens.period',577,0,3600,'','',2),(204,1,'web.screens.stime',577,0,0,'20180328094847','',3),(205,1,'web.screens.isnow',577,0,1,'','',2),(206,1,'web.paging.page',0,0,1,'','',2),(207,1,'web.screens.period',580,0,86400,'','',2),(208,1,'web.screens.stime',580,0,0,'20180413070036','',3),(209,1,'web.screens.isnow',580,0,1,'','',2),(210,1,'web.screens.period',582,0,3600,'','',2),(211,1,'web.screens.stime',582,0,0,'20180129214346','',3),(212,1,'web.screens.isnow',582,0,1,'','',2),(213,1,'web.screens.period',581,0,3600,'','',2),(214,1,'web.screens.stime',581,0,0,'20180207165643','',3),(215,1,'web.screens.isnow',581,0,1,'','',2),(216,1,'web.screens.period',589,0,3600,'','',2),(217,1,'web.screens.stime',589,0,0,'20180413164647','',3),(218,1,'web.screens.isnow',589,0,1,'','',2),(219,1,'web.screens.period',587,0,21600,'','',2),(220,1,'web.screens.stime',587,0,0,'20180413122346','',3),(221,1,'web.screens.isnow',587,0,1,'','',2),(222,1,'web.screens.period',591,0,10800,'','',2),(223,1,'web.screens.stime',591,0,0,'20180415073107','',3),(224,1,'web.screens.isnow',591,0,1,'','',2),(225,1,'web.screens.period',590,0,3600,'','',2),(226,1,'web.screens.stime',590,0,0,'20180413164459','',3),(227,1,'web.screens.isnow',590,0,1,'','',2),(228,1,'web.screens.period',588,0,3600,'','',2),(229,1,'web.screens.stime',588,0,0,'20180307084045','',3),(230,1,'web.screens.isnow',588,0,1,'','',2),(231,1,'web.queue.config',0,0,0,'','',2),(232,1,'web.screens.period',583,0,3600,'','',2),(233,1,'web.screens.stime',583,0,0,'20180122085551','',3),(234,1,'web.screens.isnow',583,0,1,'','',2),(235,1,'web.screens.period',592,0,3600,'','',2),(236,1,'web.screens.stime',592,0,0,'20180307084050','',3),(237,1,'web.screens.isnow',592,0,1,'','',2),(238,1,'web.screens.period',595,0,3600,'','',2),(239,1,'web.screens.stime',595,0,0,'20180326101520','',3),(240,1,'web.screens.isnow',595,0,1,'','',2),(241,1,'web.screens.period',598,0,3600,'','',2),(242,1,'web.screens.stime',598,0,0,'20180330150012','',3),(243,1,'web.screens.isnow',598,0,1,'','',2),(244,1,'web.screens.period',603,0,10800,'','',2),(245,1,'web.screens.stime',603,0,0,'20180414043755','',3),(246,1,'web.screens.isnow',603,0,1,'','',2),(247,1,'web.screens.period',599,0,10800,'','',2),(248,1,'web.screens.stime',599,0,0,'20180405052554','',3),(249,1,'web.screens.isnow',599,0,1,'','',2),(250,1,'web.screens.period',604,0,3600,'','',2),(251,1,'web.screens.stime',604,0,0,'20180328091128','',3),(252,1,'web.screens.isnow',604,0,1,'','',2),(253,1,'web.screens.period',600,0,3600,'','',2),(254,1,'web.screens.stime',600,0,0,'20180330150016','',3),(255,1,'web.screens.isnow',600,0,1,'','',2),(256,1,'web.screens.period',602,0,3600,'','',2),(257,1,'web.screens.stime',602,0,0,'20180327130552','',3),(258,1,'web.screens.isnow',602,0,1,'','',2),(259,1,'web.screens.period',606,0,3600,'','',2),(260,1,'web.screens.stime',606,0,0,'20180327104319','',3),(261,1,'web.screens.isnow',606,0,1,'','',2),(262,1,'web.screens.period',605,0,10800,'','',2),(263,1,'web.screens.stime',605,0,0,'20180327121841','',3),(264,1,'web.screens.isnow',605,0,1,'','',2),(265,1,'web.screens.period',608,0,3600,'','',2),(266,1,'web.screens.stime',608,0,0,'20180328091144','',3),(267,1,'web.screens.isnow',608,0,1,'','',2),(268,1,'web.screens.period',611,0,3600,'','',2),(269,1,'web.screens.stime',611,0,0,'20180330125148','',3),(270,1,'web.screens.isnow',611,0,1,'','',2),(271,1,'web.screens.period',610,0,3600,'','',2),(272,1,'web.screens.stime',610,0,0,'20180330125152','',3),(273,1,'web.screens.isnow',610,0,1,'','',2),(274,1,'web.login.attempt.failed',0,0,0,'','',2),(275,1,'web.login.attempt.ip',0,0,0,'192.168.56.1','',3),(276,1,'web.login.attempt.clock',0,0,1523768958,'','',2),(277,1,'web.screens.period',579,0,3600,'','',2),(278,1,'web.screens.stime',579,0,0,'20180413164326','',3),(279,1,'web.screens.isnow',579,0,1,'','',2),(280,1,'web.screens.period',614,0,3600,'','',2),(281,1,'web.screens.stime',614,0,0,'20180413145719','',3),(282,1,'web.screens.isnow',614,0,1,'','',2),(283,1,'web.screens.period',601,0,3600,'','',2),(284,1,'web.screens.stime',601,0,0,'20180413164649','',3),(285,1,'web.screens.isnow',601,0,1,'','',2),(286,1,'web.screens.period',625,0,21600,'','',2),(287,1,'web.screens.stime',625,0,0,'20180414065009','',3),(288,1,'web.screens.isnow',625,0,1,'','',2),(289,1,'web.screens.period',630,0,10800,'','',2),(290,1,'web.screens.stime',630,0,0,'20180415072314','',3),(291,1,'web.screens.isnow',630,0,1,'','',2),(292,1,'web.screens.period',627,0,3600,'','',2),(293,1,'web.screens.stime',627,0,0,'20180413165514','',3),(294,1,'web.screens.isnow',627,0,1,'','',2),(295,1,'web.screens.period',626,0,3600,'','',2),(296,1,'web.screens.stime',626,0,0,'20180413193847','',3),(297,1,'web.screens.isnow',626,0,1,'','',2),(298,1,'web.screens.period',631,0,3600,'','',2),(299,1,'web.screens.stime',631,0,0,'20180413192038','',3),(300,1,'web.screens.isnow',631,0,1,'','',2),(301,1,'web.screens.period',624,0,3600,'','',2),(302,1,'web.screens.stime',624,0,0,'20180413172320','',3),(303,1,'web.screens.isnow',624,0,1,'','',2),(304,1,'web.screens.period',20,0,10800,'','',2),(305,1,'web.screens.stime',20,0,0,'20180413151441','',3),(306,1,'web.screens.isnow',20,0,1,'','',2),(307,1,'web.screens.period',628,0,3600,'','',2),(308,1,'web.screens.stime',628,0,0,'20180413202416','',3),(309,1,'web.screens.isnow',628,0,1,'','',2),(311,1,'web.dashbrd.period',1,0,3600,'','',2),(312,1,'web.dashbrd.stime',1,0,0,'20180607104352','',3),(313,1,'web.dashbrd.isnow',1,0,1,'','',2),(314,1,'web.graphs.period',580,0,604800,'','',2),(315,1,'web.graphs.stime',580,0,0,'20180408131243','',3),(316,1,'web.graphs.isnow',580,0,1,'','',2),(317,1,'web.auditacts.timeline.period',0,0,63072000,'','',2),(318,1,'web.auditacts.timeline.stime',0,0,0,'20160415155813','',3),(319,1,'web.auditacts.timeline.isnow',0,0,1,'','',2),(320,1,'web.auditlogs.timeline.period',0,0,7321405,'','',2),(321,1,'web.auditlogs.timeline.stime',0,0,0,'20180120221117','',3),(322,1,'web.auditlogs.timeline.isnow',0,0,1,'','',2),(323,1,'web.auditlogs.filter.alias',0,0,0,'Admin','',3),(324,1,'web.auditlogs.filter.action',0,0,-1,'','',2),(325,1,'web.auditlogs.filter.resourcetype',0,0,-1,'','',2),(326,1,'web.graphs.period',647,0,3600,'','',2),(327,1,'web.graphs.stime',647,0,0,'20180605144311','',3),(328,1,'web.graphs.isnow',647,0,1,'','',2),(329,1,'web.items.filter_delay',0,0,0,'','',3),(330,1,'web.items.filter_history',0,0,0,'','',3),(331,1,'web.items.filter_trends',0,0,0,'','',3),(332,1,'web.items.subfilter_interval',0,0,0,'','',3),(333,1,'web.items.subfilter_history',0,0,0,'','',3),(334,1,'web.items.subfilter_trends',0,0,0,'','',3),(335,1,'web.reports.hostid',0,10121,0,'','',1),(336,1,'web.httpconf.php.sort',0,0,0,'name','',3),(337,1,'web.httpconf.php.sortorder',0,0,0,'ASC','',3),(338,1,'web.graphs.period',667,0,7200,'','',2),(339,1,'web.graphs.stime',667,0,0,'20180605161405','',3),(340,1,'web.graphs.isnow',667,0,1,'','',2),(341,1,'web.problem.filter.show',0,0,1,'','',2),(342,1,'web.problem.filter.groupids',0,2,0,'','',1),(343,1,'web.problem.filter.application',0,0,0,'','',3),(344,1,'web.problem.filter.problem',0,0,0,'','',3),(345,1,'web.problem.filter.severity',0,0,0,'','',2),(346,1,'web.problem.filter.age_state',0,0,0,'','',2),(347,1,'web.problem.filter.age',0,0,14,'','',2),(348,1,'web.problem.filter.maintenance',0,0,1,'','',2),(349,1,'web.problem.filter.unacknowledged',0,0,0,'','',2),(350,1,'web.problem.filter.details',0,0,0,'','',2),(351,1,'web.graphs.period',727,0,3600,'','',2),(352,1,'web.graphs.stime',727,0,0,'20180605160823','',3),(353,1,'web.graphs.isnow',727,0,1,'','',2),(354,1,'web.graphs.period',729,0,60,'','',2),(355,1,'web.graphs.stime',729,0,0,'20180605161052','',3),(356,1,'web.graphs.isnow',729,0,0,'','',2),(357,1,'web.dashbrd.list_was_opened',0,0,1,'','',2),(358,1,'web.dashbrd.list.sort',0,0,0,'name','',3),(359,1,'web.dashbrd.list.sortorder',0,0,0,'ASC','',3),(360,1,'web.dashbrd.period',0,0,3600,'','',2),(361,1,'web.dashbrd.stime',0,0,0,'20180605162512','',3),(362,1,'web.dashbrd.isnow',0,0,1,'','',2),(363,1,'web.graphs.period',658,0,7200,'','',2),(364,1,'web.graphs.stime',658,0,0,'20180605152530','',3),(365,1,'web.graphs.isnow',658,0,1,'','',2),(366,1,'web.graphs.period',668,0,3600,'','',2),(367,1,'web.graphs.stime',668,0,0,'20180605162932','',3),(368,1,'web.graphs.isnow',668,0,1,'','',2),(369,1,'web.graphs.period',659,0,7200,'','',2),(370,1,'web.graphs.stime',659,0,0,'20180605152658','',3),(371,1,'web.graphs.isnow',659,0,1,'','',2),(372,1,'web.dashbrd.dashboardid',0,1,0,'','',1),(373,1,'web.graphs.period',655,0,10800,'','',2),(374,1,'web.graphs.stime',655,0,0,'20180605154652','',3),(375,1,'web.graphs.isnow',655,0,1,'','',2),(376,1,'web.graphs.period',757,0,1800,'','',2),(377,1,'web.graphs.stime',757,0,0,'20180605203307','',3),(378,1,'web.graphs.isnow',757,0,1,'','',2),(379,1,'web.trigger_prototypes.php.sort',0,0,0,'description','',3),(380,1,'web.trigger_prototypes.php.sortorder',0,0,0,'ASC','',3),(381,1,'web.host_prototypes.php.sort',0,0,0,'name','',3),(382,1,'web.host_prototypes.php.sortorder',0,0,0,'ASC','',3),(383,2,'web.menu.view.last',0,0,0,'latest.php','',3),(384,2,'web.view.groupid',0,0,0,'','',1),(385,2,'web.latest.groupid',0,0,0,'','',1),(386,2,'web.paging.lastpage',0,0,0,'latest.php','',3),(387,1,'web.graphs.period',745,0,10800,'','',2),(388,1,'web.graphs.stime',745,0,0,'20180605183702','',3),(389,1,'web.graphs.isnow',745,0,1,'','',2),(390,1,'web.graphs.period',791,0,43200,'','',2),(391,1,'web.graphs.stime',791,0,0,'20180605213827','',3),(392,1,'web.graphs.isnow',791,0,1,'','',2),(393,1,'web.graphs.period',797,0,10800,'','',2),(394,1,'web.graphs.stime',797,0,0,'20180606064112','',3),(395,1,'web.graphs.isnow',797,0,1,'','',2),(396,1,'web.graphs.period',788,0,21600,'','',2),(397,1,'web.graphs.stime',788,0,0,'20180606034151','',3),(398,1,'web.graphs.isnow',788,0,1,'','',2),(399,1,'web.graphs.period',787,0,21600,'','',2),(400,1,'web.graphs.stime',787,0,0,'20180606034226','',3),(401,1,'web.graphs.isnow',787,0,1,'','',2),(402,1,'web.graphs.period',835,0,3600,'','',2),(403,1,'web.graphs.stime',835,0,0,'20180606100026','',3),(404,1,'web.graphs.isnow',835,0,1,'','',2),(405,1,'web.graphs.period',836,0,10800,'','',2),(406,1,'web.graphs.stime',836,0,0,'20180606102759','',3),(407,1,'web.graphs.isnow',836,0,1,'','',2),(408,1,'web.actionconf.eventsource',0,0,2,'','',2),(409,1,'web.graphs.period',1161,0,3600,'','',2),(410,1,'web.graphs.stime',1161,0,0,'20180606171020','',3),(411,1,'web.graphs.isnow',1161,0,1,'','',2),(412,2,'web.dashbrd.dashboardid',0,1,0,'','',1),(413,2,'web.dashbrd.period',1,0,3600,'','',2),(414,2,'web.dashbrd.stime',1,0,0,'20180606205216','',3),(415,2,'web.dashbrd.isnow',1,0,1,'','',2),(416,2,'web.tr_status.php.sort',0,0,0,'lastchange','',3),(417,2,'web.tr_status.php.sortorder',0,0,0,'DESC','',3),(418,1,'web.graphs.period',1194,0,21600,'','',2),(419,1,'web.graphs.stime',1194,0,0,'20180607013126','',3),(420,1,'web.graphs.isnow',1194,0,1,'','',2),(421,1,'web.graphs.period',1150,0,43200,'','',2),(422,1,'web.graphs.stime',1150,0,0,'20180606193132','',3),(423,1,'web.graphs.isnow',1150,0,1,'','',2),(424,1,'web.graphs.period',1160,0,7200,'','',2),(425,1,'web.graphs.stime',1160,0,0,'20180607074759','',3),(426,1,'web.graphs.isnow',1160,0,1,'','',2),(427,2,'web.latest.php.sort',0,0,0,'name','',3),(428,2,'web.latest.php.sortorder',0,0,0,'ASC','',3);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot'),(4,'Windows service names for discovery','SysmonLog'),(5,'Windows service startup states for discovery','automatic');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (3,'System performance',2,3,10001,NULL,0),(4,'Zabbix server health',2,3,10047,NULL,0),(5,'System performance',2,2,10076,NULL,0),(6,'System performance',2,2,10077,NULL,0),(7,'System performance',2,2,10075,NULL,0),(9,'System performance',2,3,10074,NULL,0),(10,'System performance',2,3,10078,NULL,0),(15,'MySQL performance',2,1,10073,NULL,0),(16,'Zabbix server',2,2,NULL,1,0),(17,'Zabbix proxy health',2,2,10048,NULL,0),(18,'System performance',1,2,10079,NULL,0),(19,'System performance',2,2,10081,NULL,0),(20,'System performance',2,3,10107,NULL,0),(21,'MySQL performance',2,1,10117,NULL,1),(22,'Postfix All Stat',2,2,10126,NULL,1),(23,'System performance',2,3,10135,NULL,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (20,3,0,433,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(22,3,0,387,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(24,4,0,392,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(25,4,0,404,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(26,4,0,406,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(27,4,0,410,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(28,5,0,469,500,148,0,0,1,1,0,1,0,0,'',0,0,'',3),(30,6,0,475,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(31,6,0,474,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(32,7,0,463,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(33,7,0,462,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(36,9,0,457,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(37,9,0,456,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(40,10,0,481,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(41,10,0,480,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(42,15,0,454,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(43,15,0,455,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(47,4,0,527,500,160,0,2,2,1,0,0,0,0,'',0,0,'',3),(48,17,0,532,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(49,17,0,530,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(50,17,0,531,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(51,17,0,529,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(52,9,0,544,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(53,5,0,471,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(54,5,0,498,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(55,5,0,540,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(56,7,0,541,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(57,7,0,464,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(58,6,0,542,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(59,3,0,533,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(60,3,0,436,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(61,3,1,10009,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(62,3,1,10013,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(63,18,0,487,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(64,18,0,543,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(65,9,0,458,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(66,9,1,22838,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(67,9,1,22837,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(68,10,0,545,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(69,10,0,482,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(70,10,1,22998,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(71,10,1,22997,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(72,19,0,495,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(73,19,0,546,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(74,19,1,23140,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(75,19,1,23138,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(76,20,0,560,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(77,20,0,561,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(78,20,0,563,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(79,20,0,562,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(80,20,1,25432,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(81,20,1,25431,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(84,22,0,699,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(85,22,0,700,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(86,22,0,701,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(87,21,0,666,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(88,21,0,665,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(89,23,0,733,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(90,23,0,734,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(91,23,0,735,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(92,23,0,736,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(93,23,1,26360,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(94,23,1,26359,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','/bin/ping -c 3 {HOST.CONN}',2,NULL,NULL,'','',0,1),(2,'Traceroute','/usr/bin/traceroute {HOST.CONN}',2,NULL,NULL,'','',0,1),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN}',2,7,NULL,'','',0,1);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`,`lastaccess`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('b1b0128fa013e5fc87c684a5c2b12746',1,1517408224,0),('828a19f45417993cf883c2c75c452300',1,1523615382,0),('3651915e1a93b319bd5d5bf363e1b223',1,1523764562,0),('0735e8a1ae7f4d8ac4a448286c7552af',1,1523779698,0),('7ec3fc1bde359230cb63756c76c3b8b1',1,1528287375,0),('0c07be2e4a989467d9fdb595a3f58ae4',1,1528328639,0),('12be4fb75eb2e149aaae8de5e5bc9784',1,1528340614,0),('d83719402cd1767bfadb2c9574932b2d',1,1528343101,0),('120ebccab23cd53a4bc3514b9900c976',1,1528339685,1),('213806b18dcc13317932540aad9d143e',2,1522491847,0),('4f9fc86dd14d448ba0a66e472b47e9cd',2,1522491864,0),('946fbeaf8954015a876ecf566aa44f11',2,1523768958,0),('731d166d881162bf71662c8313dc9fa6',2,1523778779,0),('a1f2c1225dedad1c7ff4be8e2ecbcc17',2,1523779069,0),('72ccb9413dfe96e4e30ca660776784f2',2,1523779595,0),('9d1b58f9235d52af5d7209b936173dda',2,1528164202,0),('deedd5123a3763ccf3418f3b5c7dcd25',2,1528164202,0),('24ed63ad60da12240061728b078b4673',2,1528165693,0),('6d22356159a9b3412f4191f3d522b80b',2,1528165693,0),('78814e883e0971686c9eda5248591f85',2,1528167135,0),('c7f889240840b72be1e2530b8c1023ee',2,1528167135,0),('a527b4b200f9ea79b4a253f5d128ce0c',2,1528170460,0),('dcaf06cbcc1fcecc8f1464621f5f79c6',2,1528170460,0),('5487c6b2781b8575cd7b09e8a6b1da27',2,1528170620,0),('aa0b556bbefb44429b2eed6c8ec25f19',2,1528170620,0),('a38880e1429435c55cacc76be8366888',2,1528172567,0),('e164adb619fc3ad651c14fc7eac5ba32',2,1528172567,0),('44f57aa88389bd9169c58cd485b2a929',2,1528174623,0),('5194bb8e972e779c3511602ce14af93b',2,1528174623,0),('04779e0113251c537f053e8e86ada4ff',2,1528184514,0),('42790c2c7a24a4b9b6b495ea4ee6ce6f',2,1528184514,0),('1ece968e7b573a37a52ab3bf558ee500',2,1528188267,0),('c1c28f4db47f62e191383adbf79bd261',2,1528188267,0),('6ac9dd177a97893436cedd851ca34eb4',2,1528189043,0),('b416ca546ee17b3d41f716da1e91104b',2,1528189043,0),('112836a7a2994f58a6d1479e19dbf8eb',2,1528189603,0),('a4340074f6d82932f3a7ab174871f8cb',2,1528189603,0),('1d81165fa707ca4ec616e2f53dce64cf',2,1528189907,0),('52ad820208894e64369f21f3c3fec4dd',2,1528189907,0),('43c357692eb1055cca9ab270d1700447',2,1528191105,0),('5ac88d21927fa31ab5f19d8bb2568c29',2,1528191105,0),('a54e716e189dbbee42ba757da99c07d9',2,1528192608,0),('b4ca46da279747ea3bef71c6446fea6c',2,1528192608,0),('589e92b8687a6bfe39836450ae1cfcff',2,1528197646,0),('75c4894520f8d225b8b53515618ac563',2,1528197646,0),('1c58c7353a2156251f603e847bb601a2',2,1528200575,0),('a4d295b3fb6007a97e78ad4628244132',2,1528200575,0),('80961b7b9b3226beb6570ee5b7471cd4',2,1528203076,0),('833b0b207e8cf04d47a15edd3f293b0b',2,1528204632,0),('ae453f07b043d2c8f12112e39777c6d3',2,1528204636,0),('cd79a478a8f0f3639890e3cac83344cf',2,1528204642,0),('99e954da958c80061df0a5fd322bbe1c',2,1528204647,0),('8119df122bf7d3d17587f4a309f1a8ad',2,1528204711,0),('622f79cf169498e5ed28aad824d32b85',2,1528204728,0),('aa95278be1ff426793f6993c7d7cb193',2,1528204730,0),('8fde4eb5dd55d4558b51fe1e0086b6b3',2,1528204743,0),('3ad31901cd08c60f362d3380f1a420f2',2,1528204817,0),('26c5039b226ef0d89c96c79ca1f513d3',2,1528204829,0),('126db372a075b8752b432e2bcc623dc5',2,1528204855,0),('4a8639577e2af67ed20f3b14ecb7fc84',2,1528204874,0),('6dae5ab518ad17d027ab5bf6a4d7d726',2,1528204875,0),('39e7c1f09d850951f4549b2e8fadb391',2,1528204895,0),('6baa38030ed13da94dd13cede81baeeb',2,1528204936,0),('cadb185b6674c972afae26d178db979e',2,1528204952,0),('ae171d27b568266d50560a2ba51695e8',2,1528205015,0),('bbaa8a79978baecb098f923ec28cb07f',2,1528205028,0),('fd037c55318e00920556bab52d8f5f63',2,1528205151,0),('9bded78acc2caa15674ad88da2e8daea',2,1528212651,0),('f75c04db2cc7d818799752e87b84ae71',2,1528212651,0),('66181c0f7858a70999df77cc01eb7b8e',2,1528215039,0),('ca5a7248492895bd82dc83769efea680',2,1528215039,0),('3d3519832a821316af0dede7cbc44371',2,1528216604,0),('527ce8032e27d158521e073baf8c8e29',2,1528216604,0),('5eec913d5f12501f87a141954091ebab',2,1528217966,0),('92bd48e729edf7478dfbd52a6e1534ae',2,1528217966,0),('6eb66f5ab31baba71597fa3eb9f35bd0',2,1528218638,0),('994f85c5e463380bfe5ef9b6668a65e2',2,1528218638,0),('a5d91b31fcc08b1e1b8e4ea3105c7c5a',2,1528219184,0),('cae7aef13e5b5541e9f64fd3a2cf9ef9',2,1528219184,0),('030b14d723a49f7244d3c3a79d7d3f64',2,1528219203,0),('5fad84dd00ae6fa3bb86aa61643e6ba9',2,1528219203,0),('0476d9bf37f77e9394a94c62a219acd5',2,1528219414,0),('34605f7c0938e35635c389aef081b22d',2,1528219414,0),('9be18d43096496d0091ea9c328ace50e',2,1528219716,0),('d86394a3715f128e6167b1cfaf146167',2,1528219716,0),('269fb341356149dc85f1b29eaf20bd12',2,1528219743,0),('6efa19f6ad57e0291502da84ed108471',2,1528221412,0),('f00eac8bec297605d0e787ba0227d613',2,1528221412,0),('69c9de1c544f4c38d8bd4e1e240d3bf5',2,1528222300,0),('b68647a003d87c53f0c75e0b0a99ce45',2,1528222300,0),('29df890f101b1d31c7c1d5e8ab9c64a1',2,1528223262,0),('bcff17e9deedebedd086fb7b51be1f5d',2,1528223262,0),('e8e463010a636cc2ae8e6cf1fcd69c2d',2,1528223651,0),('7cd7175c796307fe4a7dd2db512690fc',2,1528223857,0),('184c3ca343132f1834d97aa7e5ac3aad',2,1528224319,0),('30854e413484f8228f978e9502a513b4',2,1528224319,0),('3c7d3701dc20289a8c98386b61f46b5d',2,1528224319,0),('bce91aaa550c0155b1a969a758e29a43',2,1528224319,0),('0f45aa90b11d8795b537e27494685bb8',2,1528224501,0),('174e1d913f4a9f4816a887b6f2e15939',2,1528224501,0),('307e4e35cf2ccd23ab9bf18ba826d4b6',2,1528228740,0),('91130a9bb710b4ceb643cdc57a8f6be8',2,1528228740,0),('2f946f81f74c389f9948775baa502486',2,1528229769,0),('0b85575c307e4509a8447c7a44ea4387',2,1528229970,0),('36a8934bd798c2be073bdbe27e8bff78',2,1528229970,0),('92e2efa142c04205bf08975d89d7ea45',2,1528231730,0),('ea4e35852d746393b69f985867a8cb30',2,1528231730,0),('41947f1d5d6bc0756efb8b678ab6a6dd',2,1528233272,0),('66ef584706a89ea161b34172c01cf17d',2,1528233272,0),('039c6aec51a95de8905ba1560f3e6a63',2,1528235691,0),('a57c4b5adde922e46132cd5f785c25a7',2,1528235691,0),('6302b3b37bfbb5b428fe5b68d98b77d0',2,1528236226,0),('80910346c5a4e96880f99497f31cea91',2,1528236226,0),('4ef01b92ab93006d9ba37f5abf848e81',2,1528244935,0),('9691660a4fefcb0b504cd38f421a5554',2,1528244935,0),('9cf75131394c7f6ba40a2858b56eda54',2,1528245121,0),('c4a4d007be741b166418bb92fe09912e',2,1528245121,0),('82aa472c6edf6c66e9c56807cd27df7e',2,1528246938,0),('fa5158c929e9b80ffb1960b4986d97be',2,1528246938,0),('2935970af52d4e4d2719cf7fee934697',2,1528246967,0),('ca2006c88ff1fc4828e014e9d95eadba',2,1528246967,0),('b81cc45a1d5c0e7733b0ffa13c221f80',2,1528250607,0),('d74012237dc1862a4eaf210f42c524f0',2,1528250607,0),('93839cb32325b7c50a2161c632897dbb',2,1528252597,0),('dcbe62e647cfeea69c5f2c5120b8b486',2,1528252597,0),('4295439d4561577d04f49f2be4b29983',2,1528256286,0),('d2407139622d3b765d1cba146c4da0dd',2,1528256286,0),('379067a45e6b25c3733aef879030fea8',2,1528257074,0),('e2ade4e1f8c8a0771bee13f98e6187b3',2,1528257074,0),('76cbf9572c7d7750b42090d181581f9d',2,1528258753,0),('b88a2d3918eddb905e98b197fb228f8c',2,1528258753,0),('0dcf4c4d869a3bdd65d764396bb429ba',2,1528266310,0),('de1ad76a6ccd2a83a7a711a786981f85',2,1528266310,0),('6ea7bad56dc6aa9fd4206429c9b11e9b',2,1528266322,0),('c6cd9f5b0693174d39f71210c3b450d5',2,1528266322,0),('19dc8cbf8443daddd6c8e55596bcbdeb',2,1528269366,0),('ca85021b32ffb9c3c5b02f54c7ff3d1e',2,1528269366,0),('398b64158a894998590296304e8f4295',2,1528270227,0),('eae743ed7c6ed42dd7f9ee00dc700999',2,1528270227,0),('82e88291a153556bfb1396e288817ec1',2,1528271166,0),('f41ab06bb9a3c2d8b539e882c4e5177b',2,1528271166,0),('b8e859f3dd68530e7f72da71f9d68b23',2,1528271500,0),('f26d96cc7c866f3a6e8501d27112385a',2,1528271500,0),('d6fbceec3952f6e24b46fa8ea60bd0cc',2,1528272991,0),('eca6c77b7bd20c4d993a4f5400df379d',2,1528272992,0),('62f8a97086fcdd401301e32ae00fae2c',2,1528275567,0),('b7100a87694eb1b9edb74089dddbea20',2,1528275567,0),('482c476e5b893357b0f21030068062a3',2,1528276157,0),('6d6937ce830005c574b28e982d444f3f',2,1528276157,0),('259f4c48fa4abb6a85e01a6c5b8122f5',2,1528276539,0),('8ccf63136826bd1e0a7b88ba60598085',2,1528276539,0),('63c001fa1c0aa8daccb43f73d48f6bc1',2,1528276734,0),('d3404ac05aea13d74a29714a5b91afea',2,1528276734,0),('09735eee37886fba4496ef60715aa13a',2,1528280133,0),('75d999d2a54b6593e6fc2e7183a5af51',2,1528280133,0),('9694640e657d8177ff11851ef4f6a527',2,1528291050,0),('14eb2a7ca03bf179270f97e690f1200d',2,1528291196,0),('411f833615481c3fc7579c98c0e00b76',2,1528291196,0),('c012107f20259ba75f43800d817757cf',2,1528292526,0),('b01648bbba30b9f03afaa236e182d6b4',2,1528292546,0),('c8db233ac8f1f0c1ac1767108c7306da',2,1528292610,0),('b5e83b1703a5350c164e5a3afde48e3e',2,1528293112,0),('01c5d44c827b03480037af0c58a8f0d8',2,1528293151,0),('6e31d0f29329ac44b213098eca2a70e6',2,1528293151,0),('e778ef3d1ffcaa41c4335137576d78a6',2,1528293154,0),('474106e8d3ea1aac7e7336a45bc82380',2,1528293157,0),('5dad66a5f227265562d4c4df4a0efbee',2,1528293170,0),('e0a951f0aa80b50cdfa09a5bc5708cd4',2,1528293174,0),('f0f40084be4d5c5fc12d948f633762d0',2,1528293174,0),('d33eb23f0987a8019955fe17ae404da7',2,1528293191,0),('a31fada4cc7cadcc465559a1739626e2',2,1528293232,0),('e096036919a92f6ade99e98945160be4',2,1528293328,0),('2310cc18b0ad4176a8c6d56b1defd78b',2,1528293343,0),('156d1004fcd3679bde42dc5e635f584f',2,1528294656,0),('f3fb4bd4bccec5cb5c001dfed9250a44',2,1528294656,0),('2d76d1a987c385029e07dbf1dc74167c',2,1528295621,0),('79f6a7c88cebb029afae3ed414e4edb2',2,1528295646,0),('209994ef7579631b5ee4de0b0523b554',2,1528296070,0),('db1967cd85655b5a9208ecb5b7fa1126',2,1528296100,0),('cef53086aaf1a7ab88d5f19e7153c75a',2,1528296399,0),('92138ed403ffbe3a9635a6806335333f',2,1528296419,0),('19cd95cd782bf4d98a602db7bbbbd44b',2,1528297542,0),('41700295445fc23e170a359a54a896d0',2,1528297542,0),('1f625f32bfe7383ce39d3275c53b9fcb',2,1528300250,0),('54290ce6c8b8e4b6c6964c30b2e18006',2,1528300250,0),('00e592ce57ec52a0484e1a7a6d5e118b',2,1528300576,0),('1e6f5382f8f78e30df983f3352b6fe38',2,1528300576,0),('425631f1152d1067b9518879335437f9',2,1528303327,0),('69c2f820c680b84430941d7fa7f4f7f9',2,1528303327,0),('6b9002d43d6e0904f6a49c1aae4edf78',2,1528304034,0),('e672727955e56149383083e5edeaf020',2,1528304034,0),('b9ba95111200f7a7b851b9103b5f0748',2,1528305269,0),('eeb40378b507283df4b91d834581d2e9',2,1528305269,0),('b19fc62dae3937b6b08fb9652bca3327',2,1528308151,0),('bdf32cea63dfbc8cd68c958c323385e5',2,1528308483,0),('fe2ae2d2ef1cb623bb9fdd09a000c711',2,1528308483,0),('368f1dc3c9dd3c16f91c2fbb703abbbe',2,1528313428,0),('7933b83c71ea42f8821151c67eed0679',2,1528313428,0),('27e2c15bc4369eab3235723a62769106',2,1528316882,0),('c99bd32d0f1eb41a916203e97fd83ab2',2,1528316882,0),('9ef8ad81b7751be40b8bae2357c3567b',2,1528317313,0),('d2a3bc8c5bbb700a5429bc3c096ba315',2,1528317313,0),('cac93d9785d9ee0515ac11b16fa797c1',2,1528317464,0),('f85a0f63232c9368b4c667691f3d6363',2,1528317464,0),('b54c25c49993e151b3721cb1ca129776',2,1528318233,0),('c12467fc4343d93c71858f884cee0771',2,1528318233,0),('8e918a7517acb896321a62d7529e0465',2,1528324774,0),('fb2281293144af9a422ae55d32cf0a36',2,1528324774,0),('52aa249e56e0d99b832bd72206cc6dcf',2,1528325674,0),('582638d2b1e1f1de1f29ec4838e70677',2,1528325674,0),('80e85823e5d707f24e8ffc3e1d051d7d',2,1528326131,0),('e4c6b05cf073e86c1f68c0b19bb521d8',2,1528326131,0),('5d517030f29015f2d0535c0063cef4f3',2,1528326452,0),('87fb35bd4343a3a974e793da004cedca',2,1528326452,0),('65962c062d4fd0b8d0f595c81c376f96',2,1528326834,0),('c4888c4df633e3c2651f6110242d56d0',2,1528326834,0),('8a051148a9e3778ada3a6ead32bcd320',2,1528327171,0),('c343552d60849b53acd9f10b239640a2',2,1528327171,0),('2dcd773a5aee55fdfc30a6fd5897bae1',2,1528331656,0),('ab3aa3f6b369d126c0fda3b33789d84a',2,1528331656,0),('50d73c0a7e1a5ce147dcd26a60cdaee9',2,1528334334,0),('85bf296fba6a2f0fa1fce128c93ca6b2',2,1528334334,0),('25acc491124dcc57f48b96ebec39940b',2,1528334666,0),('b4e51bf17e1363d9d23cf4b4049237d7',2,1528334666,0),('b95182d0feaa7d0828b2c39012595783',2,1528335191,0),('d061f78a5b3cc1ebefd7e744b909d677',2,1528335191,0),('8d466d5d9d4a1200d2e03e89caf967fb',2,1528336735,0),('f473b46ae84bb956a9b06b22bf392797',2,1528336735,0),('21c5483427cf6df7ff8ec0e0cd87bdef',2,1528338380,0),('453e14eefcc7953d400a6f08861e7d97',2,1528338380,0),('0ddea45578789f4b6a2724040bcdfd23',2,1528339301,0),('d6c841732888f7f7c810a2241041b5d7',2,1528339685,0),('696946825bf931a1a9b3a25d406c40f8',2,1528340059,0),('f03456874e90214f93393c1e4fede32e',2,1528340059,0),('49c9ddeb499581ddee62800667f62255',2,1528343028,0),('c716ffc1859d37b5ba6878277808dbf6',2,1528343028,1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(32) NOT NULL DEFAULT '30s',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_trigger`
--

DROP TABLE IF EXISTS `sysmap_element_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_trigger` (
  `selement_triggerid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`selement_triggerid`),
  UNIQUE KEY `sysmap_element_trigger_1` (`selementid`,`triggerid`),
  KEY `c_sysmap_element_trigger_2` (`triggerid`),
  CONSTRAINT `c_sysmap_element_trigger_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_element_trigger_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_trigger`
--

LOCK TABLES `sysmap_element_trigger` WRITE;
/*!40000 ALTER TABLE `sysmap_element_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_shape`
--

DROP TABLE IF EXISTS `sysmap_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_shape` (
  `sysmap_shapeid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `text` text NOT NULL,
  `font` int(11) NOT NULL DEFAULT '9',
  `font_size` int(11) NOT NULL DEFAULT '11',
  `font_color` varchar(6) NOT NULL DEFAULT '000000',
  `text_halign` int(11) NOT NULL DEFAULT '0',
  `text_valign` int(11) NOT NULL DEFAULT '0',
  `border_type` int(11) NOT NULL DEFAULT '0',
  `border_width` int(11) NOT NULL DEFAULT '1',
  `border_color` varchar(6) NOT NULL DEFAULT '000000',
  `background_color` varchar(6) NOT NULL DEFAULT '',
  `zindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmap_shapeid`),
  KEY `sysmap_shape_1` (`sysmapid`),
  CONSTRAINT `c_sysmap_shape_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_shape`
--

LOCK TABLES `sysmap_shape` WRITE;
/*!40000 ALTER TABLE `sysmap_shape` DISABLE KEYS */;
INSERT INTO `sysmap_shape` VALUES (0,1,0,0,0,680,15,'{MAP.NAME}',9,11,'000000',0,0,0,0,'000000','',-1);
/*!40000 ALTER TABLE `sysmap_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ttl` int(11) NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `task_1` (`status`,`proxy_hostid`),
  KEY `c_task_1` (`proxy_hostid`),
  CONSTRAINT `c_task_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_acknowledge`
--

DROP TABLE IF EXISTS `task_acknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_acknowledge` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_acknowledge_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_acknowledge`
--

LOCK TABLES `task_acknowledge` WRITE;
/*!40000 ALTER TABLE `task_acknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_acknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_close_problem`
--

DROP TABLE IF EXISTS `task_close_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_close_problem` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_close_problem_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_close_problem`
--

LOCK TABLES `task_close_problem` WRITE;
/*!40000 ALTER TABLE `task_close_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_close_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command`
--

DROP TABLE IF EXISTS `task_remote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command` (
  `taskid` bigint(20) unsigned NOT NULL,
  `command_type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  `alertid` bigint(20) unsigned DEFAULT NULL,
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command`
--

LOCK TABLES `task_remote_command` WRITE;
/*!40000 ALTER TABLE `task_remote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command_result`
--

DROP TABLE IF EXISTS `task_remote_command_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command_result` (
  `taskid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_result_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command_result`
--

LOCK TABLES `task_remote_command_result` WRITE;
/*!40000 ALTER TABLE `task_remote_command_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
INSERT INTO `trigger_depends` VALUES (1,13295,13321),(3,13296,13295),(2,13296,13321),(4,13297,13321),(5,13298,13297),(6,13298,13321),(7,13299,13321),(9,13300,13299),(8,13300,13321),(10,13301,13321),(12,13302,13301),(11,13302,13321),(13,13303,13322),(14,13304,13303),(15,13304,13322),(16,13305,13322),(17,13306,13321),(18,13307,13305),(19,13307,13322),(20,13308,13306),(21,13308,13321),(22,13311,13309),(23,13312,13310),(24,13313,13321),(25,13314,13322),(26,13315,13313),(27,13315,13321),(28,13316,13314),(29,13316,13322),(30,13318,13317),(31,13319,13321),(32,13320,13319),(33,13320,13321),(34,13323,13321),(35,13324,13321),(36,13324,13323),(37,13325,13321),(38,13326,13321),(39,13326,13325),(41,13555,13554),(40,13556,13554),(42,13788,13787),(43,13789,13787),(44,13804,13803),(45,13806,13805),(46,13826,13827),(47,13828,13829),(48,13830,13831),(49,13832,13825),(50,13858,13859),(51,13859,13860);
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tag`
--

DROP TABLE IF EXISTS `trigger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tag` (
  `triggertagid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`triggertagid`),
  KEY `trigger_tag_1` (`triggerid`),
  CONSTRAINT `c_trigger_tag_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tag`
--

LOCK TABLES `trigger_tag` WRITE;
/*!40000 ALTER TABLE `trigger_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(2048) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `recovery_mode` int(11) NOT NULL DEFAULT '0',
  `recovery_expression` varchar(2048) NOT NULL DEFAULT '',
  `correlation_mode` int(11) NOT NULL DEFAULT '0',
  `correlation_tag` varchar(255) NOT NULL DEFAULT '',
  `manual_close` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (10010,'{13078}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10011,'{13084}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10012,'{12580}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(10016,'{10199}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10021,'{12583}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10041,'{10204}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10042,'{12553}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10043,'{10208}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10044,'{10207}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10045,'{12927}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(10047,'{12550}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(10190,'{13082}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13000,'{12144}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13015,'{12641}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13017,'{12651}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13019,'{12649}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13023,'{12653}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13025,'{12549}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13026,'{12926}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13073,'{12645}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13074,'{12646}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13080,'{13164}>75','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13164}<65',0,'',0),(13081,'{13170}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13170}<65',0,'',0),(13082,'{13168}>75','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13168}<65',0,'',0),(13083,'{13172}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13172}<65',0,'',0),(13084,'{13174}>75','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13174}<65',0,'',0),(13085,'{13176}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13176}<65',0,'',0),(13086,'{13178}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13178}<65',0,'',0),(13087,'{13180}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13180}<65',0,'',0),(13088,'{13182}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13182}<65',0,'',0),(13089,'{13184}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13184}<65',0,'',0),(13091,'{13188}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13188}<65',0,'',0),(13092,'{13190}>75','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13190}<65',0,'',0),(13093,'{13192}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13192}<65',0,'',0),(13094,'{13198}>75','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13198}<65',0,'',0),(13095,'{13200}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13200}<65',0,'',0),(13096,'{13202}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13202}<65',0,'',0),(13097,'{13204}>75','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13204}<65',0,'',0),(13243,'{13080}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13266,'{12592}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13272,'{12598}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13275,'{13186}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13186}<65',0,'',0),(13285,'{13159}=0','Telnet service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13287,'{12671}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(13288,'{12672}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13289,'{12673}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13291,'{12675} / {12676} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13292,'{12677} / {12678} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',13291,0,0,2,0,'',0,'',0),(13293,'{12679} / {12680} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',13291,0,0,2,0,'',0,'',0),(13294,'{12681}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13295,'{12682}<5 or {12682}>90','Baseboard Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13296,'{12683}<10 or {12683}>83','Baseboard Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13297,'{12684}<0.953 or {12684}>1.149','BB +1.05V PCH Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13298,'{12685}<0.985 or {12685}>1.117','BB +1.05V PCH Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13299,'{12686}<0.683 or {12686}>1.543','BB +1.1V P1 Vccp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13300,'{12687}<0.708 or {12687}>1.501','BB +1.1V P1 Vccp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13301,'{12688}<1.362 or {12688}>1.635','BB +1.5V P1 DDR3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13302,'{12689}<1.401 or {12689}>1.589','BB +1.5V P1 DDR3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13303,'{12690}<1.597 or {12690}>2.019','BB +1.8V SM Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13304,'{12691}<1.646 or {12691}>1.960','BB +1.8V SM Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13305,'{12692}<2.876 or {12692}>3.729','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13306,'{12693}<2.982 or {12693}>3.625','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13307,'{12694}<2.970 or {12694}>3.618','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13308,'{12695}<3.067 or {12695}>3.525','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13309,'{12696}<2.876 or {12696}>3.729','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13310,'{12697}<2.982 or {12697}>3.625','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13311,'{12698}<2.970 or {12698}>3.618','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13312,'{12699}<3.067 or {12699}>3.525','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13313,'{12700}<4.471 or {12700}>5.538','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13314,'{12701}<4.362 or {12701}>5.663','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13315,'{12702}<4.630 or {12702}>5.380','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13316,'{12703}<4.483 or {12703}>5.495','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13317,'{12704}<5 or {12704}>66','BB Ambient Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13318,'{12705}<10 or {12705}>61','BB Ambient Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13319,'{12706}<0 or {12706}>48','Front Panel Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13320,'{12707}<5 or {12707}>44','Front Panel Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13321,'{12708}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13322,'{12709}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13323,'{12710}<324','System Fan 2 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13324,'{12711}<378','System Fan 2 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13325,'{12712}<324','System Fan 3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13326,'{12713}<378','System Fan 3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13327,'{13155}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13328,'{12715}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13329,'{12929}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13330,'{12717}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13331,'{12718}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13332,'{13089}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13333,'{13088}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13334,'{13087}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13336,'{12723}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13337,'{12724}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13338,'{12725}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13339,'{12726}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13340,'{12727}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13341,'{12728}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13342,'{12729}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13343,'{12730}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13344,'{12731}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13345,'{12930}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13346,'{12733}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13347,'{12734}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13348,'{13074}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13349,'{13073}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13350,'{13072}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13352,'{12739}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13353,'{12740}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13354,'{12741}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13355,'{12742}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13356,'{12743}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13357,'{12744}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13358,'{12745}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13359,'{12746}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13360,'{12747}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13361,'{12931}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13364,'{13071}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13365,'{13070}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13366,'{13069}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13367,'{13068}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13368,'{12755}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13370,'{12757}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13371,'{12758}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13372,'{12759}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13373,'{12760}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13374,'{12761}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13375,'{12762}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13376,'{12763}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13377,'{12932}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13382,'{13075}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13384,'{12771}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13386,'{12773}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13388,'{12775}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13389,'{12776}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13390,'{12777}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13391,'{12778}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13392,'{12779}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13393,'{12933}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13395,'{12782}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13396,'{13093}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13397,'{13092}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13398,'{13091}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13399,'{13090}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13400,'{12787}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13401,'{12788}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13402,'{12789}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13403,'{12790}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13404,'{12791}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13405,'{12792}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13406,'{12793}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13407,'{12794}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13408,'{12795}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13409,'{12934}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13410,'{12797}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13411,'{12798}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13414,'{13086}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13416,'{12803}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13418,'{12805}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13419,'{12806}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13420,'{12807}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13421,'{12808}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13422,'{12809}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13423,'{12810}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13425,'{12812}>0','Host information was changed on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13428,'{12815}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13430,'{13095}>300','Too many processes on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13431,'{12818}<10','Lack of available virtual memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,1,'{12818}>20',0,'',0),(13433,'{12820}<10000','Lack of free memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13435,'{13094}>5','Processor load is too high on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13437,'{12824}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13438,'{12935}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13439,'{12826}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13441,'{13194}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13194}<65',0,'',0),(13442,'{12830} > ({12831} * 0.7)','70% http-8080 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13443,'{12832} > ({12833} * 0.7)','70% http-8443 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13444,'{12834} > ({12835}  *0.7)','70% jk-8009 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13445,'{12836}>({12837}*0.7)','70% mp CMS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13446,'{12838}>({12839}*0.7)','70% mp CMS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13447,'{12840}>({12841}*0.7)','70% mp Code Cache used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13448,'{12842}>({12843}*0.7)','70% mp Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13449,'{12844}>({12845}*0.7)','70% mp PS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13450,'{12846}>({12847}*0.7)','70% mp PS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13451,'{12848}>({12849}*0.7)','70% mp Tenured Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13452,'{12850}>({12851}*0.7)','70% os Opened File Descriptor Count used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13453,'{12852}<{12853}','gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13454,'{12854}<{12855}','gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13455,'{12856}<{12857}','gc PS Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13456,'{12858} = 1','gzip compression is off for connector http-8080 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13457,'{12859} = 1','gzip compression is off for connector http-8443 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13458,'{12860}={12861}','mp CMS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13459,'{12862}={12863}','mp CMS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13460,'{12864}={12865}','mp Code Cache fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13461,'{12866}={12867}','mp Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13462,'{12868}={12869}','mp PS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13463,'{12870}={12871}','mp PS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13464,'{12872}={12873}','mp Tenured Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13465,'{12874}=1','{HOST.NAME} is not reachable','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13466,'{12967}=1','{HOST.NAME} uses suboptimal JIT compiler','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13507,'{12936}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13508,'{12937}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13510,'{12939}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13511,'{12940}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13512,'{12941}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13513,'{12942}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13514,'{12943}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13515,'{12944}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13516,'{12945}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13517,'{12946}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13518,'{12947}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13519,'{12948}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13520,'{12949}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13521,'{13206}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13206}<65',0,'',0),(13522,'{13208}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13208}<65',0,'',0),(13523,'{13210}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13210}<65',0,'',0),(13524,'{13211}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13211}<65',0,'',0),(13525,'{13212}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13212}<65',0,'',0),(13526,'{13213}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13213}<65',0,'',0),(13527,'{13214}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13214}<65',0,'',0),(13528,'{13215}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13215}<65',0,'',0),(13529,'{13216}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13216}<65',0,'',0),(13530,'{13217}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13217}<65',0,'',0),(13531,'{13218}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13218}<65',0,'',0),(13532,'{13219}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13219}<65',0,'',0),(13533,'{13220}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13220}<65',0,'',0),(13534,'{13207}>75','Zabbix data sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13207}<65',0,'',0),(13535,'{13209}>75','Zabbix heartbeat sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13209}<65',0,'',0),(13536,'{12965}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13538,'{12968}>70','70% os Process CPU Load on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13539,'{12969}>({12970}*0.7)','70% mem Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13540,'{12971}>({12972}*0.7)','70% mem Non-Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13541,'{12973}={12974}','mem Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13542,'{12975}={12976}','mem Non-Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13543,'{12977}<>1','{HOST.NAME} runs suboptimal VM type','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13544,'{12994}=0','FTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13545,'{12995}=0','HTTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13546,'{12996}=0','HTTPS service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13547,'{12997}=0','IMAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13548,'{12998}=0','LDAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13549,'{13154}=0','NNTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13550,'{13156}=0','NTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13551,'{13152}=0','POP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13552,'{13157}=0','SMTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13553,'{13158}=0','SSH service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13554,'{13096}=0','{HOST.NAME} is unavailable by ICMP','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13555,'{13097}>0.15','Response time is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13556,'{13098}>20','Ping loss is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13557,'{13160}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13559,'{13196}>75','Zabbix task manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13196}<65',0,'',0),(13561,'{13221}<>0','Service \"{#SERVICE.NAME}\" ({#SERVICE.DISPLAYNAME}) is not running (startup type {#SERVICE.STARTUPNAME})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13585,'{13245}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13586,'{13246}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13587,'{13247}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13588,'{13248}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13589,'{13249}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13590,'{13250}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13591,'{13251}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13592,'{13252}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13593,'{13253}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13594,'{13254}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13595,'{13255}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13596,'{13256}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13597,'{13257}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13598,'{13258}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13599,'{13259}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13600,'{13260}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13601,'{13261}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13787,'{13447}=3','Cannot be pinged','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13788,'{13448}>50','Ping loss is too high','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13789,'{13449}>100','Ping Response time is too high','',0,0,4,0,'','',NULL,1,0,0,0,'',0,'',0),(13790,'{13450}>0','Upgraded Packages in Container Available','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13791,'{13451}=1','Zabbix agent is unreachable','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13792,'{13452}=1','No update status data available','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',1),(13793,'{13453}=0','Wordpress update available','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',1),(13794,'{13454}>20','DB Backup is 20% Greater in Size','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',1),(13795,'{13455}<20','DB Backup is 20% Smaller in Size','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',1),(13796,'{13456}<1K','DB Backup is empty','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13797,'{13457}=0 and {13458}<>0 and {13459}<>0 and {13460}<>0','No Backups occurred in 2 days','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13798,'{13461}<>0 and {13462}=0 and {13463}<>0 and {13464}<>0','No Backups occurred in 3 days','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13799,'{13465}<>0 and {13466}<>0 and {13467}=0 and {13468}<>0','No Backups occurred in 4 days','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13800,'{13469}<>0 and {13470}<>0 and {13471}<>0 and {13472}=0','No Backups occurred in 5 days or more','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13801,'{13473}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13803,'{13475}<0','SSL certificate expired','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13804,'{13476}<7','SSL certificate expires in less than 7 days. ({ITEM.VALUE} days remaining)','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13805,'{13477}<0','Domain expired','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13806,'{13478}<30','Domain expiress in less than 30 days. ({ITEM.VALUE} days remaining)','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13807,'{13479}=0','Service clamd (clamav) is not running','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13808,'{13480}=0 and {13481}<>0 and {13482}<>0 and {13483}<>0','BackupPC - Host without Backups (2 Days)','',0,0,1,0,'There are some hosts that have not been backed up in 2 Days, while this is not a problem it should be monitored.','',NULL,0,0,0,0,'',0,'',0),(13809,'{13484}=0 and {13485}<>0 and {13486}<>0','BackupPC - Host without Backups (3 Days)','',0,0,5,0,'There are some hosts that have not been backed up in 3 Days, this should be checked soon.','',NULL,0,0,0,0,'',0,'',0),(13810,'{13487}=0 and {13488}<>0','BackupPC - Host without Backups (4 Days)','',0,0,5,0,'There are some hosts that have not been backed up in 4 Days, this should be checked immediately.','',NULL,0,0,0,0,'',0,'',0),(13811,'{13489}=0','BackupPC - Host without Backups (5 Days)','',0,0,5,0,'There are some hosts that have not been backed up in 5 Days, this should be checked immediately.','',NULL,0,0,0,0,'',0,'',0),(13812,'{13490}=0','BackupPC - {HOSTNAME} Full backup older than 1 week','',0,0,5,0,'BackupPC has some hosts missing weekly full backup. Please take action to correct.','',NULL,0,0,0,0,'',0,'',0),(13813,'{13491}=0','BackupPC not running','',0,0,5,0,'The BackupPC process it not running, try restarting the service.','',NULL,0,0,0,0,'',0,'',0),(13814,'{13492}>0','{#BACKUPHOST} has bad file in full backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13815,'{13493}>0','{#BACKUPHOST} has bad file in incremental backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13816,'{13494}>0','{#BACKUPHOST} has bad share in full backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13817,'{13495}>0','{#BACKUPHOST} has bad share in incremental backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13818,'{13496}>0','{#BACKUPHOST} has error in full backup','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',1),(13819,'{13497}>0','{#BACKUPHOST} has error in incremental backup','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',1),(13820,'{13498}>0','{#BACKUPHOST} has tar error in full backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',1),(13821,'{13499}>0','{#BACKUPHOST} has tar error in incremental backup','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',1),(13822,'{13500}=0','Service spamd is not running','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13823,'{13501}<1','Redis is not running','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13824,'{13502}>1.45','Redis memory fragmentation to high','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13825,'{13503}=0','Dead Rabbit','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13826,'{13504}>50','Percent file descriptors greater than 50%','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13827,'{13505}>75','Percent file descriptors greater than 75%','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13828,'{13506}>50','Percent memory use greater than 50%','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13829,'{13507}>75','Percent memory use greater than 75%','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13830,'{13508}>50','Percent sockets in use greater than 50%','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13831,'{13509}>75','Percent sockets in use greater than 75%','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13832,'{13510}=1 or {13511}=1','Queue data status issue','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13833,'{13512}=0','RabbitMQ Cluster partition detected','',0,0,3,0,'RabbitMQ Cluster is in a BAD state!','',NULL,0,0,0,0,'',0,'',0),(13834,'{13513}>0','RabbitMQ server version has changed','',1,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13835,'{13514}=1','No data received on queue {#VHOSTNAME}/{#QUEUENAME} in 10 minutes.','',0,0,4,0,'No data received on queue {#VHOSTNAME}/{#QUEUENAME}','',NULL,0,0,2,0,'',0,'',0),(13836,'{13515}=0 and {13516}<>0','No queue consumer found and messages present on: {#VHOSTNAME}/{#QUEUENAME}','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13837,'{13517}>{$RABBIT_QUEUE_MESSAGES_CRIT}','{#NODENAME}/{#VHOSTNAME}/{#QUEUENAME} - CRITICAL','http://{#FQDN}:15672/#/queues/',0,0,4,0,'','',NULL,0,0,2,0,'',0,'',0),(13838,'{13518}>{$RABBIT_QUEUE_MESSAGES_WARN} and {13518}<{$RABBIT_QUEUE_MESSAGES_CRIT}','{#NODENAME}/{#VHOSTNAME}/{#QUEUENAME} - Warning','http://{#FQDN}:15672/#/queues/',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13839,'{13519}=0','Shovel {#SHOVELNAME} on Vhost {#VHOSTNAME} is not running','',0,0,4,0,'','',NULL,0,0,2,0,'',0,'',0),(13840,'{13520}>{$PG_LONG_QUERY_THRESHOLD}','PostgreSQL active transaction too long','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13841,'{13521}<{$PG_CACHE_HIT_RATIO}','PostgreSQL cache hit ratio too low','',1,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13842,'{13522}>{$PG_DEADLOCKS_THRESHOLD}','PostgreSQL deadlock occured','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13843,'{13523}>{$PG_CONN_IDLE_IN_TRANSACTION}','PostgreSQL idle in transaction connections too high','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13844,'{13524}>{$PG_LONG_QUERY_THRESHOLD}','PostgreSQL idle transaction too long','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13845,'{13525}=0','PostgreSQL not running','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13846,'{13526}>{$PG_CONN_WAITING}','PostgreSQL number of waiting connections too high','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13847,'{13527}>{$PG_CONFLICTS_THRESHOLD}','PostgreSQL recovery conflict occured on {HOSTNAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13848,'{13528}>{$PG_CHECKPOINTS_REQ_THRESHOLD}','PostgreSQL required checkpoints occurs too frequently','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13849,'{13529}>{$PG_PING_THRESHOLD_MS}','PostgreSQL response too long','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13850,'{13530}<{$PG_UPTIME_THRESHOLD}','PostgreSQL service was restarted','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',1),(13851,'{13531}>{$PG_CONN_TOTAL_PCT}','PostgreSQL total number of connections too high','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13852,'{13532}>{$PG_LONG_QUERY_THRESHOLD}','PostgreSQL waiting transaction too long','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13853,'{13533}>{$PG_DATABASE_SIZE_THRESHOLD}','PostgreSQL database {#DBNAME} too large','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13854,'{13534}>{$PG_SR_PACKET_LOSS}','PostgreSQL packet loss between {HOSTNAME} and {#HOTSTANDBY} to high ({ITEM.LASTVALUE})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13855,'{13535}>{$PG_SR_LAG_BYTE}','PostgreSQL streaming lag between {HOSTNAME} and {#HOTSTANDBY} to high ({ITEM.LASTVALUE})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13856,'{13536}>{$PG_SR_LAG_SEC}','PostgreSQL streaming lag between {HOSTNAME} and {#HOTSTANDBY} to high ({ITEM.LASTVALUE})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13857,'{13537}=0','{HOST.NAME} - Postfix is down','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13858,'{13538}>20','{HOST.NAME} - Postfix queue is over 20','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13859,'{13539}>50','{HOST.NAME} - Postfix queue is over 50','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13860,'{13540}>200','{HOST.NAME} - Postfix queue is over 200','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13861,'{13541}=0','{HOST.NAME} - Postgrey is down','',1,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13862,'{13542}>0','OPcache version has changed','',1,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13863,'{13543}=0','PHP-FPM is down','',0,0,4,0,'PHP-FPM process count: 0','',NULL,0,0,0,0,'',0,'',0),(13864,'{13544}=0','Fail2ban is not enabled in autostart','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13865,'{13545}=0','Fail2Ban service is down','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13866,'{13546}=0','Nginx is down','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13867,'{13547}=0','Memcached not running on {HOSTNAME}','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13868,'{13548}=0','Memcache doesn\'t accept connections on {HOSTNAME}','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13869,'{13549}=0','Version Check','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',1),(13870,'{13550}=0','LDAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13872,'{13552}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13873,'{13553}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13874,'{13554}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13875,'{13555}>0','/etc/hosts changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13876,'{13556}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13877,'{13557}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13878,'{13558}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13879,'{13559}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13880,'{13560}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13881,'{13561}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13882,'{13562}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13883,'{13563}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13884,'{13564}<90','Memory Use > 90%  on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13885,'{13565}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13886,'{13566}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13887,'{13567}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13888,'{13568}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13889,'{13569}>{$ESTABLISHED}','{HOST.NAME} socket.tcp.established {ITEM.VALUE} (>{$ESTABLISHED})','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13890,'{13570}>{$CLOSEWAIT}','{HOST.NAME} socket.tcp_closewait {ITEM.VALUE} (>{$CLOSEWAIT})','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13891,'{13571}>{$TIMEWAIT}','{HOST.NAME} socket.tcp_timewait {ITEM.VALUE} (>{$TIMEWAIT})','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13892,'{13572}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13893,'{13573}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13894,'{13574}>5242880000','Redis-{HOST.NAME}-{#REDISPORT}-usememory > 5G','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13895,'{13575}>0.9','Redis-{HOST.NAME}-{#REDISPORT}-usememory > 90%','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13896,'{13576}<1','Redis-{HOST.NAME}-{#REDISPORT} no-slave','',1,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13897,'{13577}<>1','Redis-{HOST.NAME}-{#REDISPORT} shutdown','',0,0,4,0,'','',NULL,0,0,2,0,'',0,'',0),(13898,'{13578}<>1','Memcached-{HOST.NAME}-{#MCPORT} shutdown','',0,0,4,0,'','',NULL,0,0,2,0,'',0,'',0);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` varchar(32) NOT NULL DEFAULT '15m',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` varchar(32) NOT NULL DEFAULT '30s',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','21232f297a57a5a743894a0e4a801fc3','',1,'0','zh_CN','30s',3,'default',0,'192.168.56.1',1523768958,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,'15m','en_GB','30s',1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',0,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(7,'Dell Open Manage System Status'),(2,'Host availability'),(6,'HP Insight System Status'),(17,'HTTP response status code'),(14,'Maintenance status'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widgetid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`),
  KEY `widget_1` (`dashboardid`),
  CONSTRAINT `c_widget_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,1,'favgrph','',0,0,2,3),(2,1,'favscr','',2,0,2,3),(3,1,'favmap','',4,0,2,3),(4,1,'problems','',0,3,6,6),(5,1,'webovr','',0,9,3,4),(6,1,'dscvry','',3,9,3,4),(7,1,'hoststat','',6,0,6,4),(8,1,'syssum','',6,4,6,4),(9,1,'stszbx','',6,8,6,5);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_field`
--

DROP TABLE IF EXISTS `widget_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_field` (
  `widget_fieldid` bigint(20) unsigned NOT NULL,
  `widgetid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `value_groupid` bigint(20) unsigned DEFAULT NULL,
  `value_hostid` bigint(20) unsigned DEFAULT NULL,
  `value_itemid` bigint(20) unsigned DEFAULT NULL,
  `value_graphid` bigint(20) unsigned DEFAULT NULL,
  `value_sysmapid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_fieldid`),
  KEY `widget_field_1` (`widgetid`),
  KEY `widget_field_2` (`value_groupid`),
  KEY `widget_field_3` (`value_hostid`),
  KEY `widget_field_4` (`value_itemid`),
  KEY `widget_field_5` (`value_graphid`),
  KEY `widget_field_6` (`value_sysmapid`),
  CONSTRAINT `c_widget_field_1` FOREIGN KEY (`widgetid`) REFERENCES `widget` (`widgetid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_2` FOREIGN KEY (`value_groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_3` FOREIGN KEY (`value_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_4` FOREIGN KEY (`value_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_5` FOREIGN KEY (`value_graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_6` FOREIGN KEY (`value_sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_field`
--

LOCK TABLES `widget_field` WRITE;
/*!40000 ALTER TABLE `widget_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07 11:45:53