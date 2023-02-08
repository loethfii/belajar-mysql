create table wallet
(
	id int auto_increment primary key not null,
    id_customer int not null,
    balance int not null default 0,
    unique key id_customer_unique (id_customer),
    foreign key fk_wallet_customer(id_customer) references customers(id)
) engine = InnoDB;

show create table wallet;

describe wallet;

insert into wallet (id_customer) values (1),(4),(5);

select customers.first_name, wallet.balance from wallet 
join customers 
on (wallet.id_customer = customers.id);

