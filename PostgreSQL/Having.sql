SELECT photo_id , count(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING Count(*) >2;