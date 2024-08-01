-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Job
-- =============================================

CREATE PROCEDURE SP_delete_jobs(
    @id VARCHAR(10)
)AS
BEGIN
    DELETE FROM tbl_departments
    WHERE id = @id
END
