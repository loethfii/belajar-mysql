create table wishlist
(
	id int not null auto_increment,
    id_product int not null,
    description text,
    primary key (id),
    constraint fk_wishlist_product foreign key (id_product) references products(id)
	
) engine = innodb;

desc wishlist;

show create table wishlist;

alter table wishlist
drop constraint fk_wishlist_product;

alter table wishlist
add constraint fk_wishlist_product foreign key (id_product) references products(id);

insert into wishlist (id_product, description)
value (3,'Gas semoga kebeli');

drop table wishlist;


create table wishlist 
(
	id int auto_increment not null,
    id_product int not null,
    grup_wishlist varchar(100),
    description varchar(100) default 'Kosong',
    primary key(id),
    constraint fkw_product foreign key (id_product) references products(id)

)engine = innodb;

insert into wishlist(id_product,grup_wishlist)
values (13, 'vga card terbaru');

select * from wishlist;

show create table wishlist;

alter table wishlist
drop constraint fkw_product;

alter table wishlist
add constraint fkw_product foreign key (id_product) references products(id)
on delete cascade on update cascade;


select * from wishlist join products on (wishlist.id_product = products.id);

select wishlist.id as 'id wishlist', wishlist.grup_wishlist, products.price
from wishlist join products on (wishlist.id_product = products.id);

select w.grup_wishlist, p.name, p.quantity from wishlist as w join products as p on (w.id_product = p.id);


describe wishlist;

alter table wishlist
add column id_customer int after id_product;

alter table wishlist
add constraint fkw_customer foreign key (id_customer) references customers(id);


select * from wishlist;

update wishlist 
set id_customer = 6
where id in (2);


select * from wishlist as w join customers as c join products as p
on (w.id_product = p.id and w.id_customer = c.id);

select w.id as 'id wishlist' , 
c.first_name as 'nama kamu',
p.name as 'nama produk',
p.category as 'kategori',
p.price as 'harga',
p.quantity as 'sisa barang'
from wishlist as w 
join customers as c 
join products as p
on (w.id_product = p.id and w.id_customer = c.id);

show create table wishlist;

select w.id as 'id wishlist' , 
-- count(c.id) as 'jumlah wishlist',
c.id as 'customer id',
c.first_name as 'nama kamu',
p.name as 'nama produk',
p.category as 'kategori',
p.price as 'harga',
p.quantity as 'sisa barang'
from wishlist as w 
join customers as c 
join products as p
on (w.id_product = p.id and w.id_customer = c.id);

select * from wishlist;

describe wishlist;

ALTER table wishlist alter grup_wishlist SET DEFAULT 'Kosong';


insert into wishlist (id_product,id_customer)
values (2,4),(3,4),(4,4),(7,4); 

select 
count(c.id) as 'jumlah wishlist kamu'
from wishlist as w
join customers as c 
on (w.id_customer = c.id)
where c.id = 5 and email = 'juan@gmail.com';























































