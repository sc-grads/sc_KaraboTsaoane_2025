Create Table hashtags_posts(
  id serial Primary key , 
  hashtag_id integer not null references hashtags(id) on delete cascade,
  post_id integer not null references posts(id)  on delete cascade,
  unique(hashtag_id , post_id)
);