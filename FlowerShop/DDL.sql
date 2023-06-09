create table fl_customers(
customer_id int primary key,
first_name varchar(100) NOT NULL,
last_name varchar(100) NOT NULL,
address varchar(100),
phone varchar (100)
);


create table fl_orders(
order_id int primary key,
customer_id int not null,
branch_id int not null,
order_date date not null,
constraint fl_orders_customer_id_FK foreign key(customer_id) references fl_customers(customer_id),
constraint fl_orders_branch_id_FK foreign key(branch_id) references fl_branches(branch_id)
);

create table fl_flowers (
flower_id int primary key,
flower_name varchar(100) not null,
price number not null,
supplier_id int not null, 
CONSTRAINT fl_flowers_supplier_id_FK FOREIGN KEY (supplier_id) REFERENCES fl_suppliers(supplier_id),
CONSTRAINT CHK_price CHECK (price>0)
);

create table fl_suppliers(
supplier_id number primary key,
name varchar2(100) not null,
address varchar2(100) not null
);

create table fl_orderdetails(
order_id int not null,
flower_id int not null,
quantity int not null,
constraint fl_orderdetails_orders_id_FK foreign key(order_id) references fl_orders(order_id),
constraint fl_orderdetails_flowers_id_FK foreign key(flower_id) references fl_flowers(flower_id),
CONSTRAINT CHK_quantity CHECK (quantity >0)
);

create table fl_branches(
branch_id int primary key,
location varchar(100) NOT NULL,
phone varchar(100) NOT NULL
);
