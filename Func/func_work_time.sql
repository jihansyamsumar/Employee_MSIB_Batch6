-- =============================================
-- Author:		Jihan 
-- Description:	func_work_time
-- =============================================

CREATE FUNCTION func_work_time (
	@clock_in DATETIME,
	@clock_out DATETIME
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @work_time VARCHAR(20);
	DECLARE @hours INT;
	DECLARE @minutes INT;

	-- Memeriksa apakah Clock_in dan Clock_out tidak NULL
	IF @clock_in IS NOT NULL AND @clock_out IS NOT NULL AND @clock_out > @clock_in
    BEGIN
		-- Menghitung selisih waktu dalam menit
        SET @hours = DATEDIFF(MINUTE, @clock_in, @clock_out) / 60;
        SET @minutes = DATEDIFF(MINUTE, @clock_in, @clock_out) % 60;
        
        -- Menggabungkan hasil ke dalam format jam dan menit
        SET @work_time = CAST(@hours AS VARCHAR) + ' jam ' + CAST(@minutes AS VARCHAR) + ' menit';
    END
    ELSE
    BEGIN
        SET @work_time = 'Waktu tidak valid';
    END

    RETURN @work_time;
END;

SELECT dbo.func_work_time('2024-06-12 08:00:00', '2024-06-12 17:00:00') AS WorkTime;
SELECT dbo.func_work_time('2024-06-12 09:30:00', NULL) AS WorkTime;