SELECT brand_id, AVG(list_price) AS avg_price
FROM [BikeStores].[production].[products]
GROUP BY brand_id
HAVING AVG(list_price) > 1000;

