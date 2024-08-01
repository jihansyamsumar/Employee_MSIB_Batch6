USE 
final_project_employee
GO

CREATE PROCEDURE AddDepartment
    @id INT,
    @name NVARCHAR(255),
    @location INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the department ID already exists
    IF EXISTS (SELECT 1 FROM tbl_departments WHERE id = @id)
    BEGIN
        PRINT 'Sorry, department is already Exist';
    END
    ELSE
    BEGIN
        -- Check if the location exists
        IF NOT EXISTS (SELECT 1 FROM tbl_locations WHERE id = @location)
        BEGIN
            PRINT 'Sorry, Location Doesn''t Exist';
        END
        ELSE
        BEGIN
            -- Insert the new department
            INSERT INTO tbl_departments (id, name, location)
            VALUES (@id, @name, @location);

            PRINT 'Department Added';
        END
    END
END
GO
