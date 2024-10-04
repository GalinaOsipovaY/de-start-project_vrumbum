/*добавьте сюда запрос для решения задания 3*/
/*3 из 6*/
SELECT EXTRACT(month from date) AS month, /*месяца*/
       EXTRACT(YEAR from date) AS year, /*годы*/
       ROUND(AVG(price), 2) AS price_avg /*цена с учетом скидки с огруглением до 2ого знака*/
FROM car_shop.sales
WHERE EXTRACT(YEAR from date) = 2022 
GROUP BY month, year
ORDER BY month ASC; /*по месяцам в восходящем порядке*/