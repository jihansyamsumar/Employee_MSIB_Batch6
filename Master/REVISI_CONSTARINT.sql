
--tbl_permission
EXEC sp_helpconstraint 'tbl_permission'

--tbl_role_permissions
EXEC sp_helpconstraint 'tbl_role_permissions'

ALTER TABLE tbl_role_permissions
DROP CONSTRAINT FK_tbl_role_permissions_permission;

ALTER TABLE tbl_role_permissions
DROP CONSTRAINT FK_tbl_role_permissions_role;

ALTER TABLE tbl_role_permissions ALTER COLUMN permission INT NULL;

ALTER TABLE tbl_role_permissions ALTER COLUMN role INT NOT NULL;

ALTER TABLE tbl_role_permissions
ADD CONSTRAINT FK_tbl_role_permissions_permission
FOREIGN KEY (permission) REFERENCES tbl_permission(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_role_permissions
ADD CONSTRAINT FK_tbl_role_permissions_role
FOREIGN KEY (role) REFERENCES tbl_roles(id)
ON DELETE NO ACTION;

--tbl_role
EXEC sp_helpconstraint 'tbl_roles'

--tbl_account_roles

EXEC sp_helpconstraint 'tbl_account_roles'
ALTER TABLE tbl_account_roles  ALTER COLUMN role INT NOT NULL;
ALTER TABLE tbl_account_roles  ALTER COLUMN account INT NULL;

ALTER TABLE tbl_account_roles 
ADD CONSTRAINT FK_tbl_account_roles_role 
FOREIGN KEY (role) REFERENCES tbl_roles(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_account_roles 
ADD CONSTRAINT FK_tbl_account_roles_account 
FOREIGN KEY (account) REFERENCES tbl_account(id)
ON DELETE SET NULL;

ALTER TABLE tbl_account_roles
DROP CONSTRAINT FK_tbl_account_roles_account;

ALTER TABLE tbl_account_roles
DROP CONSTRAINT FK_tbl_account_roles_role;

--tbl_account
EXEC sp_helpconstraint 'tbl_account'

ALTER TABLE tbl_employee ALTER COLUMN id INT NULL;

--sebelum input data di tbl_employee, hapus constraint ini dulu, setelah itu input data employeee lalu input data account 
ALTER TABLE tbl_account
DROP CONSTRAINT FK_tbl_account_roles;

ALTER TABLE tbl_account 
ADD CONSTRAINT FK_tbl_account_roles 
FOREIGN KEY (id) REFERENCES tbl_employee(id)
ON DELETE NO ACTION;
--sebelum input data di tbl_employee, hapus constraint ini dulu, setelah itu input data employeee lalu input data account 

--tbl_region
EXEC sp_helpconstraint 'tbl_regions'

--tbl_country
EXEC sp_helpconstraint 'tbl_countries'
ALTER TABLE tbl_countries ALTER COLUMN region INT NOT NULL;

ALTER TABLE tbl_countries
DROP CONSTRAINT FK_tbl_countries_regions;

ALTER TABLE tbl_countries
ADD CONSTRAINT FK_tbl_countries_regions
FOREIGN KEY (region) REFERENCES tbl_regions(id)
ON DELETE NO ACTION;

SELECT * FROM tbl_countries

--tbl_locations
ALTER TABLE tbl_locations ALTER COLUMN country CHAR(3) NOT NULL;

EXEC sp_helpconstraint 'tbl_locations'

ALTER TABLE tbl_locations
DROP CONSTRAINT FK_TBL_Countries;

ALTER TABLE tbl_locations
ADD CONSTRAINT FK_TBL_Countries
FOREIGN KEY (country) REFERENCES tbl_countries(id)
ON DELETE NO ACTION;

--tbl_departments
ALTER TABLE tbl_departments ALTER COLUMN location INT NOT NULL;
EXEC sp_helpconstraint 'tbl_departments'

ALTER TABLE tbl_departments
DROP CONSTRAINT FK_TBL_Location;

ALTER TABLE tbl_departments
ADD CONSTRAINT FK_TBL_Location
FOREIGN KEY (location) REFERENCES tbl_locations(id)
ON DELETE NO ACTION;



--tbl_employee
EXEC sp_helpconstraint 'tbl_employee'

ALTER TABLE tbl_employee
ADD CONSTRAINT FK_TBL_Location
FOREIGN KEY (location) REFERENCES tbl_locations(id)
ON DELETE SET NULL;

ALTER TABLE tbl_employee
DROP CONSTRAINT FK_TBL_Department;

ALTER TABLE tbl_employee
DROP CONSTRAINT FK_tbl_jobs_employee;

ALTER TABLE tbl_employee
DROP CONSTRAINT FK_tbl_salary_employee;

ALTER TABLE tbl_employee ALTER COLUMN department INT NOT NULL;
ALTER TABLE tbl_employee ALTER COLUMN job VARCHAR(10) NOT NULL;
ALTER TABLE tbl_employee ALTER COLUMN salary int  NOT NULL;

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

--tbl_jobs
EXEC sp_helpconstraint 'tbl_jobs'

--tbl_job_histories
ALTER TABLE tbl_job_histories ALTER COLUMN department INT NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN job VARCHAR(10) NOT NULL;
ALTER TABLE tbl_job_histories ALTER COLUMN id_employee INT NOT NULL;
EXEC sp_helpconstraint 'tbl_job_histories'

ALTER TABLE tbl_job_histories
DROP CONSTRAINT FK_Employee_history;

ALTER TABLE tbl_job_histories
DROP CONSTRAINT FK_tbl_Department_JoB_History;

ALTER TABLE tbl_job_histories
DROP CONSTRAINT FK_tbl_jobs;

ALTER TABLE tbl_employee--
DROP CONSTRAINT FK_tbl_employee_history;

ALTER TABLE tbl_employee ADD CONSTRAINT FK_tbl_employee_history FOREIGN KEY (id_employee) REFERENCES tbl_employee (id)ON DELETE NO ACTION;--test belum di running

ALTER TABLE tbl_job_histories --Jangan di running
ADD CONSTRAINT FK_Employee_history
FOREIGN KEY (id_employee) REFERENCES tbl_employee(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_job_histories
ADD CONSTRAINT FK_tbl_Department_JoB_History
FOREIGN KEY (department) REFERENCES tbl_departments(id)
ON DELETE NO ACTION;

ALTER TABLE tbl_job_histories
ADD CONSTRAINT FK_tbl_jobs
FOREIGN KEY (job) REFERENCES tbl_jobs(id)
ON DELETE NO ACTION;

EXEC sp_helpconstraint 'tbl_employee'

SELECT * FROM tbl_account

DELETE FROM tbl_account WHERE id = 1
DELETE FROM tbl_employee WHERE id = 1

delete from tbl_job_histories

