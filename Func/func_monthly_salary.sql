SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Function untuk menghitung salary employee
-- =======================================================
CREATE FUNCTION func_monthly_salary(
    @Salary_Per_Day INT,
    @TotalHour INT,
	@absensi INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Salary_Per_Hour INT;
    DECLARE @Monthly_Salary INT;

	-- Ambil data absensi dari tbl_salary
    SELECT @absensi = absensi
    FROM tbl_salary

	-- Hitung gaji per jam
    SET @Salary_Per_Hour = @Salary_Per_Day / @absensi;

    -- Hitung gaji bulanan
    SET @Monthly_Salary = @Salary_Per_Hour * @TotalHour;

    RETURN @Monthly_Salary;
END;


