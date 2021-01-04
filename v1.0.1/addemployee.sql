DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS addemployee;

-- create sp
CREATE PROCEDURE addemployee(
	IN    employeeNumber INT,
    IN    firstName varchar(255),
	IN	  lastName varchar(50),
	IN	  email varchar(50),
	IN	  officeCode varchar(50),
	IN    jobTitle varchar(50)
)

BEGIN
	
	INSERT INTO	`employees` (`employeeNumber`,`firstName`,`lastName`,`email`,`officeCode`,`jobTitle`) VALUES
    (employeeNumber,firstName,lastName,email,officeCode,jobTitle);

END $$

DELIMITER ;

