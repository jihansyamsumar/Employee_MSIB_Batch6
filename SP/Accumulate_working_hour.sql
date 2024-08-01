USE 
final_project_employee
GO
CREATE PROCEDURE AccumulateWorkingHours
    @id_employee INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @total_hours INT;

    -- Calculate total working hours for the employee for the current month
    SELECT @total_hours = SUM(DATEDIFF(HOUR, clock_in, clock_out))
    FROM tbl_absensi
    WHERE id = @id_employee
      AND MONTH(clock_in) = MONTH(GETDATE())
      AND YEAR(clock_in) = YEAR(GETDATE());

    -- Update total hours in tbl_salary
    UPDATE tbl_salary
    SET TotalHour = @total_hours
    WHERE id = @id_employee;

    PRINT 'Working hours accumulated successfully';
END
GO


