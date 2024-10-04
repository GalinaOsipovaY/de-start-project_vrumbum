/*добавьте сюда запрос для решения задания 1*/
/*1 из 6*/
SELECT (SELECT COUNT(*) FROM car_shop.brands WHERE gasoline_consumption IS NULL) * 100.0 / COUNT(*) AS percentage_without_gasoline_consumption
FROM car_shop.brands;