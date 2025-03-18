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
INSERT INTO subjects
VALUES (6, 'Math', null, current_date);
INSERT INTO subjects
VALUES (7, 'Math', null, current_date);
INSERT INTO subjects
VALUES (8, 'Math', null, current_date);

SELECT id, name, grade, subjects.start_date
FROM subjects;

SELECT name, start_date
FROM subjects;

SELECT name AS name_subject, grade AS total_grade
FROM subjects;

SELECT *
FROM subjects
ORDER BY name, grade;

/*Если в предложении DISTINCT указаны несколько столбцов для выборки,
  то запрос будет получать уникальные комбинации для перечисленных столбцов.
  При этом предложение DISTINCT не игнорирует значения null.
  Таким образом, при использовании DISTINCT
  в результатах выборки будет включать NULL в качестве отдельного значения.*/
SELECT DISTINCT name, grade
FROM subjects;

SELECT DISTINCT (name), id, grade
FROM subjects
ORDER BY name DESC;

/*Чтобы задать порядок столбцов, то нужно использовать подзапрос или агрегатные функции*/
SELECT MIN(id), name, MIN(grade)
FROM subjects
GROUP BY name;

SELECT COUNT(name)
FROM subjects;