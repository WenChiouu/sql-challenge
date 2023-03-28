-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01 00:00:00' AND hire_date < '1987-01-01 00:00:00';

-- 3. List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT t.title, d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM titles as t 
INNER JOIN employees as e 
ON t.title_id = e.emp_title_id
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d 
ON de.dept_no = d.dept_no
WHERE title = 'Manager'

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d 
INNER JOIN dept_emp as de
ON d.dept_no = de.dept_no
INNER JOIN employees as e 
ON de.emp_no = e.emp_no;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments as d 
INNER JOIN dept_emp as de
ON d.dept_no = de.dept_no
INNER JOIN employees as e 
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d 
INNER JOIN dept_emp as de
ON d.dept_no = de.dept_no
INNER JOIN employees as e 
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'  OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "frequency counts"
FROM employees
GROUP BY last_name
ORDER BY "frequency counts" DESC;

-- titles - title_id , title (manager) 
-- departments - dept_no , dept_name
-- dept_em - emp_no , dept_no
-- employees - emp_no, emp_title, first_n, last_n

