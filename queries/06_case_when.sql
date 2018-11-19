SELECT
        t1.category AS category_name,
        COUNT(*) AS occurences
FROM    (
        SELECT  first_name,
                salary,
                CASE
                        WHEN salary < 100000 THEN 'UNDERPAID'
                        WHEN salary BETWEEN 100000 AND 160000 THEN 'PAID WELL'
                        WHEN salary > 160000 THEN 'EXECUTIVE'
                        ELSE 'UNPAID'
                END AS category
        FROM    employees
        ORDER BY
                salary DESC
        ) AS t1
GROUP BY
        t1.category
ORDER BY
        category_name;

SELECT
        SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) AS employees_clothing,
        SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) AS employees_computers,
        SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) AS employees_sports,
        SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) AS employees_tools
FROM    employees;

SELECT  first_name,
        CASE WHEN t1.region_id = 1 THEN t2.country END AS region_1,
        CASE WHEN t1.region_id = 2 THEN t2.country END AS region_2,
        CASE WHEN t1.region_id = 3 THEN t2.country END AS region_3,
        CASE WHEN t1.region_id = 4 THEN t2.country END AS region_4,
        CASE WHEN t1.region_id = 5 THEN t2.country END AS region_5,
        CASE WHEN t1.region_id = 6 THEN t2.country END AS region_6,
        CASE WHEN t1.region_id = 7 THEN t2.country END AS region_7
FROM    employees as t1, regions as t2
WHERE   t1.region_id = t2.region_id;

SELECT
        SUM(CASE WHEN
                region_1 = (SELECT country FROM regions WHERE region_id = 1) OR
                region_2 = (SELECT country FROM regions WHERE region_id = 2) OR
                region_3 = (SELECT country FROM regions WHERE region_id = 3)
            THEN 1 ELSE 0 END) AS united_states,
        SUM(CASE WHEN
                region_4 = (SELECT country FROM regions WHERE region_id = 4) OR
                region_5 = (SELECT country FROM regions WHERE region_id = 5)
            THEN 1 ELSE 0 END) AS asia,
        SUM(CASE WHEN
                region_6 = (SELECT country FROM regions WHERE region_id = 6) OR
                region_7 = (SELECT country FROM regions WHERE region_id = 7)
            THEN 1 ELSE 0 END) AS canada
FROM    (
        SELECT  first_name,
                CASE WHEN t1.region_id = 1 THEN t2.country END AS region_1,
                CASE WHEN t1.region_id = 2 THEN t2.country END AS region_2,
                CASE WHEN t1.region_id = 3 THEN t2.country END AS region_3,
                CASE WHEN t1.region_id = 4 THEN t2.country END AS region_4,
                CASE WHEN t1.region_id = 5 THEN t2.country END AS region_5,
                CASE WHEN t1.region_id = 6 THEN t2.country END AS region_6,
                CASE WHEN t1.region_id = 7 THEN t2.country END AS region_7
        FROM    employees as t1, regions as t2
        WHERE   t1.region_id = t2.region_id
        ) AS t1;

SELECT  name,
        SUM(supply) as supply_total,
        CASE
                WHEN SUM(supply) < 20000 THEN 'low'
                WHEN SUM(supply) BETWEEN 20000 AND 50000 THEN 'enough'
                WHEN SUM(supply) > 50000 THEN 'full'
        END AS category
FROM    fruit_imports
GROUP BY
        name
ORDER BY
        name ASC;

SELECT
        SUM(CASE WHEN season = 'All Year' THEN supply * cost_per_unit ELSE 0 END) AS all_year,
        SUM(CASE WHEN season = 'Fall' THEN supply * cost_per_unit ELSE 0 END) AS fall,
        SUM(CASE WHEN season = 'Spring' THEN supply * cost_per_unit ELSE 0 END) AS spring,
        SUM(CASE WHEN season = 'Summer' THEN supply * cost_per_unit ELSE 0 END) AS summer,
        SUM(CASE WHEN season = 'Winter' THEN supply * cost_per_unit ELSE 0 END) AS winter
FROM    fruit_imports;