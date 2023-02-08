describe customers;

select * from customers;

update customers
set first_name = 'fefe'
where id = 4;

insert into customers (email, first_name, last_name)
values ('juan@gmail.com', 'Juan', 'Arsy'), ('wahyu@gmail.com', 'Wahyu', 'Aminoto'), ('Frenklin@gmail.com', 'Frengklin', 'Fanouten');