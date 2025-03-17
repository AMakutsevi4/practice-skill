CREATE TABLE accounts
(
    id       int not null primary key,
    name     text,
    login    text,
    password text
);

INSERT INTO accounts
VALUES (1, 'Petr Arsentev', 'parsentev', '1234');
INSERT INTO accounts
VALUES (2, 'Andrey Hincu', 'anincu', '4321');
INSERT INTO accounts
VALUES (3, 'Rail Shamsemuhametov', 'rsham', '5678');
INSERT INTO accounts
VALUES (4, 'Elena Kartashova', 'ekart', '8765');
INSERT INTO accounts
VALUES (5, 'Lana Sergeeva', 'lserg', '2156');


SELECT *
FROM accounts;

SELECT name, login
FROM accounts;

/* AS - позволяет задать псевдоним для столбца.
  Обратите внимание, что в SQL для написания составных имен используется стиль snake_case(как названия констант в Java).*/
SELECT name AS person_name, password AS account_password
FROM accounts;

/* ORDER BY - сортировка по указанному столбцу, столбцов для сортировки может быть несколько.
   Если столбцов несколько, то в сортировке они учитываются в том порядке, в котором указаны */
SELECT *
FROM accounts
ORDER BY name;