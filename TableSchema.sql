--Titles

create table titles
(
title_id varchar(5),
title varchar(50) not null,
PRIMARY KEY(title_id)
);

create table departments
(
dept_no varchar(4),
dept_name varchar(50) not null,
PRIMARY KEY(dept_no)
);

create table employees
(
emp_no int,
emp_title_id varchar(5),
birth_date date,
first_name varchar(50),
last_name varchar(50),
sex char(1),
hire_date date,
PRIMARY KEY(emp_no),
CONSTRAINT fk_title
      FOREIGN KEY(emp_title_id) 
	  REFERENCES titles(title_id)
);

create table salaries
(
emp_no int,
salary int,
PRIMARY KEY(emp_no, salary),
CONSTRAINT fk_employee
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
);

create table dept_emp
(
emp_no int not null,
dept_no varchar(4) not null,
PRIMARY KEY(emp_no, dept_no),
CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no),
CONSTRAINT fk_emp
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
);

create table dept_manager
(
dept_no varchar(4) not null,
emp_no int not null,
PRIMARY KEY(emp_no, dept_no),
CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no),
CONSTRAINT fk_emp
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
);
