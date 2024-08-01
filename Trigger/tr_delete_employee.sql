SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 10/06/2024
-- Description:	Menambahkan data ke table job histories dengan status "Resign" jika ada data dihapus pada table employee
-- =============================================
CREATE TRIGGER tr_update_employee_job
ON tbl_employee
AFTER DELETE
AS
BEGIN
	INSERT INTO tbl_job_histories (id_employee, start_date, end_date, status, job, department)
    SELECT 
        i.id, GETDATE(), NULL, 'Resign', i.job, i.department      
    FROM inserted i; 
END;
