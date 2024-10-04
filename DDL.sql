/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/

/*создание схемы car_shop*/
CREATE schema car_shop /*создание схемы (или CREATE SCHEMA IF NOT EXISTS car_shop)*/
;

/*создание таблицы brands*/
CREATE TABLE car_shop.brands (
    brand_id serial PRIMARY KEY,
    brand_name VARCHAR NOT NULL, /*в названии могут быть и цифры, и буквы*/
    gasoline_consumption numeric(3, 1) null, /*м.б. пустым*/
    brand_origin VARCHAR null /*буквы, м.б. пустым*/
);

/*создание таблицы colors*/
CREATE TABLE car_shop.colors (
    color_id serial PRIMARY KEY,
    color_name VARCHAR NOT NULL UNIQUE /*буквы*/
);

/*создание таблицы persons*/
CREATE TABLE car_shop.persons (
    person_id serial PRIMARY KEY,
    person_name VARCHAR NOT NULL, /*в названии буквы*/
    phone VARCHAR /*телефон не меняется согласно условию, в названии цифры и символы*/
);

/*создание таблицы sales*/
CREATE TABLE car_shop.sales (
id SMALLINT PRIMARY KEY, 
brand_id serial NOT NULL,
color_id serial NOT NULL,
price numeric (9, 2) NOT NULL, /*исходя из анализа исходных данных, не м.б. пустым, м.б. больше семизначной суммы, знак после запятой определен исходя из входных данных*/
"date" DATE NOT NULL, /*не м.б. пустым иначе не было бы продажи*/
person_id serial NOT NULL,
discount numeric (4, 2) NOT NULL, /*исходя из анализа исходных данных, в исходных данных null нет, знак после запятой определен исходя из входных данных*/
FOREIGN KEY (brand_id) REFERENCES car_shop.brands(brand_id),
FOREIGN KEY (color_id) REFERENCES car_shop.colors(color_id),
FOREIGN KEY (person_id) REFERENCES car_shop.persons(person_id)
);