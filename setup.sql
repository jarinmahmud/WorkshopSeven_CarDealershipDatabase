-- Creating Database:
DROP DATABASE IF EXISTS dealership_db;
CREATE DATABASE dealership_db;

USE dealership_db;

-- Creating tables:

-- Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2: vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(20),
    price DECIMAL(10, 2),
    sold BOOLEAN
);

-- Table 3: inventory
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: sales_contracts
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    dealership_id INT,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

-- Populating tables with data

-- Dealerships
INSERT INTO dealerships (name, address, phone) VALUES
('Super Cars', '123 Main St', '123-456-7890'),
('Auto World', '456 Elm St', '234-567-8901'),
('Luxury Rides', '789 Oak St', '345-678-9012');

-- Vehicles
INSERT INTO vehicles (VIN, make, model, year, color, price, sold) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2020, 'Red', 22000.00, FALSE),
('1HGCM82633A654321', 'Toyota', 'Camry', 2021, 'Blue', 25000.00, FALSE),
('1HGCM82633A789012', 'Ford', 'Mustang', 2019, 'Black', 30000.00, TRUE),
('1HGCM82633A345678', 'Tesla', 'Model S', 2022, 'White', 80000.00, FALSE);

-- Inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '1HGCM82633A654321'),
(2, '1HGCM82633A789012'),
(3, '1HGCM82633A345678');

-- Sales Contracts
INSERT INTO sales_contracts (VIN, customer_name, sale_date, sale_price, dealership_id) VALUES
('1HGCM82633A789012', 'John Doe', '2023-01-15', 29000.00, 2);




