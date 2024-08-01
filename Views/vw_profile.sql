USE 
final_project_employee
GO
CREATE VIEW vw_profile AS
SELECT 
    e.id AS employee_id,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    e.gender,
    e.email,
    e.phone,
    e.hire_date,
    e.salary,
    e.manager AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
    e.job,
    e.department
FROM 
    tbl_employee e
LEFT JOIN 
    tbl_employee m ON e.manager = m.id;