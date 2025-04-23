CREATE TABLE films (
                       film_id int primary key,
                       title text,
                       length int
);

INSERT INTO films VALUES (1, 'Resurrection Silverado', 117),
                         (2, 'Graffiti Love', 117),
                         (3, 'Affair Prejudice', 117),
                         (4, 'Hurricane Affair', 49),
                         (5, 'Hook Chariots', 49),
                         (6, 'Heavenly Gun', 49),
                         (7, 'Doors President', 49),
                         (8, 'Sense Greek', 54),
                         (9, 'October Submarine', 54),
                         (10, 'Kill Brotherhood', 54);


SELECT
    f1.title AS title,
    f2.title AS title,
    f1.length AS length
FROM
    films f1
        INNER JOIN
    films f2 ON f1.length = f2.length AND f1.film_id != f2.film_id

