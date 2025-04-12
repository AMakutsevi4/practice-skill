CREATE TABLE authors
(
    a_id   int primary key,
    a_name text
);

CREATE TABLE books
(
    b_id      int primary key,
    b_name    text,
    author_id int references authors (a_id)
);

INSERT INTO authors
VALUES (1, 'Bruce Eckel'),
       (2, 'Robert Lafore'),
       (3, 'Andrew Tanenbaum');

INSERT INTO books
VALUES (1, 'Modern Operating System', 3),
       (2, 'Thinking in Java', 1),
       (3, 'Computer Architecture', 3);

SELECT a_name, b_name
FROM authors a
CROSS JOIN books;

SELECT a_name, b_name
FROM authors, books