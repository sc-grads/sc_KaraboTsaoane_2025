Create Table likes(
  id serial primary key,
  created_at timestamp with time zone default current_timestamp,
  user_id integer not null references users(id) on delete cascade,
  comment_id integer references comments(id) on delete cascade,
  post_id integer references posts(id) on delete cascade,
  check(
	Coalesce((post_id)::Boolean::Integer,0)
	+
	Coalesce((comment_id)::Boolean::Integer,0)
	= 1
  ),
  Unique(user_id , post_id , comment_id)
);