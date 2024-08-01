-- =============================================
-- Author:		Jihan 
-- Description:	func_gender
-- =============================================

CREATE FUNCTION func_gender (
	@gender VARCHAR(10)
)
RETURNS VARCHAR(1)
AS
BEGIN
	DECLARE @isValid VARCHAR(1);

	-- Memeriksa apakah gender memiliki nilai "Male" atau "Female"
	IF @gender = 'Male' OR @gender = 'Female'
	BEGIN
		SET @isValid = '1';
	END
	ELSE
	BEGIN
		SET @isValid = '0';
	END
	RETURN @isValid;
END;

SELECT dbo.func_gender('Male') AS GenderValidity; 
SELECT dbo.func_gender('Female') AS GenderValidity;
SELECT dbo.func_gender('Man') AS GenderValidity;