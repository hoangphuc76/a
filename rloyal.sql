create database rloyal_demo

create table Product_Category(
	product_category_id int primary key,
	product_category_parent_id int ,
	product_category_name varchar(50),
	foreign key (product_category_parent_id) references Product_Category(product_category_id)
)

create table Product_Collection (
	product_collection_id int primary key,
	product_collection_name varchar(50),
	product_category_id int,
	foreign key (product_category_id) references Product_Category(product_category_id) 
)

create table Discount(
	discount_id int primary key,
	discount_name varchar,
	discount_percent decimal(10,2),
	active bit ,
	created_at date, 
	modified_at date,
	deleted_at date,
)

create table Product(
	product_id int primary key,
	product_name varchar(50),
	product_category_id int,
	product_collection_id int,
	created_at date, 
	modified_at date,
	deleted_at date,
	discount_id int,
	original_price decimal(10,2),
	sale_price decimal(10,2),
	foreign key(product_category_id) references Product_Category(product_category_id),
	foreign key(product_collection_id) references Product_Collection(product_collection_id),
	foreign key(discount_id) references Discount(discount_id),
)
drop table Product

drop table Product_Inventory
create table Product_Inventory(
	product_inventory_id int primary key ,
	quantity int
)


drop table Discount

create table Product_Item (
	product_item_id int primary key,
	product_id int,
	size int,
	product_inventory_id int unique,
	foreign key (product_id) references Product(product_id),
	foreign key (product_inventory_id) references Product_Inventory(product_inventory_id)
)

drop table Product_Item

create table Product_Info(
	product_id int primary key,
	product_desc varchar,
	full_desc varchar(500),
	diamondpave varchar,
	gemstone varchar,
	resizeable varchar,
	pendant varchar,
	colour varchar,
	foreign key (product_id) references Product(product_id) 
)

INSERT INTO Product_Category (product_category_id, product_category_parent_id, product_category_name) VALUES
(1, NULL, 'Jewelry'),
(2, NULL, 'Engagement and Wedding'),
(3, NULL, 'Watches'),
(4, NULL, 'Bags And Accessories'),
(5, NULL, 'Fragrances'),

(6, 1, 'Necklaces'),
(7, 1, 'Rings'),
(8, 1, 'Bracelets'),
(9, 1, 'Earrings'),
(10, 1, 'Cufflinks And More'),

(11, 2, 'Couple Rings'),
(12, 2, 'Engagement Rings'),
(13, 2, 'Women''s Wedding Bands'),
(14, 2, 'Men''s Wedding Bands'),
(15, 2, 'Diamond Gifts'),

(16, 3, 'Gold Watches'),
(17, 3, 'Rose Gold Watches'),
(18, 3, 'Diamond Watches'),
(19, 3, 'Skeleton Watches'),
(20, 3, 'Automatic Watches'),
(21, 3, 'Leather Watches'),

(22, 4, 'Bags'),
(23, 4, 'Wallets'),
(24, 4, 'Small Leather Goods'),
(25, 4, 'Leather Bracelets'),
(26, 4, 'Eyewear'),
(27, 3, 'Scarves And Stoles');


INSERT INTO Product_Collection (product_collection_id, product_collection_name, product_category_id) VALUES
(1, 'B.Zero1', 1),
(2, 'Serpenti', 1),
(3, 'Divas'' Dream', 1),
(4, 'Bvlgari Cabochon', 1),
(5, 'Bvlgari Bvlgari', 1),
(6, 'Fiorever', 1),
(7, 'Save the Children', 1),
(8, 'Monete', 1),

(9, 'Incontro d''Amore', 2),
(10, 'Infinito', 2),
(11, 'Dedicata a Venezia', 2),
(12, 'Marryme', 2),
(13, 'Fedi', 2),

(14, 'Serpenti', 3),
(15, 'Bvlgari Bvlgari', 3),
(16, 'Lvcea', 3),
(17, 'Divas''s Dream', 3),
(18, 'Octo', 3),
(19, 'Grandes Complications', 3),

(20, 'Serpenti', 4),
(21, 'Bvlagri Roma', 4),
(22, 'Bvlagri Logo', 4),
(23, 'B.Zero1', 4),
(24, 'Bvlgari Bvlgari', 4),
(25, 'Bvlgari Bvlgari Man', 4),

(26, 'Bvlagri Allegra', 5),
(27, 'Bvlagri Le Gemme', 5),
(28, 'Omnia', 5),
(29, 'Eau Paurfmée', 5),
(30, 'Petits et Mamans', 5),
(31, 'Bvlagri Man', 5);

create table Product(
	product_id int primary key,
	product_name varchar(50),
	product_category_id int,
	product_collection_id int,
	created_at date, 
	modified_at date,
	deleted_at date,
	discount_id int,
	original_price decimal(10,2),
	sale_price decimal(10,2),
	foreign key(product_category_id) references Product_Category(product_category_id),
	foreign key(product_collection_id) references Product_Collection(product_collection_id),
	foreign key(discount_id) references Discount(discount_id),
)

INSERT INTO Product (product_id, product_name, product_category_id, product_collection_id) VALUES
(1, 'B.Zero1 Necklace', 6, 1),
(2, 'Serpenti Viper Ring', 7, 2),
(3, 'Serpenti Viper Bracelet', 8, 2),
(4, 'Divas'' Dream Earrings', 9, 3),
(5, 'Bvlgari Cabochon Ring', 7, 4),
(6, 'Fiorever Pendant', 6, 6),
(7, 'Save the Children Necklace', 6, 7),
(8, 'Monete Bracelet', 8, 8),
(9, 'Incontro d''Amore Ring', 11, 9),
(10, 'Infinito Wedding Band', 12, 10)
(11, 'Dedicata a Venezia Engagement Ring', 11, 11),
(12, 'Marryme Wedding Band', 12, 11),
(13, 'Serpenti Watch', 16, 13),
(14, 'Lvcea Watch', 16, 14),
(15, 'Octo Watch', 16, 16),
(16, 'Bvlgari Bvlgari Bag', 21, 5),
(17, 'Bvlgari Allegra Fragrance', 22, 22),
(18, 'Omnia Fragrance', 24, 24),
(19, 'Bvlgari Man Fragrance', 27, 27)
