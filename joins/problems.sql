-- ============================================
-- Problem: Combine Two Tables
-- Source: LeetCode 175
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/combine-two-tables/
-- ============================================

-- APPROACH:
-- 1. Retrieve person details from Person table
-- 2. Retrieve city and state from Address table
-- 3. LEFT JOIN keeps all persons even if no address exists
-- 4. Match rows using personId from both tables

-- SOLUTION:
SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;

-- KEY LEARNING:
-- LEFT JOIN returns all rows from left table
-- Unmatched rows from right table become NULL
-- Table aliases make queries shorter and cleaner
-- JOIN condition connects related records
-- ============================================
