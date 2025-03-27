CREATE TABLE colors (
                        id int primary key,
                        name text
);

CREATE TABLE actions (
                         number int primary key,
                         description text,
                         color_id int references colors(id)
);

INSERT INTO colors VALUES(1, 'red');
INSERT INTO colors VALUES(2, 'black');

INSERT INTO actions VALUES (1, 'draw red', 1);
INSERT INTO actions VALUES (2, 'use black hole', 2);


SELECT name, description
FROM actions a
INNER JOIN colors c on c.id = a.color_id;


/*Для того чтобы сделать выборку данных из таблицы А,
  которые могут иметь или не иметь соответствующие строки в таблице В, то необходимо использовать предложение LEFT JOIN.*/

  SELECT id, name, number, description
  FROM colors c
  LEFT JOIN actions a ON c.id = a.color_id;