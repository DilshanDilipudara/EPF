DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS addoffice;

-- create sp
CREATE PROCEDURE addoffice(
	IN    officeCode varchar(10),
    IN    officeName varchar(255),
	IN	  city varchar(50),
	IN	  phone varchar(50),
	IN	  address varchar(50),
	IN	  street varchar(50) ,
	IN	  country varchar(50) ,
	IN	  postalCode varchar(15)
)

BEGIN
	
	INSERT INTO	`offices` (`officeCode`,`officeName`,`city`,`phone`,`address`, `street`,`country` ,`postalCode`) VALUES
    (officeCode,officeName,city,phone,address,street,country,postalCode);

END $$

DELIMITER ;
