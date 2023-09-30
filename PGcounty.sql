CREATE DATABASE maryland_stats;
USE maryland_stats;

CREATE TABLE county (
    county_id INT PRIMARY KEY,
    county_name VARCHAR(50),
    founding_date INT,
    area VARCHAR(50),
    description VARCHAR(255),
    population INT,
    mayor VARCHAR(50)
);

CREATE TABLE cities (
    city_id VARCHAR(20) PRIMARY KEY,
    city_name VARCHAR(50),
    county_id INT,
    state_id VARCHAR(50),
    state_name VARCHAR(50),
    area VARCHAR(50),
    FOREIGN KEY (county_id) REFERENCES county(county_id)
);

CREATE TABLE population (
    city_id VARCHAR(20),
    city_name VARCHAR(50),
    population INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE coordinates (
    city_id VARCHAR(20),
    county_id INT,
    city_name VARCHAR(50),
    lat DECIMAL(6, 4),
    lng DECIMAL(6, 4),
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    FOREIGN KEY (county_id) REFERENCES county(county_id)
);
