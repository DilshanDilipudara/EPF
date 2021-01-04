DELIMITER $$

-- drop sp
DROP PROCEDURE IF EXISTS addepf;

-- create sp
CREATE PROCEDURE addepf(
	IN employeeNo INT,
    IN ecode INT,
    IN salary DECIMAL(10,2),
    IN edate DATE
)

BEGIN
	
    DECLARE emonth INT DEFAULT 0;
    DECLARE eyear INT DEFAULT 0;
    DECLARE balance DECIMAL(10,2) DEFAULT 0.0;
    DECLARE tot DECIMAL(10,2) DEFAULT 0.0;
    DECLARE tl DECIMAL(10,2) DEFAULT 0.0;
     DECLARE bal DECIMAL(10,2) DEFAULT 0.0;
    DECLARE epfc INT DEFAULT 0;

    
    SET emonth = MONTH(edate);
    SET eyear = YEAR(edate);
    SET balance = salary * 0.08;
    

    -- check epfcode has already exist
     SELECT COUNT(epfcode) INTO epfc
     FROM epf
     WHERE employeeNumber = employeeNo;
 
	IF epfc = 0 THEN
		INSERT INTO `epf`(`epfcode`,`employeeNumber`,`salary`,`total`) VALUES
		(ecode,employeeNo,salary,balance);
	
		INSERT INTO `epfbalance`(`epfcode`,`month`,`year`,`balance`) VALUES
		(ecode,emonth,eyear,balance);
        
	ELSE

		SELECT total INTO tot 
		FROM epf 
		WHERE epfcode = 4;
        
        SELECT balance  INTO bal
        FROM epfbalance
        WHERE year = eyear and month = emonth;
        
        SET tl = tot + balance - bal;
        
        -- epf table update
		UPDATE epf
        SET 
			salary = salary,
            total = tl
		WHERE 
			epfcode = ecode;
            
	-- epfblance table update
        UPDATE epfbalance
        SET 
			balance = balance
		WHERE
			epfcode = ecode;
            
    END IF;
    

	
END $$

DELIMITER ;

