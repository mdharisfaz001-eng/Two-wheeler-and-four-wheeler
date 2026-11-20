
CREATE DATABASE auto_consulting;
USE auto_consulting;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE Consultant (
    consultant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

CREATE TABLE Vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_type VARCHAR(30),
    brand VARCHAR(50),
    model VARCHAR(50),
    fuel_type VARCHAR(30),
    price DECIMAL(12,2)
);

CREATE TABLE Consultation (
    consultation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    consultant_id INT,
    purpose VARCHAR(255),
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (consultant_id) REFERENCES Consultant(consultant_id)
);

CREATE TABLE Service_Center (
    center_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Service_Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    center_id INT,
    service_name VARCHAR(100),
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (center_id) REFERENCES Service_Center(center_id)
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    rating INT,
    comment VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
