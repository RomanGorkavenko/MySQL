CREATE DATABASE hw_sem5;

USE hw_sem5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
LOAD DATA
-- Путь по которому положил файл "C:\ProgramData\MySQL\MySQL Server 8.0\Data\hw_sem5\test_db.csv"
INFILE 'test_db.csv'
INTO TABLE cars
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT *
FROM cars;

CREATE VIEW `V_cars` AS
SELECT *
FROM cars
WHERE cost <= '25000';

SELECT *
FROM `V_cars`;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW `V_cars` AS
SELECT *
FROM cars
WHERE cost <= '30000';

SELECT *
FROM `V_cars`;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW `V2_cars` AS
SELECT *
FROM cars
WHERE name IN('Skoda', 'Audi');

SELECT *
FROM `V2_cars`;

-- ========================================================================
/*Добавьте новый столбец под названием «время до следующей станции».\
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно.
Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной строки со следующей строкой,
чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.*/

CREATE TABLE stations
(
train_id INT NOT NULL,
station varchar(20) NOT NULL,
station_time TIME NOT NULL
);

INSERT stations(train_id, station, station_time)
VALUES
	(110, "SanFrancisco", "10:00:00"),
	(110, "Redwood Sity", "10:54:00"),
	(110, "Palo Alto", "11:02:00"),
	(110, "San Jose", "12:35:00"),
	(120, "SanFrancisco", "11:00:00"),
	(120, "Palo Alto", "12:49:00"),
	(120, "San Jose", "13:30:00");

SELECT *
FROM stations;

SELECT *,
TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id), station_time) AS time_to_the_next_station
FROM stations;

-- С заменой NULL
SELECT *,
TIMEDIFF(IFNULL(LEAD(station_time) OVER(PARTITION BY train_id), station_time), station_time) AS time_to_the_next_station
FROM stations;
