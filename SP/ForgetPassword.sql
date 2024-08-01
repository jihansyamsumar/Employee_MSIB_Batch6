USE 
final_project_employee
GO
SELECT * FROM tbl_account
CREATE PROCEDURE ForgetPassword
    @inputEmail VARCHAR(255),
    @newPassword VARCHAR(100),
    @confirmPassword VARCHAR(100),
    @otp INT
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

    -- Step 2: Check if the OTP is valid, expired, or used
    DECLARE @isValidOTP BIT;
    SELECT @isValidOTP = CASE 
                            WHEN otp = @otp THEN 1 -- Valid OTP
                            WHEN is_used = 1 THEN -2 -- OTP is used
                            WHEN is_expired < GETDATE() THEN -1 -- OTP is expired
                            ELSE 0 -- Incorrect OTP
                         END
    FROM tbl_account
    WHERE id = @employeeId;

    IF @isValidOTP = 0
    BEGIN
        PRINT 'OTP is incorrect';
        RETURN;
    END
    ELSE IF @isValidOTP = -1
    BEGIN
        PRINT 'OTP is expired';
        RETURN;
    END
    ELSE IF @isValidOTP = -2
    BEGIN
        PRINT 'OTP is used';
        RETURN;
    END

    -- Step 3: Check if the new password and confirm password match
    IF dbo.func_password_match(@newPassword, @confirmPassword) = 0
    BEGIN
        PRINT 'Password and confirm password do not match';
        RETURN;
    END

    -- Step 4: Update the account with the new password and mark OTP as used
    UPDATE tbl_account
    SET password = @newPassword,
        is_used = 1
    WHERE id = @employeeId;

    PRINT 'Password updated successfully';
END
GO

