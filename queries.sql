-- Get all dealerships:
USE dealership_db;
SELECT * FROM dealerships;

-- Find all vehicles for a specific dealership:
USE dealership_db;
SELECT v.* 
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 3;


-- Find a car by VIN:
USE dealership_db;
SELECT * FROM vehicles WHERE VIN = '1HGCM82633A100099';

-- Find a dealership where a certain car is located by VIN:
USE dealership_db;
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '1HGCM82633A100100';

-- Find all dealerships that have a certain car type:
USE dealership_db;
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = 'Mustang' AND v.color = 'Black';

-- Get all sales information for a specific dealer for a specific date range:
USE dealership_db;
SELECT * 
FROM sales_contracts
WHERE dealership_id = 2
  AND sale_date BETWEEN '2023-01-01' AND '2023-12-31';
