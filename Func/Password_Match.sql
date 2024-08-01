CREATE FUNCTION dbo.func_password_match
(
    @password NVARCHAR(100),
    @confirmPassword NVARCHAR(100)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isMatch BIT = 0;
    IF @password = @confirmPassword
    BEGIN
        SET @isMatch = 1;
    END

    RETURN @isMatch;
END
GO


DECLARE @password NVARCHAR(100) = '123123123';
DECLARE @confirmPassword NVARCHAR(100) = '123123123';

IF dbo.func_password_match(@password, @confirmPassword) = 1
BEGIN
    PRINT 'Passwords match';
END
ELSE
BEGIN
    PRINT 'Passwords do not match';
END
