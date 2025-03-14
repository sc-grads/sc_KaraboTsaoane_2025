SELECT product_name, brand_id, list_price
FROM [BikeStores].[production].[products]
WHERE brand_id IN (
    SELECT brand_id 
    FROM [BikeStores].[production].[products] 
    GROUP BY brand_id
    HAVING AVG(list_price) > 1000
);

