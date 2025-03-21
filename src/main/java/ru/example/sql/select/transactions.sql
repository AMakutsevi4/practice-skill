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
VALUES (3, 'Service', 3, 197, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (4, 'Vacation', 4, 253, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (5, 'Delivery', 3, 167, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (6, 'Current payment', 4, 84, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (7, 'Service', 1, 132, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (8, 'Credit', 2, 672, '2022-06-01 12:00:00');
INSERT INTO transactions
VALUES (9, 'Vacation', 1, 206, '2022-06-01 12:00:00');

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