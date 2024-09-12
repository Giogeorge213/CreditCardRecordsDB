CREATE TABLE Transactions ( 
TransactionID INT AUTO_INCREMENT PRIMARY KEY, 
CardID INT NOT NULL, 
TransactionDate DATE NOT NULL, 
Description TEXT, 
Amount DECIMAL(10, 2) NOT NULL,
CategoryID INT, 
FOREIGN KEY (CardID) REFERENCES Cards(CardID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) );

CREATE TABLE Bank ( 
BankID INT AUTO_INCREMENT PRIMARY KEY, 
BankName VARCHAR(255) NOT NULL UNIQUE );

CREATE TABLE PointsType ( 
PointsTypeID INT AUTO_INCREMENT PRIMARY KEY, 
PointsTypeName VARCHAR(255) NOT NULL UNIQUE );

CREATE TABLE Categories ( 
CategoryID INT AUTO_INCREMENT PRIMARY KEY, 
CategoryName VARCHAR(255) NOT NULL UNIQUE );

CREATE TABLE Cards ( 
CardID INT AUTO_INCREMENT PRIMARY KEY,
CardName VARCHAR(255) NOT NULL, 
ExpirationDate DATE, 
BankID INT NOT NULL, 
PointsTypeID INT NOT NULL,
FOREIGN KEY (BankID) REFERENCES Bank(BankID),
FOREIGN KEY (PointsTypeID) REFERENCES PointsType(PointsTypeID) );

CREATE TABLE PointsEarningRates ( 
CardID INT NOT NULL, 
CategoryID INT NOT NULL,
PointsPerDollar DECIMAL(10, 2) NOT NULL, 
PointsTypeID INT NOT NULL, 
PRIMARY KEY (CardID, CategoryID, PointsTypeID),
FOREIGN KEY (CardID) REFERENCES Cards(CardID), 
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
FOREIGN KEY (PointsTypeID) REFERENCES PointsType(PointsTypeID) );


ALTER TABLE Transactions
ADD COLUMN CardID INT,
ADD COLUMN CategoryID INT,
ADD FOREIGN KEY (CardID) REFERENCES Cards(CardID),
ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


INSERT INTO Bank (BankName)
 VALUES ('AMEX');


INSERT INTO PointsType (PointsTypeName)
VALUES ('Membership_Rewards'), ('Hilton_Honors');


INSERT INTO Cards (CardName, ExpirationDate, BankID, PointsTypeID)
VALUES
    ('BLUE BUSINESS PLUS', '2025-05-01', 1, 1),
    ('HILTON ASPIRE', '2026-11-01', 1, 2),
    ('PLATINUM', '2024-07-01', 1, 1),
    ('BUSINESS GOLD', '2027-01-01', 1, 1),
    ('GOLD', '2025-12-01', 1, 1),
    ('BUSINESS PLATINUM', '2026-09-01', 1, 1);

INSERT INTO Categories (CategoryName) 
VALUES
('Unknown'),
('Dining'),
('Travel_Airline'), 
('Entertainment'),
('Retail'), 
('Miscellaneous'), 
('Transportation'), 
('Groceries'), 
('Business_Services'), 
('Travel'), 
('Fuel'), 
('Communications');
