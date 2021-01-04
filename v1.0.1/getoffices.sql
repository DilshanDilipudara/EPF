DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS getoffices;

-- create sp
CREATE PROCEDURE getoffices()
BEGIN
	
    SELECT * FROM offices;

END $$
DELIMITER ;