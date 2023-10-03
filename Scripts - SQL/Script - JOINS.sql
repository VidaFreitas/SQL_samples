-- Using JOIN

 CREATE TABLE departments_dup
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup
(
    dept_no,
    dept_name
)

SELECT
	*
FROM
	departments;

INSERT INTO departments_dup (dept_name)
VALUES  ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) 
VALUES ('d010'), ('d011');

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup 
(
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                
	(999904, '2017-01-01'),
	(999905, '2017-01-01'),
	(999906, '2017-01-01'),
	(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd009';
    
-- DEPT_MANAGER TABLE
 
SELECT * 
FROM 
	dept_manager_dup
ORDER BY dept_no;

-- DEPARTMENT DUP TABLE

SELECT * 
FROM 
	departments_dup
ORDER BY dept_no;

-- Using INNER JOIN
 
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
ORDER BY e.emp_no;

-- Using LEFT JOIN

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM employees e
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
ORDER BY e.emp_no;

SELECT
    e.emp_no,  
    e.first_name,  
    e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM employees e  
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no  
WHERE  
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC, e.emp_no;

-- Using Right JOIN

SELECT
    m.dept_no,  
    m.emp_no,      
    d.dept_name
FROM dept_manager_dup m
RIGHT JOIN departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- Using JOIN and WHERE

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE e.emp_no = dm.emp_no;


SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no;


SELECT
	e.emp_no, 
    e.first_name, 
    e.last_name, 
    s.salary
FROM
	employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

-- Using CROSS JOIN (best practice)

SELECT
	dm.*, d.*
FROM 
	dept_manager dm
CROSS JOIN departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT
	dm.*, d.*
FROM 
	departments d
CROSS JOIN dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
WHERE d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;


SELECT
	dm.*, d.*
FROM 
	dept_manager dm,
	departments d
ORDER BY dm.emp_no , d.dept_no;

-- JOIN more than two tables

SELECT
    e.first_name,
    e.last_name,
	e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
JOIN 
	dept_manager m ON d.dept_no = m.dept_no
JOIN 
	employees e ON m.emp_no = e.emp_no;
    
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
JOIN
    dept_manager m ON e.emp_no = m.emp_no
JOIN
    departments d ON m.dept_no = d.dept_no
JOIN
    titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;


SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
JOIN
    dept_manager m ON e.emp_no = m.emp_no
JOIN
    departments d ON m.dept_no = d.dept_no
JOIN
	titles t ON e.emp_no = t.emp_no AND m.from_date = t.from_date
ORDER BY e.emp_no;


SELECT
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
JOIN
	dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;
