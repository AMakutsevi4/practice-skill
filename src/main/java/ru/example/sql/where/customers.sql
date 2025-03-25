CREATE TABLE customers
(
    id         int not null primary key,
    first_name text,
    last_name  text,
    active     boolean,
    email      text
);

INSERT INTO customers
VALUES (1, 'Petr', 'Arsentev', true, 'parsentev@bk.ru');
INSERT INTO customers
VALUES (2, 'Andrey', 'Hincu', false, 'anincu@bk.ru');
INSERT INTO customers
VALUES (3, 'Rail', 'Shamsemuhametov', true, 'rsham@bk.ru');
INSERT INTO customers
VALUES (4, 'Elena', 'Kartashova', false, 'ekart@bk.ru');
INSERT INTO customers
VALUES (5, 'Lana', 'Sergeeva', true, 'lserg@bk.ru');


/* Для того чтобы выбрать строки, которые удовлетворяют заданному условию, в SQL используется WHERE предложение.
Синтаксис имеет следующий вид:
SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE условие ORDER BY условие_сортировки
Условие должно оцениваться как истина, ложь или неизвестность. Это может быть логическое выражение или комбинация логических выражений.*/
SELECT *
FROM customers c
WHERE c.active = true;

SELECT *
FROM customers c
WHERE length(c.first_name) > 4;


SELECT *
FROM customers c
WHERE c.id <= 3;

 /*Для формирования условия в WHERE предложении также можно использовать оператор сравнения НЕ РАВНО - при этом обозначить его можно 2-мя способами - != и <>.*/
SELECT *
FROM customers c
WHERE length(c.last_name) <> 8;

/* Условия можно комбинировать и проверять несколько условий.
  Для этого используется логическая операция AND (И). Синтаксис имеет следующий вид:
SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE условие1 AND условие2 AND условие3;*/
SELECT *
FROM customers c
WHERE length(c.last_name) >= 5 AND c.active = false;

/* Условия можно комбинировать и проверять несколько условий. Для этого используется логическая операция OR (ИЛИ).
   Синтаксис имеет следующий вид:
SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE условие1 OR условие2 OR условие3; */
SELECT *
FROM customers c
WHERE c.id >3 OR c.active = false;


/* Если мы хотим сопоставить строку с любой строкой в списке мы можем использовать оператор IN.
   Синтаксис будет следующим:
SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE столбец_для_проверки IN (строка1, строка2, и т.д.);*/
SELECT *
FROM customers c
WHERE c.first_name IN ('Ann', 'Anne', 'Annie');
