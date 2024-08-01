-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Employee
-- =============================================

CREATE PROCEDURE SP_delete_employee(
    @id INT
) AS
BEGIN
    -- Check if the ID is valid (exists in the table)
    IF EXISTS (SELECT 1 FROM tbl_employee WHERE id = @id)
    BEGIN
        -- Delete the account
        DELETE FROM tbl_account WHERE id = @id;

		-- Delete the employee
        DELETE FROM tbl_employee WHERE id = @id;

        -- Print success message
        PRINT 'Employee Deleted!';
    END
    ELSE 
    BEGIN
        -- Print error message if employee not found
        PRINT 'Employee Not Found!';
    END
END;



EXEC SP_delete_employee @id = 1
SELECT * FROM tbl_employee
SELECT * FROM tbl_account
