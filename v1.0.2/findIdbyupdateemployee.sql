DELIMITER $$

-- drop procedure
 DROP PROCEDURE IF EXISTS findIdbyupdateemployee;

-- create sp
CREATE PROCEDURE findIdbyupdateemployee(
	IN employeeNumber INT
)

	
BEGIN
    
    SELECT e.employeeNumber as employeeNumber, e.firstName as firstName,e.lastName as lastName, e.email as email, e.jobTitle as jobTitle, o.officeName as officeName,
    e.officeCode as officeCode,e.phoneNumber as phoneNumber
    FROM employees e
    INNER JOIN offices o ON e.officeCode = o.officeCode
    WHERE e.employeeNumber = employeeNumber;
    
END $$

DELIMITER ;
