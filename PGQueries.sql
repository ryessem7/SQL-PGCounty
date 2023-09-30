-- #1 What are the 10 most populated cities in Prince George's County?
SELECT city_name, population
FROM citypop
ORDER BY population DESC
LIMIT 10;

-- #2 What is the TOTAL population of Prince George's County?
SELECT SUM(population)
FROM citypop;

-- #3 What is the latitude and longititude of College Park, MD?
SELECT lat, lng
FROM coordinates
WHERE city_name = 'College Park';

-- #4 Which city has the highest population density (population per square mile)?
SELECT p.city_name, (p.population / c.area) AS population_density
FROM citypop p
JOIN cities c ON p.city_id = c.city_id
ORDER BY population_density DESC
LIMIT 1;

-- #5 What are the top 3 smallest cities in terms of area in square miles?
SELECT city_name, area
FROM cities
ORDER BY area ASC
LIMIT 3;

-- #6 What is the population of Greenbelt, MD using city id?
SELECT city_name, population
FROM citypop
WHERE city_id = 'VGX9';

-- #7 How many cities in PG County start with the letter C?
SELECT COUNT(city_name)
FROM citypop
WHERE city_name LIKE 'C%';

-- #8 What many cities have over 30,000 people?
SELECT city_name
FROM citypop
WHERE population > 30000;

-- #9 How many cities are present in PG County?
SELECT COUNT(*)
FROM cities;

-- #10 What is the average population of all the cities in Prince George's County?
SELECT AVG(population) AS avg_pop
FROM citypop;

- #11 Who is the mayor of PG County?
SELECT mayor
FROM county;
