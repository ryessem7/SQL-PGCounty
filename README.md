# SQL-PGCounty

This repository contains a demonstration of my database engineering skills using MySQL. In this smmall activity, I have created a database schema, imported CSV data into tables, assigned data types, and created an Entity-Relationship Diagram (ERD) model.

## Table of Contents
- [Database Schema](#database-schema)
- [Entity-Relationship Diagram (ERD)](https://github.com/ryessem7/SQL-PGCounty/blob/main/PGDia.png)
- [CSV Data Import](#csv-data-import)

<a name="database-schema"></a>
## Database Schema

### Tables
1. **Cities**
   - Fields: city_id (VARCHAR(20), Primary Key), city_name (VARCHAR(50), county_id(INT), state_id (VARCHAR(50), state_name((VARCHAR(50), area(VARCHAR(50)
   
2. **Citypop**
   - Fields: city_id (VARCHAR(20), city_name (VARCHAR(50), population(INT)

3. **Coordinates**
   - Fields: city_id (VARCHAR(20), county_id(INT), city_name (VARCHAR(50), lat(DECIMAL(6,4), lng(DECIMAL(6,4)

4. **County**
   - Fields: county_id (INT PK), county_name (VARCHAR(50), founding_date(INT), area(VARCHAR(50), description(VARCHAR(255), population(INT), mayor(VARCHAR(50)

### Relationships
- County to Cities: One-to-Many (One county can have mulitple cities)
- Cities/County to Coordinates: One-to-One (One city/county can only have one latitude and longitude)
- Cities to Citypop: Many-to-Many (Many cities have many populations)

<img width="617" alt="spread1" src="https://github.com/ryessem7/SQL-PGCounty/blob/main/PGDia.png">


<a name="csv-data-import"></a>
## CSV Data Import

### CSV Files
- [PGCities.csv](https://github.com/ryessem7/SQL-PGCounty/blob/main/PGCities.csv)
- [Population.csv](https://github.com/ryessem7/SQL-PGCounty/blob/main/Population.csv)
- [PGCoordinates.csv](https://github.com/ryessem7/SQL-PGCounty/blob/main/PGCoordinates.csv)
- [PGCountyTab.csv](https://github.com/ryessem7/SQL-PGCounty/blob/main/PGCountyTab.csv)

- Datasets derived from gigasheets, modified by myself. Population figures are not entirely accurate, but close enough. 

### Creation Commands
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

