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
VALUES (5, 'sugar', 105, 30);


SELECT *
FROM products;

SELECT id, price
FROM products;

SELECT name AS product_name, count AS actual_count
FROM products;