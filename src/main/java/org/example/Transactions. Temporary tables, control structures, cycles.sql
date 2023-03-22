CREATE DATABASE hw_sem6;

USE hw_sem6;

-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER //

CREATE FUNCTION `times`(`second` INT) 
RETURNS VARCHAR(45) 
DETERMINISTIC
BEGIN
	DECLARE `time` VARCHAR(45);
    if (`second` <= 86399999) THEN
		SET `time` = concat(
							cast(floor(`second` / (24 * 3600)) AS CHAR(3)), ' days ',
							cast(floor((`second` % (24 * 3600)) / 3600) AS CHAR(2)), ' hours ',
							cast(floor(((`second` % (24 * 3600)) % 3600) / 60 ) AS CHAR(2)), ' minutes ',
							cast(floor(((`second` % (24 * 3600)) % 3600) % 60 ) AS CHAR(2)), ' seconds'
							);
                            RETURN (`time`);
    ELSE
		RETURN ('Введите значение меньше 86399999');
	END IF;
END//

DELIMITER ;

SELECT `times`(86399999) AS `time`;

-- 2. Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DELIMITER //

CREATE PROCEDURE `numbers`() 
BEGIN
    DECLARE `temp` INT DEFAULT 2;
    WHILE `temp` <= 10 DO
		SELECT `temp`;
        SET `temp` = `temp` + 2;
    END WHILE;
END//

-- Вывод строкой
DELIMITER ;

CALL `numbers`();

DELIMITER //

CREATE PROCEDURE `numbers_string`() 
BEGIN
	DECLARE `result` VARCHAR(45) DEFAULT '';
    DECLARE `temp` INT DEFAULT 2;
    WHILE `temp` <= 10 DO
		if (`result` = '') THEN
			SET `result` = CAST(`temp` AS CHAR(2));
            SET `temp` = `temp` + 2;
		ELSE
			SET `result` = CONCAT(`result`, ' ,',CAST(`temp` AS CHAR(2)));
			SET `temp` = `temp` + 2;
		END IF;
    END WHILE;
    SELECT `result`;
END//

DELIMITER ;

CALL `numbers_string`();