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
