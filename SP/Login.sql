USE 
final_project_employee
GO
SELECT a.id, a.username, a.password, e.email
FROM tbl_account a
INNER JOIN tbl_employee e ON a.id = e.id;

CREATE PROCEDURE dbo.usp_Login
    @input NVARCHAR(255),
    @inputPassword NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @realPassword NVARCHAR(255);
    DECLARE @userId INT;
    DECLARE @username NVARCHAR(255);
    DECLARE @userEmail NVARCHAR(255);

    -- Attempt to get the account by username
    SELECT @userId = id, @realPassword = password, @username = username
    FROM tbl_account
    WHERE username = @input;

    -- If no user was found by username, try to get by email from employee table
    IF @userId IS NULL
    BEGIN
        SELECT @userId = a.id, @realPassword = a.password, @userEmail = e.email
        FROM tbl_employee e
        INNER JOIN tbl_account a ON e.id = a.id
        WHERE e.email = @input;
    END

    -- Check if user exists
    IF @userId IS NULL
    BEGIN
        PRINT 'User not registered';
    END
    ELSE
    BEGIN
        -- Verify password
        IF @realPassword = @inputPassword
        BEGIN
            PRINT 'Login Success';
        END
        ELSE
        BEGIN
            PRINT 'Incorrect password';
        END
    END
END
GO


DROP PROCEDURE dbo.usp_Login
-- Menguji dengan username yang valid
EXEC dbo.usp_Login @input = 'alice.johnson@example.com', @inputPassword = 'password123';

-- Menguji dengan email yang valid
EXEC dbo.usp_Login @input = 'user2@example.com', @inputPassword = 'pass456';
