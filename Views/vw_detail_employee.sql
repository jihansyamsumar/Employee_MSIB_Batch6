/*vw_employee_details*/
/*vw_employee_details*/
CREATE VIEW vw_employee_details AS
SELECT 
	E.id, A.username, CONCAT(E.first_name,' ',E.last_name) AS full_name, E.gender, E.email, E.hire_date, E.salary,E.manager AS manager_id, 
	CONCAT(E.first_name,' ',E.last_name) AS manager_name, E.job, D.name, R.role, D.location, H.status
FROM tbl_employee AS E
JOIN tbl_account AS A ON E.id = A.id
JOIN tbl_departments AS D ON E.department = D.id
JOIN tbl_account_roles AS R ON A.id = R.account
JOIN tbl_job_histories AS H ON E.id = H.id_employee



SELECT * FROM vw_employee_details;