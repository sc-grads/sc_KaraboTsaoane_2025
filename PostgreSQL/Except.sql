(
  SELECT *
  FROM Products
  order BY price DESC
  Limit 4
)
EXCEPT
(
  SELECT *
  FROM Products
  order BY price/weight DESC
  Limit 4
);