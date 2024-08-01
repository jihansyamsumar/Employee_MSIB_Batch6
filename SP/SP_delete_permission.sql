-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Permission
-- =============================================

CREATE PROCEDURE SP_delete_permissions(
    @id INT
)AS
BEGIN
    DELETE FROM tbl_permission
    WHERE id = @id
END

EXEC SP_delete_permissions @id = 100001

SELECT * FROM tbl_permission