Create Table photo_tags(
  id serial primary key,
  created_at timestamp with time zone default current_Timestamp,
  updated_at timestamp with time zone default current_Timestamp,
  user_id integer not null references users(id) on delete cascade,
  post_id integer not null references posts(id) on delete cascade,
  x integer not null ,
  y integer not null,
  unique(user_id , post_id)
);