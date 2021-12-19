-- -- Creating tables for PH-EmployeeDB
-- CREATE TABLE departments (
--      dept_no VARCHAR(4) NOT NULL,
--      dept_name VARCHAR(40) NOT NULL,
--      PRIMARY KEY (dept_no),
--      UNIQUE (dept_name)
-- );
-- --Creating Employees table
-- CREATE TABLE employees (
-- 	 emp_no INT NOT NULL,
--      birth_date DATE NOT NULL,
--      first_name VARCHAR NOT NULL,
--      last_name VARCHAR NOT NULL,
--      gender VARCHAR NOT NULL,
--      hire_date DATE NOT NULL,
--      PRIMARY KEY (emp_no)
-- );
-- -- Create Dept Manager Table 
-- CREATE TABLE dept_manager (
-- dept_no VARCHAR(4) NOT NULL,
--     emp_no INT NOT NULL,
--     from_date DATE NOT NULL,
--     to_date DATE NOT NULL,
-- FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
-- FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
--     PRIMARY KEY (emp_no, dept_no)
-- );
-- -- Create Salaries table 
-- CREATE TABLE salaries (
--   emp_no INT NOT NULL,
--   salary INT NOT NULL,
--   from_date DATE NOT NULL,
--   to_date DATE NOT NULL,
--   FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
--   PRIMARY KEY (emp_no)
-- );
-- --Create Dept Employees Table 
-- CREATE TABLE Dept_Employees (
-- 	emp_no INT NOT NULL,
-- 	dept_no VARCHAR(4) NOT NULL,
-- 	from_date DATE NOT NULL,
--     to_date DATE NOT NULL,
-- FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
-- FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
-- FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
-- 	PRIMARY KEY (emp_no, dept_no)
-- 	);
	
-- --DROPPING title TABLE 
-- CREATE TABLE title 
-- 	(emp_no INT NOT NULL,
-- 	tilte VARCHAR(40) NOT NULL,
-- 	from_date DATE NOT NULL,
--   	to_date DATE NOT NULL,
-- FOREIGN KEY (emp_no) REFERENCES salaries (emp_no)
-- 	);

-- -- FIRST QUERY 1952-1955

-- SELECT first_name, last_name
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- -- SECOND QUERY 1952
-- SELECT first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- -- THIRD QUERY 1953 
-- SELECT first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- -- FOURTH QUERY 1954
-- SELECT first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- -- SECOND QUERY 1955 - 1955 
-- SELECT first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- --FIRST QUERY 1952-1955 WITH COUNT 
-- NUMBER OF EMPLOYEES RETIRING

-- SELECT COUNT (first_name)
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- --FIRST QUERY 1952-1955 FOR NEW TABLE 

-- SELECT first_name, last_name
-- INTO retirement_info
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- --THIS IS TO ADD THE emp_no COLUMN IN IT 
-- DROP TABLE retirement_info; 

-- -- Create new table for retiring employees
-- SELECT emp_no, first_name, last_name
-- INTO retirement_info
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- -- Check the table
-- SELECT * FROM retirement_info;

-- -- -- Joining departments and dept_manager tables
-- -- SELECT departments.dept_name,
-- --      dept_manager.emp_no,
-- --      dept_manager.from_date,
-- --      dept_manager.to_date
-- -- FROM departments 
-- -- INNER JOIN dept_manager
-- -- ON departments.dept_no = dept_manager.dept_no;

-- -- -- Joining retirement_info and dept_emp tables
-- -- SELECT retirement_info.emp_no,
-- --     retirement_info.first_name,
-- -- retirement_info.last_name,
-- --     dept_employees.to_date
-- -- FROM retirement_info
-- -- LEFT JOIN dept_employees
-- -- ON retirement_info.emp_no = dept_employees.emp_no;

-- -- --GIVING ALIAS 
-- -- SELECT ri.emp_no,
-- --     ri.first_name,
-- -- ri.last_name,
-- --     de.to_date
-- -- FROM retirement_info as ri
-- -- LEFT JOIN dept_employees as de
-- -- ON ri.emp_no = de.emp_no;

