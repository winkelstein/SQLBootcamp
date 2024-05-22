CREATE TABLE IF NOT EXISTS TravelCosts (
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost INT,
    PRIMARY KEY (point1, point2)
);


INSERT INTO TravelCosts (point1, point2, cost)
VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'c', 30);

WITH RECURSIVE CityPaths AS (
    SELECT 
        point1 AS start_city,
        point2 AS end_city,
        cost AS total_cost,
        CONCAT('{', point1, ',', point2) AS tour,
        1 AS level,
        point2::text AS visited_cities
    FROM TravelCosts
    WHERE point1 = 'a'

    UNION ALL

    SELECT 
        cp.start_city,
        t.point2 AS end_city,
        cp.total_cost + t.cost AS total_cost,
        CONCAT(cp.tour, ',', t.point2) AS tour,
        cp.level + 1 AS level,
        CONCAT(cp.visited_cities, ',', t.point2) AS visited_cities
    FROM CityPaths cp
    JOIN TravelCosts t ON t.point1 = cp.end_city
    WHERE cp.level < 4 
        AND NOT t.point2 = ANY(string_to_array(cp.visited_cities, ',')::text[])
)

SELECT 
    total_cost, 
    CONCAT(tour, '}') AS tour
FROM CityPaths
WHERE end_city = 'a' 
    AND array_length(string_to_array(visited_cities, ','), 1) = 4 
    AND total_cost = (
        SELECT MIN(total_cost) 
        FROM CityPaths 
        WHERE end_city = 'a' AND array_length(string_to_array(visited_cities, ','), 1) = 4
    )
ORDER BY tour;