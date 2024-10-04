/*добавьте сюда запрос для решения задания 5*/
/*5 из 6*/
SELECT b.brand_origin,
       MAX(s.price + s.price*s.discount/100) AS price_max, /*самая большая цена без учёта скидки*/
       MIN(s.price + s.price*s.discount/100) AS price_min /*самая маленькая цена без учёта скидки*/
FROM car_shop.sales s
inner JOIN car_shop.brands b ON s.brand_id = b.brand_id 
                             and b.brand_origin is not null
GROUP BY b.brand_origin; /*в условии не указана сортировка*/