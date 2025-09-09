select username , tags.created_at
from users
Join(
Select user_id , created_at from caption_tags
Union All
Select user_id , created_at from photo_tags
) As tags on tags.user_id = Users.id
where tags.created_at <'2010-01-07'
;