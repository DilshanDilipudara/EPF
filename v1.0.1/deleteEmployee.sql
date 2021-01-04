DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS deleteEmployee;

-- create sp
CREATE PROCEDURE deleteEmployee(
	IN employeeID INT
)

BEGIN

	DELETE FROM employees 
    WHERE employeeNUmber = employeeID;

END $$

DELIMITER ;
