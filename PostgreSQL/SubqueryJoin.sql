SELECT first_name
FROM users 
JOIN (
SELECT user_id FROM orders WHERE product_id= 3
)As o
on o.user_id = users.id