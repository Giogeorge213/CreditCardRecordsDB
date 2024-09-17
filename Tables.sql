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
    TransactionID INT NOT NULL,
    TransactionAmount DOUBLE(10, 2) NOT NULL,
    PRIMARY KEY (CardID, CategoryID, PointsTypeID),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (PointsTypeID) REFERENCES PointsType(PointsTypeID),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(id),
    
);

--Alter imported table 
ALTER TABLE transactions
RENAME COLUMN amount TO TransactionAmount;

--More foreign key assigments

ALTER TABLE Transactions
ADD COLUMN CardID INT,
ADD COLUMN CategoryID INT,
ADD FOREIGN KEY (CardID) REFERENCES Cards(CardID),
ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);




