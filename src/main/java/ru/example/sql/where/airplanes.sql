CREATE TABLE airplanes
(
    id       int not null primary key,
    model    text,
    range    int,
    capacity int
);

INSERT INTO airplanes
VALUES (1, 'Airbus-320-200', 5700, 180);
INSERT INTO airplanes
VALUES (2, 'Airbus-321-200', 5600, 220);
INSERT INTO airplanes
VALUES (3, 'Airbus-319-100', 6700, 150);
INSERT INTO airplanes
VALUES (4, 'Cessna 208 Caravan', 1200, 13);
INSERT INTO airplanes
VALUES (5, 'Boeing 777-300', 11100, 450);
INSERT INTO airplanes
VALUES (6, 'Boeing 767-300', 7900, 350);
INSERT INTO airplanes
VALUES (7, 'Boeing 737-300', 4200, 145);
INSERT INTO airplanes
VALUES (8, 'Sukhoi SuperJet-100', 3000, 98);
INSERT INTO airplanes
VALUES (9, 'Bombardier CRJ-200', 2700, 50);


/* При проверке условия значение в столбце соответствовало какому-то интересующему нас шаблону.
  В этом случае используется оператор LIKE. Этот оператор используется вместе с
  символом "%" - он соответствует любой последовательности символов,
   вместо него могут быть подставлены любые символы в любом количестве, а может быть не подставлено ни одного символа.
   Синтаксис будет выглядеть следующим образом:
SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE столбец_для_проверки LIKE 'подстрока%';*/
SELECT *
FROM airplanes a
WHERE a.model LIKE 'Airbus%';

SELECT *
FROM airplanes a
WHERE a.model LIKE '%200';

/*Также используется символ "_" - он соответствует в точности одному любому символу.
  При этом указанные символы в шаблоне могут присутствовать одновременно. Синтаксис будет выглядеть следующим образом (указан лишь пример):

SELECT имена_столбцов_через_запятую FROM название_таблицы WHERE столбец_для_проверки LIKE '__подстрока%';*/

SELECT *
FROM airplanes a
WHERE a.model LIKE '___b%';

/* При этом иногда необходимо сделать выборку строк чтобы при проверке условия значение в столбце
  не соответствовало какому-то интересующему нас шаблону.
  В этом случае используется оператор NOT LIKE
   Шаблон в операторе NOT LIKE всегда покрывает всю анализируемую строку. Поэтому % может быть в начале строки, в конце строки,
   а также быть в начале и в конце - в таком случае мы можем найти последовательность символов внутри строки.*/
SELECT *
FROM airplanes a
WHERE a.model NOT LIKE 'Airbus%' AND a.model NOT LIKE 'Boeing%';

/*При этом, чтобы ограничить количество строк в выборке используется предложение LIMIT,
  Которое указывается в конце запроса и после него указывается количество строк, которое должно попасть в результаты выборки.*/
SELECT *
FROM airplanes a
WHERE a.model NOT LIKE 'Airbus%' AND a.model NOT LIKE 'Boeing%' LIMIT 1;



