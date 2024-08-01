-- =============================================
-- Author:		Jihan 
-- Description:	func_email_format
-- =============================================

CREATE FUNCTION func_email_format(
	@email VARCHAR(50)
)
RETURNS VARCHAR(1)
AS
BEGIN
	DECLARE @isValid VARCHAR(1);

	-- Memeriksa apakah email memiliki simbol @ and .
	-- posisi @ harus sebelum posisi .
	IF CHARINDEX('@', @email) > 1
		AND CHARINDEX('.', @email, CHARINDEX('@', @email)) > CHARINDEX('@', @email) + 1
		AND LEN(@email) - CHARINDEX('.', REVERSE(@email)) > 1
	BEGIN
		SET @isValid = '1';
	END
	ELSE
	BEGIN
		SET @isValid = '0';
	END
	RETURN @isValid;
END;

SELECT dbo.func_email_format('user@example.com') AS EmailValidity;
SELECT dbo.func_email_format('userexample.com') AS EmailValidity;