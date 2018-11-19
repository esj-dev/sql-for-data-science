SELECT  DISTINCT t1.student_name, t2.course_no, t3.course_title, t4.last_name
FROM    students AS t1, student_enrollment AS t2, courses AS t3, teach AS t4
WHERE   t1.student_no = t2.student_no
AND     t2.course_no = t3.course_no
AND     t3.course_no = t4.course_no
ORDER BY
        student_name;

SELECT  t4.student_name,
        t4.course_title,
        t5.teacher
FROM    (
        SELECT  DISTINCT t1.student_name, t2.course_no, t3.course_title
        FROM    students AS t1, student_enrollment AS t2, courses AS t3
        WHERE   t1.student_no = t2.student_no
        AND     t2.course_no = t3.course_no
        ORDER BY
                student_name
        ) AS t4
        LEFT JOIN
                (
                SELECT  course_no,
                        MIN(last_name) AS teacher
                FROM    teach
                GROUP BY
                        course_no
        ) AS t5 ON t4.course_no = t5.course_no
ORDER BY
        t4.student_name,
        t4.course_no;

SELECT  *
FROM    employees as t1
WHERE   salary > (SELECT AVG(salary) FROM employees as t2 WHERE t1.department = t2.department);

SELECT  student_name, course_title
FROM    students CROSS JOIN courses;