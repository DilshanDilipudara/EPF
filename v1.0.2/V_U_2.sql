DELIMITER $$

-- drop sp
 DROP PROCEDURE IF EXISTS V_U_2;

-- create sp 
CREATE PROCEDURE V_U_2()
BEGIN

    
	-- add column
	ALTER TABLE `employees`
	ADD `phoneNumber` VARCHAR(255)
	AFTER `jobTitle`;

	-- modify datatype 
	ALTER TABLE `offices`
	MODIFY `postalCode` varchar(30) NULL;


	-- rename column name
	ALTER TABLE  `offices`
	CHANGE COLUMN `addressLine1` `address`  varchar(50) NOT NULL;
	
		
	-- drop column
	ALTER TABLE `offices`
	DROP COLUMN `addressLine2`;

	-- drop table
	DROP TABLE IF EXISTS `epfbalance`;
	DROP TABLE IF EXISTS `epf`;

	-- create epf table
	CREATE TABLE `epf` (
	  `epfcode`int NOT NULL,
	  `employeeNumber` int NOT NULL,
	  `total` decimal(10,2) ,
	  `salary` decimal(10,2) NOT NULL,
	  PRIMARY KEY (`epfcode`),
	  UNIQUE KEY `employeeNumber` (`employeeNumber`),
	  CONSTRAINT `epf_ibfk_1` FOREIGN KEY (`employeeNumber`) REFERENCES `employees` (`employeeNumber`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;

	-- create epfbalance
	CREATE TABLE `epfbalance`(
		`id` INT AUTO_INCREMENT,
		`epfcode` INT NOT NULL,
		`month` INT,
		`year` INT ,
		`balance` decimal(10,2) NOT NULL,
		 PRIMARY KEY(`id`),
		 key `epfcode`(`epfcode`),
		 CONSTRAINT `epfbalance_ibfk_1` FOREIGN KEY (`epfcode`) REFERENCES `epf` (`epfcode`)
	)ENGINE=InnoDB DEFAULT CHARSET=latin1;
		
        INSERT INTO	`version` (`id`,`databaseVersion`,`applicationVersion`,`updateDate`,`updated`) VALUES
		(2,2,2,CURRENT_TIMESTAMP(),true);
END $$

DELIMITER ;