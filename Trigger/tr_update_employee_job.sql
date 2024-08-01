SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:                Irvandhar
-- Create date: 10/06/2024
-- Description:        Menambahkan data ke table job histories dengan status "Hand Over",
--                                ketika ada perubahan pada table employee kolom job
-- =============================================
CREATE TRIGGER tr_update_employee_job
ON tbl_employee
AFTER UPDATE
AS
BEGIN
        INSERT INTO tbl_job_histories (id_employee, start_date, end_date, status, job, department)
		SELECT 
			i.id, GETDATE(), NULL, 'Hand Over', i.job, i.department      
		FROM inserted i; 
END;
