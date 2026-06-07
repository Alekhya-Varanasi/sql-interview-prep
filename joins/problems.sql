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
-- ============================================
-- Problem: Product Sales Analysis I
-- Source: LeetCode 1068
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/product-sales-analysis-i/
-- ============================================

-- APPROACH:
-- 1. Join the Sales and Product tables
-- 2. Match rows using product_id
-- 3. Select product_name from Product table
-- 4. Select year and price from Sales table

-- SOLUTION:
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;

-- KEY LEARNING:
-- JOIN combines rows from related tables
-- ON specifies the matching condition
-- Table aliases (s, p) improve readability
-- INNER JOIN returns only matching records
-- ============================================
-- ============================================
-- Problem: Customer Who Visited but Did Not Make Any Transactions
-- Source: LeetCode 1581
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- ============================================

-- APPROACH:
-- 1. Use LEFT JOIN to combine Visits and Transactions tables
-- 2. Match rows using visit_id
-- 3. Find visits where transaction_id is NULL
--    (means no transaction was made)
-- 4. Group results by customer_id
-- 5. Count the number of visits without transactions

-- SOLUTION:
SELECT v.customer_id,
       COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- KEY LEARNING:
-- LEFT JOIN keeps all rows from the left table
-- NULL values help identify missing matches
-- COUNT() counts rows within each group
-- GROUP BY is used for aggregation per customer
-- ============================================
-- ============================================
-- Problem: Employee Bonus
-- Source: LeetCode 577
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/employee-bonus/
-- ============================================

-- APPROACH:
-- 1. Use LEFT JOIN to combine Employee and Bonus tables
-- 2. Match records using empId
-- 3. Select employees whose bonus is less than 1000
--    OR who have no bonus (NULL)
-- 4. LEFT JOIN ensures employees without bonus are included

-- SOLUTION:
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;

-- KEY LEARNING:
-- LEFT JOIN preserves all rows from the left table
-- NULL checks must use IS NULL (not = NULL)
-- OR condition helps include missing related records
-- Filtering can be applied after join
-- ============================================
-- ============================================
-- Problem: Managers with at Least 5 Direct Reports
-- Source: LeetCode 570
-- Difficulty: Medium
-- Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- ============================================

-- APPROACH:
-- 1. Self-join Employee table to link employees with their managers
-- 2. Match employee.id with employee.managerId
-- 3. Group by manager
-- 4. Count number of direct reports per manager
-- 5. Filter managers having at least 5 reports

-- SOLUTION:
SELECT e1.name
FROM Employee e1
JOIN Employee e2
ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id) >= 5;

-- KEY LEARNING:
-- Self JOIN is used when table relates to itself
-- GROUP BY must include selected non-aggregated columns
-- HAVING filters after aggregation
-- COUNT() helps measure direct relationships
-- ============================================
-- ============================================
-- Problem: Project Employees I
-- Source: LeetCode 1075
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/project-employees-i/
-- ============================================

-- APPROACH:
-- 1. Join Project and Employee tables
-- 2. Match rows using employee_id
-- 3. Group records by project_id
-- 4. Calculate average experience_years for each project
-- 5. Use ROUND() to format result to 2 decimal places

-- SOLUTION:
SELECT p.project_id,
       ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-- KEY LEARNING:
-- AVG() calculates the average value
-- ROUND(num, 2) formats decimals to 2 places
-- GROUP BY is needed with aggregate functions
-- JOIN combines related data from multiple tables
-- ============================================
-- ============================================
-- Problem: Average Selling Price
-- Source: LeetCode 1251
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/average-selling-price/
-- ============================================

-- APPROACH:
-- 1. Start with the Prices table because every product
--    must appear in the final result.
-- 2. LEFT JOIN UnitsSold using:
--      - matching product_id
--      - purchase_date within the product's price period
-- 3. Calculate total revenue:
--      SUM(units * price)
-- 4. Calculate total units sold:
--      SUM(units)
-- 5. Average Selling Price =
--      Total Revenue / Total Units Sold
-- 6. Use COALESCE() to return 0 when a product has no sales.
-- 7. Round the result to 2 decimal places.

-- SOLUTION:
SELECT
    p.product_id,
    ROUND(
        COALESCE(
            SUM(u.units * p.price) / SUM(u.units),
            0
        ),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date
                           AND p.end_date
GROUP BY p.product_id;

-- KEY LEARNING:
-- LEFT JOIN ensures products with no sales are included.
-- BETWEEN checks if purchase_date falls within a price period.
-- SUM(units * price) gives total revenue.
-- SUM(units) gives total quantity sold.
-- COALESCE(expr, 0) replaces NULL with 0.
-- ROUND(value, 2) formats output to 2 decimal places.
-- GROUP BY product_id calculates ASP per product.
-- Weighted Average = SUM(value * weight) / SUM(weight)
-- ============================================
-- ============================================
-- Problem: Students and Examinations
-- Source: LeetCode 1280
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/students-and-examinations/
-- ============================================

-- APPROACH:
-- 1. Generate all possible student-subject combinations
--    using CROSS JOIN.
-- 2. LEFT JOIN Examinations to preserve combinations
--    where no exam was attended.
-- 3. Match examination records using:
--      - student_id
--      - subject_name
-- 4. Count matching examination records for each
--    student-subject pair.
-- 5. Group by student and subject.
-- 6. Sort by student_id and subject_name.

-- SOLUTION:
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
   AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;

-- KEY LEARNING:
-- CROSS JOIN creates all possible combinations
-- of rows between two tables (Cartesian Product).
--
-- LEFT JOIN keeps rows even when no matching
-- examination record exists.
--
-- COUNT(column) ignores NULL values, so students
-- who never attended an exam get 0.
--
-- Always GROUP BY the output grain:
--    One row per (student_id, subject_name)
--
-- Do not group by descriptive columns alone
-- (e.g., student_name) because duplicate names
-- can exist.
--
-- Interview Pattern:
-- Generate all combinations + LEFT JOIN +
-- Aggregate counts.
-- ============================================