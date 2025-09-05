Create table orders(
	id serial primary key ,
	name Varchar(40) not null ,
	created_at Timestamp not null ,
	est_delivery Timestamp not null,
	check(created_at < est_delivery)
);