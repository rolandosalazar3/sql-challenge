-- Employees table
create table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(40) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL
);

-- Departments table
create table departments (
	dept_no VARCHAR(10) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

-- Titles table
create table titles (
	title_id VARCHAR(40) NOT NULL,
	title VARCHAR(40) NOT NULL
);

-- Department employee table
create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Salaries table
create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

-- Create Department manager table
create table dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);