SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 10/06/2024
-- Description:	Triger after insert - tbl_employee
-- =============================================
CREATE TRIGGER tr_insert_employee
ON tbl_employee
AFTER INSERT
AS
BEGIN
	INSERT INTO tbl_job_histories (id_employee, start_date, end_date, status, job, department)
    SELECT 
        i.id, GETDATE(), NULL, 'Active', i.job, i.department      
    FROM inserted i; 
END;

/* Trial and Error
ALTER TABLE tbl_job_histories
DROP CONSTRAINT PK_tbl_job_histories;

DROP TRIGGER IF EXISTS tr_insert_employee;

SELECT * FROM tbl_job_histories;
*/