CREATE DATABASE final_project_employee;

USE 
final_project_employee
GO

/*Start irvandhar*/

CREATE TABLE tbl_permission(
	id int,
	name varchar(100)
);

CREATE TABLE tbl_role_permissions(
	id int,
	role int,
	permission int
);

CREATE TABLE tbl_roles(
	id int,
	name varchar(50)
);

CREATE TABLE tbl_account_roles(
	id int,
	account int,
	role int
);

CREATE TABLE tbl_account(
	id int,
	username varchar(25),
	password varchar(255),
	otp int,
	is_expired datetime,
	is_used bit
);

/*Start Constraint*/

/*tbl_permission*/
ALTER TABLE tbl_permission ALTER COLUMN id INT NOT NULL;
ALTER TABLE tbl_permission ALTER COLUMN name VARCHAR(100) NOT NULL;
ALTER TABLE tbl_permission ADD CONSTRAINT PK_tbl_permission PRIMARY KEY (id);

/*tbl_role_permissions*/
ALTER TABLE tbl_role_permissions ALTER COLUMN id INT NOT NULL;
ALTER TABLE tbl_role_permissions ALTER COLUMN permission INT NULL;
ALTER TABLE tbl_role_permissions ALTER COLUMN role INT NOT NULL;
ALTER TABLE tbl_role_permissions ADD CONSTRAINT PK_tbl_role_permissions PRIMARY KEY (id);

