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
