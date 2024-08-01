USE 
final_project_employee
GO

CREATE PROCEDURE AddRole
    @id INT,
    @name NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the role ID already exists
    IF EXISTS (SELECT 1 FROM tbl_roles WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Role is already Exist';
    END
    ELSE
    BEGIN
        -- Insert the new role
        INSERT INTO tbl_roles (id, name)
        VALUES (@id, @name);

        PRINT 'Role Added';
    END
END
GO
