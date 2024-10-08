/*добавьте сюда запрос для решения задания 4*/
/*4 из 6*/
select p.person_name AS person, /*пользователь*/
      STRING_AGG(b.brand_name||' '||m.model_name, ', ') AS cars /*список купленных машин у каждого пользователя через запятую*/
from car_shop.sales s
inner JOIN car_shop.models m ON s.model_id = m.model_id
inner JOIN car_shop.brands b ON b.brand_id = m.brand_id
-- inner JOIN car_shop.models m ON s.model_id = m.model_id
inner JOIN car_shop.persons p ON s.person_id = p.person_id
GROUP by p.person_id, p.person_name
ORDER by p.person_name ASC;/*по имени пользователя в восходящем порядке*/