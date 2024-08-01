-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Departments
-- =============================================

CREATE PROCEDURE SP_delete_departments(
    @id INT
)AS
BEGIN
    DELETE FROM tbl_departments
    WHERE id = @id
END

EXEC SP_delete_departments @id = 600100

SELECT * FROM tbl_departments
DROP PROCEDURE SP_delete_departments