ALTER TABLE tbl_role_permissions
ADD CONSTRAINT FK_tbl_role_permissions_permission
FOREIGN KEY (permission) REFERENCES tbl_permission(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_role_permissions
ADD CONSTRAINT FK_tbl_role_permissions_role
FOREIGN KEY (role) REFERENCES tbl_roles(id)
ON DELETE NO ACTION;

/*tbl_roles*/
ALTER TABLE tbl_roles ALTER COLUMN id INT NOT NULL;
ALTER TABLE tbl_roles ALTER COLUMN name VARCHAR(50) NOT NULL;
ALTER TABLE tbl_roles ADD CONSTRAINT PK_tbl_roles PRIMARY KEY (id);

/*tbl_account_roles*/
ALTER TABLE tbl_account_roles ALTER COLUMN id INT NOT NULL;
ALTER TABLE tbl_account_roles  ALTER COLUMN role INT NOT NULL;
ALTER TABLE tbl_account_roles  ALTER COLUMN account INT NULL;
ALTER TABLE tbl_account_roles ADD CONSTRAINT PK_tbl_account_roles PRIMARY KEY (id);

ALTER TABLE tbl_account_roles 
ADD CONSTRAINT FK_tbl_account_roles_role 
FOREIGN KEY (role) REFERENCES tbl_roles(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_account_roles 
ADD CONSTRAINT FK_tbl_account_roles_account 
FOREIGN KEY (account) REFERENCES tbl_account(id)
ON DELETE SET NULL;

/*tbl_account*/
ALTER TABLE tbl_account ALTER COLUMN id INT NOT NULL;
ALTER TABLE tbl_account ALTER COLUMN username VARCHAR(25) NOT NULL;
ALTER TABLE tbl_account ALTER COLUMN password VARCHAR(255) NOT NULL;
ALTER TABLE tbl_account ALTER COLUMN otp INT NOT NULL;
ALTER TABLE tbl_account ADD CONSTRAINT PK_tbl_account PRIMARY KEY (id);

ALTER TABLE tbl_account 
ADD CONSTRAINT FK_tbl_account_roles 
FOREIGN KEY (id) REFERENCES tbl_employee(id)
ON DELETE NO ACTION;

/*End Constraint */

/*End irvandhar*/

-- Irham J

CREATE TABLE tbl_regions (
	id int,
	name VARCHAR(25) NOT NULL
); 

CREATE TABLE tbl_countries(
	id char(3),
	name VARCHAR(40) NOT NULL,
	region int
);

CREATE TABLE tbl_locations(
	id int,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country char(3)
);

CREATE TABLE tbl_departments(
	id int,
	name VARCHAR(30) NOT NULL,
	location int
);

CREATE TABLE tbl_employee(
	id int,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25),
	gender VARCHAR(10) NOT NULL,
	email VARCHAR(25),
	phone VARCHAR(20),
	hire_date DATE,
	salary int, 
	manager int,
	job VARCHAR(10),
	department int
);
-- START CONSTRAINT --
-- TBL REGION
ALTER TABLE tbl_regions ALTER COLUMN id int NOT NULL;
ALTER TABLE tbl_regions ADD CONSTRAINT PK_TBL_REGIONS PRIMARY KEY (id); 

-- TBL Countries
ALTER TABLE tbl_countries ALTER COLUMN id char(3) NOT NULL;
ALTER TABLE tbl_countries ALTER COLUMN region int NOT NULL;
ALTER TABLE tbl_countries ADD CONSTRAINT PK_TBL_Countries PRIMARY KEY (id); 

ALTER TABLE tbl_countries
ADD CONSTRAINT FK_tbl_countries_regions
FOREIGN KEY (region) REFERENCES tbl_regions(id)
ON DELETE NO ACTION;
-- TBL Locations
ALTER TABLE tbl_locations ALTER COLUMN id int NOT NULL;
ALTER TABLE tbl_locations ALTER COLUMN country char(3) NOT NULL;
ALTER TABLE tbl_locations ADD CONSTRAINT PK_TBL_Locations PRIMARY KEY (id); 

ALTER TABLE tbl_locations
ADD CONSTRAINT FK_TBL_Countries
FOREIGN KEY (country) REFERENCES tbl_countries(id)
ON DELETE NO ACTION;
-- TBL Departments
ALTER TABLE tbl_departments ALTER COLUMN id int NOT NULL;
ALTER TABLE tbl_departments ALTER COLUMN location int NOT NULL;
ALTER TABLE tbl_departments ADD CONSTRAINT PK_TBL_Departments PRIMARY KEY (id); 

ALTER TABLE tbl_departments
ADD CONSTRAINT FK_TBL_Location
FOREIGN KEY (location) REFERENCES tbl_locations(id)
ON DELETE NO ACTION;
-- TBL Employees
ALTER TABLE tbl_employee ALTER COLUMN id int NOT NULL;
ALTER TABLE tbl_employee ADD CONSTRAINT PK_TBL_Employee PRIMARY KEY (id);
ALTER TABLE tbl_employee ALTER COLUMN email VARCHAR(25) NOT NULL;
ALTER TABLE tbl_employee ADD CONSTRAINT UQ_tbl_Employee_email UNIQUE (email);
ALTER TABLE tbl_employee ALTER COLUMN department int NOT NULL;
ALTER TABLE tbl_employee ADD CONSTRAINT FK_tbl_employee_manager FOREIGN KEY (manager) REFERENCES tbl_employee(id);
ALTER TABLE tbl_employee ALTER COLUMN salary int NOT NULL;
ALTER TABLE tbl_employee ALTER COLUMN job VARCHAR(10) NOT NULL;

ALTER TABLE tbl_employee 
ADD CONSTRAINT FK_TBL_Department_employee 
FOREIGN KEY (department) REFERENCES tbl_departments (id) 
ON DELETE NO ACTION;

ALTER TABLE tbl_employee 
ADD CONSTRAINT FK_tbl_salary_employee 
FOREIGN KEY (salary) REFERENCES tbl_salary (id)
ON DELETE NO ACTION;

ALTER TABLE tbl_employee 
ADD CONSTRAINT FK_tbl_jobs_employee 
FOREIGN KEY (job) REFERENCES tbl_jobs (id)
ON DELETE NO ACTION;

-- END CONSTRAINT --
-- Irham J

/*Start Jihan Azzahra*/
CREATE TABLE tbl_jobs(
	id varchar(10),
	title varchar(35),
	min_salary int,
	max_salary int
); 

CREATE TABLE tbl_job_histories(
	id_employee int,
	start_date date,
	end_date date,
	status varchar(10),
	job varchar(10),
	department int
);

CREATE TABLE tbl_salary(
	id int,
	salary_per_hour int,
	salary_per_day int,
	working_hour int,
	absensi int,
	month_year date,
	totalhour int
);
EXEC sp_rename 'tbl_salary.working_out', 'working_hour', 'COLUMN';
SELECT * FROM tbl_salary
CREATE TABLE tbl_absensi(
	id int,
	id_employee int,
	clock_in datetime,
	clock_out datetime,
	status varchar,
	time time
);

CREATE TABLE tbl_salary_history(
	id_employee int,
	id_salary int,
	end_date date,
	status varchar(10),
	job varchar(10),
	department int
);
/*End Jihan Azzahra*/

/*Start Jihan Azzahra*/

--tbl_jobs
ALTER TABLE tbl_jobs ALTER COLUMN id varchar(10) NOT NULL;
ALTER TABLE tbl_jobs ADD CONSTRAINT PK_tbl_jobs PRIMARY KEY (id); 
ALTER TABLE tbl_jobs ALTER COLUMN title varchar(35) NOT NULL;

--tbl_job_histories
SELECT * FROM tbl_job_histories;
ALTER TABLE tbl_job_histories ALTER COLUMN id_employee INT NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN start_date DATE NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN status varchar(10) NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN job varchar(10) NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN department int NOT NULL;
ALTER TABLE tbl_job_histories ADD CONSTRAINT PK_tbl_job_histories PRIMARY KEY (id_employee, start_date);

ALTER TABLE tbl_job_histories
ADD CONSTRAINT FK_tbl_Department_JoB_History
FOREIGN KEY (department) REFERENCES tbl_departments(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_job_histories
ADD CONSTRAINT FK_tbl_jobs
FOREIGN KEY (job) REFERENCES tbl_jobs(id)
ON DELETE NO ACTION;

--tbl_absensi
ALTER TABLE tbl_absensi alter column id INT NOT NULL;
ALTER TABLE tbl_absensi ADD CONSTRAINT PK_tbl_absensi PRIMARY KEY(id);
ALTER TABLE tbl_absensi ALTER COLUMN id_employee int NOT NULL;
ALTER TABLE tbl_absensi ADD CONSTRAINT FK_Employee_Absen FOREIGN KEY (id_employee) REFERENCES tbl_employee (id);
ALTER TABLE tbl_absensi ALTER COLUMN status varchar(10) NOT NULL; 

--tbl_salary
ALTER TABLE tbl_salary ALTER COLUMN id int NOT NULL;
ALTER TABLE tbl_salary ADD CONSTRAINT PK_tbl_salary PRIMARY KEY(id);
ALTER TABLE tbl_salary ALTER COLUMN absensi int NOT NULL; --Ubah ke yang bawah
ALTER TABLE tbl_salary ALTER COLUMN absensi int;-- ini, klo udah bener insrt ubah ke atas.
ALTER TABLE tbl_salary ADD CONSTRAINT FK_tbl_salary FOREIGN KEY (absensi) REFERENCES tbl_absensi (id);

--tbl_salary_history
ALTER TABLE tbl_salary_history ADD CONSTRAINT FK_tbl_salary_history_tbl_salary FOREIGN KEY (id_salary) REFERENCES tbl_salary(id);
ALTER TABLE tbl_salary_history ADD CONSTRAINT PK_tbl_salary_history PRIMARY KEY(id_salary);
ALTER TABLE tbl_salary_history ADD CONSTRAINT FK_Employee__salary_history FOREIGN KEY (id_employee) REFERENCES tbl_employee (id);
ALTER TABLE tbl_salary_history ALTER COLUMN status varchar(10) NOT NULL;
ALTER TABLE tbl_salary_history ALTER COLUMN id_salary int NOT NULL;
ALTER TABLE tbl_salary_history ALTER COLUMN job varchar(10) NOT NULL;
ALTER TABLE tbl_salary_history ALTER COLUMN department int NOT NULL;
ALTER TABLE tbl_salary_history ADD CONSTRAINT FK_Department_Salary_History FOREIGN KEY (department) REFERENCES tbl_departments (id);
/*End Jihan Azzahra*/