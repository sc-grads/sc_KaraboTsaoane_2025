select url , username 
FROM photos 
RIGHT JOIN users On users.id = photos.user_id;