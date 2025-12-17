CREATE TABLE products
(
    id    int not null primary key,
    name  text,
    price int,
    count int
);

INSERT INTO products
VALUES (1, 'bread', 50, 10);
INSERT INTO products
VALUES (2, 'cheese', 250, 8);
INSERT INTO products
VALUES (3, 'milk', 75, 15);
INSERT INTO products
VALUES (4, 'butter', 115, 7);
INSERT INTO products
VALUES (5, 'bread', 50, 10);
INSERT INTO products
VALUES (6, 'cheese', 250, 8);
INSERT INTO products
VALUES (7, 'milk', 75, 15);
INSERT INTO products
VALUES (8, 'bread', 50, 10);
INSERT INTO products
VALUES (9, 'cheese', 250, 8);
INSERT INTO products
VALUES (10, 'bread', 50, 10);


SELECT *
FROM products;

SELECT id, price
FROM products;

SELECT name AS product_name, count AS actual_count
FROM products;

SELECT *
FROM products
ORDER BY price DESC;

SELECT DISTINCT name, price
FROM products
ORDER BY price DESC;

SELECT DISTINCT name, price, count
FROM products
ORDER BY name, price, count;



/*В такой форме COUNT(DISTINCT имя_столбца)
  возвращает количество уникальных ненулевых значений в столбце, который мы указываем в COUNT.
  Простыми словами, в данном запросе он указывает количество уникальных имён*/
SELECT COUNT(DISTINCT name)
FROM products;
