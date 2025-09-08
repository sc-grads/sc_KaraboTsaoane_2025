Create Table followers(
  id serial primary key ,
  created_at timestamp with time zone default current_timestamp ,
  leader_id integer not null references users(id) on delete cascade,
  follower_id integer not null references users(id) on delete cascade,
  unique(leader_id , follower_id)
);