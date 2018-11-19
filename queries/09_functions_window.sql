SELECT  DISTINCT
        department,
        COUNT(*) OVER(PARTITION BY department) AS number_of_employees,
        SUM(salary) OVER(PARTITION BY department) AS total_salary
FROM    employees
ORDER BY
        department ASC;