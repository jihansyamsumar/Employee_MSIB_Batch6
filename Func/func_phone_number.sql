-- =============================================
-- Author:		Jihan 
-- Description:	func_phone_number
-- =============================================

CREATE FUNCTION func_phone_number(
	@phone_number VARCHAR(20)
)
RETURNS VARCHAR(1)
AS
BEGIN
	DECLARE @isValid VARCHAR(1);

	-- Memeriksa apakah phone number hanya berisi karakter numerik
	IF @phone_number NOT LIKE '%[^0-9]%'
	BEGIN
		SET @isValid = '1';
	END
	ELSE
	BEGIN
		SET @isValid = '0';
	END

	RETURN @isValid;
END;

SELECT dbo.func_phone_number('08123456789') AS PhoneNumberValidity;
SELECT dbo.func_phone_number('+62 8123456789') AS PhoneNumberValidity;
SELECT dbo.func_phone_number('0812abc3456dfe') AS PhoneNumberValidity;
