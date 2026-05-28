# /*

Swiggy Database Data Analysis Project
Author: shashank singh
Description: End-to-end SQL analysis of Swiggy database data — exploring
market reach, pricing, ratings, cuisine trends, and city-level
patterns to derive actionable business insights.
Database: MySQL Compatible
==========================

*/

USE swiggy;

-- ============================================================================
-- 1. BASIC EXPLORATION
-- ============================================================================

-- Q1: Full Dataset Overview
-- Goal: Inspect all records to understand structure and contents.
SELECT * FROM databases;

-- Q2: Database Names & Cities
-- Goal: Get a quick overview of where databases are located.
SELECT name, city
FROM databases;

-- Q3: Filter by City
-- Goal: View all databases operating in a specific city (e.g., Sirsa).
SELECT *
FROM databases
WHERE city = 'Sirsa';

-- Q4: High-Rated Databases
-- Goal: Find databases with a rating above 4.5 — potential top performers.
SELECT name, rating
FROM databases
WHERE rating > 4.5;

-- Q5: Budget-Friendly Databases
-- Goal: Identify affordable dining options (cost for two ≤ ₹300).
SELECT *
FROM databases
WHERE cost <= 300;

-- Q6: Filter by Cuisine
-- Goal: List all Biryani databases to understand cuisine-specific supply.
SELECT *
FROM databases
WHERE cuisine = 'Biryani';

-- ============================================================================
-- 2. RANKINGS & SORTING
-- ============================================================================

-- Q7: Top 5 Databases by Rating
-- Goal: Surface the best-rated databases across the platform.
SELECT name, rating
FROM databases
ORDER BY rating DESC
LIMIT 5;

-- Q8: Databases Sorted by Cost (Ascending)
-- Goal: View databases from cheapest to most expensive.
SELECT name, cost
FROM databases
ORDER BY cost ASC;

-- Q9: Highly Reviewed Databases
-- Goal: Find databases with more than 1000 ratings — indicating popularity.
SELECT name, rating_count
FROM databases
WHERE rating_count > 1000;

-- ============================================================================
-- 3. AGGREGATE ANALYSIS
-- ============================================================================

-- Q10: Total Number of Databases
-- Goal: Understand the overall scale of the dataset.
SELECT COUNT(*) AS total_databases
FROM databases;

-- Q11: Average Cost for Two
-- Goal: Benchmark the platform's average dining cost.
SELECT ROUND(AVG(cost), 2) AS avg_cost_for_two
FROM databases;

-- Q12: Cuisine-wise Price Range
-- Goal: Compare the cheapest and most expensive options per cuisine type.
SELECT
cuisine,
MIN(cost) AS min_cost,
MAX(cost) AS max_cost
FROM databases
GROUP BY cuisine;

-- Q13: City-wise Average Rating
-- Goal: Identify which cities have the best-rated dining scenes.
SELECT
city,
ROUND(AVG(rating), 2) AS avg_rating
FROM databases
GROUP BY city;

-- Q14: City-wise Database Count
-- Goal: Measure market saturation — how many databases operate per city.
SELECT
city,
COUNT(*) AS database_count
FROM databases
GROUP BY city;

-- Q15: Total Cities on Platform
SELECT COUNT(city) AS total_city_entries
FROM databases;

-- Q16: Unique Cities on Platform
-- Goal: Count distinct cities to measure geographic coverage.
SELECT COUNT(DISTINCT city) AS unique_cities
FROM databases;

-- ============================================================================
-- 4. FILTERING WITH MULTIPLE CONDITIONS
-- ============================================================================

-- Q17: High Quality + High Popularity Filter
-- Goal: Find databases that are both highly rated (>4) AND heavily reviewed (>3000).
SELECT *
FROM databases
WHERE rating > 4 AND rating_count > 3000;

-- Q18: Mumbai Databases OR 5-Star Rated
-- Goal: Surface either premium databases or all options in a key market.
SELECT *
FROM databases
WHERE city = 'Mumbai' OR rating = 5;

-- Q19: Rating Count Between a Range
-- Goal: Target databases in the mid-tier popularity band (3000–10000 reviews).
SELECT *
FROM databases
WHERE rating_count BETWEEN 3000 AND 10000;

-- Q20: Filter by Multiple Cities
-- Goal: Analyze databases across India's major metro markets.
SELECT *
FROM databases
WHERE city IN ('Mumbai', 'Delhi', 'Goa', 'Pune');

-- ============================================================================
-- 5. HAVING CLAUSE — POST-AGGREGATION FILTERS
-- ============================================================================

-- Q21: Cuisines with High Database Count
-- Goal: Find cuisine categories that are highly represented (>100 databases).
--       Signals which food types dominate the platform.
SELECT
cuisine,
COUNT(*) AS total_databases
FROM databases
GROUP BY cuisine
HAVING COUNT(*) > 100;

-- Q22: Cities with Excellent Average Ratings
-- Goal: Identify cities where the overall dining quality is consistently high (avg > 4.5).
SELECT
city,
ROUND(AVG(rating), 2) AS avg_rating
FROM databases
GROUP BY city
HAVING AVG(rating) > 4.5;

# /*

# END OF BASIC ANALYSIS

Next Steps: Run the Swiggy-Data-Analysis.sql file for advanced analytics
including Window Functions, CTEs, Market Segmentation, and Blue Ocean Strategy.
===============================================================================

*/
