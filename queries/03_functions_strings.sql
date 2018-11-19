SELECT  last_name ||' '|| 'works in the' ||' '|| department ||' '|| 'department' AS description
FROM    professors
WHERE   last_name = 'Chong';

SELECT  'It is' ||' '|| (salary > 95000) ||' '|| 'that professor' ||' '|| last_name ||' '|| 'is highly paid' AS description
FROM    professors;

SELECT  last_name,
        SUBSTRING(UPPER(department), 1,3) AS department,
        salary,
        hire_date
FROM    professors;

SELECT  MIN(salary) AS salary_min,
        MAX(salary) AS salary_max
FROM    professors
WHERE   last_name != 'Wilson';

SELECT  MIN(hire_date)
FROM    professors;