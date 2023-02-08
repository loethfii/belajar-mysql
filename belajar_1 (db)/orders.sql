create table orders
(
	id int auto_increment not null primary key,
    total int not null,
    order_date datetime not null default current_timestamp
)engine = innodb;

desc orders;

create table orders_detail
(
	id_product int not null,
    id_order int not null,
    price int not null,
    quantity int not null,
    primary key (id_product,id_order)
)engine = innodb;

alter table orders_detail
add constraint fk_orders_id_product 
foreign key (id_product) references products(id);


alter table orders_detail
add constraint fk_orders_id_order 
foreign key (id_order) references orders(id);

desc orders_detail;

desc orders;

show create table orders_detail;

insert into orders (total)
values(6000),(7000),(300),(300),(300),(300);

select * from orders;

select * from orders_detail;

insert into orders_detail(id_product, id_order, price, quantity)
values (8,3, 390000, 10); 

select * from orders
join orders_detail on (orders_detail.id_order= orders.id)
join products on (orders_detail.id_product = products.id);

select * from orders_detail
join orders on (orders_detail.id_order = orders.id)
join products on (orders_detail.id_product = products.id); 




