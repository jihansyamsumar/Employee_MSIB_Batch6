SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Function Salary
-- =============================================
CREATE FUNCTION fn_validate_salary(
    @id VARCHAR(10),
    @salary INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @min_salary INT;
    DECLARE @max_salary INT;
    
    -- Ambil min dan max salary dari tbl_job dan sesuaikan dengan idnya.
    SELECT @min_salary = min_salary, @max_salary = max_salary
    FROM tbl_jobs
    WHERE id = @id;
    
    --Start Validate
    IF @salary >= @min_salary AND @salary <= @max_salary
    BEGIN
        RETURN 1; -- Gaji valid
    END
	RETURN 0; -- Gaji tidak valid
END;
GO