-- -- --GIVING ALIAS TO JOIN DEPTARTMENTS AND DEPARTMENT-MANAGER
-- -- SELECT d.dept_name,
-- --      dm.emp_no,
-- --      dm.from_date,
-- --      dm.to_date
-- -- FROM departments as d
-- -- INNER JOIN dept_manager as dm
-- -- ON d.dept_no = dm.dept_no;

-- DROP TABLE current_emp CASCADE;
-- --CREATING AGAIN AS 1 CODE WAS MISSING
-- SELECT ri.emp_no,
--     ri.first_name,
--     ri.last_name,
-- de.to_date
-- INTO current_emp
-- FROM retirement_info as ri
-- LEFT JOIN dept_employees as de
-- ON ri.emp_no = de.emp_no
-- WHERE de.to_date = ('9999-01-01');

-- -- Employee count by department number
-- SELECT COUNT(ce.emp_no), de.dept_no
-- FROM current_emp as ce
-- LEFT JOIN dept_employees as de
-- ON ce.emp_no = de.emp_no
-- GROUP BY de.dept_no
-- ORDER BY de.dept_no;

-- SELECT * FROM salaries
-- ORDER BY to_date DESC;

-- SELECT emp_no, first_name,last_name, gender
-- INTO emp_info
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- SELECT * FROM emp_info;
-- DROP TABLE emp_info CASCADE;



-- SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
-- INTO emp_info
-- FROM employees as e
-- INNER JOIN salaries as s
-- ON (e.emp_no = s.emp_no)
-- INNER JOIN dept_employees as de
-- ON (e.emp_no = de.emp_no)
-- WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--      AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- 	 AND (de.to_date = '9999-01-01'); 
	 
-- SELECT * FROM emp_info;

-- -- List of managers per department
-- SELECT  dm.dept_no,
--         d.dept_name,
--         dm.emp_no,
--         ce.last_name,
--         ce.first_name,
--         dm.from_date,
--         dm.to_date
-- INTO manager_info
-- FROM dept_manager AS dm
--     INNER JOIN departments AS d
--         ON (dm.dept_no = d.dept_no)
--     INNER JOIN current_emp AS ce
--         ON (dm.emp_no = ce.emp_no);

-- SELECT * FROM manager_info;

-- -- SELECT ce.emp_no,ce.first_name,ce.last_name,d.dept_name
-- -- -- INTO dept_info
-- -- FROM current_emp as ce
-- -- INNER JOIN dept_employees AS de
-- -- ON (ce.emp_no = de.emp_no)
-- -- INNER JOIN departments AS d
-- -- ON (de.dept_no = d.dept_no);

-- -- SELECT * FROM current_emp;

-- -- SKILL DRILL
-- SELECT ri.emp_no, ri.first_name, ri.last_name, de.dept_no,d.dept_name
-- INTO sales_info
-- FROM retirement_info as ri
-- INNER JOIN dept_employees AS de
-- ON (ri.emp_no = de.emp_no)
-- INNER JOIN departments AS d
-- ON (de.dept_no = d.dept_no);

-- SELECT * 
-- INTO sales_dept_info 
-- FROM sales_info AS si
-- WHERE dept_name ='Sales';

-- SELECT * FROM sales_info;

-- -- SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
-- -- INTO emp_info
-- -- FROM employees as e
-- -- INNER JOIN salaries as s
-- -- ON (e.emp_no = s.emp_no)
-- -- INNER JOIN dept_employees as de
-- -- ON (e.emp_no = de.emp_no)
-- -- WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- --      AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- -- 	 AND (de.to_date = '9999-01-01'); 
	 
DROP TABLE retirement_title CASCADE;
DROP TABLE retirement_title CASCADE;
SELECT * FROM emp_info;
SELECT e.emp_no, e.first_name, e.last_name, ti.from_date, ti.to_date, ti.tilte
INTO retirement_title
FROM employees as e
INNER JOIN title as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

DROP TABLE unique_titles CASCADE;

SELECT * FROM retirement_title; 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, tilte
INTO unique_titles
FROM retirement_title AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no,tilte DESC;

SELECT * FROM unique_titles;

SELECT tilte, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY tilte
ORDER BY COUNT(*) DESC; 



	