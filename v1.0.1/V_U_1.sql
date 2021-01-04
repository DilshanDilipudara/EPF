DELIMITER $$
    
DROP PROCEDURE IF EXISTS V_U_1;

CREATE PROCEDURE V_U_1()
BEGIN
		DROP TABLE IF EXISTS `employees`;
		DROP TABLE IF EXISTS `offices`;
		DROP TABLE IF EXISTS `version`;
        
		CREATE TABLE `offices`(
		  `officeCode` varchar(10) NOT NULL,
          `officeName` varchar(255) NOT NULL,
		  `city` varchar(50) NOT NULL,
		  `phone` varchar(50) NOT NULL,
		  `addressLine1` varchar(50) NOT NULL,
          `addressLine2` varchar(50),
		  `street` varchar(50) DEFAULT NULL,
		  `country` varchar(50) NOT NULL,
		  `postalCode` varchar(15) NOT NULL,
		  PRIMARY KEY (`officeCode`)
		  )ENGINE=InnoDB DEFAULT CHARSET=latin1;


		CREATE TABLE `employees` (
		  `employeeNumber` int NOT NULL,
		  `lastName` varchar(50) NOT NULL,
		  `firstName` varchar(50) NOT NULL,
		  `email` varchar(100) NOT NULL,
		  `officeCode` varchar(10) NOT NULL,
		  `jobTitle` varchar(50) NOT NULL,
		  PRIMARY KEY (`employeeNumber`),
		  KEY `officeCode` (`officeCode`),
		  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
		) ENGINE=InnoDB DEFAULT CHARSET=latin1;
		
        CREATE TABLE `version` (
			`id` INT NOT NULL,
			`databaseVersion` INT NOT NULL,
			`applicationVersion` INT NOT NULL,
			`updateDate` TIMESTAMP NOT NULL,
			`updated` BOOLEAN NOT NULL,
			PRIMARY KEY( `id`),
			KEY `ver_db_app`(`databaseVersion`, `applicationVersion`)
		)ENGINE=InnoDB DEFAULT CHARSET=latin1;
        
		INSERT INTO	`version` (`id`,`databaseVersion`,`applicationVersion`,`updateDate`,`updated`) VALUES
		(1,1,1,CURRENT_TIMESTAMP(),true);
END $$
DELIMITER ;
