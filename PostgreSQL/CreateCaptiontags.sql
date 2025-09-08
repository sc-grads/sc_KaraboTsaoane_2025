Create Table caption_tags(
  id serial primary key ,
  created_at timestamp with time zone default current_timestamp,
  user_id integer not null references users(id) on delete cascade,
  post_id integer not null  references posts(id) on delete cascade,
  unique (user_id , post_id)
);