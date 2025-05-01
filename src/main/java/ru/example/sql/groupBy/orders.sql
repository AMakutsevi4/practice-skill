CREATE TABLE orders
(
    id INT,
    amount    INT
);

INSERT INTO orders
VALUES (1, 100),
       (2, 150),
       (1, 200),
       (3, 50),
       (2, 120);

SELECT
    id, SUM(amount)
FROM orders
GROUP BY id;

/*
CREATE TABLE products
(
    id INT,
    category   VARCHAR(50)
);
*/

/*
SELECT category, COUNT(category)
FROM products
GROUP BY category*/


/*
CREATE TABLE employees
(
    id INT,
    department  VARCHAR(50),
    age         INT,
    position    VARCHAR(50),
    salary      INT
);
*/

/*
SELECT department, AVG(age)
FROM employees
GROUP BY department,
*/