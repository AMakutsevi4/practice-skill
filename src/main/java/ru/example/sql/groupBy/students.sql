CREATE TABLE students
(
    id INT,
    subject    VARCHAR(50),
    grade      INT
);

INSERT INTO students
VALUES (1, 'Math', 85),
       (1, 'Physics', 90),
       (2, 'Math', 78),
       (2, 'Physics', 88),
       (3, 'Math', 92),
       (3, 'Physics', 95);

SELECT subject, AVG(grade)
FROM students
GROUP BY subject;

/*
 CREATE TABLE students
(
    id INT,
    faculty    VARCHAR(50)
);
 */

SELECT
    faculty, COUNT(faculty)
FROM students
GROUP BY faculty
