CREATE TABLE departments (
                             id int primary key,
                             name text not null
);

CREATE TABLE employees (
                           id int primary key,
                           name text,
                           department_id int references departments(id)
);


INSERT INTO departments VALUES (1, 'Sales'),
                               (2, 'Marketing'),
                               (3, 'HR'),
                               (4, 'IT'),
                               (5, 'Production');

INSERT INTO employees VALUES (1, 'Ivan Ivanov', 1),
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