USE 
final_project_employee
GO

SELECT * FROM tbl_employee
CREATE PROCEDURE GenerateOTP
    @inputEmail VARCHAR(255),
    @otp INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cek apakah email ada di tabel employee
    DECLARE @employeeId INT;
    SELECT @employeeId = id FROM tbl_employee WHERE email = @inputEmail;

    IF @employeeId IS NULL
    BEGIN
        PRINT 'Account not registered';
        RETURN;
    END

    -- Generate OTP random 6 digit
    SET @otp = CAST(RAND() * 900000 + 100000 AS INT);

    -- Waktu saat ini dan waktu expired
    DECLARE @currentTime DATETIME = GETDATE();
    DECLARE @expiredTime DATETIME = DATEADD(MINUTE, 10, @currentTime);

    -- Update tabel account dengan data OTP yang baru
    UPDATE tbl_account
    SET otp = @otp,
        is_expired = @expiredTime,
        is_used = 0
    WHERE id = @employeeId;

    -- Output OTP
    PRINT 'OTP: ' + CAST(@otp AS VARCHAR);
END;
GO


DROP PROCEDURE GenerateOTP

EXEC GenerateOTP @inputEmail = 'alice.johnson@example.com';

SELECT * FROM tbl_employee
SELECT * FROM tbl_account
DELETE FROM tbl_account WHERE id = 1