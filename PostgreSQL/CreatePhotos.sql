select contents , username 
FROM COMMENTS 
JOIN users on users.id = COMMENTS.user_id;