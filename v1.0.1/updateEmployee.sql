DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS updateEmployee;

-- create sp 
CREATE PROCEDURE updateEmployee(
	IN  emp INT,
    IN  firstName VARCHAR(50),
    IN  lastName VARCHAR(50),
    IN  email VARCHAR(100),
    IN  officeCode VARCHAR(10),
    IN  jobTitle VARCHAR(50)
)

BEGIN

	UPDATE employees
	SET  
		   firstName = firstName,
		   lastName = lastName,
		   email = email,
		   officeCode = officeCode,
		   jobTitle = jobTitle
	WHERE  
		  employeeNumber = emp;
          
END $$

DELIMITER ;