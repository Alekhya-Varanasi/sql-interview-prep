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

-- ============================================
-- Problem: The Blunder
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/the-blunder/
-- ============================================

-- APPROACH:
-- 1. AVG(salary) calculates the actual average salary
-- 2. REPLACE(salary, '0', '') removes all zeros from salary
-- 3. AVG() on modified salaries gives mistaken average
-- 4. Subtract mistaken average from actual average
-- 5. CEIL() rounds result up to nearest integer

-- SOLUTION:
SELECT CEIL(
           AVG(salary) - AVG(REPLACE(salary, '0', ''))
       )
FROM Employees;

-- KEY LEARNING:
-- REPLACE() substitutes characters inside strings
-- Aggregate functions can be combined in calculations
-- AVG() works on numeric expressions
-- CEIL() rounds values upward
-- ============================================

-- Problem: Weather Observation Station 5
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-5/problem

-- APPROACH:
-- 1. Find the city with the shortest name
-- 2. If multiple cities have same length, choose alphabetically first
-- 3. Find the city with the longest name
-- 4. If multiple cities have same length, choose alphabetically first

-- SOLUTION:

-- Shortest city name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

-- Longest city name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;

-- KEY LEARNING:
-- LENGTH() returns number of characters in a string
-- ORDER BY can sort using multiple conditions
-- LIMIT 1 returns only the first row
-- ============================================
-- ============================================
-- Problem: Number of Unique Subjects Taught by Each Teacher
-- Source: LeetCode 2356
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
-- ============================================

-- APPROACH:
-- 1. Group by each teacher
-- 2. Count distinct subjects per teacher
-- 3. DISTINCT handles duplicate subject_id in same dept

-- SOLUTION:
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;

-- KEY LEARNING:
-- COUNT(DISTINCT col) counts unique values only
-- LeetCode runtime % varies — don't chase it
-- ============================================
-- ============================================
-- Problem: Not Boring Movies
-- Source: LeetCode 620
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/not-boring-movies/
-- ============================================

-- APPROACH:
-- 1. Select only movies with odd-numbered IDs
-- 2. Exclude movies where description is 'boring'
-- 3. Sort results by rating in descending order

-- SOLUTION:
SELECT *
FROM cinema
WHERE id % 2 != 0
  AND description != 'boring'
ORDER BY rating DESC;

-- KEY LEARNING:
-- % operator is used to check odd/even numbers
-- Multiple conditions can be combined using AND
-- ORDER BY col DESC sorts values from highest to lowest
-- ============================================
-- ============================================
-- Problem: Weather Observation Station 11
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
-- ============================================

-- APPROACH:
-- 1. Select distinct city names from STATION table
-- 2. Find cities that do NOT start with a vowel
--    OR do NOT end with a vowel
-- 3. Use REGEXP for pattern matching

-- SOLUTION:
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOU]'
   OR CITY NOT REGEXP '[AEIOU]$';

-- KEY LEARNING:
-- DISTINCT removes duplicate values
-- REGEXP is used for pattern matching
-- ^ represents the start of a string
-- $ represents the end of a string
-- NOT REGEXP filters values that do not match the pattern
-- ============================================
-- ============================================
-- Problem: Weather Observation Station 12
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-12/problem
-- ============================================

-- APPROACH:
-- 1. Select distinct city names from STATION table
-- 2. Find cities that do NOT start with a vowel
-- 3. Find cities that do NOT end with a vowel
-- 4. Use AND to keep only cities satisfying both conditions

-- SOLUTION:
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOU]'
  AND CITY NOT REGEXP '[AEIOU]$';

-- KEY LEARNING:
-- DISTINCT removes duplicate rows
-- REGEXP enables pattern matching in SQL
-- ^ checks the beginning of a string
-- $ checks the ending of a string
-- AND requires both conditions to be true
-- ============================================
-- ============================================
-- Problem: Find Followers Count
-- Source: LeetCode 1729
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/find-followers-count/
-- ============================================

-- APPROACH:
-- 1. Group records by user_id
-- 2. Count the number of follower_id values for each user
-- 3. Sort the result by user_id in ascending order

-- SOLUTION:
SELECT user_id,
       COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- KEY LEARNING:
-- COUNT() counts rows within each group
-- GROUP BY creates groups for aggregation
-- ORDER BY sorts the final result
-- Aggregate functions are commonly used with GROUP BY
-- ============================================
-- ============================================
-- Problem: User Activity for the Past 30 Days I
-- Source: LeetCode 1141
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
-- ============================================

-- APPROACH:
-- 1. Filter records to only include the last 30 days
--    from the given end date (2019-07-27).
-- 2. Count unique active users per day.
-- 3. Use COUNT(DISTINCT user_id) to avoid duplicates.
-- 4. Group results by activity_date.
-- 5. Return activity_date as "day".

-- SOLUTION:
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- KEY LEARNING:
-- BETWEEN includes both start and end dates.
-- COUNT(DISTINCT ...) is used to remove duplicate user activity in a day.
-- GROUP BY activity_date aggregates daily activity.
-- This is a classic "daily aggregation over a sliding window" pattern.
-- ============================================