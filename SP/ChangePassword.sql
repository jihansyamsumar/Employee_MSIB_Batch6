USE 
final_project_employee
GO

CREATE PROCEDURE ChangePassword
    @inputEmail VARCHAR(255),
    @newPassword VARCHAR(100),
    @confirmPassword VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Check if the email exists in the Employee table
    DECLARE @employeeId INT;
    SELECT @employeeId = id FROM tbl_employee WHERE email = @inputEmail;

    IF @employeeId IS NULL
    BEGIN
        PRINT 'Account not registered';
        RETURN;
    END

    -- Step 2: Generate OTP
    DECLARE @otp INT;
    EXEC GenerateOTP @inputEmail, @otp OUTPUT;

    -- Step 3: Update Table Account with Generated OTP, is_used to false, and expired_time to add 10 minutes
    UPDATE tbl_account
    SET otp = @otp,
        is_used = 0,
        is_expired = DATEADD(MINUTE, 10, GETDATE())
    WHERE id = @employeeId;

    -- Step 4: Print OTP
    PRINT 'OTP: ' + CAST(@otp AS VARCHAR(6));

    -- Step 5: Input New Password and Confirm Password
    IF dbo.func_password_match(@newPassword, @confirmPassword) = 0
    BEGIN
        PRINT 'Password and confirm password do not match';
        RETURN;
    END

    -- Step 6: Update Table Account with New Password and is_used true
    UPDATE tbl_account
    SET password = @newPassword,
        is_used = 1
    WHERE id = @employeeId;

    PRINT 'Password changed successfully';
END
GO
Select * from tbl_salary