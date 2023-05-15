/* Top-rated red wines: 
Top 10 wines with the highest average ratings and their respective wineries, countries, and regions */
SELECT name, rating, winery, country, region
FROM red
ORDER BY rating DESC
LIMIT 10;

/* Top-rated rose wines: 
Top 10 wines with the highest average ratings and their respective wineries, countries, and regions */
SELECT name, rating, winery, country, region
FROM rose
ORDER BY rating DESC
LIMIT 10;

/*Top-rated sparkling wines: 
Top 10 wines with the highest average ratings and their respective wineries, countries, and regions. */
SELECT name, rating, winery, country, region
FROM sparkling
ORDER BY rating DESC
LIMIT 10;

/*Top-rated white wines: 
Top 10 wines with the highest average ratings and their respective wineries, countries, and regions */
SELECT name, rating, winery, country, region
FROM white
ORDER BY rating DESC
LIMIT 10;

/*Best value wines: 
The top 10 wines with the best price-to-quality ratio (lowest price per rating point) */
SELECT name, winery, price/rating AS price_to_quality_ratio
FROM (
      SELECT * FROM red
      UNION
      SELECT * FROM rose
      UNION
      SELECT * FROM sparkling
      UNION
      SELECT * FROM white) AS all_wines
WHERE rating > 0
ORDER BY price_to_quality_ratio ASC
LIMIT 10;

/*Red Wine production by country: 
The total number of red wines and average ratings per country */
SELECT country, COUNT (*) AS total_red_wines, AVG(rating) AS average_ratings
FROM red
GROUP BY country
ORDER BY total_red_wines DESC;

/*Rose Wine production by country: 
The total number of rose wines and average ratings per country */
SELECT country, COUNT (*) AS total_rose_wines, AVG(rating) AS average_ratings
FROM rose
GROUP BY country
ORDER BY total_rose_wines DESC;

/*Sparkling Wine production by country: 
The total number of sparkling wines and average ratings per country. */
SELECT country, COUNT (*) AS total_sparkling_wines, AVG(rating) AS average_ratings
FROM sparkling
GROUP BY country
ORDER BY total_sparkling_wines DESC;

/* White Wine production by country: The total number of white wines and average ratings per country.  */
SELECT country, COUNT (*) AS total_white_wines, AVG(rating) AS average_ratings
FROM white
GROUP BY country
ORDER BY total_white_wines DESC;

/* Top red wineries by average rating: 
Top 10 red wineries with the highest average ratings, according to country and region  */
SELECT winery, region, country, AVG(rating) as average_ratings
FROM red
GROUP BY winery, country, region
ORDER BY average_ratings DESC
LIMIT 10;

/*Top rose wineries by average rating: 
Top 10 rose wineries with the highest average ratings, according to country and region  */
SELECT winery, region, country, AVG(rating) as average_ratings
FROM rose
GROUP BY winery, country, region
ORDER BY average_ratings DESC
LIMIT 10;

/*Top sparkling wineries by average rating: 
Top 10 sparkling wineries with the highest average ratings, according to country and region */
SELECT winery, region, country, AVG(rating) as average_ratings
FROM sparkling
GROUP BY winery, country, region
ORDER BY average_ratings DESC
LIMIT 10;

/*Top white wineries by average rating: 
Top 10 white wineries with the highest average ratings, according to country and region */
SELECT winery, region, country, AVG(rating) as average_ratings
FROM red
GROUP BY winery, country, region
ORDER BY average_ratings DESC
LIMIT 10;

/*Vintage analysis: The relationship between wine age (vintage) and average rating. */
SELECT year, AVG(rating) as average_rating, COUNT(*) as number_of_wines
FROM (
      SELECT * FROM red
      UNION
      SELECT * FROM rose
      UNION
      SELECT * FROM sparkling
      UNION
      SELECT * FROM white) AS all_wines
WHERE year != 'N.V.' AND year IS NOT NULL
GROUP BY year
ORDER BY year;

/*Price range analysis: Red wines are categorised into price ranges and the average rating for each range was calculated. */
SELECT
  CASE
    WHEN price <= 20 THEN 'Under $20'
    WHEN price <= 50 THEN '$20 - $50'
    WHEN price <= 100 THEN '$50 - $100'
    ELSE 'Over $100'
  END AS price_range,
  AVG(rating) as avg_rating,
  COUNT(*) as number_of_wines
FROM red
GROUP BY price_range
ORDER BY price_range;

--Price range analysis: Rose wines are categorised into price ranges and the average rating for each range was calculated.
SELECT
  CASE
    WHEN price <= 20 THEN 'Under $20'
    WHEN price <= 50 THEN '$20 - $50'
    WHEN price <= 100 THEN '$50 - $100'
    ELSE 'Over $100'
  END AS price_range,
  AVG(rating) as avg_rating,
  COUNT(*) as number_of_wines
FROM rose
GROUP BY price_range
ORDER BY price_range;

--Price range analysis: Sparkling wines are categorised into price ranges and the average rating for each range was calculated.
SELECT
  CASE
    WHEN price <= 20 THEN 'Under $20'
    WHEN price <= 50 THEN '$20 - $50'
    WHEN price <= 100 THEN '$50 - $100'
    ELSE 'Over $100'
  END AS price_range,
  AVG(rating) as avg_rating,
  COUNT(*) as number_of_wines
FROM sparkling
GROUP BY price_range
ORDER BY price_range;

--Price range analysis: White wines are categorised into price ranges and the average rating for each range was calculated.
SELECT
  CASE
    WHEN price <= 20 THEN 'Under $20'
    WHEN price <= 50 THEN '$20 - $50'
    WHEN price <= 100 THEN '$50 - $100'
    ELSE 'Over $100'
  END AS price_range,
  AVG(rating) as avg_rating,
  COUNT(*) as number_of_wines
FROM white
GROUP BY price_range
ORDER BY price_range;
