USE 
final_project_employee
GO

CREATE PROCEDURE AddPermission
    @id INT,
    @name NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the permission ID already exists
    IF EXISTS (SELECT 1 FROM tbl_permission WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Permission is already Exist';
    END
    ELSE
    BEGIN
        -- Insert the new permission
        INSERT INTO tbl_permission (id, name)
        VALUES (@id, @name);

        PRINT 'Permission Added';
    END
END
GO
