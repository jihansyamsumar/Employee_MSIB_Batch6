USE 
final_project_employee
GO

CREATE PROCEDURE AddRegion
    @id INT,
    @name NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the region ID already exists
    IF EXISTS (SELECT 1 FROM tbl_regions WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Region is already Exist';
    END
    ELSE
    BEGIN
        -- Insert the new region
        INSERT INTO tbl_regions (id, name)
        VALUES (@id, @name);

        PRINT 'Region Added';
    END
END
GO
EXEC AddRegion @id = 400400, @name = 'Central Europe';
SELECT * FROM tbl_regions