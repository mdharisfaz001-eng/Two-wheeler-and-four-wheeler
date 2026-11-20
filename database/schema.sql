
CREATE DATABASE IF NOT EXISTS auto_consulting
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE auto_consulting;

CREATE TABLE customer (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 phone VARCHAR(20),
 password_hash VARCHAR(100) NOT NULL,
 role ENUM('customer','staff','admin') DEFAULT 'customer',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE consultant (
 consultant_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 phone VARCHAR(20),
 password_hash VARCHAR(100) NOT NULL,
 specialization VARCHAR(100) NOT NULL,
 experience_years TINYINT UNSIGNED DEFAULT 0
);

CREATE TABLE vehicle (
 vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
 vehicle_type ENUM('Two-Wheeler','Four-Wheeler') NOT NULL,
 brand VARCHAR(50) NOT NULL,
 model VARCHAR(80) NOT NULL,
 fuel_type ENUM('Petrol','Diesel','Electric','CNG','Hybrid') DEFAULT 'Petrol',
 price DECIMAL(12,2) NOT NULL,
 description VARCHAR(500),
 image_url VARCHAR(300)
);

CREATE TABLE consultation (
 consultation_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 consultant_id INT,
 vehicle_id INT,
 purpose VARCHAR(500) NOT NULL,
 budget DECIMAL(12,2),
 preferred_type ENUM('Two-Wheeler','Four-Wheeler'),
 scheduled_at DATETIME,
 recommendation TEXT,
 status ENUM('requested','accepted','completed','cancelled') DEFAULT 'requested',
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
 FOREIGN KEY (consultant_id) REFERENCES consultant(consultant_id),
 FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);

CREATE TABLE service_center (
 center_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 city VARCHAR(80) NOT NULL,
 address VARCHAR(250) NOT NULL,
 phone VARCHAR(20),
 maps_url VARCHAR(400)
);

CREATE TABLE service (
 service_id INT AUTO_INCREMENT PRIMARY KEY,
 center_id INT NOT NULL,
 service_name VARCHAR(100) NOT NULL,
 vehicle_type ENUM('Two-Wheeler','Four-Wheeler') NOT NULL,
 cost DECIMAL(10,2) NOT NULL,
 duration_minutes SMALLINT UNSIGNED DEFAULT 60,
 FOREIGN KEY (center_id) REFERENCES service_center(center_id)
);

CREATE TABLE service_booking (
 booking_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 service_id INT NOT NULL,
 vehicle_number VARCHAR(20) NOT NULL,
 scheduled_at DATETIME NOT NULL,
 status ENUM('booked','in_progress','completed','cancelled') DEFAULT 'booked',
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
 FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE review (
 review_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 target_type ENUM('consultation','service_booking') NOT NULL,
 target_id INT NOT NULL,
 rating TINYINT NOT NULL,
 comment VARCHAR(1000),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 CHECK (rating BETWEEN 1 AND 5),
 UNIQUE (customer_id,target_type,target_id),
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
