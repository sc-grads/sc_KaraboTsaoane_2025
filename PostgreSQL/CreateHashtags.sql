Create Table hashtags(
  id serial Primary key , 
  created_at timestamp with time zone default current_timestamp,
  title varchar(20) not null unique
);