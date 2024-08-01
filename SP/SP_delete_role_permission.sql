-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Role Permission
-- =============================================

CREATE PROCEDURE SP_delete_role_permissions(
    @id int
)AS
BEGIN
    DELETE FROM tbl_role_permissions
    WHERE id = @id
END

EXEC SP_delete_role_permissions @id= 210001

SELECT * FROM tbl_role_permissions
DROP PROCEDURE SP_delete_role_permission

