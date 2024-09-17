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
