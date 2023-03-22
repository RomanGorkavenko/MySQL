CREATE DATABASE hw_sem3;

USE hw_sem3;

CREATE TABLE `workers`
(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45),
`surname` VARCHAR(45),
`speciality` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT `workers`(`name`, `surname`, `speciality`, `seniority`, `salary`, `age`)
VALUES
	("Вася", "Васькин", "начальник", 40, 100000, 60),
	("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Катина", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59),
    ("Петр", "Петров", "рабочий", 20, 25000, 40),
    ("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "рабочий", 8, 19000, 28),
    ("Юра", "Юркин", "рабочий", 5, 15000, 25),
    ("Максим", "Воронин", "рабочий", 2, 11000, 22),
    ("Юра", "Галкин", "рабочий", 3, 12000, 24),
    ("Люся", "Люськина", "уборщик", 10, 10000, 49);
    
SELECT * FROM workers;

-- 1. Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT id, name, speciality, salary
FROM workers
ORDER BY salary;

SELECT id, name, speciality, salary
FROM workers
ORDER BY salary DESC;

-- 2 Выведите 5 максимальных зарплат (salary)
SELECT salary
FROM workers
GROUP BY salary
ORDER BY salary DESC
LIMIT 5;

-- 3. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
SELECT speciality, SUM(salary) AS salary
FROM workers
GROUP BY speciality;

-- 4. Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
SELECT speciality, COUNT(speciality) AS count
FROM workers
WHERE speciality = 'рабочий' AND age >= 24 AND age <= 42;

-- 5. Найти количество специальностей
SELECT speciality, COUNT(speciality) AS count
FROM workers
GROUP BY speciality;

-- 6. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
SELECT speciality
FROM workers
GROUP BY speciality
HAVING AVG(age) < 44;
