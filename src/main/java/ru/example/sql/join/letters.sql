CREATE TABLE letters (
                         l_id int primary key,
                         label char(1)
);

CREATE TABLE numbers (
                         n_id int primary key,
                         score int
);

INSERT INTO letters VALUES (1, 'A'),
                           (2, 'B');

INSERT INTO numbers VALUES (1, 1),
                           (2, 2),
                           (3, 3);


/*Предложение CROSS JOIN позволяет нам производить декартово произведение строк в двух или более таблиц.
В отличие от других предложений JOIN (LEFT JOIN или INNER JOIN), CROSS JOIN не имеет предиката соединения.*/

SELECT *
FROM letters
CROSS JOIN numbers;