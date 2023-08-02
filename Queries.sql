--1. List the employee number, last name, first name, sex, and salary of each employee.

select
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from
	employees e
left join
	salaries s
on
	e.emp_no=s.emp_no;
	
--2. List the first name, last name, and hire date for the employees who were hired in 1986.

select
	e.first_name,
	e.last_name,
	e.hire_date
from
	employees e
where
	EXTRACT(YEAR FROM e.hire_date)=1986;
	
--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

select
	dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
from
	dept_manager dm
inner join
	departments d
on
	d.dept_no=dm.dept_no
inner join
	employees e
on
	e.emp_no=dm.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select
	de.dept_no, 
	d.dept_name, 
	de.emp_no, 
	e.first_name,
	e.last_name
from
	dept_emp de
inner join
	departments d
on
	de.dept_no=d.dept_no
inner join
	employees e
on
	e.emp_no=de.emp_no;
	
--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select
	e.first_name, e.last_name, e.sex
from
	employees e
where
	e.first_name='Hercules' and
	e.last_name like 'B%';
	
--6. List each employee in the Sales department, including their employee number, last name, and first name.

select
	de.emp_no,
	e.first_name,
	e.last_name
from
	dept_emp de
inner join
	employees e
on
	e.emp_no=de.emp_no
inner join
	departments d
on
	de.dept_no=d.dept_no
where
	d.dept_name='Sales';
	
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
	de.emp_no,
	d.dept_name,
	e.first_name,
	e.last_name
from
	dept_emp de
inner join
	employees e
on
	e.emp_no=de.emp_no
inner join
	departments d
on
	d.dept_no=de.dept_no
where
	d.dept_name in ('Sales','Development');
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select
	e.last_name, count(e.last_name) as frequency_last_names
from
	employees e
group by
	e.last_name
order by
	2 desc;




