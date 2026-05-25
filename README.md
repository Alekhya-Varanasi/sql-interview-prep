# SQL Interview Prep — Portfolio

## About Me
Senior Data professional with 4 years of experience at Infosys, specializing in Oracle databases, data pipelines, and schema design. This repository documents my SQL problem-solving approach across real interview topics.

**Target roles:** Data Engineer | AWS | Azure Databricks  
**Core strengths:** Complex joins, window functions, CTEs, aggregations

---

## Repository Structure

```
sql-interview-prep/
│
├── aggregations/       → GROUP BY, HAVING, COUNT, SUM, AVG, CASE WHEN
├── subqueries/         → Correlated, nested, EXISTS, IN
├── window_functions/   → RANK, DENSE_RANK, ROW_NUMBER, LAG, LEAD
├── joins/              → INNER, LEFT, RIGHT, SELF, CROSS joins
├── ctes/               → WITH clause, recursive CTEs
├── string_functions/   → REPLACE, CONCAT, SUBSTRING, LIKE
└── case_studies/       → Real-world multi-table scenarios
```

---

## Problem Format

Every solution follows this structure:

```sql
-- ============================================
-- Problem: [Problem Name]
-- Source: LeetCode / StrataScratch / DataLemur
-- Difficulty: Easy / Medium / Hard
-- Company: [if known]
-- ============================================

-- APPROACH:
-- 1. [Step 1 of thinking]
-- 2. [Step 2 of thinking]
-- 3. [Step 3 of thinking]

-- SOLUTION:
SELECT ...
FROM ...
WHERE ...

-- KEY LEARNING:
-- [What this problem taught or reinforced]
```

---

## Problems Solved

### Aggregations
| # | Problem | Difficulty | Source | Key Concept |
|---|---------|-----------|--------|-------------|
| 1 | Recyclable and Low Fat Products | Easy | LeetCode 1757 | WHERE with AND |
| 2 | Find Customer Referee | Easy | LeetCode 584 | NULL handling |
| 3 | Big Countries | Easy | LeetCode 595 | OR conditions |
| 4 | Invalid Tweets | Easy | LeetCode 1683 | LENGTH function |
| 5 | Article Views I | Easy | LeetCode 1148 | DISTINCT ORDER BY functions |

### Window Functions
| # | Problem | Difficulty | Source | Key Concept |
|---|---------|-----------|--------|-------------|
| 1 | Rank Scores | Medium | LeetCode 178 | DENSE_RANK |
| 2 | Department Top 3 Salaries | Hard | LeetCode 185 | DENSE_RANK + partition |

### Joins
| # | Problem | Difficulty | Source | Key Concept |
|---|---------|-----------|--------|-------------|
| 1 | Combine Two Tables | Easy | LeetCode 175 | LEFT JOIN |

*Table updates as problems are solved daily.*

---

## Key Concepts Quick Reference

### Window Functions
```sql
-- RANK vs DENSE_RANK vs ROW_NUMBER
SELECT name, salary,
    RANK()         OVER (PARTITION BY dept ORDER BY salary DESC) AS rank,
    DENSE_RANK()   OVER (PARTITION BY dept ORDER BY salary DESC) AS dense_rank,
    ROW_NUMBER()   OVER (PARTITION BY dept ORDER BY salary DESC) AS row_num
FROM employees;

-- LAG and LEAD
SELECT date, revenue,
    LAG(revenue, 1)  OVER (ORDER BY date) AS prev_day,
    LEAD(revenue, 1) OVER (ORDER BY date) AS next_day
FROM sales;
```

### CTEs
```sql
WITH cte_name AS (
    SELECT dept, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept
)
SELECT e.name, e.salary, c.avg_sal
FROM employees e
JOIN cte_name c ON e.dept = c.dept
WHERE e.salary > c.avg_sal;
```

### Conditional Aggregation
```sql
SELECT
    dept,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_count,
    SUM(CASE WHEN status = 'active' THEN salary ELSE 0 END) AS active_payroll
FROM employees
GROUP BY dept;
```

---

## Tools
- **Practice platforms:** LeetCode · StrataScratch · DataLemur
- **Database:** MySQL / PostgreSQL
- **Target:** 50+ problems solved by Jun 22, 2026

---

## Connect
**LinkedIn:** www.linkedin.com/in/varanasi-v-g-alekhya-233793145  
