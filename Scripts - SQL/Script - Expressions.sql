# TABLE EXPRESSIONS

WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries
)
SELECT
SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) AS no_salaries_below_avg_w_sum,

# COUNT(CASE WHEN s.salary < c.avg_salary THEN s.salary ELSE NULL END) AS no_salaries_below_avg_w_count,

COUNT(s.salary) AS no_of_salary_contracts
FROM 
	salaries s 
		JOIN 
	employees e ON s.emp_no = e.emp_no AND e.gender = 'M' 
		CROSS JOIN 
	cte c;

# WITH CLAUSE

WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT 
	s.emp_no, MAX(s.salary) AS max_salary
FROM 
	salaries s
		JOIN 
	employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no

)
SELECT
SUM(CASE WHEN c2.max_salary < c1.avg_salary THEN 1 ELSE 0 END) AS highest_salaries_below_avg
FROM 
	employees e
		JOIN 
	cte2 c2 ON c2.emp_no = e.emp_no
		JOIN 
    cte1 c1;