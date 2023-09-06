-- ЗАДАЧА 1

DROP DATABASE IF EXISTS dz2_sales;
CREATE DATABASE dz2_sales;
USE dz2_sales;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUE
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);

SELECT * FROM sales;

-- ЗАДАЧА 2
SELECT
    count_product,
CASE
    WHEN count_product < 100
        THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300
        THEN "Средний заказ"
    WHEN count_product >= 300
        THEN "Большой заказ"
    ELSE "Error"
END AS resulte
FROM sales;


-- ЗАДАЧА 3
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id TEXT CHARACTER SET utf8mb4,
    amount DECIMAL(10,2),
    order_status TEXT
);

INSERT INTO orders (employee_id, amount, order_status)
VALUE
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT
    order_status,
CASE
    WHEN order_status = "OPEN"
        THEN "Order is in open state"
    WHEN order_status = "CLOSED"
        THEN "Order is closed"
    WHEN order_status = "CANCELLED"
        THEN "Order is cancelled"
    ELSE "Error"
END AS resulte
FROM orders;


    


