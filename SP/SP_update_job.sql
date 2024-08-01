SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update_tbl_job
-- =============================================
CREATE PROCEDURE SP_update_job(
    @id VARCHAR(10),
    @title VARCHAR(35) = NULL,
    @min_salary INT = NULL,
    @max_salary INT = NULL
)
AS
BEGIN
    -- Update data job berdasarkan parameter yang diberikan
    UPDATE tbl_jobs
    SET
        title = COALESCE(@title, title),
        min_salary = COALESCE(@min_salary, min_salary),
        max_salary = COALESCE(@max_salary, max_salary)
    WHERE
        id = @id;

    PRINT 'Job updated!.';
END;
