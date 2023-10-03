SELECT 
    dept_no
FROM
    departments;
    
SELECT * FROM departments;

-- Using AND e OR

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Elvis' AND gender = 'M';
    
    
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
    
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';
    
    
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND (gender = 'M' OR gender = 'F');

-- Using NOT e NOT IN

SELECT
    *
FROM
    employees
WHERE
    first_name IN ('Cathie', 'Mark', 'Nathan');


SELECT
    *
FROM
    employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');
    
-- Using LIKE, NOT LIKE  - % depois da alavra indica seguencia de caracteres e _ um    /   Wildcard caracteres ( %  _ * )

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');


SELECT
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');


SELECT
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

 
SELECT
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
-- Using BETWEEN - NOT BETWEEN e AND

SELECT
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';


SELECT
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';


SELECT
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
-- Using IS NOT NULL  /  IS NULL

SELECT
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    

SELECT
    *
FROM
    employees
WHERE
    first_name IS NULL;

-- Using ( = eqaul to / > greater than / >= greater than or equal  / < les than  / <= less than or equal / <>, != not equal or different from

SELECT
    *
FROM
    employees
WHERE
    first_name != 'Mark';
    
    
SELECT
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

-- Using COUNT() 


SELECT 
	count(first_name)
FROM
	employees;

SELECT 
	count(DISTINCT first_name)
FROM
	employees;
    
SELECT
    COUNT(*)
FROM
    salaries
WHERE
	salary >= 100000;
    
    
SELECT
    COUNT(*)
FROM
	dept_manager;

-- Using ORDER BY 

SELECT
    *
FROM
	employees
ORDER BY first_name;

SELECT
    *
FROM
	employees
ORDER BY emp_no;

-- Using GROUP BY  / AS para difinir nome da coluna. 

SELECT
    first_name
FROM
	employees
GROUP BY first_name;


SELECT
    first_name, COUNT(first_name) AS names_count
FROM
	employees
GROUP BY first_name;

-- Using HAVING tem que ser colocada entre ORDER BY e GROU BY

SELECT
    first_name, COUNT(first_name) AS names_count
FROM
	employees
GROUP BY first_name
HAVING COUNT(hire_date) > 250
ORDER BY first_name;

 -- Using WHERE x HAVING ( se precisar ter COUNT entáo será acompanhado de Having - funcoes agregradas) Where ara condioes gerais
 
SELECT
    first_name, COUNT(first_name) AS names_count
FROM
	employees
WHERE
	hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(hire_date) < 200
ORDER BY first_name DESC;

SELECT
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- Using LIMIT

SELECT 
	*
FROM
	salaries
ORDER BY salary DESC
LIMIT 10;
 
 
 -- Using INSERT 

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees
(
	birth_date,
    emp_no,
    first_name,
    gender,
    hire_date,
	last_name
) VALUES
(
	'1986-04-01',
     999901,
    'Jhon',
    'M',
    '2011-01-01',
    'Smith'
);

-- Using UPDATE

SELECT
	*
FROM
	employees
WHERE
	emp_no = 999901;

UPDATE employees
SET
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
	emp_no = 999901;

-- Using DELETE

SELECT
	*
FROM
	employees
WHERE
	emp_no = 999901;

DELETE FROM employees
WHERE emp_no = 999901;

ROLLBACK;

-- Using SUM()

SELECT
    SUM(salary)
FROM
	salaries;
    
-- Using MIN / MAX / AVG

SELECT
    MAX(salary)
FROM
	salaries;

SELECT
    AVG(salary)
FROM
	salaries;
    
-- Using ROUND() para arredondar o numero

SELECT
    ROUND(AVG(salary))
FROM
	salaries;
