-- QUESTION # 1: Get employee number, 
--last name, first name, gender, and salary
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
join salaries s
on e.emp_no = s.emp_no
;

-- QUESTION # 2: Listed employees who were 
-- hired in 1986
select emp_no, last_name, hire_date
from employees
where hire_date <= '12/31/1986' AND 
hire_date >= '01/01/1986';

-- QUESTION #3: Listed the manager of each 
-- department with the following information: 
-- department number, department name, 
-- the manager's employee number, 
-- last name, first name, and start and 
-- end employment dates.
select dm.dept_no, dp.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from dept_manager dm
join departments dp
on dm.dept_no = dp.dept_no
join employees e
on e.emp_no = dm.emp_no;

-- QUESTION #4: Listed the department of each 
-- employee with the following information: 
-- employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp dm
join departments dp
on dm.dept_no = dp.dept_no
join employees e
on e.emp_no = dm.emp_no;

-- QUESTION #5: Listed all employees whose first name is 
-- "Hercules" and last names begin with "B."
select emp_no, first_name, last_name
from employees
where last_name like 'B%' and
first_name = 'Hercules';

-- QUESTION #6: Listed all employees in the Sales department, 
-- including their employee number, last name, first name, 
-- and department name
select e.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp dm
join departments dp
on dm.dept_no = dp.dept_no
join employees e
on e.emp_no = dm.emp_no
where dp.dept_name = 'Sales';

-- QUESTION #7: Listed all employees in the Sales and 
-- Development departments, including their employee number,
-- last name, first name, and department name
select * from departments;

select e.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp dm
join departments dp
on dm.dept_no = dp.dept_no
join employees e
on e.emp_no = dm.emp_no
where dp.dept_name = 'Sales' or dp.dept_name = 'Development';

-- QUESTION #8: In descending order, listed the frequency count 
-- of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "Total Last Names"
FROM employees
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;




