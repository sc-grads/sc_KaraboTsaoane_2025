create materialized View weekly_likes as(
select 
	date_trunc('week' , coalesce(posts.created_at , comments.created_at)) as week ,
	Count(posts.id) as num_likes_for_posts,
	Count(comments.id) as num_likes_for_comments
	from likes
	left join posts on posts.id = likes.post_id
	left join comments on comments.id = likes.comment_id
	Group by week
	order by week
) with data;