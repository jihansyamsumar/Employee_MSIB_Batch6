USE 
final_project_employee
GO

CREATE PROCEDURE AddEmployee
    @id INT,
    @first_name NVARCHAR(255),
    @last_name NVARCHAR(255),
    @gender NVARCHAR(10),
    @email NVARCHAR(255),
    @phone NVARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager_id INT = NULL,
    @job NVARCHAR(10),
    @department INT,
    @password NVARCHAR(100),
    @confirm_password NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Check if employee ID already exists
    IF EXISTS (SELECT 1 FROM tbl_employee WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Employee is already Exist';
        RETURN;
    END

    -- Step 2: Check if foreign keys exist
    IF NOT EXISTS (SELECT 1 FROM tbl_salary WHERE id = @salary)
    BEGIN
        PRINT 'Sorry, Salary Doesnt Exist';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @job)
    BEGIN
        PRINT 'Sorry, Job Doesnt Exist';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @department)
    BEGIN
        PRINT 'Sorry, Department Doesnt Exist';
        RETURN;
    END

    -- Step 3: Validate gender
    IF dbo.func_gender(@gender) = '0'
    BEGIN
        PRINT 'Invalid gender. Must be "Male" or "Female"';
        RETURN;
    END

    -- Step 4: Validate email format
    IF dbo.func_email_format(@email) = '0'
    BEGIN
        PRINT 'Invalid email format';
        RETURN;
    END

    -- Step 5: Validate password format
    IF dbo.func_password_policy(@password) = 0
    BEGIN
        PRINT 'Password does not meet policy requirements';
        RETURN;
    END

    -- Step 6: Validate password match
    IF dbo.func_password_match(@password, @confirm_password) = 0
    BEGIN
        PRINT 'Passwords do not match';
        RETURN;
    END

    -- Step 7: Validate phone number format
    IF dbo.func_phone_number(@phone) = '0'
    BEGIN
        PRINT 'Invalid phone number format';
        RETURN;
    END

    -- Step 8: Check Manager Id in Table Employee
    IF @manager_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employee WHERE id = @manager_id)
    BEGIN
        PRINT 'Manager Id not Found!';
        RETURN;
    END
	
    -- Step 9: Insert data into tbl_employee
    INSERT INTO tbl_employee (id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
    VALUES (@id, @first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager_id, @job, @department);

    -- Step 10: Generate OTP for the new account
    DECLARE @otp INT;
    EXEC GenerateOTP @inputEmail = @email, @otp = @otp OUTPUT;

    -- Step 11: Insert data into tbl_account
    INSERT INTO tbl_account (id, username, password, otp, is_expired, is_used)
    VALUES (@id, @email, @password, @otp, DATEADD(MINUTE, 10, GETDATE()), 0);

   
	-- Step 12: Insert data into tbl_account_roles
    INSERT INTO tbl_account_roles (id, account, role)
    SELECT 
        @id,
        @id,
        CASE 
            WHEN @manager_id IS NULL THEN 130300 -- Jika kolom manager NULL
            ELSE 140400 -- Jika kolom manager tidak NULL
        END;
	-- Step 13: Print success message
    PRINT 'Employee Added';
END;
GO
SELECT * FROM tbl_roles
DROP procedure AddEmployee
SELECT * FROM tbl_employee
SELECT * FROM tbl_account
SELECT * FROM tbl_account_roles
DELETE FROM tbl_employee WHERE id = 12;
EXEC AddEmployee 
    @id = 19,
    @first_name = 'Jihan',
    @last_name = 'Dhar',
    @gender = 'Male',
    @email = 'Dhar.jihan@example.com',
    @phone = '1224237890',
    @hire_date = '2024-01-01',
    @salary = 2,
    @manager_id = NULL,
    @job = 'AppDevJr',
    @department = 600100,
    @password = 'Password@123',
    @confirm_password = 'Password@123';
