DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(50) NULL,
  department_name VARCHAR(45) NULL,
  price DECIMAL(10,2),
  stock_quantity INT(10) NULL,
  PRIMARY KEY (item_id)
);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("OLED TV", "1700.99", "Electronics", 10);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("Instant Pot LUX", "59.65", "Kitchen & Dinning", 10);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("Samsung SSD 860 PRO", "150.33", "Computer & Accessories", 10);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("NICETOWN Living Room Blackout Curtains", "30.99", "Home Decor", 10);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("QLED TV", "1100.99", "Electronics", 8);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("Crock-Pot 2100467 Express", "90.00", "Kitchen & Dinning", 8);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("TP-Link AC1750 Smart WiFi Router", "65.99", "Computer & Accessories", 8);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("Modern Plush Cherry Red Area Rug", "17.99", "Home Decor", 8);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("mDesign Vertical Dresser Storage Tower", "60.00", "Furniture", 5);
INSERT INTO products (product_name, price, department_name, stock_quantity)
VALUES ("Black Sonoma 5 Drawer Chest", "155.99", "Furniture", 5);


SELECT * FROM  Products
