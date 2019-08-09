-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no char (5)   NOT NULL,
    dept_name varchar(50)   NOT NULL,

    CONSTRAINT "uc_departments_dept_no" UNIQUE (
        "dept_no"
    )
);

CREATE TABLE dept_emp (
    emp_no integer   NOT NULL,
    dept_no char (5)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_manager (
    dept_no char (5)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE employees (
    emp_no integer   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender char(2)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary money   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_emp (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES titles (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_emp (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_emp (emp_no);

CREATE INDEX idx_departments_dept_name
ON departments (dept_name);

