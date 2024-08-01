USE 
final_project_employee
GO

CREATE FUNCTION dbo.func_password_policy
(
    @password NVARCHAR(100)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT = 0;
    IF LEN(@password) >= 8
    BEGIN
        IF (PATINDEX('%[A-Z]%', @password COLLATE Latin1_General_BIN) > 0)
            AND (PATINDEX('%[a-z]%', @password COLLATE Latin1_General_BIN) > 0)
            AND (PATINDEX('%[0-9]%', @password) > 0)
            AND (PATINDEX('%[^a-zA-Z0-9]%', @password) > 0)
        BEGIN
            SET @isValid = 1;
        END
    END

    RETURN @isValid;
END
GO


DROP Function dbo.func_password_policy

DECLARE @password NVARCHAR(100) = '!rhamJ123321';
IF dbo.func_password_policy(@password) = 1
BEGIN
    PRINT 'Password is valid';
END
ELSE
BEGIN
    PRINT 'Password is invalid';
END