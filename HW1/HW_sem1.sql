CREATE DATABASE hw_sem1;

USE hw_sem1;

CREATE TABLE phones 
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ProduktName VARCHAR(45) NOT NULL,
Manufacturer VARCHAR(45) NOT NULL,
ProduktCount INT NOT NULL,
Price INT NOT NULL
);

INSERT phones(ProduktName, Manufacturer, ProduktCount, Price)
VALUES
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);

SELECT *
FROM phones;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProduktName, Manufacturer ,Price
FROM phones
WHERE ProduktCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM phones
WHERE Manufacturer = "Samsung";

/*
4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE”):
	4.1. Товары, в которых есть упоминание "Iphone"
	4.2. "Galaxy"
	4.3.  Товары, в которых есть ЦИФРЫ
	4.4.  Товары, в которых есть ЦИФРА "8" 
*/

-- 4.1
SELECT * 
FROM phones
WHERE ProduktName LIKE "iPhone%";

-- 4.2
SELECT * 
FROM phones
WHERE ProduktName LIKE "Galaxy%";

-- 4.3
SELECT *
FROM phones
WHERE ProduktName RLIKE "[0-9]";

-- 4.4
SELECT *
FROM phones
WHERE ProduktName RLIKE "[8]";
