DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS viewepf;

-- create sp
CREATE PROCEDURE viewepf()
BEGIN
		
        SELECT 
			ef.epfcode as epfcode, ef.total as total, ef.salary, 
			e.firstName as firstName , e.lastName as lastName,
            o.officeCode as officeCode, o.officeName as officeName
        FROM epf ef
       INNER JOIN employees e ON e.employeeNumber = ef.employeeNumber
	   INNER JOIN offices o ON o.officeCode = e.officeCode;
    
END $$

DELIMITER ;