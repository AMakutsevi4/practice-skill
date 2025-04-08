CREATE TABLE usersFunc
(
    id         INTEGER PRIMARY KEY,
    name       TEXT      NOT NULL,
    birth_date TIMESTAMP NOT NULL
);

INSERT INTO usersFunc (id, name, birth_date)
VALUES (1, 'Иван Иванов', '1990-05-15'),
       (2, 'Петр Петров', '1985-11-22'),
       (3, 'Анна Сидорова', '1995-03-10'),
       (4, 'Мария Кузнецова', '1988-07-30'),
       (5, 'Алексей Смирнов', '1993-09-18'),
       (6, 'Елена Попова', '2000-01-25'),
       (7, 'Дмитрий Васильев', '1982-12-05'),
       (8, 'Ольга Новикова', '1998-08-12'),
       (9, 'Сергей Федоров', '1991-04-20'),
       (10, 'Наталья Морозова', '1997-06-08');

SELECT FLOOR(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date)))
FROM usersFunc;