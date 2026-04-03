
-- Walmart Sales Database SQL Script

-- Create Database
CREATE DATABASE IF NOT EXISTS walmart_sales_db;
USE walmart_sales_db;

-- Create Tables

-- Stores Table
CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    store_type VARCHAR(5),
    location VARCHAR(50)
);

-- Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    store_id INT,
    dept_id INT,
    sale_date DATE,
    weekly_sales FLOAT,
    holiday_flag BOOLEAN,
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- High Sales Log Table
CREATE TABLE HighSalesLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    weekly_sales FLOAT
);

-- Insert Sample Data

-- Insert into Stores
INSERT INTO Stores (store_id, store_type, location) VALUES
(1, 'A', 'Dallas'),
(2, 'B', 'Austin');

-- Insert into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(101, 'Grocery'),
(102, 'Electronics');

-- Insert into Sales
INSERT INTO Sales (sale_id, store_id, dept_id, sale_date, weekly_sales, holiday_flag) VALUES
(1, 1, 101, '2023-08-01', 12500.50, FALSE),
(2, 2, 102, '2023-08-08', 10000.75, TRUE),
(3, 1, 101, '2023-08-01', 11300.00, FALSE);

-- Triggers

-- Trigger to log high-sales events
DELIMITER $$
CREATE TRIGGER HighSalesTrigger
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.weekly_sales > 10000 THEN
        INSERT INTO HighSalesLog (sale_id, weekly_sales)
        VALUES (NEW.sale_id, NEW.weekly_sales);
    END IF;
END$$
DELIMITER ;

-- Trigger to validate non-negative sales input
DELIMITER $$
CREATE TRIGGER ValidateSales
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.weekly_sales < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Weekly Sales cannot be negative';
    END IF;
END$$
DELIMITER ;

-- Stored Procedure to calculate total sales
DELIMITER $$
CREATE PROCEDURE CalculateTotalSales(IN storeId INT, IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT SUM(weekly_sales) AS total_sales
    FROM Sales
    WHERE store_id = storeId
      AND sale_date BETWEEN startDate AND endDate;
END$$
DELIMITER ;

-- View for Monthly Sales per Store
CREATE VIEW MonthlySalesPerStore AS
SELECT store_id, 
       MONTH(sale_date) AS month, 
       YEAR(sale_date) AS year, 
       SUM(weekly_sales) AS total_monthly_sales
FROM Sales
GROUP BY store_id, MONTH(sale_date), YEAR(sale_date);
