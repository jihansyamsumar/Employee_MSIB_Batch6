USE 
final_project_employee
GO

CREATE PROCEDURE AddLocation
    @id INT,
    @street_address NVARCHAR(255),
    @postal_code NVARCHAR(20),
    @city NVARCHAR(100),
    @state_province NVARCHAR(100),
    @country NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the location ID already exists
    IF EXISTS (SELECT 1 FROM tbl_locations WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Location is already Exist';
    END
    ELSE
    BEGIN
        -- Check if the country exists
        IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @country)
        BEGIN
            PRINT 'Sorry, Country Doesn''t Exist';
        END
        ELSE
        BEGIN
            -- Insert the new location
            INSERT INTO tbl_locations (id, street_address, postal_code, city, state_province, country)
            VALUES (@id, @street_address, @postal_code, @city, @state_province, @country);

            PRINT 'Location Added';
        END
    END
END
GO
