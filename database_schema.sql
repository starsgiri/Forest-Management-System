-- Forest Management System Database Schema
-- Created: December 5, 2025

-- Create Database
CREATE DATABASE IF NOT EXISTS forest_management_system;
USE forest_management_system;

-- 1. Animals Table
CREATE TABLE Animals (
    animal_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    location VARCHAR(200),
    zone VARCHAR(50),
    count INT DEFAULT 0,
    species_type VARCHAR(50), -- Mammal, Bird, Reptile, etc.
    conservation_status VARCHAR(50), -- Endangered, Threatened, etc.
    last_sighting_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Trees Table
CREATE TABLE Trees (
    tree_id INT PRIMARY KEY AUTO_INCREMENT,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    location VARCHAR(200),
    zone VARCHAR(50),
    height_meters DECIMAL(5,2),
    age_years INT,
    diameter_cm DECIMAL(6,2),
    health_status VARCHAR(50), -- Healthy, Diseased, Dead
    plantation_date DATE,
    tree_type VARCHAR(50), -- Deciduous, Evergreen, etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Plants Table
CREATE TABLE Plants (
    plant_id INT PRIMARY KEY AUTO_INCREMENT,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    location VARCHAR(200),
    zone VARCHAR(50),
    plant_type VARCHAR(50), -- Shrub, Herb, Grass, Fern, etc.
    coverage_area_sqm DECIMAL(8,2),
    flowering_season VARCHAR(50),
    medicinal_use BOOLEAN DEFAULT FALSE,
    count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4. Forest Officers Table
CREATE TABLE ForestOfficers (
    officer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    employee_id VARCHAR(20) UNIQUE NOT NULL,
    designation VARCHAR(100),
    department VARCHAR(100),
    assigned_zone VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    joining_date DATE,
    status VARCHAR(20) DEFAULT 'Active', -- Active, On Leave, Retired
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 5. Visitors Table
CREATE TABLE Visitors (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    visit_date DATE NOT NULL,
    entry_time TIME,
    exit_time TIME,
    visitor_type VARCHAR(50), -- Tourist, Researcher, Student, etc.
    group_size INT DEFAULT 1,
    permit_number VARCHAR(50),
    zone_visited VARCHAR(50),
    purpose VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Resources Table
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(100) NOT NULL,
    resource_type VARCHAR(50), -- Equipment, Vehicle, Tool, Supply
    quantity INT DEFAULT 0,
    unit VARCHAR(20),
    location VARCHAR(200),
    assigned_zone VARCHAR(50),
    assigned_officer_id INT,
    condition_status VARCHAR(50), -- Good, Fair, Poor, Damaged
    purchase_date DATE,
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    cost DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (assigned_officer_id) REFERENCES ForestOfficers(officer_id) ON DELETE SET NULL
);

-- Create Indexes for better query performance
CREATE INDEX idx_animals_zone ON Animals(zone);
CREATE INDEX idx_animals_conservation ON Animals(conservation_status);
CREATE INDEX idx_trees_zone ON Trees(zone);
CREATE INDEX idx_trees_health ON Trees(health_status);
CREATE INDEX idx_plants_zone ON Plants(zone);
CREATE INDEX idx_officers_zone ON ForestOfficers(assigned_zone);
CREATE INDEX idx_officers_status ON ForestOfficers(status);
CREATE INDEX idx_visitors_date ON Visitors(visit_date);
CREATE INDEX idx_visitors_zone ON Visitors(zone_visited);
CREATE INDEX idx_resources_zone ON Resources(assigned_zone);
CREATE INDEX idx_resources_type ON Resources(resource_type);

-- Display success message
SELECT 'Database and all tables created successfully!' AS Status;
