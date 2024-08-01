USE 
final_project_employee
GO
CREATE PROCEDURE CalculateMonthlySalary
    @id_employee INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if today is the 10th
    IF DAY(GETDATE()) = 14
    BEGIN
        DECLARE @total_hours INT;
        DECLARE @salary_per_hour INT;
        DECLARE @monthly_salary INT;

        -- Get total hours and salary per hour
        SELECT @total_hours = TotalHour, @salary_per_hour = salary_per_hour
        FROM tbl_salary
        WHERE id = @id_employee;

        -- Validate salary per hour
        IF dbo.fn_validate_salary(@id_employee, @salary_per_hour) = 0
        BEGIN
            PRINT 'Invalid salary per hour';
            RETURN;
        END

        -- Calculate monthly salary
        SET @monthly_salary = @total_hours * @salary_per_hour;

        -- Insert monthly salary into employee table
        UPDATE tbl_employee
        SET salary = @monthly_salary
        WHERE id = @id_employee;

        -- Reset total hours
        UPDATE tbl_salary
        SET TotalHour = 0
        WHERE id = @id_employee;

        PRINT 'Monthly salary calculated and updated successfully';
    END
    ELSE
    BEGIN
        PRINT 'Today is not the salary calculation day';
    END
END
GO
-- Accumulate working hours
EXEC AccumulateWorkingHours @id_employee = 1;

-- On 10th of every month
EXEC CalculateMonthlySalary @id_employee = 1;

-- Log salary history
EXEC LogSalaryHistory @id_employee = 1;