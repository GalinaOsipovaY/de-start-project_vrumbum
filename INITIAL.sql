/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/
/*создание схемы raw_data*/
CREATE schema raw_data /*или CREATE SCHEMA IF NOT EXISTS raw_data*/
;

/*создание таблицы sales в схеме raw_data*/
CREATE TABLE raw_data.sales (
id SMALLINT PRIMARY KEY,
auto VARCHAR, /*буквы и цифры*/
gasoline_consumption numeric(3, 1) null, /*м.б. пустым*/
price numeric (9, 2), /*цена с учетом скидки, м.б. больше семизначной суммы, знак после запятой определен исходя из входных данных*/
"date" DATE,
person_name VARCHAR,
phone VARCHAR, /*телефон пользователя не меняется*/
discount numeric (4, 2), /*знак после запятой определен исходя из входных данных*/
brand_origin VARCHAR /*буквы, м.б. пустым*/
);

/*copy d sql shell*/
\copy raw_data.sales(id,auto,gasoline_consumption,price,date,person_name,phone,discount,brand_origin) FROM 'C:\Dev\Temp\cars.csv' WITH (FORMAT csv, HEADER, DELIMITER ',', NULL 'null');