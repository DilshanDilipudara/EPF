DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS addoffice;

-- create sp
CREATE PROCEDURE addoffice(
	IN    officeCode varchar(10),
    IN    officeName varchar(255),
	IN	  city varchar(50),
	IN	  phone varchar(50),
	IN	  addressLine1 varchar(50),
	IN    addressLine2 varchar(50),
	IN	  street varchar(50) ,
	IN	  country varchar(50) ,
	IN	  postalCode varchar(15)
)

BEGIN
	
	INSERT INTO	`offices` (`officeCode`,`officeName`,`city`,`phone`,`addressLine1`,`addressLine2`, `street`,`country` ,`postalCode`) VALUES
    (officeCode,officeName,city,phone,addressLine1,addressLine2,street,country,postalCode);

END $$

DELIMITER ;

