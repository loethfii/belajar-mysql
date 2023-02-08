create table categories
(
	id int auto_increment not null,
    name varchar(100) not null,
    primary key(id)
)engine = innodb;

drop table category;

use belajar_1;

describe categories;

insert into categories(name)
values ('VGA CARD'),('Motherboard Intel'),('Motherboard Amd'), ('Perawatan Badan'), ('Makanan'),('Smartphone android');

select * from categories;

update categories
set name = 'makanan dan minuman'
where id = 5;

insert into categories(name)
values ('Oleh - Oleh'),('Alat Olahraga');





