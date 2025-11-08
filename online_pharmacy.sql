CREATE DATABASE ONLINE_PHARMACY;
USE ONLINE_PHARMACY;

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    Phone VARCHAR(11),
    City VARCHAR(50),
    State VARCHAR(50),
    DocId INT,
    CONSTRAINT FK_CUSTOMERS_DOCTORS FOREIGN KEY (DocId) REFERENCES DOCTORS(DocId)
);


CREATE TABLE Doctors (
	DocId INT,
	DocName	VARCHAR(100) NOT NULL,
    CONSTRAINT PK_DOCTOR PRIMARY KEY (DocId)
);

CREATE TABLE Prescription (
	PrescriptionId INT PRIMARY KEY,
	PrescriptionFile VARCHAR(50) NOT NULL,
	Status VARCHAR(50),
    Doctors INT,
    CONSTRAINT FK_DOCTORS FOREIGN KEY (Doctors) REFERENCES DOCTORS(DocId)
);

CREATE TABLE Product (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    ProductCategory VARCHAR(50) NOT NULL,
    QuantityInStock INT NOT NULL DEFAULT 0,
    BuyPrice DECIMAL(10,2)
);

CREATE TABLE Orders (
	OrderId INT PRIMARY KEY,
	OrderDate DATE,
	Status VARCHAR (50),
	CustomerId INT,
    CONSTRAINT FK_CUSTOMERS FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(CustomerId)
);

CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY AUTO_INCREMENT,
    OrderId INT,
    ProductId INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2),
    CONSTRAINT FK_ORDERDETAILS_ORDERS FOREIGN KEY (OrderId) REFERENCES ORDERS(OrderId),
    CONSTRAINT FK_ORDERDETAILS_PRODUCTS FOREIGN KEY (ProductId) REFERENCES PRODUCT(ProductId)
);

CREATE TABLE Invoice (
    InvoiceId INT PRIMARY KEY,
    PaymentMethod VARCHAR(20),
    Amount DECIMAL(10,2),
    CustomerId INT,
    CONSTRAINT FK_INVOICE_CUSTOMERS FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS (CustomerId)
);

INSERT INTO Doctors (DocId, DocName) VALUES
(1, 'Dr. Arogundade Ayomide'),
(2, 'Dr. Oluwaseun Lawal'),
(3, 'Dr. Temilade Ogunsanwo'),
(4, 'Dr. Damilola Omoniyi'),
(5, 'Dr. Bolaji Olatunde');

INSERT INTO Customers (CustomerId, CustomerName, Email, Phone, City, State, DocId) VALUES
(1, 'Olaoluwa Oyebola', 'olaoye@gmail.com', '1234567890', 'Yaba', 'LG', 3),
(2, 'Favour Oluwadare', 'favdare@gmail.com', '0987654321', 'Akute', 'OG', 2),
(3, 'Folusho Fatoye', 'folutoye@gmail.com', '1122334455', 'Ilesa', 'OS', 4),
(4, 'Joseph Obika', 'josbika@gmail.com', '6677889900', 'Awka', 'AN', 5),
(5, 'Solomon Ede', 'chukssoles@gamil.com', '5566778899', 'Asaba', 'DT', 1);

INSERT INTO Prescription (PrescriptionId, PrescriptionFile, Status, Doctors) VALUES
(1, 'pt001.pdf', 'Pending', 5),
(2, 'pt002.pdf', 'Approved', 4),
(3, 'pt003.pdf', 'Dispensed', 3),
(4, 'pt004.pdf', 'Pending', 2),
(5, 'pt005.pdf', 'Approved', 1);

INSERT INTO Product (ProductId, ProductName, ProductCategory, QuantityInStock, BuyPrice) VALUES
(1, 'Aspirin', 'Pain Relief', 100, 5.99),
(2, 'Cough Syrup', 'Cold & Flu', 50, 7.49),
(3, 'Vitamin C', 'Supplements', 200, 8.99),
(4, 'Antibiotic Cream', 'Topical', 75, 6.25),
(5, 'Allergy Pills', 'Allergy', 150, 9.50);

INSERT INTO Orders (OrderId, OrderDate, Status, CustomerId) VALUES
(1, '2024-04-01', 'Processing', 1),
(2, '2024-04-02', 'Shipped', 2),
(3, '2024-04-03', 'Delivered', 3),
(4, '2024-04-04', 'Cancelled', 4),
(5, '2024-04-05', 'Shipped', 5);

INSERT INTO OrderDetails (OrderId, ProductId, Quantity, UnitPrice) VALUES
(1, 1, 2, 5.99),    -- 2 Aspirin
(1, 3, 1, 8.99),    -- 1 Vitamin C
(2, 2, 3, 7.49),    -- 3 Cough Syrup
(3, 5, 2, 9.50),    -- 2 Allergy Pills
(4, 4, 1, 6.25);    -- 1 Antibiotic Cream

INSERT INTO Invoice (InvoiceId, PaymentMethod, Amount, CustomerId) VALUES
(1, 'Credit Card', 19.99, 1),
(2, 'Cash', 29.99, 2),
(3, 'Debit Card', 39.49, 3),
(4, 'Online Transfer', 49.00, 4),
(5, 'Credit Card', 59.75, 5);


# all customers with their assigned doctors
SELECT C.CustomerName as Patient, D.DocName as Assigned_Doctor
FROM customers c
JOIN doctors d ON  c.DocId = d.DocId;

# all prescriptions with doctor names
SELECT P.PrescriptionId, P.PrescriptionFile, P.Status, D.DocName
FROM prescription P
JOIN doctors D ON P.Doctors = D.DocId;

# all products with low stock (less than 100)
SELECT ProductId, ProductName, ProductCategory, QuantityInStock
FROM Product
WHERE QuantityInStock < 100;

# total number of customers per state


# show all orders along with the customer and order status
SELECT O.OrderId, O.OrderDate, O.Status, C.CustomerName
FROM Orders O 
JOIN Customers C ON O.CustomerId = C.CustomerId;

# the most expensive product
SELECT ProductName, BuyPrice
FROM Product
ORDER BY BuyPrice DESC
LIMIT 1;

# top 3 Most Ordered Products
SELECT P.ProductName, OD.Quantity as Quantity_Ordered
FROM Product P 
JOIN Orderdetails OD ON P.ProductId = OD.ProductId
ORDER BY OD.Quantity DESC 
LIMIT 3;

# total invoice amount per payment method
SELECT PaymentMethod,
    COUNT(*) AS NumInvoices,
    SUM(Amount) AS TotalAmount
FROM Invoice
GROUP BY PaymentMethod;

