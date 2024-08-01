USE 
final_project_employee
GO
CREATE PROCEDURE LogSalaryHistory
    @id_employee INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @monthly_salary INT;

    -- Get monthly salary from employee table
    SELECT @monthly_salary = salary
    FROM tbl_employee
    WHERE id = @id_employee;

    -- Insert salary history
    INSERT INTO tbl_salary_history (id_employee, id_salary, end_date)
    VALUES (@id_employee, @monthly_salary, GETDATE());

    PRINT 'Salary history logged successfully';
END
GO
