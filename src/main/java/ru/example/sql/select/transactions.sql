CREATE TABLE transactions
(
    id           int not null primary key,
    purpose      text,
    client_id    int,
    amount       int,
    payment_date timestamp
);

INSERT INTO transactions
VALUES (1, 'Credit', 1, 132, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (2, 'Current payment', 2, 94, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (3, 'Service', 3, 194, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (4, 'Vacation', 4, 254, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (5, 'Credit', 1, 244, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (6, 'Current payment', 2, 114, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (7, 'Service', 3, 178, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (8, 'Vacation', 4, 196, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (9, 'Credit', 1, 198, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (10, 'Current payment', 2, 78, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (11, 'Service', 3, 156, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (12, 'Vacation', 4, 152, '2022-06-01 12:00:00');

/*Для того чтобы посчитать среднее значение в каком-нибудь столбце можно использовать функцию AVG.

 Для того чтобы привести его к некоему шаблону можно сразу результат расчета привести к типу numeric следующим образом
 SELECT AVG(имя_столбца)::numeric(точность, шкала) FROM название_таблицы*/
SELECT AVG(amount)
FROM transactions;

/*  Если несколько значений в столбце совпадают, то для того,
  чтобы посчитать только среднее значение среди уникальных значений,
  то можно просто добавить DISTINCT - выглядит это следующим образом:
  SELECT AVG(DISTINCT имя_столбца) FROM название_таблицы;*/
SELECT AVG(DISTINCT amount)
FROM transactions;

/*Чтобы рассчитать среднее значение сгруппированных данных, вместе с AVG используем предложение GROUP BY - запрос будет выглядеть следующим образом:
SELECT столбец_группировки, остальные_столбцы, AVG(имя_столбца) FROM название_таблицы GROUP BY столбец_группировки

Вначале предложение GROUP BY делит данные таблицы на группы, а далее AVG выполняет расчет среднего значения для каждой из групп.*/
SELECT purpose, AVG(amount)
FROM transactions
GROUP BY purpose
ORDER BY purpose;

/*Для того чтобы посчитать сумму всех значений в каком-нибудь столбце можно использовать функцию SUM. */
SELECT SUM(amount)
FROM transactions;

/*Функция SUM игнорирует NULL. Т.е. эта функция не учитывает NULL при расчетах.*/
SELECT SUM(DISTINCT amount)
FROM transactions;

SELECT purpose, SUM(amount)
FROM transactions
GROUP BY purpose
ORDER BY purpose DESC;

SELECT purpose, AVG(amount)::NUMERIC(10,2), SUM(amount)
FROM transactions
GROUP BY purpose
ORDER BY purpose;

SELECT AVG(amount), SUM(amount)
FROM transactions;

/*MAX - это агрегатная функция, которая возвращает максимальное значение в наборе.
  Функцию MAX можно использовать не только в SELECT, но и в предложениях WHERE и HAVING.*/
SELECT MAX(amount)
FROM transactions;

/*Агрегатную функцию MAX можно использовать вместе с GROUP BY, чтобы получить максимальное значение для каждой группы.
  Таким образом можно, например, получить самую высокую цену за товар в определенной категории и т.п.*/
SELECT purpose, MAX(amount)
FROM transactions
GROUP BY purpose;

/*Функция MIN - агрегатная функция, которая возвращает минимальное значение в наборе.*/
SELECT MIN(amount)
FROM transactions;


SELECT purpose, MIN(amount)
FROM transactions
GROUP BY purpose;

/* Есть две таблицы – Department (id, name) и Employee (id, department_id, cheief_id, name, salary).
Вывести список имён сотрудников, получающих большую заработную плату, чем у непосредственного руководителя.*/

-- SELECT name
-- FROM Employee e
--
-- SELECT a.name FROM Employee a, Employee b
-- where b.id = a.chief_id and a.salary > b.salary

/*
2. Есть таблица Rooms (id, home_type, address, has_tv, has_internet,…).
Необходимо вывести id комнаты и наличие интернета в комнате, если интернет имеется, вывести “YES”, иначе “NO”.*/
-- SELECT id, (
-- CASE
--     WHEN (has_internet == true) THEN 'YES'
--     ELSE 'NO'
-- END ) as has_internet
--
-- FROM Rooms;