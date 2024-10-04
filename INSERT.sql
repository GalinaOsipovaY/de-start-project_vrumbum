/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/

/*заполнение таблицы brands*/
insert into car_shop.brands (brand_name, gasoline_consumption, brand_origin)
select distinct SPLIT_PART(auto, ',', 1) as brand_name, 
                gasoline_consumption,
                brand_origin
from raw_data.sales;


/*заполнение таблицы colors*/
insert into car_shop.colors (color_name)
select distinct SPLIT_PART(auto, ',', 2) as color_name
from raw_data.sales;


/*заполнение таблицы persons*/
insert into car_shop.persons (person_name, phone)
select distinct person_name, phone
from raw_data.sales;


/*заполнение таблицы sales*/
insert into car_shop.sales (id, brand_id, color_id, price, date, person_id, discount)
select s.id, b.brand_id, c.color_id, s.price, date , p.person_id, s.discount
from raw_data.sales s
left join car_shop.brands b on  b.brand_name = SPLIT_PART(s.auto, ',', 1) 
                             and coalesce(b.gasoline_consumption, 0) = coalesce(s.gasoline_consumption, 0)
                             and coalesce(b.brand_origin, 'нет') = coalesce(s.brand_origin, 'нет')
left join car_shop.colors c on c.color_name = SPLIT_PART(s.auto, ',', 2)
left join car_shop.persons p on p.person_name = s.person_name
                             and p.phone = s.phone;