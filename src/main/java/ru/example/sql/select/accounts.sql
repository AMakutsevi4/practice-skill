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
VALUES (3, 'Lana Sergeeva', 'lserg', '2156');
INSERT INTO accounts
VALUES (4, 'Petr Arsentev', 'arsentev_p', '1234');
INSERT INTO accounts
VALUES (5, 'Andrey Hincu', 'nincu_a', '4321');
INSERT INTO accounts
VALUES (6, 'Lana Sergeeva', 'serg_l', '2156');


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

/* Предложение DISTINCT используется для удаления дубликатов из набора результатов выборки.
   Предложение DISTINCT можно использовать только с операторами SELECT*/
SELECT DISTINCT name
FROM accounts;

/*Для того чтобы в выборку попали данные из нескольких столбцов,
  при этом уникальность учитывалась только лишь в части из них - используется предложение DISTINCT*/
SELECT DISTINCT (name), login, password
FROM accounts;

/*Функция COUNT(*) вернет количество строк, возвращенных SELECT-ом, включая null и дубликаты.
  Если ее использовать на большом объеме данных, то запрос будет медленным.*/
SELECT COUNT(*)
FROM accounts;