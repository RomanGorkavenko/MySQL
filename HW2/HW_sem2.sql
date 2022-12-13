/*
1. Используя операторы языка SQL, создайте таблицу “sales”.
Заполните ее данными. Справа располагается рисунок к первому заданию.
*/
CREATE DATABASE hw_sem2;

USE hw_sem2;

CREATE TABLE sales
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);

INSERT sales(order_date, count_product)
VALUES
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);
    
SELECT *
FROM sales;

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
От 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT id,
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product < 300 THEN "Средний заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "FAIL"
    END AS `Тип заказа`
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE orders
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(45) NOT NULL,
amount DECIMAL(6,2) NOT NULL,
order_status VARCHAR(45) NOT NULL
);

INSERT orders(employee_id, amount, order_status)
VALUE
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");
    
SELECT *
FROM orders;

/*
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

SELECT id, order_status,
if(order_status = "OPEN", "Order is in open state",
	if(order_status = "CLOSED", "Order is closed",
		if(order_status = "CANCELLED", "Order is cancelled", "value is not found")))
AS `full_order_status`
FROM orders;

-- 4.  Чем 0 отличается от NULL?
/*
NULL означает пустое ни чем не заполненое значение (пустая ячейка таблицы).
0 это конкретное числовое значеие.
*/
