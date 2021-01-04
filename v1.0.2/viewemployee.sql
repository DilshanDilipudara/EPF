DELIMITER $$

-- drop procedure
 DROP PROCEDURE IF EXISTS viewemployee;

-- create office
CREATE PROCEDURE viewemployee()
	
BEGIN
    
    SELECT e.employeeNumber as employeeNumber, e.firstName as firstName,e.lastName as lastName, e.email as email, e.jobTitle as jobTitle, o.officeName,e.phoneNumber as phoneNumber
    FROM employees e
    INNER JOIN offices o ON e.officeCode = o.officeCode;
    
END $$

DELIMITER ;
