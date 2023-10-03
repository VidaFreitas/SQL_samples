-- SELF JOIN

SELECT
	e1.*
FROM
	emp_manager e1
		JOIN
	emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE 
	e2.emp_no IN (SELECT 
				manager_no
			FROM
				emp_manager);
                
-- SQL VIEWS

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no;

