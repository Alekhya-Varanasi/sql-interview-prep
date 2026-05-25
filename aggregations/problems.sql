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
