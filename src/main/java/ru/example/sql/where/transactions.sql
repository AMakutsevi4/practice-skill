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


SELECT *
FROM transactions t WHERE t.purpose != 'Vacation'
AND t.amount < 150;


SELECT *
FROM transactions t
WHERE t.purpose = 'Credit' OR t.amount > 170;

/*При этом иногда необходимо сделать выборку строк чтобы при проверке условия значение в столбце находилось в каком-то диапазоне значений.
  В этом случае нам поможет оператор BETWEEN. Синтаксис будет иметь следующий вид:
  SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE столбец_для_проверки BETWEEN значение_1 AND значение_2;*/

  SELECT *
  FROM transactions t
  WHERE t.amount BETWEEN 100 AND 200;

SELECT *
FROM transactions t
WHERE t.amount NOT BETWEEN 100 AND 200;

SELECT *
FROM transactions t
WHERE t.amount BETWEEN 80 AND 190 AND t.payment_date NOT BETWEEN '2022-02-01 12:00:00' AND '2022-08-01 12:00:00';

