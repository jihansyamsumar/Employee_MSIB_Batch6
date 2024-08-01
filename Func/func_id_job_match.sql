-- =============================================
-- Author:		Jihan 
-- Description:	func_id_job_match
-- =============================================

CREATE FUNCTION func_id_job_match(
	@job_id VARCHAR(10)
)
RETURNS VARCHAR(1)
AS
BEGIN
	DECLARE @isValid VARCHAR(1);

	-- Memeriksa apakah job id memiliki value yang sama
	IF @job_id IS NOT NULL AND LEN(@job_id) > 0
	BEGIN
		SET @isValid = '1';
	END
	ELSE
	BEGIN
		SET @isValid = '0';
	END

	RETURN @isValid;
END;

SELECT dbo.func_id_job_match('100') AS JobIDValidity; 
SELECT dbo.func_id_job_match(NULL) AS JobIDValidity; 
