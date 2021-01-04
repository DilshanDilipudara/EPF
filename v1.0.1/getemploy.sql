
DELIMITER $$
SHOW WARNINGS;
DROP PROCEDURE IF EXISTS GetEmployees;

CREATE PROCEDURE GetEmployees()
BEGIN
	
	SELECT 
		 firstName
		,lastName
		,city
		,state
		,country
		FROM employees
	   INNER JOIN offices USING (officecode);
   
END $$

DELIMITER ;