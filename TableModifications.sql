--My State and Zip_Code columns need to be swapped created temporary column to swap them
ALTER TABLE transactions ADD COLUMN temp_state VARCHAR(255);

UPDATE transactions SET temp_state = `State` WHERE `State` IS NOT NULL AND `Zip_Code` IS NOT NULL AND `State` REGEXP '^[0-9]{5}[^0-9]*$';

UPDATE transactions SET `State` = `Zip_Code` WHERE `State` IS NOT NULL AND `Zip_Code` IS NOT NULL AND `State` REGEXP '^[0-9]{5}[^0-9]*$';

UPDATE transactions SET `Zip_Code` = temp_state WHERE temp_state IS NOT NULL;

--Modify to drop time portion

ALTER TABLE transactions
MODIFY COLUMN date DATE;

--Add a primary key to the Transactions Table

ALTER TABLE transactions
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

--Update foreign keys in Transactions Table 

UPDATE Transactions t 
JOIN Cards c ON t.Card_Used = c.CardName 
SET t.CardID = c.CardID; 

UPDATE Transactions t 
JOIN Categories c ON t.Category = c.CategoryName 
SET t.CategoryID = c.CategoryID;

--Drop old columns 

ALTER TABLE Transactions 
DROP COLUMN Card_Used, 
DROP COLUMN Category;

