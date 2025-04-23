CREATE TABLE departments
(
    id   int primary key,
    name text not null
);

CREATE TABLE employees
(
    id            int primary key,
    name          text,
    department_id int references departments (id)
);


INSERT INTO departments
VALUES (1, 'Sales'),
       (2, 'Marketing'),
       (3, 'HR'),
       (4, 'IT'),
       (5, 'Production');

INSERT INTO employees
VALUES (1, 'Ivan Ivanov', 1),
       (2, 'Petr Petrov', 1),
       (3, 'Olga Sergeeva', 2),
       (4, 'Michael Shnurov', 3),
       (5, 'Irina Trubkina', 4),
       (6, 'Evgenii Shtukov', null);


SELECT e.name, d.name
FROM departments d
         FULL OUTER JOIN employees e ON d.id = e.department_id;


SELECT e.name, d.name
FROM employees e
         FULL OUTER JOIN departments d ON e.department_id = d.id
WHERE e.name IS NULL;

SELECT e.name, d.name
FROM employees e
         FULL JOIN departments d ON e.department_id = d.id
WHERE d.name IS NULL;

SELECT *
FROM departments
         NATURAL JOIN employees;


/*
SELF JOIN – это соединение, которое соединяет таблицу с самой собой.
Чтобы сформировать SELF JOIN, мы указываем одну и ту же таблицу 2 раза с разными псевдонимами таблиц указываем условие объединения после ключевого слова ON.
SELF JOIN обычно используется для запроса иерархических данных. Например, рассматривая простейшую схему зависимости работников друг от друга
(у нас могут быть рядовые сотрудники и менеджеры),
чтобы получить список сотрудников и их руководителей – мы как раз и будем использовать SELF JOIN.*/

SELECT e.name, m.name
FROM employees e
         INNER JOIN employees m ON m.e_id = e.superviser_id



CREATE TABLE employee
(
    employee_id int primary key,
    name        text,
    manager_id  int references employee (employee_id)
);

INSERT INTO employee
VALUES (1, 'Petr', null),
       (2, 'Andrey', 1),
       (3, 'Elena', 1),
       (4, 'Anna', 2),
       (5, 'Stas', 2),
       (6, 'Sergey', 3),
       (7, 'Alex', 3),
       (8, 'Michael', 3);


Select e.name, m.name
FROM employee e
INNER JOIN employee m ON  m.employee_id = e.manager_id
ORDER BY m.name