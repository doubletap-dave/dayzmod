/*
	DayZ Mod 1.8.9 Updates
	
	RUN THIS FILE IF UPDATING AN EXISTING 188 DATABASE TO 189.
*/
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for event dayzhivemind.3h updates
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` EVENT `3h updates` ON SCHEDULE EVERY 3 HOUR STARTS '2015-01-26 03:29:45' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	update event_scheduler set LastRun = NOW() where System = "3hRespawns";
	
	CALL `pMain`('1337');
	
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:17
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dayzhivemind.character_data
CREATE TABLE IF NOT EXISTS `character_data` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '1000',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(1000) NOT NULL DEFAULT '[[],[]]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:18
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dayzhivemind.character_dead
CREATE TABLE IF NOT EXISTS `character_dead` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(1000) NOT NULL DEFAULT '[[],[]]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
--
-- Dumping routines for database 'dayzdev'
--
/*!50003 DROP FUNCTION IF EXISTS `countVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehicles`(`inst` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst;
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;/*!50003 DROP FUNCTION IF EXISTS `countVehiclesClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesClass`(`inst` int,`c` varchar(255)) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
		INTO count
		FROM object_data
		WHERE Instance = inst
		AND CharacterID = 0
		AND Classname = c;
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;/*!50003 DROP FUNCTION IF EXISTS `countVehiclesGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesGroup`(`inst` int, `groupid` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT;
	
	/*SELECT COUNT(*)
		INTO count
		FROM object_data AS obj
		WHERE CharacterID = 0
			AND Instance = instance
		AND t = (SELECT `Group` FROM vehicle_spawns AS spawn WHERE spawn.Classname = obj.Classname LIMIT 1);*/
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst
		AND Classname IN
		(
			SELECT Classname
			FROM vehicle_spawns
			WHERE ID IN
			(
				SELECT Spawn_ID
				FROM vehicle_spawns_groups
				WHERE Group_ID = groupid
			)
		);
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dayzhivemind.event_scheduler
CREATE TABLE IF NOT EXISTS `event_scheduler` (
  `System` text,
  `LastRun` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dayzhivemind.event_scheduler: ~2 rows (approximately)
/*!40000 ALTER TABLE `event_scheduler` DISABLE KEYS */;
INSERT INTO `event_scheduler` (`System`, `LastRun`) VALUES
	('3hRespawns', NULL),
	('pCleanup', NULL),
	('pCleanupBase', NULL),
	('pMain', NULL);
/*!40000 ALTER TABLE `event_scheduler` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!50003 DROP FUNCTION IF EXISTS `generateUID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `generateUID`(`inst` int) RETURNS bigint(20)
BEGIN
	DECLARE Min BIGINT DEFAULT 10000000;
	DECLARE Max BIGINT DEFAULT 99999999;
	
	DECLARE UID BIGINT DEFAULT 0;
	
	WHILE (UID = 0) DO
		SET UID = ROUND(Min + RAND() * (Max - Min));
		
		IF (UID IN (SELECT ObjectUID FROM object_data WHERE CharacterID = 0 AND Instance = inst)) THEN
			SET UID = 0;
		END IF;
	END WHILE;
	
	RETURN UID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;/*!50003 DROP FUNCTION IF EXISTS `getNumSpawnable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `getNumSpawnable`(`inst` int, `spawnid` int) RETURNS int(11)
BEGIN
	DECLARE Class_Max INT DEFAULT (SELECT MaxNum - countVehiclesClass(inst, Classname) FROM vehicle_spawns WHERE ID = spawnid LIMIT 1);
	DECLARE Group_Max INT DEFAULT
	(
		SELECT MIN(MaxNum - countVehiclesGroup(inst, ID))
		FROM vehicle_groups
		WHERE ID IN
		(
			SELECT Group_ID
			FROM vehicle_spawns_groups
			WHERE Spawn_ID = spawnid
		)
	);
	
	RETURN IF(ISNULL(Group_Max), Class_Max, IF(Class_Max < Group_Max, Class_Max, Group_Max));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:22
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dayzhivemind.object_data
CREATE TABLE IF NOT EXISTS `object_data` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` longtext NOT NULL,
  `Fuel` double(13,5) NOT NULL DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectID`),
  UNIQUE KEY `CheckUID` (`ObjectUID`,`Instance`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Damage`,`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!50003 DROP PROCEDURE IF EXISTS `pCleanup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanup`()
BEGIN 
#Last ran
	update event_scheduler set LastRun = NOW() where System = "pCleanup";

#starts outofbounds cleanup
        CALL pCleanupOOB();
 
#remove damaged objects
        DELETE
                FROM object_data
                WHERE CharacterID != 0 AND Damage >= 1;

#remove damaged vehicles older than vehicle_spawns.CleanupTime
	DELETE FROM object_data
	WHERE CharacterID = 0
		AND Damage = 1
		AND SYSDATE() > DATE(last_updated) + INTERVAL (
			SELECT CleanupTime
			FROM vehicle_spawns
			WHERE vehicle_spawns.Classname = object_data.Classname
			LIMIT 1) MINUTE;

#remove empty tents older than seven days
        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
       
        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[]';          
 
#remove barbed wire older than two days
        DELETE
            FROM object_data
				WHERE Classname = 'Wire_cat1'
					AND DATE(last_updated) < CURDATE() - INTERVAL 2 DAY;
					                      
#remove Tank Traps older than fifteen days
        DELETE
                FROM object_data
                WHERE Classname = 'Hedgehog_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 15 DAY;
 
#remove Sandbags older than twenty days
        DELETE
                FROM object_data
                WHERE Classname = 'Sandbag1_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 20 DAY;
 
#remove Traps older than five days
        DELETE
                FROM object_data
                WHERE (Classname = 'BearTrap_DZ' or Classname = 'TrapBearTrapFlare' or Classname = 'TrapBearTrapSmoke' or Classname = 'Trap_Cans' or Classname = 'TrapTripwireFlare' or Classname = 'TrapTripwireGrenade' or Classname = 'TrapTripwireSmoke')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY; 
#remove incomplete gates after 1 Day
        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenGate_foundation')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 1 Day;                        
#remove incomplete fences after 1 Day								
        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_foundation')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 1 Day;  
                        
#remove incomplete fences after 3 Dayz								
        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_frame' or Classname = 'WoodenFence_quaterpanel' or Classname = 'WoodenFence_halfpanel' or Classname = 'WoodenFence_thirdpanel')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 3 Day; 
                       
#remove dead players from data table
        DELETE
                FROM character_data
                WHERE Alive=0 AND DATE(last_updated) < CURDATE() - INTERVAL 90 Day; 
#Remove Bad Data
				DELETE
								FROM object_data
								WHERE Classname like '%_base';
			
#Remove wire if the owner has died.						
		DELETE
			FROM Object_DATA
			USING Object_DATA, Character_DATA
				WHERE Object_DATA.Classname = 'Wire_cat1'
					AND Object_DATA.CharacterID = Character_DATA.CharacterID
					AND Character_DATA.Alive = 0;
					
#remove Base_Fire_DZ older than 5 days
        DELETE
            FROM object_data
				WHERE Classname = 'Base_Fire_DZ'
					AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for procedure dayzhivemind.pCleanup
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanupBase`()
BEGIN
#Last ran
	update event_scheduler set LastRun = NOW() where System = "pCleanupBase";
	
#Start Maintenance 1-4 Mode       
	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenFence_1' or Classname = 'WoodenFence_2' or Classname = 'WoodenFence_3' or Classname = 'WoodenFence_4')
				AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
 				AND Hitpoints = '[]';

#Start Maintenance 5-7 Mode       
	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenFence_5' or Classname = 'WoodenFence_6' or Classname = 'WoodenFence_7')
				AND DATE(last_updated) < CURDATE() - INTERVAL 14 DAY
 				AND Hitpoints = '[]';
 				
#Check WoodenFence_1_foundation
	update
		object_data
			set Classname = 'WoodenFence_1_foundation'
				where Classname = 'WoodenFence_1_frame'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;

#Check WoodenFence_1_frame
	update
		object_data
			set Classname = 'WoodenFence_1_frame'
				where Classname = 'WoodenFence_quaterpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;

#Check WoodenFence_halfpanel
	update
		object_data
			set Classname = 'WoodenFence_quaterpanel'
				where Classname = 'WoodenFence_halfpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenFence_thirdpanel
	update
		object_data
			set Classname = 'WoodenFence_halfpanel'
				where Classname = 'WoodenFence_thirdpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				 
#Check fence 1
	update
		object_data
			set Classname = 'WoodenFence_thirdpanel'
				where Classname = 'WoodenFence_1'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
#Check fence 2
	update
		object_data
			set Classname = 'WoodenFence_1'
				where Classname = 'WoodenFence_2'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;	
#Check fence 3
	update
		object_data
			set Classname = 'WoodenFence_2'
				where Classname = 'WoodenFence_3'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 4
	update
		object_data
			set Classname = 'WoodenFence_3'
				where Classname = 'WoodenFence_4'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 5
	update
		object_data
			set Classname = 'WoodenFence_4'
				where Classname = 'WoodenFence_5'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 6 DAY;					
#Check fence 6
	update
		object_data
			set Classname = 'WoodenFence_5'
				where Classname = 'WoodenFence_6'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 6 DAY;					
#Check fence 7
	update
		object_data
			set Classname = 'WoodenFence_6'
				where Classname = 'WoodenFence_7'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 6 DAY;	
				
#DayZ_WoodenGates = ["WoodenGate_1","WoodenGate_2","WoodenGate_3","WoodenGate_4"];
#Start Maintenance Mode Gates				
	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenGate_1' or Classname = 'WoodenGate_2' or Classname = 'WoodenGate_3' or Classname = 'WoodenGate_4')
				AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
 				AND Hitpoints = '[]';
				
#Check WoodenGate_1
	update
		object_data
			set Classname = 'WoodenGate_foundation'
				where Classname = 'WoodenGate_1'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_2
	update
		object_data
			set Classname = 'WoodenGate_1'
				where Classname = 'WoodenGate_2'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_3
	update
		object_data
			set Classname = 'WoodenGate_2'
				where Classname = 'WoodenGate_3'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_4
	update
		object_data
			set Classname = 'WoodenGate_3'
				where Classname = 'WoodenGate_4'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:24
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for procedure dayzhivemind.pCleanupOOB
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanupOOB`()
BEGIN

	DECLARE intLineCount	INT DEFAULT 0;
	DECLARE intDummyCount	INT DEFAULT 0;
	DECLARE intDoLine			INT DEFAULT 0;
	DECLARE intWest				INT DEFAULT 0;
	DECLARE intNorth			INT DEFAULT 0;

	SELECT COUNT(*)
		INTO intLineCount
		FROM Object_DATA;

	SELECT COUNT(*)
		INTO intDummyCount
		FROM Object_DATA
		WHERE Classname = 'dummy';

	WHILE (intLineCount > intDummyCount) DO
	
		SET intDoLine = intLineCount - 1;

		SELECT ObjectUID, Worldspace
			INTO @rsObjectUID, @rsWorldspace
			FROM Object_DATA
			LIMIT intDoLine, 1;

		SELECT REPLACE(@rsWorldspace, '[', '') INTO @rsWorldspace;
		SELECT REPLACE(@rsWorldspace, ']', '') INTO @rsWorldspace;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 2), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 2 -1)) + 2), ',', '') INTO @West;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 3), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 3 -1)) + 2), ',', '') INTO @North;

		SELECT INSTR(@West, '-') INTO intWest;
		SELECT INSTR(@North, '-') INTO intNorth;

		IF (intNorth = 0) THEN
			SELECT CONVERT(@North, DECIMAL(16,8)) INTO intNorth;
		END IF;

# Check for NSEW boundaries
		IF (intWest < 0 OR intWest > 15360 OR intNorth > 15360 OR intNorth < 750) THEN
			DELETE FROM Object_DATA
				WHERE ObjectUID = @rsObjectUID;
		END IF;
			
		SET intLineCount = intLineCount - 1;

	END WHILE;

END//
DELIMITER ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:25
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dayzhivemind.player_data
CREATE TABLE IF NOT EXISTS `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`),
  KEY `playerUID` (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:25
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table dayzhivemind.player_login
CREATE TABLE IF NOT EXISTS `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!50003 DROP PROCEDURE IF EXISTS `pMain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pMain`(IN `i` INT)
    MODIFIES SQL DATA
BEGIN
# Server instance ID.
#-----------------------------------------------
	DECLARE sInstance VARCHAR(8) DEFAULT i;
#-----------------------------------------------
#Last Ran
	update event_scheduler set LastRun = NOW() where System = "pMain";
#Starts Cleanup
	CALL pCleanupBase(); #comment out to disable base decay
	CALL pCleanup();

	CALL pSpawnVehicles(sInstance);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;/*!50003 DROP PROCEDURE IF EXISTS `pSpawnVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pSpawnVehicles`(IN `i` int)
BEGIN
	#---------------------------------------------------------------
	#Change this to affect the maximum number of vehicles on the server.
	DECLARE MaxVehicles INT DEFAULT 80;
	
	#Change this to affect the radius that is checked for existing vehicles when spawning.
	#If set to 0 or negative vehicles will always spawn despite blocking vehicles.
	DECLARE SearchRadius DOUBLE DEFAULT 10;
	#---------------------------------------------------------------
	
	DECLARE ServerInstance INT DEFAULT i;
	DECLARE MaxNumSpawn INT DEFAULT MaxVehicles - countVehicles(ServerInstance);

	
	set @countNULLs = 0;	
	set @tobjLoop = 3;
	WHILE (@tobjLoop > 0) DO
	DROP TEMPORARY TABLE IF EXISTS temp_objects;
	CREATE TEMPORARY TABLE temp_objects AS
		(
			SELECT	CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
					CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
			FROM object_data
			WHERE CharacterID = 0
				AND Instance = ServerInstance
				AND (@ws := Worldspace) IS NOT NULL
				AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
				AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
		);
		
		set @countNULLs = (SELECT count(*) FROM temp_objects where (X IS NULL OR Y IS NULL));
		IF (@countNULLs > 0 ) THEN 
			SET @tobjLoop = @tobjLoop - 1;
		ELSE 
			SET @tobjLoop = 0;
		END IF;
	END WHILE;
	
	IF (@countNULLs > 0 ) THEN 
		SELECT "No vehicles spawned. NULLs found in temp_objects.";
	END IF;
	
	
	DROP TEMPORARY TABLE IF EXISTS temp_locations;
	CREATE TEMPORARY TABLE temp_locations AS
	(
		SELECT vehicle_locations.ID, temp2.Worldspace
		FROM
		(
			SELECT Worldspace
			FROM
			(
				SELECT	Worldspace,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
				FROM (SELECT Worldspace FROM vehicle_locations GROUP BY Worldspace) AS temp
				WHERE (@ws := Worldspace) IS NOT NULL
					AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
					AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
			) AS temp1
			WHERE
			(
				@distance :=
				(
					SELECT MIN(SQRT((temp_objects.X - temp1.X) * (temp_objects.X - temp1.X) + (temp_objects.Y - temp1.Y) * (temp_objects.Y - temp1.Y)))
					FROM temp_objects
				)
			) IS NULL OR @distance > SearchRadius
		) AS temp2
		JOIN vehicle_locations
			ON vehicle_locations.Worldspace = temp2.Worldspace
	);
	
	DROP TEMPORARY TABLE IF EXISTS temp_spawns;
	CREATE TEMPORARY TABLE temp_spawns AS
	(
		SELECT temp.ID, Classname, Worldspace, Chance, MinFuel, MaxFuel, MinDamage, MaxDamage
		FROM
		(
			SELECT *
			FROM vehicle_spawns
			WHERE (@numSpawnable := getNumSpawnable(ServerInstance, ID)) IS NOT NULL
				AND @numSpawnable > 0
			ORDER BY RAND()
		) AS temp
		JOIN temp_locations
			ON temp_locations.ID = temp.Location
		ORDER BY RAND()
	);

	SET @numSpawned = 0;
	WHILE (@numSpawned < MaxNumSpawn AND (SELECT COUNT(*) FROM temp_spawns) > 0) DO
		SET @spawnid = (SELECT ID FROM temp_spawns LIMIT 1);
		SET @chance = (SELECT Chance FROM temp_spawns LIMIT 1);
		SET @numSpawnable = getNumSpawnable(ServerInstance, @spawnid);
		IF (@numSpawnable > 0 AND RAND() < @chance) THEN
			SET @worldspace = (SELECT Worldspace FROM temp_spawns LIMIT 1);
			
			#SKI GOGGLES - prevent random double-WS inserts
			set @countWS = (SELECT count(*) FROM object_data where characterid=0 AND worldspace=@worldspace);
			IF (@CountWS < 1) THEN
			#SKI GOGGLES - prevent random double-WS inserts
			
				INSERT INTO object_data (ObjectUID, Classname, Instance, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Damage, Datestamp)
				SELECT generateUID(ServerInstance), Classname, ServerInstance, 0, Worldspace,
					randomizeVehicleInventory(Classname),
					randomizeVehicleHitpoints(Classname),
					MinFuel + RAND() * (MaxFuel - MinFuel),
					MinDamage + RAND() * (MaxDamage - MinDamage),
					SYSDATE()
				FROM temp_spawns
				LIMIT 1;
			#SKI GOGGLES - prevent random double-WS inserts
			END IF;	
			#SKI GOGGLES - prevent random double-WS inserts
			DELETE FROM temp_spawns WHERE Worldspace = @worldspace;
			
			SET @numSpawned = @numSpawned + 1;
		END IF;
		
		SET @numSpawnable = @numSpawnable - 1;
		
		IF (@numSpawnable < 1) THEN
			DELETE FROM temp_spawns WHERE ID = @spawnid;
		END IF;
	END WHILE;
	
	SELECT CONCAT(@numSpawned, " vehicles spawned.");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `randomizeVehicleHitpoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleHitpoints`(`class` varchar(255)) RETURNS varchar(2000) CHARSET latin1
    READS SQL DATA
BEGIN
	#---------------------------------------------------------------
	#Random number r is generated in the range ]0, 1[.
	#If r + MinDamage is less than Threshold, damage to part is set to MinDamage.
	DECLARE Threshold DOUBLE DEFAULT 0.5;
	#---------------------------------------------------------------
	
	DECLARE Result varchar(2000);
	DECLARE Hitpoints_ID INT DEFAULT (SELECT Hitpoints FROM vehicle_spawns WHERE Classname = class LIMIT 1);
	
	IF (ISNULL(Hitpoints_ID)) THEN
		RETURN "[]";
	END IF;
	
	SELECT GROUP_CONCAT("[\"", PartName, "\",", TRUNCATE(IF ((@r := MinDamage + RAND() * (MaxDamage - MinDamage)) < Threshold, MinDamage, @r), 4), "]")
		INTO Result
		FROM vehicle_hitpoints
		WHERE ID = Hitpoints_ID;
	
	RETURN CONCAT_WS("", "[", Result, "]");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `randomizeVehicleInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleInventory`(`c` varchar(255)) RETURNS longtext CHARSET latin1
    READS SQL DATA
BEGIN
	DECLARE WeaponClasses		VARCHAR(255);
	DECLARE WeaponAmounts		VARCHAR(255);
	DECLARE MagazineClasses		VARCHAR(512); #changed to 512 since vehicle inventory can be large
	DECLARE MagazineAmounts		VARCHAR(255);
	DECLARE BackpackClasses		VARCHAR(255);
	DECLARE BackpackAmounts		VARCHAR(255);
	
	DECLARE InventoryID INT DEFAULT (SELECT Inventory FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	DECLARE MaxWeapons		INT DEFAULT (SELECT MaxWeapons		FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxMagazines	INT DEFAULT (SELECT MaxMagazines	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxBackpacks	INT DEFAULT (SELECT MaxBackpacks	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	IF (ISNULL(InventoryID)) THEN
		RETURN "[]";
	END IF;
	
	#Weapons
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxWeapons, MaxWeapons - @sum + @amt, @amt))
	INTO WeaponClasses, WeaponAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory
		WHERE ID = InventoryID
			AND Type = "Weapon" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxWeapons;
	
	#Magazines
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxMagazines, MaxMagazines - @sum + @amt, @amt))
	INTO MagazineClasses, MagazineAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Magazine" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxMagazines;
	
	#Backpacks
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxBackpacks, MaxBackpacks - @sum + @amt, @amt))
	INTO BackpackClasses, BackpackAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Backpack" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxBackpacks;
	
	#Concatenate all classes and amounts into one string in the format:
	#[[[<backpack classes>],[<weapon amounts>]],[[<magazine classes>],[<magazine amounts>]],[[<backpack classes>],[<backpack amounts>]]]
	RETURN CONCAT_WS
	(
		"",
		"[[[",			WeaponClasses,
		"], [",			WeaponAmounts,
		"]], [[",		MagazineClasses,
		"], [",			MagazineAmounts,
		"]], [[",		BackpackClasses,
		"], [",			BackpackAmounts,
		"]]]"
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
-- --------------------------------------------------------
-- Host:                         184.164.146.210
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-23 08:38:29
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for function dayzhivemind.rndspawn
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END//
DELIMITER ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
--
-- Table structure for table `vehicle_groups`
--

DROP TABLE IF EXISTS `vehicle_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_groups` (
  `ID` int(11) NOT NULL,
  `MaxNum` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='0 Helicopters\r\n1 Military cars (Landrover W, Landrover D, HMMWV)\r\n2 Armed cars\r\n3 Bikes\r\n4 Trucks\r\n5 Buses\r\n6 Civilian cars\r\n7 Civilian cars high end\r\n8 Civilian cars low end\r\n9 AN-2\r\n10 UH-1H';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_groups`
--

LOCK TABLES `vehicle_groups` WRITE;
/*!40000 ALTER TABLE `vehicle_groups` DISABLE KEYS */;
INSERT INTO `vehicle_groups` VALUES
(0,4),
(1,3),
(2,2),
(3,8),
(4,2),
(5,2),
(6,15),
(9,1),
(10,2);
/*!40000 ALTER TABLE `vehicle_groups` ENABLE KEYS */;
UNLOCK TABLES;--
-- Table structure for table `vehicle_hitpoints`
--

