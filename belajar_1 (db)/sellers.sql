create table sellers
(
	id int not null auto_increment,
    name varchar(100) not null,
    name2 varchar(100) ,
    name3 varchar(100) ,
    email varchar (100) not null,
    primary key(id),
    unique key email_unique(email),
    index name_index(name),
    index name_index2(name2),
    index name_index3(name3),
    index name_index_name_index2_name_index3(name,name2,name3)
) engine = innodb;

use belajar_1;

desc sellers;

drop table sellers;

show create table sellers;


select * from orders
join orders_detail on (orders_detail.id_order= orders.id)
join products on (orders_detail.id_product = products.id);
















