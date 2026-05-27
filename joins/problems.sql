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

-- ============================================
-- Problem: African Cities
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/african-cities/
-- ============================================

-- APPROACH:
-- 1. JOIN City and Country tables using country code
-- 2. Filter countries belonging to Africa continent
-- 3. Return city names from matching records

-- SOLUTION:
SELECT CTY.Name
FROM City CTY
JOIN Country COU
ON CTY.CountryCode = COU.Code
WHERE COU.Continent = 'Africa';

-- KEY LEARNING:
-- JOIN retrieves related data from multiple tables
-- WHERE filters rows based on conditions
-- Aliases make long table names shorter and cleaner
-- Only matching rows are returned with INNER JOIN
-- ============================================

-- ============================================
-- Problem: Average Population of Each Continent
-- Source: HackerRank
-- Difficulty: Easy
-- Link: https://www.hackerrank.com/challenges/average-population-of-each-continent/
-- ============================================

-- APPROACH:
-- 1. JOIN Country and City tables using country code
-- 2. Group rows by continent
-- 3. AVG() calculates average city population per continent
-- 4. FLOOR() removes decimal values

-- SOLUTION:
SELECT COU.Continent,
       FLOOR(AVG(CTY.Population))
FROM Country COU
JOIN City CTY
ON CTY.CountryCode = COU.Code
GROUP BY COU.Continent;

-- KEY LEARNING:
-- JOIN combines related tables
-- AVG() calculates mean values
-- FLOOR() rounds down to nearest integer
-- GROUP BY creates one result per continent
-- ============================================
-- ============================================
-- Problem: Replace Employee ID With The Unique Identifier
-- Source: LeetCode 1378
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- ============================================

-- APPROACH:
-- 1. Use LEFT JOIN to combine Employees and EmployeeUNI tables
-- 2. Match rows using the employee ID column
-- 3. Select unique_id from EmployeeUNI and name from Employees
-- 4. LEFT JOIN ensures all employees appear,
--    even if they don't have a unique_id

-- SOLUTION:
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;

-- KEY LEARNING:
-- LEFT JOIN keeps all records from the left table
-- If no matching row exists, NULL is returned
-- Aliases (e, eu) make queries shorter and cleaner
-- JOIN is used to combine related tables
-- ============================================
