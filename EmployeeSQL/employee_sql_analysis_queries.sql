--DATA ANALYSIS
--1. List the employee number, last name, first name, sex, and salary of each employee.
select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on s.emp_no = e.emp_no
order by s.emp_no;

--2. List the first name, last name, and hire date for the employees 
--who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE extract(year from hire_date) = 1986;

--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no;

--4. List the department number for each employee along with 
--that employee’s employee number, last name, first name, and department name.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by e.emp_no;

--5. List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B.
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;

---Set up for questions 6 & 7
CREATE VIEW all_dept AS (SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
LEFT JOIN employees as e
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON d.dept_no = de.dept_no);

--6. List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT emp_no, last_name, first_name, dept_name
FROM all_dept
Where dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM all_dept
Where dept_name in ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency DESC;