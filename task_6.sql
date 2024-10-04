/*добавьте сюда запрос для решения задания 6*/
/*6 из 6*/
SELECT COUNT(*) AS persons_from_usa_count 
FROM car_shop.persons 
WHERE phone LIKE '+1%';