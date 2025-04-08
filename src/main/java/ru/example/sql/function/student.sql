CREATE TABLE student
(
    id         INTEGER PRIMARY KEY,
    first_name TEXT    NOT NULL,
    last_name  TEXT    NOT NULL,
    age        INTEGER NOT NULL
);

INSERT INTO student (id, first_name, last_name, age)
VALUES (1, 'Иван', 'Иванов', 20),
       (2, 'Петр', 'Петров', 21),
       (3, 'Анна', 'Сидорова', 19),
       (4, 'Мария', 'Кузнецова', 22),
       (5, 'Алексей', 'Смирнов', 20),
       (6, 'Елена', 'Попова', 21),
       (7, 'Дмитрий', 'Васильев', 23),
       (8, 'Ольга', 'Новикова', 19),
       (9, 'Сергей', 'Федоров', 22),
       (10, 'Наталья', 'Морозова', 20);


SELECT
    CONCAT(first_name, '.', LEFT(last_name, 1), '.') AS name
FROM student
ORDER BY name DESC;