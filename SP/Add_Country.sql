USE 
final_project_employee
GO

CREATE PROCEDURE AddCountry
    @id NVARCHAR(10),
    @name NVARCHAR(255),
    @region INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the country ID already exists
    IF EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Country is already Exist';
    END
    ELSE
    BEGIN
        -- Check if the region exists
        IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @region)
        BEGIN
            PRINT 'Sorry, Region Doesn''t Exist';
        END
        ELSE
        BEGIN
            -- Insert the new country
            INSERT INTO tbl_countries (id, name, region)
            VALUES (@id, @name, @region);

            PRINT 'Country Added';
        END
    END
END
GO

EXEC AddCountry @id = 'CO', @name = 'Comorros', @region = 400300;
SELECT * FROM tbl_countries