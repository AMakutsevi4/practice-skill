CREATE TABLE subjects
(
    id         int not null primary key,
    name       text,
    grade      int,
    start_date timestamp
);

INSERT INTO subjects
VALUES (1, 'Math', 50, current_date);
INSERT INTO subjects
VALUES (2, 'English', 75, current_date);
INSERT INTO subjects
VALUES (3, 'Sociology', 65, current_date);
INSERT INTO subjects
VALUES (4, 'Economic', 60, current_date);
INSERT INTO subjects
VALUES (5, 'Computer Science', 95, current_date);

SELECT id, name, grade, subjects.start_date
FROM subjects;

SELECT name, start_date
FROM subjects;

SELECT name AS name_subject, grade AS total_grade
FROM subjects;