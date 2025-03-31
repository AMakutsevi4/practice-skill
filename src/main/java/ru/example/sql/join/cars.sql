CREATE TABLE cars
(
    id    int primary key,
    model text
);

CREATE TABLE engines
(
    number int primary key,
    volume decimal,
    power  int,
    car_id int references cars (id)
);

INSERT INTO cars
VALUES (1, 'Toyota Camry');
INSERT INTO cars
VALUES (2, 'Renault Sandero');

INSERT INTO engines
VALUES (1234, 2.5, 181, 1);
INSERT INTO engines
VALUES (5678, 1.2, 75, 2);


/*Для того чтобы выполнить объединение между таблицами, используется внешний ключ (FOREIGN KEY) – это столбец
  или группа столбцов в таблице, которые ссылаются на первичный ключ другой таблицы.*/

SELECT id, model, volume, power
FROM engines e
         INNER JOIN cars c on e.car_id = c.id;


SELECT c.id, c.model, e.volume, e.power
FROM cars c
         INNER JOIN engines e ON e.car_id = c.id;

SELECT c.id, c.model, e.number, e.volume, e.power
FROM cars c
LEFT JOIN engines e ON e.car_id = c.id;

SELECT id, model, number, volume, power
FROM cars c
RIGHT JOIN engines e ON e.car_id = c.id;

SELECT *
FROM cars c
FULL OUTER JOIN engines e ON c.id = e.car_id