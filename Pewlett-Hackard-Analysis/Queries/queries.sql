-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
--Creating Employees table
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
-- Create Dept Manager Table 
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
-- Create Salaries table 
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
--Create Dept Employees Table 
CREATE TABLE Dept_Employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
	);
	
--DROPPING title TABLE 
CREATE TABLE title 
	(emp_no INT NOT NULL,
	tilte VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES salaries (emp_no)
	);
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

-- FIRST QUERY 1952-1955 WITH COUNT 
-- NUMBER OF EMPLOYEES RETIRING

-- SELECT COUNT (first_name)
-- FROM employees
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- FIRST QUERY 1952-1955 FOR NEW TABLE 

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;