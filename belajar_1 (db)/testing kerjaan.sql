create table data
(
	data_id int primary key auto_increment,
    data_nama varchar(100) not null
) engine = innodb;

desc data;

insert into data (data_nama)
values ('Test 1'), ('Test 2');

create table data_detail(
data_id int not null,
data_key varchar(50) not null,
data_val varchar(100) not null
);

INSERT INTO data_detail VALUES (1, 'key 1', 'Val 1');

select * from data;

select * from data_detail; 

select data.data_id as ID, data.data_nama as Nama, ifnull(data_detail.data_key,'No Data') as Data_key, ifnull(data_detail.data_val,'No Data') as data_val  from data
left join data_detail
on (data_detail.data_id = data.data_id);


create table saldo (
saldo_id int primary key auto_increment,
saldo_tanggal datetime not null,
user_id int not null,
saldo_value int not null
);

desc saldo;

INSERT INTO saldo VALUES (1, '2020-10-01 13:00', 1, 10000);
INSERT INTO saldo VALUES (2, '2020-10-01 14:00', 1, 15000);
INSERT INTO saldo VALUES (3, '2020-10-01 15:00', 1, 20000);
INSERT INTO saldo VALUES (4, '2020-10-01 13:00', 2, 25000);
INSERT INTO saldo VALUES (5, '2020-10-01 13:00', 3, 30000);
INSERT INTO saldo VALUES (6, '2020-10-01 14:00', 3, 50000);

select * from saldo;

select sum(saldo_value) 
from saldo
group by user_id;


create table projection(
projection_id int primary key auto_increment,
projection_tanggal datetime not null,
user_id int not null,
saldo_id int not null,
projection_value int not null
);

desc projection;

insert into projection (projection_id,projection_tanggal,user_id, saldo_id,projection_value)
values (1, '2020-11-02 03:20:38	1	3	45000',1);

INSERT INTO projection (projection_tanggal, user_id, saldo_id, projection_value)
SELECT '2020-11-02 03:20:38', user_id, MAX(saldo_id), SUM(saldo_value)
FROM saldo
group by user_id;


select * from projection;

drop table projection;




















