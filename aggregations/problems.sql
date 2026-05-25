-- ============================================
-- Problem: Recyclable and Low Fat Products
-- Source: LeetCode 1757
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/
-- ============================================

-- APPROACH:
-- 1. Both conditions must be true simultaneously
-- 2. AND filters rows meeting both criteria

-- SOLUTION:
SELECT product_id 
FROM products 
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';

-- KEY LEARNING:
-- AND means BOTH conditions must be true
-- ENUM columns compared with string values 'Y'/'N'
-- ============================================

-- Problem: Find Customer Referee
-- Source: LeetCode 584
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/find-customer-referee/description/

-- APPROACH:
-- 1. Exclude customers referred by referee_id = 2
-- 2. Also include customers with no referee (NULL)
-- 3. OR covers both cases

-- SOLUTION:
SELECT name
FROM customer
WHERE referee_id != 2
   OR referee_id IS NULL;

-- KEY LEARNING:
-- NULL != 2 evaluates to UNKNOWN not TRUE
-- so != alone silently drops NULL rows
-- Always handle NULL explicitly in WHERE clauses
-- ============================================

-- Problem: Big Countries
-- Source: LeetCode 595
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/big-countries/description/

-- APPROACH:
-- 1. Include countries with area having atleast 3 Million 
-- 2. Also include countries with atleast 25 Million population 
-- 3. OR covers both cases

-- SOLUTION:
SELECT name, population, area 
FROM world 
WHERE area >= 3000000 
   OR population>= 25000000;

-- KEY LEARNING:
-- OR means either condition must be true
-- A country qualifies even if only ONE threshold is met
-- Opposite of AND where BOTH must be true
-- ============================================

-- Problem: Invalid Tweets
-- Source: LeetCode 1683
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/invalid-tweets/
-- ============================================

-- APPROACH:
-- 1. A tweet is invalid if content length exceeds 15 characters
-- 2. LENGTH() returns number of characters in the string
-- 3. Filter tweets where content length is greater than 15

-- SOLUTION:
SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;

-- KEY LEARNING:
-- LENGTH() is used to count characters in a string
-- WHERE filters rows based on conditions
-- > 15 means only tweets exceeding limit are returned
-- ============================================

-- Problem: Article Views I
-- Source: LeetCode 1148
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/article-views-i/
-- ============================================

-- APPROACH:
-- 1. Find rows where the author viewed their own article
-- 2. author_id = viewer_id identifies self-views
-- 3. DISTINCT removes duplicate author ids
-- 4. ORDER BY sorts ids in ascending order

-- SOLUTION:
SELECT DISTINCT author_id AS id
FROM views
WHERE author_id = viewer_id
ORDER BY author_id;

-- KEY LEARNING:
-- DISTINCT removes duplicate values
-- Column aliases rename output columns using AS
-- ORDER BY sorts results ascending by default
-- ============================================

-- Problem: Duplicate Emails
-- Source: LeetCode 182
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/duplicate-emails/
-- ============================================

-- APPROACH:
-- 1. Group rows by email address
-- 2. COUNT(email) finds how many times each email appears
-- 3. HAVING filters groups appearing more than once
-- 4. Return only duplicate emails

-- SOLUTION:
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

-- KEY LEARNING:
-- GROUP BY creates groups of similar values
-- COUNT() is an aggregate function
-- HAVING filters grouped data after aggregation
-- WHERE filters rows before grouping
-- ============================================

-- Problem: Game Play Analysis I
-- Source: LeetCode 511
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/game-play-analysis-i/
-- ============================================

-- APPROACH:
-- 1. Group records by player_id
-- 2. MIN(event_date) finds the earliest login date
-- 3. Return each player's first login date

-- SOLUTION:
SELECT player_id,
       MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

-- KEY LEARNING:
-- MIN() returns the smallest value in a group
-- GROUP BY creates one result per player
-- DISTINCT is unnecessary when using GROUP BY
-- Aggregate functions summarize grouped data
-- ============================================

-- Problem: Average Population of Each Continent
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/average-population-of-each-continent/
-- ============================================
