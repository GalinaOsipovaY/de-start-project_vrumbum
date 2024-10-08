/*добавьте сюда запрос для решения задания 5*/
/*5 из 6*/
SELECT bo.brand_origin_name as brand_origin,
       MAX(s.price*100/(100-s.discount)) AS price_max, /*самая большая цена без учёта скидки*/
       MIN(s.price*100/(100-s.discount)) AS price_min /*самая маленькая цена без учёта скидки*/
FROM car_shop.sales s
inner JOIN car_shop.models m ON s.model_id = m.model_id
inner JOIN car_shop.brands b ON b.brand_id = m.brand_id
left JOIN car_shop.brand_origin bo ON bo.brand_origin_id = b.brand_origin_id
where bo.brand_origin_id is not null
GROUP BY bo.brand_origin_name; /*в условии не указана сортировка*/