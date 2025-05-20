create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	id varchar(20) primary key,
    name varchar(100),
    age int 
);

create table product(
	id varchar(20) primary key,
    name varchar(100),
    price double
);

create table `order`(
	id varchar(20) primary key,
    `date` datetime,
    total_price double,
    customer_id varchar(20),
    foreign key (customer_id) references customer(id)
);

create table order_detail(
	order_id varchar(20),
    product_id varchar(20),
    primary key(order_id, product_id),
    foreign key (order_id) references `order`(id),
    foreign key (product_id) references product(id),
    quantity int
);