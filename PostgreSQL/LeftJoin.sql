select url , username
FROM photos
LEFT JOIN users on users.id;