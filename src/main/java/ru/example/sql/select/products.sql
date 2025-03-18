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
VALUES (2, 'milk', 75, 15);
INSERT INTO products
VALUES (3, 'sugar', 105, 30);
INSERT INTO products
VALUES (4, 'bread', 50, 10);
INSERT INTO products
VALUES (5, 'milk', 68, 15);
INSERT INTO products
VALUES (6, 'sugar', 105, 30);
INSERT INTO products
VALUES (7, 'bread', 45, 10);
INSERT INTO products
VALUES (8, 'milk', 75, 15);
INSERT INTO products
VALUES (9, 'sugar', 105, 30);


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