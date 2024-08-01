SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Role
-- =============================================

CREATE PROCEDURE SP_delete_role(
    @id int
)AS
BEGIN
    DELETE FROM tbl_roles
    WHERE id = @id
END;

EXEC SP_delete_role @id= 120100

SELECT * FROM tbl_roles
DROP PROCEDURE SP_delete_role_permission

