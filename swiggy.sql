/*
===============================================================================
Swiggy Restaurant Data Analysis Project
Author: shashank singh 
Description: End-to-end SQL analysis of Swiggy restaurant data — exploring
             market reach, pricing, ratings, cuisine trends, and city-level
             patterns to derive actionable business insights.
Database: MySQL Compatible
===============================================================================
*/

USE swiggy;

-- ============================================================================
-- 1. BASIC EXPLORATION
-- ============================================================================

-- Q1: Full Dataset Overview
-- Goal: Inspect all records to understand structure and contents.
SELECT * FROM restaurants;

-- Q2: Restaurant Names & Cities
-- Goal: Get a quick overview of where restaurants are located.
SELECT name, city
FROM restaurants;

-- Q3: Filter by City
-- Goal: View all restaurants operating in a specific city (e.g., Sirsa).
SELECT *
FROM restaurants
WHERE city = 'Sirsa';

-- Q4: High-Rated Restaurants
-- Goal: Find restaurants with a rating above 4.5 — potential top performers.
SELECT name, rating
FROM restaurants
WHERE rating > 4.5;

-- Q5: Budget-Friendly Restaurants
-- Goal: Identify affordable dining options (cost for two ≤ ₹300).
SELECT *
FROM restaurants
WHERE cost <= 300;

-- Q6: Filter by Cuisine
-- Goal: List all Biryani restaurants to understand cuisine-specific supply.
SELECT *
FROM restaurants
WHERE cuisine = 'Biryani';


-- ============================================================================
-- 2. RANKINGS & SORTING
-- ============================================================================

-- Q7: Top 5 Restaurants by Rating
-- Goal: Surface the best-rated restaurants across the platform.
SELECT name, rating
FROM restaurants
ORDER BY rating DESC
LIMIT 5;

-- Q8: Restaurants Sorted by Cost (Ascending)
-- Goal: View restaurants from cheapest to most expensive.
SELECT name, cost
FROM restaurants
ORDER BY cost ASC;

-- Q9: Highly Reviewed Restaurants
-- Goal: Find restaurants with more than 1000 ratings — indicating popularity.
SELECT name, rating_count
FROM restaurants
WHERE rating_count > 1000;


-- ============================================================================
-- 3. AGGREGATE ANALYSIS
-- ============================================================================

-- Q10: Total Number of Restaurants
-- Goal: Understand the overall scale of the dataset.
SELECT COUNT(*) AS total_restaurants
FROM restaurants;

-- Q11: Average Cost for Two
-- Goal: Benchmark the platform's average dining cost.
SELECT ROUND(AVG(cost), 2) AS avg_cost_for_two
FROM restaurants;

-- Q12: Cuisine-wise Price Range
-- Goal: Compare the cheapest and most expensive options per cuisine type.
SELECT
    cuisine,
    MIN(cost) AS min_cost,
    MAX(cost) AS max_cost
FROM restaurants
GROUP BY cuisine;

-- Q13: City-wise Average Rating
-- Goal: Identify which cities have the best-rated dining scenes.
SELECT
    city,
    ROUND(AVG(rating), 2) AS avg_rating
FROM restaurants
GROUP BY city;

-- Q14: City-wise Restaurant Count
-- Goal: Measure market saturation — how many restaurants operate per city.
SELECT
    city,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY city;

-- Q15: Total Cities on Platform
SELECT COUNT(city) AS total_city_entries
FROM restaurants;

-- Q16: Unique Cities on Platform
-- Goal: Count distinct cities to measure geographic coverage.
SELECT COUNT(DISTINCT city) AS unique_cities
FROM restaurants;


-- ============================================================================
-- 4. FILTERING WITH MULTIPLE CONDITIONS
-- ============================================================================

-- Q17: High Quality + High Popularity Filter
-- Goal: Find restaurants that are both highly rated (>4) AND heavily reviewed (>3000).
SELECT *
FROM restaurants
WHERE rating > 4 AND rating_count > 3000;

-- Q18: Mumbai Restaurants OR 5-Star Rated
-- Goal: Surface either premium restaurants or all options in a key market.
SELECT *
FROM restaurants
WHERE city = 'Mumbai' OR rating = 5;

-- Q19: Rating Count Between a Range
-- Goal: Target restaurants in the mid-tier popularity band (3000–10000 reviews).
SELECT *
FROM restaurants
WHERE rating_count BETWEEN 3000 AND 10000;

-- Q20: Filter by Multiple Cities
-- Goal: Analyze restaurants across India's major metro markets.
SELECT *
FROM restaurants
WHERE city IN ('Mumbai', 'Delhi', 'Goa', 'Pune');


-- ============================================================================
-- 5. HAVING CLAUSE — POST-AGGREGATION FILTERS
-- ============================================================================

-- Q21: Cuisines with High Restaurant Count
-- Goal: Find cuisine categories that are highly represented (>100 restaurants).
--       Signals which food types dominate the platform.
SELECT
    cuisine,
    COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY cuisine
HAVING COUNT(*) > 100;

-- Q22: Cities with Excellent Average Ratings
-- Goal: Identify cities where the overall dining quality is consistently high (avg > 4.5).
SELECT
    city,
    ROUND(AVG(rating), 2) AS avg_rating
FROM restaurants
GROUP BY city
HAVING AVG(rating) > 4.5;

/*
===============================================================================
END OF BASIC ANALYSIS
===============================================================================
Next Steps: Run the Swiggy-Data-Analysis.sql file for advanced analytics
including Window Functions, CTEs, Market Segmentation, and Blue Ocean Strategy.
===============================================================================
*/
