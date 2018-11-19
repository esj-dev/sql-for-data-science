SELECT  first_name,
        department,
       (SELECT MAX(salary) FROM employees) - salary AS salary_diff_from_max
FROM    employees
WHERE   region_id IN (
        SELECT  region_id
        FROM    regions
        WHERE   country IN ('Asia', 'Canada')
        );

SELECT  *
FROM    employees
WHERE   department IN (
        SELECT  department
        FROM    departments
        WHERE   division = 'Kids'
        )
AND     hire_date > ALL (
                SELECT  hire_date
                FROM    employees
                WHERE   department = 'Maintenance'
                );

SELECT  t1.salary
FROM    (
        SELECT  salary,
                COUNT(*) AS number_of_employees
        FROM    employees
        GROUP BY
                salary
        ORDER BY
                number_of_employees DESC, salary DESC
        ) AS t1
LIMIT   1;

SELECT  ROUND(AVG(salary))
FROM    employees
WHERE   salary NOT IN (
        (SELECT MIN(salary) FROM employees),
        (SELECT MAX(salary) FROM employees)
        );

SELECT  student_name
FROM    students
WHERE   student_no IN (
        SELECT  student_no
        FROM    student_enrollment
        WHERE   course_no IN (
                SELECT course_no
                FROM courses
                WHERE course_title IN ('Physics', 'US History')
                )
        );

SELECT  student_name
FROM    students
WHERE   student_no IN (
        SELECT  student_no
        FROM    (
                SELECT  student_no,
                        COUNT(*) AS courses_enrolled
                FROM    student_enrollment
                GROUP BY
                        student_no
                ORDER BY
                        courses_enrolled DESC
                LIMIT   1
                ) AS t1
        );

SELECT  student_name
FROM    students
WHERE   age >= ALL (
        SELECT  MAX(age)
        FROM    students
        );
