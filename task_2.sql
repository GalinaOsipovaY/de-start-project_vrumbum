/*добавьте сюда запрос для решения задания 2*/
/*2 из 6*/
SELECT b.brand_name, --название бренда
       EXTRACT(YEAR FROM s.date)  AS year, /*годы*/
       ROUND(AVG(s.price), 2) AS price_avg /*средняя цена с учетом скидки с огруглением до 2ого знака*/
FROM car_shop.sales s
inner join car_shop.brands b ON s.brand_id = b.brand_id
GROUP BY b.brand_name, year
ORDER BY b.brand_name ASC, year ASC; /*по названию бренда и году в восходящем порядке*/