DROP TABLE IF EXISTS `vehicle_hitpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_hitpoints` (
  `ID` int(11) NOT NULL,
  `PartName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinDamage` double(20,10) NOT NULL DEFAULT '0.5000000000',
  `MaxDamage` double(20,10) NOT NULL DEFAULT '1.0000000000',
  PRIMARY KEY (`ID`,`PartName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_hitpoints`
--

LOCK TABLES `vehicle_hitpoints` WRITE;
/*!40000 ALTER TABLE `vehicle_hitpoints` DISABLE KEYS */;
INSERT INTO `vehicle_hitpoints` VALUES
(1,'palivo',0.6000000000,0.8000000000),
(1,'motor',0.6000000000,0.8000000000),
(1,'karoserie',0.6000000000,1.0000000000),
(1,'wheel_1_1_steering',0.6000000000,1.0000000000),
(1,'wheel_1_2_steering',0.6000000000,1.0000000000),
(1,'wheel_2_1_steering',0.6000000000,1.0000000000),
(1,'wheel_2_2_steering',0.6000000000,1.0000000000),
(2,'motor',0.6000000000,0.8000000000),
(3,'motor',0.6000000000,0.8000000000),
(3,'elektronika',0.6000000000,1.0000000000),
(3,'mala vrtule',0.6000000000,1.0000000000),
(3,'velka vrtule',0.6000000000,1.0000000000),
(4,'glass1',0.6000000000,1.0000000000),
(4,'glass2',0.6000000000,1.0000000000),
(4,'glass3',0.6000000000,1.0000000000),
(4,'glass4',0.6000000000,1.0000000000),
(4,'glass5',0.6000000000,1.0000000000),
(4,'NEtrup',0.6000000000,1.0000000000),
(4,'motor',0.6000000000,0.8000000000),
(4,'elektronika',0.6000000000,1.0000000000),
(4,'mala vrtule',0.6000000000,1.0000000000),
(4,'velka vrtule',0.6000000000,1.0000000000),
(4,'munice',0.6000000000,1.0000000000),
(4,'sklo predni P',0.6000000000,1.0000000000),
(4,'sklo predni L',0.6000000000,1.0000000000),
(4,'glass6',0.6000000000,1.0000000000),
(5,'glass1',0.6000000000,1.0000000000),
(5,'glass2',0.6000000000,1.0000000000),
(5,'glass3',0.6000000000,1.0000000000),
(5,'motor',0.6000000000,0.8000000000),
(5,'palivo',0.6000000000,0.8000000000),
(5,'wheel_1_1_steering',0.6000000000,1.0000000000),
(5,'wheel_1_2_steering',0.6000000000,1.0000000000),
(5,'wheel_2_1_steering',0.6000000000,1.0000000000),
(5,'wheel_2_2_steering',0.6000000000,1.0000000000),
(5,'sklo predni P',0.6000000000,1.0000000000),
(5,'sklo predni L',0.6000000000,1.0000000000),
(5,'karoserie',0.6000000000,1.0000000000),
(5,'wheel_1_4_steering',0.6000000000,1.0000000000),
(5,'wheel_2_4_steering',0.6000000000,1.0000000000),
(5,'wheel_1_3_steering',0.6000000000,1.0000000000),
(5,'wheel_2_3_steering',0.6000000000,1.0000000000),
(5,'glass4',0.6000000000,1.0000000000),
(6,'glass1',0.6000000000,1.0000000000),
(6,'glass2',0.6000000000,1.0000000000),
(6,'glass3',0.6000000000,1.0000000000),
(6,'motor',0.6000000000,0.8000000000),
(6,'palivo',0.6000000000,0.8000000000),
(6,'wheel_1_1_steering',0.6000000000,1.0000000000),
(6,'wheel_1_2_steering',0.6000000000,1.0000000000),
(6,'wheel_2_1_steering',0.6000000000,1.0000000000),
(6,'wheel_2_2_steering',0.6000000000,1.0000000000),
(6,'karoserie',0.6000000000,1.0000000000),
(6,'glass4',0.6000000000,1.0000000000);
/*!40000 ALTER TABLE `vehicle_hitpoints` ENABLE KEYS */;
UNLOCK TABLES;--
-- Table structure for table `vehicle_inventory`
--

DROP TABLE IF EXISTS `vehicle_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_inventory` (
  `ID` int(11) NOT NULL,
  `Type` enum('Backpack','Magazine','Weapon') CHARACTER SET latin1 NOT NULL DEFAULT 'Magazine',
  `Classname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinAmount` tinyint(3) NOT NULL DEFAULT '1',
  `MaxAmount` tinyint(3) NOT NULL DEFAULT '1',
  `Chance` double(20,10) NOT NULL DEFAULT '1.0000000000',
  PRIMARY KEY (`ID`,`Type`,`Classname`),
  KEY `ObjectUID` (`ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_inventory`
--

LOCK TABLES `vehicle_inventory` WRITE;
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* S1203_TK_CIV_EP1 - stoner */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Weapon', 'MeleeBaseBallBat', 1, 1, 0.8500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Weapon', 'MeleeBaseBallBatBarbed', 1, 1, 0.2500000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'ItemTent', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'ItemTrashToiletpaper', 1, 2, 0.8500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'equip_comfreyleafs', 1, 3, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'ItemKosmosSmokes', 1, 2, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'equip_herb_box', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodCakeCremeCakeClean', 2, 2, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodChipsChocolate', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodChipsChocolateEmpty', 1, 3, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodChipsSulahoops', 2, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodChipsSulahoopsEmpty', 2, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'FoodCandyLegacys', 2, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'ItemSodaRabbit', 1, 3, 0.8500000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (1, 'Magazine', 'ItemFuelcan', 1, 2, 0.7500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* TT650_Ins, TT650_TK_CIV_EP1 - parts */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (2, 'Magazine', 'PartGeneric', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (2, 'Magazine', 'ItemSodaRabbit', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (2, 'Magazine', 'PartWheel', 1, 1, 0.4000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (2, 'Magazine', 'ItemFuelcanEmpty', 1, 1, 1.0000000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*SUV_DZ - gang */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Weapon', 'PDW_DZ', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Weapon', 'ItemKnife', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Weapon', 'ItemMachete', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Weapon', 'MeleeBaseBallBatNails', 1, 1, 0.6500000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', 'PipeBomb', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', 'FoodCanFrankBeans', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', 'ItemSodaRabbit', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', 'FoodCanFraggleos', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', '30Rnd_9x19_UZI', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (3, 'Magazine', 'ItemFuelcan', 1, 1, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* PBX - spec ops */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Weapon', 'M16A4_GL_ACOG_DZ', 1, 1, 0.1000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'Skin_Sniper1_DZ', 1, 1, 0.1000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'Skin_Camo1_DZ', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'HandGrenade_west', 2, 4, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'FoodMRE', 2, 2, 0.9000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'SmokeShellGreen', 1, 2, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'SmokeShellRed', 1, 2, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'ItemFlashlightRed', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', '30Rnd_556x45_StanagSD', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (4, 'Magazine', 'ItemFuelcan', 1, 1, 0.4500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* HMMWV_DZ - NATO squad */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Weapon', 'L110A1_CCO_DZ', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', 'FoodMRE', 2, 3, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', 'ItemBandage', 2, 3, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', 'SmokeShell', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', 'HandGrenade_west', 2, 2, 0.3000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', '200Rnd_556x45_M249', 2, 2, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Magazine', 'ItemJerrycan', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (5, 'Backpack', 'DZ_ALICE_Pack_EP1', 1, 1, 0.3500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* BUS Ikarus_TK_CIV_EP1, Ikarus - party bus */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Weapon', 'MeleeBaseBallBatBarbed', 1, 1, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Weapon', 'MeleeBaseBallBatNails', 1, 1, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'FoodBeefRaw', 2, 4, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'ItemSodaPeppsy', 2, 4, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'TrashJackDaniels', 2, 2, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'FoodbaconRaw', 2, 4, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'ItemTrashToiletpaper', 2, 4, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'ItemTrashRazor', 1, 1, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'equip_rag', 2, 4, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (6, 'Magazine', 'ItemCards', 2, 4, 0.9500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* MH6J_DZ, AH6X_DZ - sniper */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (7, 'Weapon', 'FNFAL_ANPVS4_DZ', 1, 1, 0.1000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (7, 'Magazine', '20Rnd_762x51_FNFAL', 4, 4, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (7, 'Magazine', 'ItemJerrycan', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (7, 'Magazine', 'ItemJerrycanEmpty', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (7, 'Backpack', 'DZ_Backpack_EP1', 2, 2, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* UAZ_Unarmed_UN_EP1 - medical*/
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Weapon', 'M9_DZ', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', '15Rnd_9x19_M9', 2, 3, 1.0000000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'ItemBandage', 2, 5, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'ItemPainkiller', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'ItemMorphine', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'ItemEpinephrine', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'ItemAntibiotic', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'emptyBloodBag', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'bloodBagONEG', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'equip_gauzepackaged', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'equip_gauze', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Magazine', 'bloodTester', 1, 1, 0.5000000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (8, 'Backpack', 'DZ_Patrol_Pack_EP1', 1, 1, 1.0000000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* UAZ_Unarmed_TK_EP1, UAZ_Unarmed_TK_CIV_EP1, UAZ_RU - eastern weapons */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Weapon', 'AK74_DZ', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', 'FoodmuttonCooked', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', 'ItemWaterbottleDmg', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', 'HandGrenade_east', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', '1Rnd_HE_GP25', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', '1Rnd_SMOKE_GP25', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', '30Rnd_545x39_AK', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Magazine', 'ItemJerrycan', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (9, 'Backpack', 'DZ_Czech_Vest_Pouch', 1, 1, 0.8500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* BAF_Offroad_D, BAF_Offroad_W */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Weapon', 'SA58_Holo_DZ', 1, 1, 0.1000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', 'FoodMRE', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', 'PartWheel', 1, 1, 0.3500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', 'HandGrenade_west', 2, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', '30Rnd_762x39_SA58', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', '20Rnd_762x51_DMR', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Magazine', 'ItemJerrycanEmpty', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (10, 'Backpack', 'DZ_British_ACU', 1, 1, 0.3500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  hilux1_civil_3_open(pickup), - hunter  */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Weapon', 'CZ550_DZ', 1, 2, 0.4500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Weapon', 'ItemKnife', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Weapon', 'ItemFishingPole', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Weapon', 'ItemHatchet', 1, 1, 0.5000000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'equip_brick', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'PartWoodPile', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'ItemTent', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'FoodCanFrankBeans', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'FoodCanRusStew', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', '5Rnd_17HMR', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (11, 'Magazine', 'ItemFuelcan', 1, 2, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Pickup_PK_INS,   Offroad_DSHKM_INS[50 cal pickup] */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (12, 'Weapon', 'M4A1_DZ', 1, 2, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (12, 'Magazine', 'HandGrenade_west', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (12, 'Magazine', '30Rnd_556x45_Stanag', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (12, 'Magazine', 'ItemJerrycanEmpty', 1, 1, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  UH1H_DZ,UH1H_2_DZ   */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Weapon', 'G36K_Camo_DZ', 1, 1, 0.2000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', '30Rnd_556x45_G36', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', '100Rnd_762x51_M240', 1, 2, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', 'FoodMRE', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', 'TrashJackDaniels', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', 'ItemSodaRabbit', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (13, 'Magazine', 'ItemJerrycan', 1, 2, 0.6500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* PLANE AN2_DZ - parts transport */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (14, 'Weapon', 'PKM_DZ', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (14, 'Magazine', 'PartFueltank', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (14, 'Magazine', 'PartGlass', 1, 2, 0.4000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (14, 'Magazine', 'PartWheel', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (80, 'Magazine', 'PartEngine', 1, 1, 0.0500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (14, 'Magazine', '100Rnd_762x54_PK', 2, 4, 1.0000000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  AN2_2_DZ - food transport */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Weapon', 'AK74_DZ', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Weapon', 'ItemMatchbox', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', '30Rnd_545x39_AK', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', 'FoodgoatRaw', 2, 3, 0.4500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', 'FoodmuttonRaw', 1, 3, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', 'FishRawSeaBass', 2, 3, 0.4500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', 'FishRawTrout', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (15, 'Magazine', 'FoodCanSardines', 1, 1, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Fishing_Boat*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Weapon', 'ItemFishingPole', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Weapon', 'ItemMachete', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Weapon', 'ItemCrowbar', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'FishRawSeaBass', 2, 3, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'FishRawTrout', 2, 3, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'ItemWaterbottleDmg', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'equip_duct_tape', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'ItemSodaRabbit', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (16, 'Magazine', 'ItemJerrycan', 1, 1, 0.2500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* V3S_Civ - building supplies */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemShovel', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemPickaxe', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemPickaxeBroken', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemSledgeHammer', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemSledgeHammerBroken', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Weapon', 'ItemCrowbar', 1, 2, 0.9500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'ItemStone', 2, 4, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'ItemLog', 2, 4, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'equip_nails', 2, 4, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'equip_duct_tape', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'equip_2inch_metal_pipe', 1, 2, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'equip_rope', 1, 2, 0.4500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (17, 'Magazine', 'ItemJerrycanEmpty', 1, 2, 0.7500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* UralCivil - random supplies */
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Weapon', 'Bizon_DZ', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Weapon', 'Makarov_DZ', 1, 2, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', '64Rnd_9x19_Bizon', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', '8Rnd_9x18_Makarov', 2, 4, 1.0000000000);

INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', 'PartEngine', 1, 1, 0.0500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', 'PartGeneric', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', 'FoodCanSardines', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (18, 'Magazine', 'ItemSodaPeppsy', 2, 2, 0.7500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* car_sedan, car_hatchback - kidnapping */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Weapon', 'Crossbow_DZ', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'equip_duct_tape', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'equip_rope', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'ItemMorphine', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'emptyBloodBag', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'bloodBagONEG', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'equip_gauzepackaged', 1, 1, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'ItemTrashRazor', 1, 1, 0.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'equip_rag', 1, 1, 0.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', '1Rnd_Arrow_Wood', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'TrashJackDaniels', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (19, 'Magazine', 'ItemSodaRabbit', 2, 2, 0.6500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Civilian  Skoda, SkodaGreen, SkodaBlue, Volha_1_TK_CIV_EP1, Volha_2_TK_CIV_EP1 - the basics */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Weapon', 'LeeEnfield_DZ', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Weapon', 'ItemKnife', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Weapon', 'ItemMachete', 1, 1, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Magazine', 'ItemTrashToiletpaper', 1, 1, 0.8500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Magazine', 'ItemSodaRabbit', 6, 6, 0.8500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Magazine', 'FoodCanHerpyEmpty', 1, 2, 0.6500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Magazine', '10Rnd_303British', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Magazine', 'ItemFuelcan', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (20, 'Backpack', 'DZ_Patrol_Pack_EP1', 1, 2, 0.4500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Civilian SVD ATV_US_EP1 - hunter */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Weapon', 'SVD_DZ', 1, 1, 0.1500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Weapon', 'ItemCompass', 1, 1, 0.7500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Weapon', 'ItemHatchet', 1, 1, 0.8000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Weapon', 'ItemFishingPole', 1, 1, 0.2500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'PartWoodPile', 1, 1, 0.3500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'equip_brick', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'FoodCanFrankBeans', 1, 2, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', '10Rnd_762x54_SVD', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'ItemTent', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'ItemWaterbottleBoiled', 1, 1, 0.4000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'FoodCanRusStew', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Magazine', 'FoodrabbitCooked', 1, 1, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (21, 'Backpack', 'DZ_Patrol_Pack_EP1', 1, 1, 0.5000000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Civilian tractor - farmer */
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (22, 'Weapon', 'Remington870_DZ', 1, 1, 0.3500000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (22, 'Magazine', 'equip_feathers', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (22, 'Magazine', '8Rnd_12Gauge_Slug', 2, 4, 1.0000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (22, 'Magazine', '2Rnd_12Gauge_Buck', 2, 4, 0.5000000000);
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES (22, 'Magazine', 'ItemWire', 1, 2, 0.6500000000);
/* -----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `vehicle_locations`
--

DROP TABLE IF EXISTS `vehicle_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_locations` (
  `ID` int(11) NOT NULL,
  `Worldspace` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`,`Worldspace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='0 ATV\r\n1 Motorcycle\r\n2 Huey\r\n4 Mi-17\r\n3 Little bird\r\n5 AN-2\r\n6 Bike\r\n7 Military car (Landrover, HMMWV, Camo UAZs, Armed pickups)\r\n10 Civilian car (including SUV)\r\n11 Bus\r\n12 Tractor\r\n13 Truck\r\n14 Boat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_locations`
--

LOCK TABLES `vehicle_locations` WRITE;
/*!40000 ALTER TABLE `vehicle_locations` DISABLE KEYS */;
INSERT INTO `vehicle_locations` VALUES
(0,'[126,[6556.34,5621.66,0]]'), 
/* (0,'[166,[8316.43,7497.42,0]]'), /* REMOVED 188 - Between Novy and Black Forest (bounces around) */
(0,'[202,[11464.035, 11381.071,0]]'), /* 114,39 Klen */
/* (0,'[253,[11459.299,11386.546,0]]'), /* DUPLICATE 188 - Klen */
(0,'[284,[8854.9082,2891.5762,0]]'), 
(0,'[300,[9047.57,4480.17,0]]'), 
(0,'[335,[8856.8359,2893.7903,0]]'), 
(0,'[337,[3312.2793,11270.755,0]]'),
(0,'[50,[3684.0366, 5999.0117,0]]'),
(0, '[29,[13002.6,5963.83,0]]'), /* NEW 188 - Radio Tower Above Solichny Quarry */
(0, '[298,[11859,12729.6,0]]'),  /* NEW 188 - Polana Quarry */
(0, '[152,[5664.46,2974.05,-0.003]]'),  /* NEW 189 - power station above cherno */
(0, '[158,[1884.38,11696.5,-0.013]]'),  /* NEW 189 - shed sw skalka */
(1,'[151,[6592.686,2906.8245,0]]'),
/* (1,'[213,[9515.67,7222.07,0]]'), /* REMOVED 188 - North of Shakhovka (next to shed) */
/* (1,'[291,[11945.78,9099.3633,0]]'), /* REMOVED 188 - Upper Berenzino*/
(1,'[372,[8762.8516, 11727.877,0]]'),
(1,'[52,[8713.4893, 7103.0518,0]]'),
(1, '[72,[13163.5,7094.64,0]]'), /* NEW 188 - Solichny Factory Train Station */
(1, '[200,[13649.1,3904.67,0]]'), /*  NEW 188 - Krutoy Cap Lighthouse */
(1, '[195,[8063.63,3270.42,0]]'), /*  NEW 188 - Prig Train Station */
(1, '[283,[2699.45,5589.65,0]]'), /*  NEW 188 - Zelenegorsk North Gas Station */
(1, '[150,[10437.6,8882.8,0]]'), /*  NEW 188 - Gorka Gas Station */
(1, '[71,[5841.03,2204.58,0.0]]'),		/* NEW 189 - gas station west of cherno */
(1, '[201,[4399.33,2315.82,0.001]]'),	/* NEW 189 - Balota Train Station */
(1, '[0,[10348.0,2220.62,0]]'),			/* NEW 189 - elektro main fire station */
(1, '[166,[2027.68,2215.42,0.001]]'),	/* NEW 189 - Kamenka Train Station */
(1, '[0,[7005.00,2805.63,0]]'), 			/* NEW 189 - in front of cherno apts */
(1, '[200,[13649.1,3904.67,0.001]]'),	/* NEW 189 - Krutoy Cap/Lighthouse */
(1, '[273,[13355.1,5448.12,0.001]]'),	/* NEW 189 - 3 Valleys House/Fountain */
(1, '[161,[11959.9,3553.81,0.001]]'),	/* NEW 189 - kamyshovo train station*/
(1, '[105,[12988.6,10228.6,0.001]]'),	/* NEW 189 - Berenzino BIG Train Station  */
(1, '[277,[3007.11,7465.94,0.001]]'),	/* NEW 189 - South Pusthoshka Gas Station next to station */
(1, '[150,[10437.6,8882.8,0.001]]'),	/* NEW 189 - gorka gas next to station */
(2,'[0,[9837.5,3860.2,0]]'),
(2,'[133,[4211.8789,10735.168,0]]'),
(2,'[156,[7660.271,3982.0063,0]]'),
(2,'[172,[7220.6538,9116.3428,0]]'),
(2,'[181,[10153.5,12026.8,0]]'),
(2,'[2,[12010.7,12637.2,0]]'),
(2,'[240,[4871.19,10176.2,0]]'),
(2,'[241,[4811.56,9603.77,0]]'),
(2,'[310,[6365.7402,7795.3501,0]]'),
(2,'[37,[6366.01,2774.14,0]]'),
(2,'[60,[11279.154,4296.0205,0]]'),
(2,'[62,[13307,3231.95,0]]'),
(2,'[67,[10587.8,2188.25,0]]'),
(2,'[72,[6886.53,11437.1,0]]'),
/*(2,'[75,[13614.3,3170.86,0]]'), /* DUPLICATE 188 - Skalisty Island */
/*(2,'[80,[6887.07,11436.8,0]]'), /* DUPLICATE 188 - Devil's Castle */
(2, '[161,[12158.4,9737.48,0]]'), /* NEW 188 - Berenzino Soccer Field */
(2, '[1,[9609.13,13505.7,0.0]]'), /* NEW 189 - near pobeda dam */
(3,'[0,[9837.5,3860.2,0]]'),
(3,'[133,[4211.8789,10735.168,0]]'),
(3,'[156,[7660.271,3982.0063,0]]'),
(3,'[172,[7220.6538,9116.3428,0]]'),
(3,'[181,[10153.5,12026.8,0]]'),
(3,'[2,[12010.7,12637.2,0]]'),
(3,'[240,[4871.19,10176.2,0]]'),
(3,'[241,[4811.56,9603.77,0]]'),
(3,'[258,[7209.86,6984.74,0]]'),
(3,'[278,[11162.7,2509.88,0]]'),
(3,'[310,[6365.7402,7795.3501,0]]'),
(3,'[37,[6366.01,2774.14,0]]'),
(3,'[60,[11279.154,4296.0205,0]]'),
/*(3,'[62,[13307,3231.95,0]]'), /* DUPLICATE 188 - Skalsty Island */
(3,'[67,[10587.8,2188.25,0]]'),
(3,'[72,[6886.53,11437.1,0]]'),
(3,'[75,[13614.3,3170.86,0]]'),
/*(3,'[80,[6887.07,11436.8,0]]'), /* DUPLICATE 188 - Devil's Castle */
(3, '[0,[11801.5,3184.63,0]]'), /* NEW 188 - Otmel Island */
(3, '[161,[12158.4,9737.48,0]]'), /* NEW 188 - Berenzino Soccer Field */
(3, '[100,[9852.02,10323.9,-0.04]]'), /* NEW 189 - NW of Dubrovka */
(3, '[48,[11783.4,6488.86,-0.039]]'), /* NEW 189 - E of Dolina */
(4,'[0,[9837.5,3860.2,0]]'),
(4,'[133,[4211.8789,10735.168,0]]'),
(4,'[156,[7660.271,3982.0063,0]]'),
(4,'[172,[7220.6538,9116.3428,0]]'),
(4,'[181,[10153.5,12026.8,0]]'),
(4,'[241,[4811.56,9603.77,0]]'),
(4,'[310,[6365.7402,7795.3501,0]]'),
(4,'[37,[6366.01,2774.14,0]]'),
(4,'[62,[13307,3231.95,0]]'),
(4,'[67,[10587.8,2188.25,0]]'),
(4,'[72,[6886.53,11437.1,0]]'),
(4,'[75,[13614.3,3170.86,0]]'),
(4,'[80,[6887.07,11436.8,0]]'),
(5,'[240,[4586.84,10684.6,0]]'),
(5,'[252,[4530.52,10785.1,0]]'),
(5,'[32,[12492,12515,0]]'),
(5, '[2,[12059.0,12621.6,0]]'), /* NEW 188 - NEAF Hangar East*/
(6,'[140,[12681.2,9467.42,0]]'),
(6,'[155,[12158.999,3468.7563,0]]'),
/*(6,'[155,[8680.75,2445.5315,0]]'), /* DUPLICATE 188 - Road Near Cap Golova */
(6,'[179,[3474.3989, 2562.4915,0]]'),
(6,'[191,[2782.7134,5285.5342,0]]'),
(6,'[201,[8070.6958, 3358.7793,0]]'),
(6,'[23,[3203.0916, 3988.6379,0]]'),
(6,'[236,[1773.9318,2351.6221,0]]'),
(6,'[236,[3699.9189,2474.2119,0]]'),
(6,'[250,[11984.01,3835.9231,0]]'),
/*(6,'[255,[10153.068,2219.3547,0]]'), /* REMOVED 188 - Field Above Elektro */
(6,'[316,[7943.5068,6988.1763,0]]'),
(6,'[322,[3097.96,7812.64,0]]'),
/*(6,'[35,[8345.7227, 2482.6855,0]]'), /* DUPLICATE 188 - Cap Golova */
/*(6,'[50,[8040.6777, 7086.5356,0]]'), /* REMOVED 188 - Road NW of Guglova*/
(6,'[73,[8350.0947, 2480.542,0]]'),
(6,'[181,[13360.3,6193.11,0]]'), /* NEW 188 - Quarry Train Station */
(6,'[269,[3670.54,2406.9,0.0]]'), /*NEW 188 - Kamarova Train Station */
(7,'[12,[4662.13,10436,0]]'),
(7,'[141,[11953.279,9107.3896,0]]'),
(7,'[157,[12235.8,9729.92,0]]'),
(7,'[157,[3693.0386, 5969.1489,0]]'),
(7,'[183,[4752.58,2535.77,0]]'),
(7,'[191,[4625.61,9675.62,0]]'),
(7,'[203,[3696.23,6013.07,0]]'),
(7,'[216,[4765.67,10260.7,0]]'),
(7,'[249,[11823.4,12691.1,0]]'),
(7,'[272,[6303.11,7833.36,0]]'),
(7,'[317,[3770.08,10237,0]]'),
(7,'[337,[6344.92,7772.4,0]]'),
(7,'[39,[12143.2,12611.2,0]]'),
(7,'[58,[3702.54,10182.1,0]]'),
(7,'[49,[1748.86,11738,5.188e-04]]'),	/* NEW 189 - SW skalka secret base*/
(7,'[304,[11702,3427.84,-4.735e-04]]'),/* NEW 189 - kamyshovo roadblock */
(10,'[0,[6279.4966, 7810.3691,0]]'),
(10,'[106,[5265.94,5492.29,0]]'),
(10,'[116,[13343.8,12919,0]]'),
(10,'[124,[11309.963, 6646.3989,0]]'),
(10,'[133,[8310.9902, 3348.3579,0]]'),
(10,'[137,[2159.68,7907.71,0]]'),
(10,'[160,[11940.6,8868.87,0]]'),
(10,'[19,[10828.8,2703.23,0]]'),
(10,'[19,[11066.828,7915.2275,0]]'),
(10,'[194,[9727.78,8932.72,0]]'),
(10,'[207,[1740.8503,3622.6938,0]]'),
/*(10,'[222,[5165.7231,2375.7642,0]]'), /* REMOVED 188  - Behind Balota Warehouses*/
/*(10,'[223,[4817.6572, 2556.5034,0]]'), /* REMOVED 188 - Behind Balota Hangars */
/*(10,'[223,[6288.416, 7834.3521,0]]'), /* REMOVED 188 - Stary */
(10,'[226,[1975.1283, 9150.0195,0]]'),
(10,'[228,[12355.3,10821.6,0]]'),
(10,'[229,[6914.04,2487.6,0]]'),
(10,'[241,[2614.0862,5079.6357,0]]'),
(10,'[266,[9157.8408,11019.819,0]]'),
(10,'[274,[11604.3,10636.8,0]]'),
(10,'[291,[8125.36,3167.17,0]]'),
(10,'[298,[9076.47,8016.35,0]]'),
(10,'[316,[7427.61,5155.17,0]]'),
(10,'[324,[13388,6603.21,0]]'),
(10,'[336,[7006.14,7717.57,0]]'),
(10,'[337,[8120.3057,9305.4912,0]]'),
(10,'[337,[9715.0352,6522.8286,0]]'),
(10,'[339,[11243.3,5376.82,0]]'),
(10,'[344,[2045.3989,7267.4165,0]]'),
(10,'[352,[12058.555,3577.8667,0]]'),
(10,'[353,[12869.565,4450.4077,0]]'),
(10,'[363,[5337.62,8656.55,0]]'),
(10, '[189,[12997.9,10072.8,0]]'), /* NEW 188 - Berenzino Gas Station  */
(10, '[11,[3000.37,7470.73,0]]'), /*  NEW 188 - South Pusthoshka Gas Station   */
(10, '[181,[9447.17,8778.15,0]]'), /*  NEW 188 - Gorka Garage   */
(10, '[33,[9930.09,10372,0.006]]'),		/* NEW 189 - NW of dubrovka   */
(10, '[45,[2879.83,9706.21,-0.003]]'), /* NEW 189 - near red barn lopatino   */
(10, '[267,[3899.65,3573.4,0.059]]'),	/* NEW 189 - red house east of Bor  */
(10, '[275,[9986.22,1876.52,0.001]]'), /* NEW 189 - Sheds on West side of Elektro */
(10, '[1,[12636,5720.63,0.003]]'),		/* NEW 189 - 3 valleys */
(10, '[8,[2681.09,5603.85,-0.011]]'),	/* NEW 189 - Zelenegorsk North Gas Station  */
(10, '[273,[4050.96,3321.29,0.001]]'), /* NEW 189 - above kamarova, end of driveway  */
(10, '[249,[5851.2,4728.07,-0.004]]'), /* NEW 189 - nadezhdino red house */
(11,'[230,[3762.5764,8736.1709,0]]'),
(11,'[245,[4580.3203,4515.9282,0]]'),
(11,'[279,[10628.433,8037.8188,0]]'),
(11,'[333,[6040.0923,7806.5439,0]]'),
(11,'[59,[6705.8887, 2991.9358,0]]'),
(11,'[76,[10314.745, 2147.5374,0]]'),
(11, '[27,[12906.5,10084.8,0]]'), /* NEW 188 - NE Berenzino */
(11, '[15,[3049.93,7979.65,-3.052e-05]'),	/* NEW 189 - pushtoshka grocery */
(11, '[243,[4513.57,6420.54,0.018]]'),		/* NEW 189 - pogorevka */
(12,'[19,[11246.52, 7534.7954,0]]'),
(12,'[195,[9681.8213,8947.2354,0]]'),
(12,'[220,[3083.52,9202.18,0]]'),
(12,'[262,[3825.1318,8941.4873,0]]'),
(12,'[95,[1690.58,5095.92,0]]'),
(12, '[109,[13140.8,10422.2,0]]'),  /* NEW 188 - Berenzino Factory */
(12, '[88,[11433.7,12234.2,0]]'),  /* NEW 188 - Krasnostov Shed */
(12, '[287,[8859.05,11657.7,0]]'),  /* NEW 188 - Govodzno next to long barn */
(12, '[320,[4641.08,6795.47,0.005]]'),		/* NEW 189 - Rogovo next to long barn */
(12, '[3,[3296.81,4918.27,-9.766e-04]]'), /* NEW 189 - Drozhino next to barn */
(13,'[178,[13276.482, 6098.4463,0]]'),
(13,'[338,[1890.9952,12417.333,0]]'),
(13, '[245,[13056.4,7068.25,1.907]]'), /*  NEW 188 - Solichny Factory  */
(13, '[359,[4140.46,8931.9,0.001]]'), /*  NEW 188 - Vybor Factory Gate */
(13, '[304,[10694.9,7952.77,1.5]]'), /* NEW 188 - Under Canopy in Polana */
(13, '[10,[12747.7,9660.6,2.003]]'), 	/* NEW 189 - Berenzino Lumber Mill */ 
(13, '[281,[7635.71,5194.12,0]]'),		/* NEW 189 - under canopy west mogalevka */ 
(13, '[42,[12737.3,12279.9,0.001]]'), 	/* NEW 189 - neaf cement factory */ 
(14,'[245,[14417.589,12886.104,0]]'),
(14,'[268,[13098.13, 8250.8828,0]]'),
(14,'[315,[13222.181,10015.431,0]]'),
(14,'[315,[8317.2676,2348.6055,0]]'),
(14,'[55,[13454.882, 13731.796,0]]'),
(14, '[0,[11706.5,3131.63,0]]'),  /* NEW 188 - Otmel Island */
(14, '[0,[3610.00,2044.63,0]]'),  /* NEW 188 - End of Kamarova Dock */
(14, '[0,[1314.00,2249.25,0]]'),  /* NEW 188 - Cove West of Kamenka */
(14, '[28,[13570.2,6320.12,4.023]]'),  /* NEW 189 - Solichny */
(14, '[28,[10410.1,1788.2,3.737]]'),	/* NEW 189 - Elektro SE */
(14, '[88,[7975.11,2888.22,0.932]]'),	/* NEW 189 - Chyornaya Bay */
(14, '[81,[299.728,1534.76,0.282]]'),	/* NEW 189 - West of Kamenka */
(14, '[0,[13417.3,2856.22,0.908]]');  /* NEW 189 - Skalisty */
/*!40000 ALTER TABLE `vehicle_locations` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `vehicle_spawns`
--

DROP TABLE IF EXISTS `vehicle_spawns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_spawns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Classname` varchar(255) NOT NULL,
  `Chance` double NOT NULL,
  `MaxNum` int(11) NOT NULL DEFAULT '1',
  `Location` int(11) NOT NULL,
  `Inventory` int(11) DEFAULT NULL,
  `Hitpoints` int(11) DEFAULT NULL,
  `MinDamage` double NOT NULL,
  `MaxDamage` double NOT NULL,
  `MinFuel` double NOT NULL,
  `MaxFuel` double NOT NULL,
  `MaxWeapons` int(11) NOT NULL,
  `MaxMagazines` int(11) NOT NULL,
  `MaxBackpacks` int(11) NOT NULL,
  `CleanupTime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Classname` (`Classname`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_spawns`
--

LOCK TABLES `vehicle_spawns` WRITE;
/*!40000 ALTER TABLE `vehicle_spawns` DISABLE KEYS */;
INSERT INTO `vehicle_spawns` (`ID`, `Classname`, `Chance`, `MaxNum`, `Location`, `Inventory`, `Hitpoints`, `MinDamage`, `MaxDamage`, `MinFuel`, `MaxFuel`, `MaxWeapons`, `MaxMagazines`, `MaxBackpacks`, `CleanupTime`) VALUES 
(1, 'UAZ_Unarmed_TK_EP1', 0.7, 2, 7, 9, 1, 0.2, 0.8, 0, 0.8, 10, 50, 8, 300),
(2, 'UAZ_Unarmed_UN_EP1', 0.59, 2, 10, 8, 1, 0.2, 0.8, 0, 0.8, 10, 50, 8, 300),
(3, 'UAZ_RU', 0.59, 1, 7, 9, 1, 0.2, 0.8, 0, 0.8, 10, 50, 8, 300),
(4, 'UAZ_Unarmed_TK_CIV_EP1', 0.59, 3, 10, 9, 1, 0.2, 0.8, 0, 0.8, 10, 50, 8, 300),
(5, 'SkodaBlue', 0.68, 2, 10, 20, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(6, 'Skoda', 0.68, 2, 10, 20, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(7, 'SkodaGreen', 0.68, 2, 10, 20, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(8, 'ATV_US_EP1', 0.7, 6, 0, 21, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 120),
(9, 'TT650_Ins', 0.72, 1, 1, 2, 2, 0.2, 0.8, 0, 0.8, 0, 5, 0, 120),
(10, 'TT650_TK_CIV_EP1', 0.72, 3, 1, 2, 2, 0.2, 0.8, 0, 0.8, 0, 5, 0, 120),
(11, 'Old_bike_TK_CIV_EP1', 0.64, 8, 6, NULL, NULL, 0.2, 0.8, 0, 0, 0, 0, 0, 60),
(12, 'hilux1_civil_3_open', 0.59, 3, 10, 11, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(13, 'Ikarus', 0.59, 2, 11, 6, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 180),
(14, 'Ikarus_TK_CIV_EP1', 0.59, 2, 11, 6, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 180),
(15, 'Tractor', 0.7, 3, 12, 22, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 60),
(16, 'S1203_TK_CIV_EP1', 0.69, 2, 10, 1, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(17, 'V3S_Civ', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(18, 'UralCivil', 0.59, 2, 13, 18, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(19, 'car_hatchback', 0.73, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(20, 'Fishing_Boat', 0.61, 1, 14, 16, 2, 0.2, 0.8, 0, 0.8, 40, 400, 8, 300),
(21, 'PBX', 0.59, 1, 14, 4, 2, 0.2, 0.8, 0, 0.8, 5, 50, 2, 300),
(22, 'Smallboat_1', 0.59, 2, 14, 16, 2, 0.2, 0.8, 0, 0.8, 20, 200, 4, 300),
(23, 'Volha_1_TK_CIV_EP1', 0.71, 3, 10, 20, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(24, 'Volha_2_TK_CIV_EP1', 0.71, 3, 10, 20, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(25, 'SUV_DZ', 0.59, 1, 10, 3, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(26, 'car_sedan', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(27, 'UH1H_DZ', 0.59, 2, 2, 13, 3, 0.2, 0.8, 0, 0.8, 5, 25, 4, 900),
(28, 'AH6X_DZ', 0.48, 3, 3, 7, 4, 0.2, 0.8, 0, 0.8, 3, 30, 2, 900),
(29, 'AN2_DZ', 0.6, 1, 5, 14, NULL, 0, 0, 0.1, 0.4, 10, 80, 15, 900),
(30, 'BAF_Offroad_D', 0.54, 2, 7, 10, 5, 0.2, 0.8, 0, 0.8, 10, 90, 2, 300),
(31, 'BAF_Offroad_W', 0.54, 2, 7, 10, 5, 0.2, 0.8, 0, 0.8, 10, 90, 2, 300),
(32, 'MH6J_DZ', 0.48, 2, 3, 7, 3, 0.2, 0.8, 0, 0.8, 3, 30, 2, 900),
(33, 'HMMWV_DZ', 0.21, 2, 7, 5, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(34, 'Pickup_PK_INS', 0.1, 2, 7, 12, 6, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(35, 'Offroad_DSHKM_INS', 0.07, 1, 7, 12, 6, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(36, 'AN2_2_DZ', 1, 1, 5, 15, NULL, 0, 0, 0.1, 0.4, 10, 80, 15, 900),
(37, 'UH1H_2_DZ', 0.3, 1, 2, 13, 3, 0.2, 0.8, 0, 0.8, 5, 25, 4, 900),
(38, 'M1030', 0.72, 1, 1, 2, 2, 0.2, 0.8, 0, 0.8, 0, 5, 0, 120),
(39, 'Old_moto_TK_Civ_EP1', 0.72, 1, 1, 2, 2, 0.2, 0.8, 0, 0.8, 0, 5, 0, 120),
(40, 'UralCivil2', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(41, 'Ural_TK_CIV_EP1', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(42, 'Ural_CDF', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(43, 'Ural_INS', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(44, 'UralOpen_INS', 0.66, 2, 13, 17, 1, 0.2, 0.8, 0, 0.8, 50, 200, 8, 300),
(45, 'LandRover_TK_CIV_EP1', 0.54, 2, 7, 10, 5, 0.2, 0.8, 0, 0.8, 10, 90, 2, 300),
(46, 'LandRover_CZ_EP1', 0.54, 2, 7, 10, 5, 0.2, 0.8, 0, 0.8, 10, 90, 2, 300),
(47, 'datsun1_civil_2_covered', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(48, 'datsun1_civil_3_open', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(49, 'hilux1_civil_1_open', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(50, 'hilux1_civil_2_covered', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(51, 'VolhaLimo_TK_CIV_EP1', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(52, 'ladalm', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300),
(53, 'lada2', 0.59, 2, 10, 19, 1, 0.2, 0.8, 0, 0.8, 10, 50, 2, 300);
/*!40000 ALTER TABLE `vehicle_spawns` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `vehicle_spawns_groups`
--

DROP TABLE IF EXISTS `vehicle_spawns_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_spawns_groups` (
  `Spawn_ID` int(11) NOT NULL,
  `Group_ID` int(11) NOT NULL,
  PRIMARY KEY (`Spawn_ID`,`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_spawns_groups`
--

LOCK TABLES `vehicle_spawns_groups` WRITE;
/*!40000 ALTER TABLE `vehicle_spawns_groups` DISABLE KEYS */;
INSERT INTO `vehicle_spawns_groups` VALUES
(2,6),
(4,6),
(5,6),
(6,6),
(7,6),
(12,6),
(13,5),
(14,5),
(16,6),
(17,4),
(18,4),
(19,6),
(23,6),
(24,6),
(26,6),
(27,0),
(27,10),
(28,0),
(29,0),
(30,9),
(31,1),
(32,1),
(33,0),
(34,1),
(35,2),
(36,2),
(37,9),
(38,0),
(38,10);
/*!40000 ALTER TABLE `vehicle_spawns_groups` ENABLE KEYS */;
UNLOCK TABLES;