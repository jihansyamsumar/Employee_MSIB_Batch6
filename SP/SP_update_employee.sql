SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update Data Employee
-- =============================================
CREATE PROCEDURE SP_update_employee(
    @id INT,
    @job VARCHAR(10)
)
AS
BEGIN
    BEGIN
        UPDATE tbl_employee
        SET
            job = COALESCE(@job, job)
        WHERE
            id = @id;

        PRINT 'Employee Job Updated!';
    END
END;

select * from tbl_employee
