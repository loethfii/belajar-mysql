Skip to content
Search or jump to…
Pull requests
Issues
Codespaces
Marketplace
Explore
 
@loethfii 
ProgrammerZamanNow
/
belajar-mysql-dasar
Public
Fork your own copy of ProgrammerZamanNow/belajar-mysql-dasar
Code
Issues
Pull requests
Actions
Projects
Security
Insights
belajar-mysql-dasar/products.sql
@khannedy
khannedy belajar mysql dasar
Latest commit 98894f1 on Dec 18, 2020
 History
 1 contributor
399 lines (300 sloc)  7.48 KB

CREATE TABLE products
(
    id          VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

SHOW TABLES;

DESCRIBE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

SELECT *
FROM products;

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P0003', 'Mie Ayam Ceker', 20000, 100),
       ('P0004', 'Mie Ayam Spesial', 25000, 100),
       ('P0005', 'Mie Ayam Yamin', 15000, 100);

SELECT *
FROM products;

SELECT id, name, price, quantity
FROM products;

SELECT name, quantity, id
FROM products;

ALTER TABLE products
    ADD PRIMARY KEY (id);

DESCRIBE products;

SHOW CREATE TABLE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

SELECT *
FROM products
WHERE quantity = 100;

SELECT *
FROM products
WHERE price = 15000;

SELECT *
FROM products
WHERE id = 'P0001';

SELECT *
FROM products
WHERE name = 'mie ayam bakso';

DESCRIBE products;

ALTER TABLE products
    ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-Lain')
        AFTER name;

SELECT *
FROM products;

SELECT *
FROM products
WHERE id = 'P0001';

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

UPDATE products
SET category    = 'Makanan',
    description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

UPDATE products
SET price = price + 5000
WHERE id = 'P0005';

INSERT INTO products(id, name, price, quantity)
VALUES ('P0009', 'Mie Ayam Original', 15000, 100);

DELETE
FROM products
WHERE id = 'P0009';

SELECT id       AS Kode,
       name     AS Nama,
       category AS Kategori,
       price    AS Harga,
       quantity AS Jumlah
FROM products;

SELECT p.id       AS Kode,
       p.name     AS Nama,
       p.category AS Kategori,
       p.price    AS Harga,
       p.quantity AS Jumlah
FROM products AS p;

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
       ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Keripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);

SELECT *
FROM products
WHERE quantity > 100;

SELECT *
FROM products
WHERE quantity >= 100;

SELECT *
FROM products
WHERE category != 'Makanan';

SELECT *
FROM products
WHERE category <> 'Minuman';

SELECT *
FROM products
WHERE quantity > 100
  AND price > 20000;

SELECT *
FROM products
WHERE category = 'Makanan'
  AND price < 20000;

SELECT *
FROM products
WHERE quantity > 100
   OR price > 20000;

SELECT *
FROM products
WHERE (category = 'Makanan' OR quantity > 500)
  AND price > 20000;

SELECT *
FROM products
WHERE name LIKE '%mie%';

SELECT *
FROM products
WHERE name LIKE '%bakso%';

SELECT *
FROM products
WHERE name LIKE '%usu%';

SELECT *
FROM products
WHERE description IS NULL;

SELECT *
FROM products
WHERE description IS NOT NULL;

SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE price NOT BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE category IN ('Makanan', 'Minuman');

SELECT *
FROM products
WHERE category NOT IN ('Makanan', 'Minuman');

SELECT id, category, name
FROM products
ORDER BY category;

SELECT id, category, price, name
FROM products
ORDER BY category ASC, price DESC;

SELECT *
FROM products
ORDER BY id
LIMIT 5;

SELECT *
FROM products
ORDER BY id
LIMIT 3;

SELECT *
FROM products
ORDER BY id
LIMIT 0, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 5, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 10, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 15, 5;
 
SELECT DISTINCT *
FROM products;

SELECT 10, 10, 10 * 10 as Hasil;

SELECT id, name, price, price DIV 1000 AS 'Price in K'
FROM products;

SELECT id, COS(price), SIN(price), TAN(price)
FROM products;

SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15;

SELECT id,
       LOWER(name)  as 'Name Lower',
       UPPER(name)  as 'Name Lower',
       LENGTH(name) as 'Name Length'
FROM products;

SELECT id,
       created_at,
       EXTRACT(YEAR FROM created_at)  as Year,
       EXTRACT(MONTH FROM created_at) as Month
FROM products;

SELECT id, created_at, YEAR(created_at) as 'tahun dibuat', MONTH(created_at) as 'bulan dibuat'
FROM products;

select * from products;

select id, name,
case category
when 'makanan' then 'enak'
when 'minuman' then 'segar'
else 'apa itu?'
end as kategori
from products;

select id, price,
case price
when price < 20000 then 'murah ko'
else 'ndok tau'
end as 'tanggapan harga?'
from products;

select id, price,
if(price <= 100000, 'Murah',
if(price >= 100000, 'mahal', 'mahal banhgry')
) as 'mahal?'
from products;

select id, price,
 if(price <= 100000, 'Murah', if(price >= 100000, 'mahal', 'mahal banhgry') ) as 'mahal?' from products;
 
 select id, price,
 if(price <= 100000, 'murahh', 'mahal') as 'tanggapan'
 from products;
 
 select name, price,
 if (price <= 20000, 'Murah', if(price <=100000, 'lumayan', 'muahal rek') ) 
 from  products;

select * from products;

select id, name, ifnull(`condition`, 'Baru') as 'Kondisi barang', ifnull(description, 'deskripsi kosong') as 'deskripsi'
 from products;
 
 select name , sum(price) as 'jumlah harga'
 from products;
 
 select count(id) as 'Totoal Product' from products;
 
 select max(price) as 'Harga Maximal' from products;
 
 select min(price) as 'Harga terendahh' from products;
 
 select avg(price) as 'Rata2 harga' from products;
 
 select sum(quantity) as 'Total stock' from products;
 
 select id, name
 from products order by id desc;
 
 
 select count(id) as 'Totoal Product', category from products group by category;
 
 select max(price) as 'Harga Maximal', category from products group by category order by price desc;
 
 select min(price) as 'Harga terendahh', category from products group by category;
 
 select avg(price) as 'Rata2 harga', category from products group by category;
 
 select sum(quantity) as 'Total stock', category from products group by category;
 
 
 select count(id) as 'total', category from products group by category
 having Total >= 2; 
 
 select name, quantity as 'total'  from products  having total > 3;
 
 select * from products order by id desc;
 
 update products
 set name = 'hemaviton jrenk c1000'
 where id = 11;
 
 describe products;
 
 alter table products
 add constraint price_check check (price >= 100);
 
 show create table products;
 
 insert into products (name, `condition`, category, description, price, quantity)
 value ('hemaviton jrenk', 'baru', 'kesehatan', 'menguatkan stamina, menambah nafsu makan', 24000 , 43);
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
