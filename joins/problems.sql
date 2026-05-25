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

-- Problem: Customers Who Never Order
-- Source: LeetCode 183
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/customers-who-never-order/
-- ============================================

-- APPROACH:
-- 1. LEFT JOIN keeps all customers from Customers table
-- 2. Match orders using customer id
-- 3. Customers without orders will have NULL in Orders columns
-- 4. Filter NULL order ids to get customers who never ordered

-- SOLUTION:
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

-- KEY LEARNING:
-- LEFT JOIN helps find missing matching records
-- NULL values appear when no matching row exists
-- IS NULL is used to filter missing data
-- Common anti-join pattern in SQL interviews
-- ============================================

