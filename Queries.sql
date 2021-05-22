-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   e.sex,
	   s.salary
FROM employees as e 
left join salaries as s
on e.emp_no=s.emp_no
ORDER by e.emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
	   last_name,
	   hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,
       d.dept_name,
       dm.emp_no,
       e.last_name,
       e.first_name
FROM dept_manager AS dm
   INNER JOIN departments AS d
       ON (dm.dept_no = d.dept_no)
   INNER JOIN employees AS e
       ON (dm.emp_no = e.emp_no);
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name
FROM employees AS e
    INNER JOIN dept_emp as de
    ON e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
	   e.last_name,
	   e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
-- List all employees in the Sales department, including their employee number, last name, first name, and department name. 
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de 
ON de.emp_no=e.emp_no
LEFT JOIN departments as dp
ON de.dept_no=dp.dept_no
WHERE dept_name = 'Sales' 	

SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   dp.dept_name
FROM employees as e
LEFT JOIN dept_emp AS de 
ON de.emp_no=e.emp_no
LEFT JOIN departments as dp
ON de.dept_no=dp.dept_no
WHERE dept_name = 'Sales' OR  dept_name='Development'  


SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

