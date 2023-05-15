
/* Brand Analysis: This query selects the brand column and counts the number of products for each brand from the Cosmetics table. 
The result includes the brand name and the corresponding product count in ascending order.*/
SELECT Brand, COUNT(*) as Product_Count 
FROM Cosmetics 
GROUP BY Brand
ORDER BY Product_Count ASC;

/* Price Analysis: The average price of all products in the Cosmetics table is calculated*/
SELECT AVG(Price) AS Average_Price
FROM Cosmetics;

/* The average price and average rank for each brand is calculated. 
It groups the results by brand and returns the brand name, average price, and average rank for each brand */
SELECT Brand, AVG(Price) as Average_Price, AVG(Rank) as Average_Rank 
FROM Cosmetics 
GROUP BY Brand;

/* The average price of each brand is calculated and the results are grouped by brand*/
SELECT Brand, AVG(Price) as Average_Price
FROM Cosmetics 
GROUP BY Brand;

/* Products and Brands with the maximum price: 
The maximum price for each product name is calculated and the results are grouped by name*/
SELECT Name, MAX(Price) AS Maximum_Price
FROM Cosmetics
GROUP BY name, brand
ORDER BY Maximum_Price DESC;

/* Products and Brands with the minimum price: 
The minimum price for each product name is calculated */
SELECT name, brand, MIN(Price) AS Minimum_Price
FROM Cosmetics
GROUP BY name, brand
ORDER BY Minimum_Price ASC;

/* Products with the highest rank: 
This query selects the name, brand, label, and rank from the Cosmetics table for the product with the highest rank. 
It uses a subquery to find the maximum rank and then retrieves the corresponding product information. */
SELECT name, brand, label, rank
FROM cosmetics
WHERE rank = (SELECT MAX(rank) 
FROM cosmetics);

/* Products with the lowest rank: This selects the name, brand, label, and rank from the Cosmetics table for the product with the lowest rank. 
It uses a subquery to find the minimum rank and then retrieves the corresponding product information. */
SELECT Name, brand, label, rank
FROM cosmetics
WHERE rank = (SELECT MIN(rank) 
FROM cosmetics);

/* This provides insights into brand price vs rank. This query selects the brand, average price, and average rank and groups the results by brand. 
The results are then sorted in descending order based on the average price */
SELECT brand, AVG(price) AS avg_price, AVG(rank) as avg_rank
FROM cosmetics
GROUP BY brand
ORDER BY avg_price DESC, avg_rank;

/* This query counts the number of products in the Cosmetics table where products are for "Combination" skin type */
SELECT COUNT(*) AS Combo_Skin_Products
FROM Cosmetics 
WHERE Combination = 1; 

/* This query counts the number of products in the Cosmetics table where products are for "Dry" skin type */
SELECT COUNT(*) AS Dry_Skin_Products 
FROM Cosmetics 
WHERE Dry = 1;

/* This query counts the number of products in the Cosmetics table where products are for "Normal" skin type */
SELECT COUNT(*) AS Normal_Skin_Products 
FROM Cosmetics 
WHERE Normal = 1;

/* This query counts the number of products in the Cosmetics table where products are for "Oily" skin type */
SELECT COUNT(*) AS Oily_Skin_Products 
FROM Cosmetics 
WHERE Oily = 1;

/* This query counts the number of products in the Cosmetics table where products are for "Sensitive" skin type */
SELECT COUNT(*) AS Sensitive_Skin_Products 
FROM Cosmetics 
WHERE Sensitive = 1;

/* Product selection for skin type: 
This gives the product name, brand, product type according to dry skin suitability with a rank above 3.5 */
SELECT name, brand, label, rank
FROM cosmetics
WHERE dry = 1 AND rank > 3.5
ORDER BY rank DESC;

/* Product selection for skin type: 
This gives the product name, brand, product type according to combination skin suitability with a rank above 3.5 */
SELECT name, brand, label, rank
FROM cosmetics
WHERE combination = 1 AND rank > 3.5
ORDER BY rank DESC;

/* Product selection for skin type: 
This gives the product name, brand, product type according to normal skin suitability with a rank above 3.5 */
SELECT name, brand, label, rank
FROM cosmetics
WHERE normal = 1 AND rank > 3.5
ORDER BY rank DESC;

/* Product selection for skin type: 
This gives the product name, brand, product type according to oily skin suitability with a rank above 3.5 */
SELECT name, brand, label, rank
FROM cosmetics
WHERE oily = 1 AND rank > 3.5
ORDER BY rank DESC;

/* Product selection for skin type: 
This gives the product name, brand, product type according to sensitive skin suitability with a rank above 3.5 */
SELECT name, brand, label, rank
FROM cosmetics
WHERE sensitive = 1 AND rank > 3.5
ORDER BY rank DESC;

