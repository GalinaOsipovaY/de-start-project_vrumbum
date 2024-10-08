/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/

/*заполнение таблицы brand_origin*/
insert into car_shop.brand_origin (brand_origin_name)
select distinct brand_origin
from raw_data.sales
where brand_origin is not null;


/*заполнение таблицы brands*/
insert into car_shop.brands (brand_name, brand_origin_id)
select distinct SPLIT_PART(s.auto, ' ', 1) as brand_name,
                bo.brand_origin_id
from raw_data.sales s
left join car_shop.brand_origin bo on coalesce(bo.brand_origin_name, 'no') = coalesce(s.brand_origin, 'no');

/*заполнение таблицы models*/
insert into car_shop.models (brand_id, model_name, gasoline_consumption)
select distinct b.brand_id,
                (SPLIT_PART(SPLIT_PART(s.auto, ',', 1), ' ', 2) || ' ' || SPLIT_PART(SPLIT_PART(s.auto, ',', 1), ' ', 3)) as model_name,
                s.gasoline_consumption
from raw_data.sales s
left join car_shop.brands b on b.brand_name = SPLIT_PART(s.auto, ' ', 1);

/*заполнение таблицы colors*/
insert into car_shop.colors (color_name)
select distinct SPLIT_PART(auto, ',', 2) as color_name
from raw_data.sales;

/*заполнение таблицы persons*/
insert into car_shop.persons (person_name, phone)
select distinct person_name, phone
from raw_data.sales;

/*заполнение таблицы sales*/
insert into car_shop.sales (id, model_id, color_id, price, date, person_id, discount)
select s.id, m.model_id, c.color_id, s.price, date , p.person_id, s.discount
from raw_data.sales s
left join car_shop.models m on m.model_name = (SPLIT_PART(SPLIT_PART(s.auto, ',', 1), ' ', 2) || ' ' || SPLIT_PART(SPLIT_PART(s.auto, ',', 1), ' ', 3))
                            and coalesce(m.gasoline_consumption, 0) = coalesce(s.gasoline_consumption, 0)
left join car_shop.colors c on c.color_name = SPLIT_PART(s.auto, ',', 2)
left join car_shop.persons p on p.person_name = s.person_name
                             and p.phone = s.phone;