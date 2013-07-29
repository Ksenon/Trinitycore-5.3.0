-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-27 00:07:24
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for auth
DROP DATABASE IF EXISTS `auth`;
CREATE DATABASE IF NOT EXISTS `auth` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `auth`;


-- Dumping structure for table auth.account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sha_email_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `gmlevel` int(10) NOT NULL DEFAULT '0',
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active_realm_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(40) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_build` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `acp` int(32) NOT NULL DEFAULT '0',
  `staff_id` int(32) NOT NULL DEFAULT '0',
  `vp` int(10) unsigned NOT NULL DEFAULT '0',
  `dp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5186 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

-- Dumping data for table auth.account: 2 rows
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `sha_pass_hash`, `sha_email_pass_hash`, `sessionkey`, `v`, `s`, `gmlevel`, `email`, `joindate`, `last_ip`, `failed_logins`, `locked`, `last_login`, `online`, `active_realm_id`, `expansion`, `mutetime`, `locale`, `os`, `recruiter`, `last_build`, `acp`, `staff_id`, `vp`, `dp`) VALUES
	(5184, 'BIBI', '18C08B6AA621819A1DE983CBE2EF29E6CC059E0E', '18C08B6AA621819A1DE983CBE2EF29E6CC059E0E', NULL, '50CC2172216991CA1469F42D2C5BF286F141EBEBBB8685124AEE39DC4B685211', '8C9BB378FE26D59D3EB3D6AFBB580E02EFA34589B0A074861FE4755797427A67', 0, 'BIBI', '2013-04-25 23:17:53', '127.0.0.1', 0, 0, '0000-00-00 00:00:00', 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 0, 0),
	(5185, 'ADMIN', '8301316D0D8448A34FA6D0C6BF1CBFA2B4A1A93A', '', '626163F9598BB58181086FC2A400D17D85208F1FD801F2B4A666616D7A920FBD290596D496EF9EFE', '06915620DDAF519E18DF7C91F26CB722B157ECBE4C8F6389A3DF77D15B11C6FA', 'F18943C6BF9490A72CDE7F573962FBD51A1A3BB7DEAF6A37D2AB9C85BB9AFD95', 0, NULL, '2013-04-26 02:19:00', '127.0.0.1', 0, 0, '2013-04-26 23:58:31', 0, 0, 4, 0, 2, 'Win', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- Dumping structure for table auth.account_access
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.account_access: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;


-- Dumping structure for table auth.account_banned
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- Dumping data for table auth.account_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;


-- Dumping structure for table auth.account_friends
DROP TABLE IF EXISTS `account_friends`;
CREATE TABLE IF NOT EXISTS `account_friends` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `friend_id` int(11) unsigned NOT NULL DEFAULT '0',
  `bind_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bring Date',
  `expire_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Expire Date',
  PRIMARY KEY (`id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores accounts for Refer-a-Friend System.';

-- Dumping data for table auth.account_friends: 0 rows
/*!40000 ALTER TABLE `account_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_friends` ENABLE KEYS */;


-- Dumping structure for table auth.account_premium
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE IF NOT EXISTS `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Accounts';

-- Dumping data for table auth.account_premium: 0 rows
/*!40000 ALTER TABLE `account_premium` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_premium` ENABLE KEYS */;


-- Dumping structure for table auth.ajax_chat_bans
DROP TABLE IF EXISTS `ajax_chat_bans`;
CREATE TABLE IF NOT EXISTS `ajax_chat_bans` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table auth.ajax_chat_bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `ajax_chat_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajax_chat_bans` ENABLE KEYS */;


-- Dumping structure for table auth.ajax_chat_invitations
DROP TABLE IF EXISTS `ajax_chat_invitations`;
CREATE TABLE IF NOT EXISTS `ajax_chat_invitations` (
  `userID` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table auth.ajax_chat_invitations: ~0 rows (approximately)
/*!40000 ALTER TABLE `ajax_chat_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajax_chat_invitations` ENABLE KEYS */;


-- Dumping structure for table auth.ajax_chat_messages
DROP TABLE IF EXISTS `ajax_chat_messages`;
CREATE TABLE IF NOT EXISTS `ajax_chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `text` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table auth.ajax_chat_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `ajax_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajax_chat_messages` ENABLE KEYS */;


-- Dumping structure for table auth.ajax_chat_online
DROP TABLE IF EXISTS `ajax_chat_online`;
CREATE TABLE IF NOT EXISTS `ajax_chat_online` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table auth.ajax_chat_online: ~0 rows (approximately)
/*!40000 ALTER TABLE `ajax_chat_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajax_chat_online` ENABLE KEYS */;


-- Dumping structure for table auth.ip_banned
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- Dumping data for table auth.ip_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;


-- Dumping structure for table auth.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table auth.mangchat
DROP TABLE IF EXISTS `mangchat`;
CREATE TABLE IF NOT EXISTS `mangchat` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `host` text,
  `port` int(11) NOT NULL DEFAULT '0',
  `user` text,
  `pass` text,
  `nick` text,
  `auth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.mangchat: ~0 rows (approximately)
/*!40000 ALTER TABLE `mangchat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangchat` ENABLE KEYS */;


-- Dumping structure for table auth.mangchat_links
DROP TABLE IF EXISTS `mangchat_links`;
CREATE TABLE IF NOT EXISTS `mangchat_links` (
  `mangchat_id` int(11) unsigned NOT NULL DEFAULT '0',
  `wow_channel` varchar(255) NOT NULL DEFAULT '',
  `wow_channel_options` int(11) unsigned NOT NULL DEFAULT '0',
  `irc_channel` varchar(255) NOT NULL DEFAULT '',
  `irc_channel_options` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mangchat_id`,`wow_channel`,`irc_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.mangchat_links: ~0 rows (approximately)
/*!40000 ALTER TABLE `mangchat_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangchat_links` ENABLE KEYS */;


-- Dumping structure for table auth.realmcharacters
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- Dumping data for table auth.realmcharacters: ~2 rows (approximately)
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 5184, 0),
	(1, 5185, 1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;


-- Dumping structure for table auth.realmd_db_version
DROP TABLE IF EXISTS `realmd_db_version`;
CREATE TABLE IF NOT EXISTS `realmd_db_version` (
  `required_s1706_xxxxx_01_realmd_warden_data_result` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';

-- Dumping data for table auth.realmd_db_version: 0 rows
/*!40000 ALTER TABLE `realmd_db_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `realmd_db_version` ENABLE KEYS */;


-- Dumping structure for table auth.realmlist
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `color` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '32',
  `realmflags` tinyint(3) unsigned NOT NULL DEFAULT '32',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `realmbuilds` int(10) unsigned NOT NULL DEFAULT '12340',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '17128',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- Dumping data for table auth.realmlist: ~1 rows (approximately)
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `port`, `icon`, `color`, `flag`, `realmflags`, `timezone`, `allowedSecurityLevel`, `population`, `realmbuilds`, `gamebuild`) VALUES
	(1, 'test trinity', '127.0.0.1', 8085, 0, 2, 32, 32, 1, 0, 0, 12340, 17128);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;


-- Dumping structure for table auth.realm_classes
DROP TABLE IF EXISTS `realm_classes`;
CREATE TABLE IF NOT EXISTS `realm_classes` (
  `realmId` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL COMMENT 'Class Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for class activation',
  PRIMARY KEY (`realmId`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table auth.realm_classes: ~11 rows (approximately)
/*!40000 ALTER TABLE `realm_classes` DISABLE KEYS */;
INSERT INTO `realm_classes` (`realmId`, `class`, `expansion`) VALUES
	(1, 1, 0),
	(1, 2, 0),
	(1, 3, 0),
	(1, 4, 0),
	(1, 5, 0),
	(1, 6, 2),
	(1, 7, 0),
	(1, 8, 0),
	(1, 9, 0),
	(1, 10, 4),
	(1, 11, 0);
/*!40000 ALTER TABLE `realm_classes` ENABLE KEYS */;


-- Dumping structure for table auth.realm_races
DROP TABLE IF EXISTS `realm_races`;
CREATE TABLE IF NOT EXISTS `realm_races` (
  `realmId` int(11) NOT NULL,
  `race` tinyint(4) NOT NULL COMMENT 'Race Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for race activation',
  PRIMARY KEY (`realmId`,`race`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table auth.realm_races: ~15 rows (approximately)
/*!40000 ALTER TABLE `realm_races` DISABLE KEYS */;
INSERT INTO `realm_races` (`realmId`, `race`, `expansion`) VALUES
	(1, 1, 0),
	(1, 2, 0),
	(1, 3, 0),
	(1, 4, 0),
	(1, 5, 0),
	(1, 6, 0),
	(1, 7, 0),
	(1, 8, 0),
	(1, 9, 3),
	(1, 10, 1),
	(1, 11, 1),
	(1, 22, 3),
	(1, 24, 4),
	(1, 25, 4),
	(1, 26, 4);
/*!40000 ALTER TABLE `realm_races` ENABLE KEYS */;


-- Dumping structure for table auth.uptime
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'NA',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- Dumping data for table auth.uptime: ~30 rows (approximately)
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` (`realmid`, `starttime`, `startstring`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1366935445, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366937070, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366939094, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366939280, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366939407, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366939506, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366940281, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366941018, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366941620, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366941691, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366941739, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366942918, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366945786, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366945908, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366945984, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366992080, '', 4800, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366997215, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366998457, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366998549, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1366999440, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367001816, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367005638, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367005854, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367006219, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367006226, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367007025, '', 0, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367007480, '', 1801, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367010420, '', 602, 0, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367011841, '', 603, 1, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1367013401, '', 602, 1, 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;


-- Dumping structure for table auth.warden_data_result
DROP TABLE IF EXISTS `warden_data_result`;
CREATE TABLE IF NOT EXISTS `warden_data_result` (
  `check` int(3) DEFAULT NULL,
  `data` tinytext,
  `str` tinytext,
  `address` int(8) DEFAULT NULL,
  `length` int(2) DEFAULT NULL,
  `result` tinytext,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.warden_data_result: ~0 rows (approximately)
/*!40000 ALTER TABLE `warden_data_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `warden_data_result` ENABLE KEYS */;


-- Dumping structure for trigger auth.negative_insert
DROP TRIGGER IF EXISTS `negative_insert`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `negative_insert` BEFORE INSERT ON `account_access` FOR EACH ROW BEGIN
    DECLARE msg VARCHAR(255);
IF NEW.`RealmID` < 0 THEN
        set msg = "Error: You cannot use -1 for RealmID. This is a Security Risk.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger auth.negative_update
DROP TRIGGER IF EXISTS `negative_update`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `negative_update` BEFORE UPDATE ON `account_access` FOR EACH ROW BEGIN
    DECLARE msg VARCHAR(255);
IF NEW.`RealmID` < 0 THEN
        set msg = "Error: You cannot use -1 for RealmID. This is a Security Risk.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
