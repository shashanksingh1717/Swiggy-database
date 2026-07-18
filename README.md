  # 🍛 Swiggy Restaurant Analytics — SQL + Interactive Dashboard

> A data analytics project exploring **61,425 Indian restaurants** from the Swiggy platform using SQL queries and an interactive HTML dashboard.

---

## 📌 Project Overview

This project analyzes the Swiggy restaurant dataset to uncover patterns in pricing, ratings, cuisine popularity, and city-level food market dynamics across **8 major Indian cities**.

Two deliverables are included:
- **`swiggy.sql`** — structured SQL queries for data exploration
- **`swiggy_dashboard.html`** — an interactive editorial-style data dashboard built in pure HTML/CSS/JS

---

## 📂 Project Structure

```
swiggy-analytics/
├── database.csv              # Raw dataset (61,425 restaurant records)
├── swiggy.sql                # All SQL queries used in analysis
├── swiggy_dashboard.html     # Interactive visualization dashboard
└── README.md
```

---

## 🗃️ Dataset

**File:** `database.csv`  
**Records:** 61,425 restaurants  
**Source:** Swiggy (India's food delivery platform)

| Column | Description |
|---|---|
| `id` | Unique restaurant ID |
| `name` | Restaurant name |
| `city` | City of operation |
| `rating` | Customer rating (out of 5.0) |
| `rating_count` | Total number of ratings |
| `cuisine` | Primary cuisine type |
| `cost` | Average cost for two (₹) |
| `link` | Swiggy listing URL |

---

## 🧮 SQL Analysis — `swiggy.sql`

The SQL file covers a full spectrum of query techniques:

### 🔍 Basic Retrieval
```sql
-- View all records
SELECT * FROM database;

-- Select specific columns
SELECT name, city FROM database;

-- Filter by city
SELECT * FROM database WHERE city = "Sirsa";
```

### ⭐ Rating & Quality Filters
```sql
-- Top rated restaurants
SELECT name, rating FROM database
WHERE rating > 4.5;

-- High engagement restaurants
SELECT name, rating_count FROM database
WHERE rating_count > 1000;
```

### 💰 Cost Analysis
```sql
-- Budget-friendly options
SELECT * FROM database WHERE cost <= 300;

-- Cost range by cuisine
SELECT cuisine, MIN(cost) AS min_cost, MAX(cost) AS max_cost
FROM database
GROUP BY cuisine;
```

### 📊 Aggregations & Grouping
```sql
-- Total restaurant count
SELECT COUNT(*) AS total_res FROM database;

-- Average meal cost
SELECT AVG(cost) AS avg_cost FROM database;

-- City-wise average rating
SELECT city, AVG(rating) AS avg_rating
FROM database
GROUP BY city;

-- City-wise restaurant count
SELECT city, COUNT(*) AS count_res
FROM database
GROUP BY city;
```

### 🏙️ City Intelligence
```sql
-- Unique cities in dataset
SELECT COUNT(DISTINCT city) AS unique_cities FROM database;

-- Cities with avg rating > 4.5
SELECT city, AVG(rating)
FROM database
GROUP BY city
HAVING AVG(rating) > 4.5;
```

### 🔎 Advanced Filtering
```sql
-- Multi-condition filter
SELECT * FROM database
WHERE rating > 4 AND rating_count > 3000;

-- Range filter
SELECT * FROM database
WHERE rating_count BETWEEN 3000 AND 10000;

-- Multi-city filter
SELECT * FROM database
WHERE city IN ("Mumbai", "Delhi", "Goa", "Pune");

-- Popular cuisine types
SELECT cuisine, COUNT(*) AS total_restaurants
FROM database
GROUP BY cuisine
HAVING COUNT(*) > 100;
```

---

## 📈 Key Findings

| Metric | Value |
|---|---|
| Total Restaurants | 61,425 |
| Cities Covered | 8 |
| Average Cost for Two | ₹298 |
| National Avg Rating | 4.02 ★ |
| Perfect 5.0 Rated | 209 restaurants |
| Most Popular Cuisine | North Indian (10,485 outlets) |
| Highest Rated Cuisine | Desserts (avg 4.12 ★) |
| Largest City Market | Bangalore (6,580 restaurants) |
| Top Quality City | Mumbai (avg 4.08 ★) |

### 💸 Price Segment Breakdown
| Segment | Range | Count | Share |
|---|---|---|---|
| Budget | < ₹300 | 33,452 | 54.5% |
| Mid-Range | ₹300–₹700 | 26,224 | 42.7% |
| Luxury | > ₹700 | 1,749 | 2.8% |

### 🏙️ City-wise Snapshot
| City | Restaurants | Avg Rating | Avg Cost |
|---|---|---|---|
| Bangalore | 6,580 | 4.02 ★ | ₹312 |
| Chennai | 4,849 | 4.03 ★ | ₹278 |
| Delhi | 4,592 | 3.95 ★ | ₹320 |
| Hyderabad | 4,489 | 3.82 ★ | ₹295 |
| Pune | 3,765 | 3.98 ★ | ₹286 |
| Kolkata | 3,160 | 4.06 ★ | ₹268 |
| Mumbai | 2,335 | 4.08 ★ | ₹340 |
| Ahmedabad | 1,291 | 3.98 ★ | ₹260 |

---

## 🖥️ Interactive Dashboard — `swiggy_dashboard.html`

An editorial-style single-page dashboard built with pure HTML, CSS, and JavaScript — no frameworks or build tools required.

### Features
- 📊 **City Bar Chart** — restaurant count per city with proportional fill bars
- ⭐ **Rating Distribution** — visual breakdown of all 61K restaurants by rating band
- 💰 **Cost Bubble Chart** — proportional bubbles for Budget / Mid / Luxury segments
- 🍛 **Cuisine Grid** — top 10 cuisines with count, average rating, and average cost
- 🗺️ **City Heatmap** — colour-coded rating intensity across 8 cities
- 🔍 **SQL Spotlight** — 6 interactive query cards with syntax-highlighted SQL and inline insights
- 🏆 **Hall of Fame** — top rated restaurants by vote count
- 📋 **City Scorecard** — multi-metric comparison table

### How to Run
No installation needed. Just open the file in any modern browser:

```bash
# Clone the repo
git clone https://github.com/your-username/swiggy-analytics.git
cd swiggy-analytics

# Open dashboard (macOS)
open swiggy_dashboard.html

# Open dashboard (Linux)
xdg-open swiggy_dashboard.html

# Open dashboard (Windows)
start swiggy_dashboard.html
```

---

## 🛠️ SQL Concepts Covered

| Concept | Used In |
|---|---|
| `SELECT`, `FROM`, `WHERE` | Basic filtering |
| `AND`, `OR`, `IN`, `BETWEEN` | Compound conditions |
| `GROUP BY`, `HAVING` | Aggregation & filtering groups |
| `ORDER BY`, `LIMIT` | Sorting & pagination |
| `COUNT`, `AVG`, `MIN`, `MAX` | Aggregate functions |
| `COUNT(DISTINCT ...)` | Unique value counting |
| `CASE WHEN` | Conditional segmentation |

---

## 🚀 How to Use the SQL File

Run the queries against any MySQL / MariaDB / SQLite database after importing the CSV:

```sql
-- 1. Create and use the database
CREATE DATABASE swiggy;
USE swiggy;

-- 2. Import the CSV into a table named `database`
--    (use MySQL Workbench, DBeaver, or CLI)

-- 3. Run any query from swiggy.sql
SELECT name, city, rating FROM database
WHERE rating > 4.5
ORDER BY rating DESC
LIMIT 10;
```

---

![Project Screenshot](01-hero-headline.jpeg)




## 📋 Requirements

- **SQL:** MySQL 8+ / MariaDB / SQLite (any SQL-compatible engine)
- **Dashboard:** Any modern browser (Chrome, Firefox, Edge, Safari)
- **No Python, Node.js, or backend required**

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">Made with ❤️ and SQL · Swiggy Open Dataset · India 🇮🇳</p>
