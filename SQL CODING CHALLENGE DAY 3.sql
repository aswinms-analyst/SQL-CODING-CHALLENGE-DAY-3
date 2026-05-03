-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);


-- DISTINCT & AS

-- 1. Unique product names
SELECT DISTINCT product_name FROM Product;

-- 2. Product names with alias
SELECT product_name AS Product_Name FROM Product;

-- 3. Unique product_id values from Sales
SELECT DISTINCT product_id FROM Sales;

-- 4. Product price with alias
SELECT price AS Product_Price FROM Product;


-- WHERE Clause

-- 5. Products with price > 10000
SELECT * FROM Product WHERE price > 10000;

-- 6. Products with price < 5000
SELECT * FROM Product WHERE price < 5000;

-- 7. Sales where quantity = 2
SELECT * FROM Sales WHERE quantity = 2;


-- Comparison Operators

-- 8. Products with price >= 15000
SELECT * FROM Product WHERE price >= 15000;

-- 9. Sales where quantity != 5
SELECT * FROM Sales WHERE quantity <> 5;


-- Arithmetic Operators

-- 10. Product name and price after 10% increase
SELECT product_name, price, price * 1.10 AS Increased_Price FROM Product;

-- 11. Sale amount and sale amount after adding 500
SELECT sale_id, sale_amount, sale_amount + 500 AS Updated_Sale_Amount FROM Sales;


-- Logical Operators

-- 12. Products with price > 5000 AND < 50000
SELECT * FROM Product WHERE price > 5000 AND price < 50000;

-- 13. Sales where quantity = 2 OR 4
SELECT * FROM Sales WHERE quantity = 2 OR quantity = 4;

-- 14. Products where price is NOT greater than 20000
SELECT * FROM Product WHERE NOT price > 20000;


-- IS NULL / IS NOT NULL

-- 15. Sales records where product_id is NULL
SELECT * FROM Sales WHERE product_id IS NULL;

-- 16. Products where price is NOT NULL
SELECT * FROM Product WHERE price IS NOT NULL;


-- IN and NOT IN


-- 17. Products with product_id 1, 3, 5
SELECT * FROM Product WHERE product_id IN (1, 3, 5);

-- 18. Products whose product_id is NOT 2, 4, 6
SELECT * FROM Product WHERE product_id NOT IN (2, 4, 6);


-- BETWEEN and NOT BETWEEN

-- 19. Products with price between 1000 and 20000
SELECT * FROM Product WHERE price BETWEEN 1000 AND 20000;

-- 20. Products with price NOT between 5000 and 50000
SELECT * FROM Product WHERE price NOT BETWEEN 5000 AND 50000;


-- LIKE and NOT LIKE

-- 21. Products whose name starts with 'M'
SELECT * FROM Product WHERE product_name LIKE 'M%';

-- 22. Products whose name ends with 'e'
SELECT * FROM Product WHERE product_name LIKE '%e';

-- 23. Products whose name contains 'phone'
SELECT * FROM Product WHERE product_name LIKE '%phone%';

-- 24. Products whose name does not start with 'S'
SELECT * FROM Product WHERE product_name NOT LIKE 'S%';


-- 25. Products with price between 1000 and 20000 AND name starts with 'M'
SELECT * FROM Product WHERE price BETWEEN 1000 AND 20000 AND product_name LIKE 'M%';

-- 26. Sales where quantity between 2 and 10
SELECT * FROM Sales WHERE quantity BETWEEN 2 AND 10;

-- 27. Products with product_id in (1,2,3) AND price > 5000
SELECT * FROM Product WHERE product_id IN (1,2,3) AND price > 5000;

-- 28. Unique sale quantities from Sales
SELECT DISTINCT quantity FROM Sales;
