SELECT  state,
        SUM(supply) AS total_supply
FROM    fruit_imports
GROUP BY
        state
ORDER BY
        total_supply DESC
LIMIT   1;

SELECT  season,
        MAX(cost_per_unit) AS cost_per_unit_max
FROM    fruit_imports
GROUP BY
        season
ORDER BY
        season;

SELECT  state,
        name,
        COUNT(*) AS imports
FROM    fruit_imports
GROUP BY
        state,
        name
HAVING COUNT(*) > 1;

SELECT  season,
        COUNT(name) AS fruits
FROM    fruit_imports
GROUP BY
        season
HAVING  (COUNT(name) = 3 OR COUNT(name) = 4)
ORDER BY
        season;

SELECT  state,
        SUM(supply * cost_per_unit) AS total_cost_per_state
FROM    fruit_imports
GROUP BY
        state
ORDER BY
        total_cost_per_state DESC;

CREATE TABLE fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

SELECT  COUNT(COALESCE(NULL, 'NONE'))
FROM    fruits;