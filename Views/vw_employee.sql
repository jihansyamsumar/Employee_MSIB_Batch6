ALTER TABLE tbl_employee
ALTER COLUMN email VARCHAR(50); --Gk bisa masukin email jadi di tambah 25 bang, tadi nyoba buat masukin data dummy

/*vw_employee*/
CREATE VIEW vw_employee AS
SELECT id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department
FROM tbl_employee;

SELECT * FROM vw_employee;