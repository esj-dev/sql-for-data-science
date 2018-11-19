-- DIRECT SUBQUERY
SELECT  department
FROM   (
        SELECT  department,
                COUNT(*) AS number_of_employees
        FROM    employees
        GROUP BY
                department
        ) AS t1
WHERE number_of_employees > 38;

-- CORRELATED SUBQUERY
SELECT  t1.department
FROM    departments AS t1
WHERE   38 < (
        SELECT  COUNT(*) AS number_of_employees
        FROM    employees AS t2
        WHERE   t1.department = t2.department
        );

SELECT  t1.department,
        MAX(salary) AS department_salary_max
FROM    employees AS t1
WHERE   38 < (
        SELECT  COUNT(*) AS number_of_employees
        FROM    employees AS t2
        WHERE   t1.department = t2.department
        )
GROUP BY
        t1.department;

SELECT  department,
        first_name,
        salary,
        CASE
                WHEN salary >= (SELECT MAX(salary) FROM employees AS t4 WHERE t1.department = t4.department) THEN 'Highest'
                WHEN salary <= (SELECT MIN(salary) FROM employees AS t4 WHERE t1.department = t4.department) THEN 'Lowest'
        END AS department_level
FROM    employees AS t1
WHERE   salary >= ALL (
        SELECT  MAX(salary)
        FROM    employees AS t2
        WHERE   t1.department = t2.department
        )
OR      salary <= ALL (
        SELECT  MIN(salary)
        FROM    employees AS t3
        WHERE   t1.department = t3.department
        )
ORDER BY
        department, first_name;
