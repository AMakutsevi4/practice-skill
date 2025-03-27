CREATE TABLE users (
                       id int primary key,
                       email text,
                       name text
);

CREATE TABLE accounts (
                          id int primary key,
                          login text,
                          password text,
                          user_id int references users(id)
);

CREATE TABLE payment (
                         id int primary key,
                         amount decimal,
                         payment_date date,
                         account_id int references accounts(id)
);


INSERT INTO users VALUES (1, 'email_1@mail.ru', 'first_name');
INSERT INTO users VALUES (2, 'email_2@bk.ru', 'second_name');

INSERT INTO accounts VALUES (1, 'login_1', '12345', 1);
INSERT INTO accounts VALUES (2, 'login_2', '67890', 2);

INSERT INTO payment VALUES (1, 100.0, '2022-09-09', 1);
INSERT INTO payment VALUES (2, 200.0, '2022-08-08', 2);

SELECT id, a.email, password, email, name
FROM users u
INNER JOIN accounts a ON u.account_id = a.id;

SELECT a.id, a.email, a.password, u.email, u.name
FROM users u
INNER JOIN accounts a ON u.account_id = a.id;

/*Важно отметить, что соединять можно больше двух таблиц.
  Например, чтобы соединить 3 таблицы, необходимо поместить второе предложение INNER JOIN
  после первого предложения INNER JOIN в виде следующего запроса.

Например, добавим таблицу:

И тогда запрос объединения 3 таблиц примет вид:

SELECT a.id, a.c1, b.id, b.c2
FROM A a
JOIN B b on a.id = b.a_id
JOIN C c on b.id = c.b_id;*/

SELECT u.id, u.email, u.name, a.login, a.password, p.amount, p.payment_date
FROM users u
INNER JOIN accounts a ON a.user_id = u.id
INNER JOIN payment p ON p.account_id = a.id;