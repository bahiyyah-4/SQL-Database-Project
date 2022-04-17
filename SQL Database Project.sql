

# DDL - Create 
create database store;
use store ;
# countries
create table countries (
 code  integer primary key, 
  name varchar(20) unique ,
  continent_name varchar(20) not null
);
# users
create table users(
 id int primary key ,
 full_name varchar(20) ,
 email varchar(20) unique ,
 gender char(1) check(gender ="m" or gender = "f"),
 date_of_birth varchar(15),
 created_at datetime  , 
 country_code int ,
 foreign key (country_code) references countries(code)
);
# orders 

create table orders (
  id int primary key ,
  user_id int ,
  foreign key(user_id) references users(id) ,
  status varchar(6) check(status= 'start' or status= 'finish'),
  created_at datetime
);
#  products 
create table products (
 id int primary key ,
 name varchar(10) not null,
 price int default 0,
 status varchar(10) check(status= 'valid' or status= 'expired'),
 created_at datetime default current_timestamp on update current_timestamp
);
#  order_products 
create table order_products (
  order_id int ,
  foreign key(order_id) references orders(id) ,
  product_id int , 
  foreign key(product_id) references products(id) ,
  quantity int default 0
);

# insert DML
# countries
insert into countries values (1 , 'test', 'first');
#select * from countries;
# users
insert into users values (1 , 'bahiyyah', 'bahiab144@gmail.com', 'f', "1997/07/10", '2022-04-17 02:13:00', 1);
#select * from users;
#orders
insert into orders values (1 , 1, 'start', '2022-04-17 02:29:00');
#select * from orders;
#  products
insert into products values (1 ,'test', 10,'valid','2022-04-17 02:30:00');
#select * from products;
#  order_products 
insert into order_products values(1 ,1, 1);
#select * from order_products;
#  Update countries
update countries set name='saudi arabia' where code='1';
# DML Delete order_products and products
delete from order_products where order_id='1';

# DQL Select 
select * from users;
select * from countries;
select * from orders;
select * from order_products;
select * from products;


