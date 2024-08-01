SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Jihan 
-- Description: Update data Profil
-- =============================================

CREATE PROCEDURE SP_update_profile(
    @id INT,
    @first_name VARCHAR(25),
    @last_name VARCHAR(25) = NULL,
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(25) = NULL
)
AS
BEGIN
    DECLARE @Valid_gender BIT;
    DECLARE @Valid_email BIT;
    DECLARE @Valid_phone BIT;

    SET @Valid_gender = dbo.func_gender(@gender);
    SET @Valid_email = dbo.func_email_format(@email);
    SET @Valid_phone = dbo.func_phone_number(@phone);

    --Proses validasi gender, email, phone_number
    IF @Valid_gender = 1 AND @Valid_email = 1 AND @Valid_phone = 1
    BEGIN
        UPDATE tbl_employee
        SET
            first_name = COALESCE(@first_name, first_name),
            last_name = COALESCE(@last_name, last_name),
            gender = COALESCE(@gender, gender),
            email = COALESCE(@email, email),
            phone = COALESCE(@phone, phone)
        WHERE
            id = @id;

        PRINT 'Data Employee Updated!';
    END
    ELSE
    BEGIN
        PRINT 'Invalid data!';
    END
END;



-- Menjalankan stored procedure dengan parameter yang diberikan
EXEC SP_update_profile 
    @id = 10,
    @first_name = 'Eriska',
	@last_name = 'Alexa',
	@gender = 'Female',
	@email = 'jan.lexa@example.com',
	@phone = '0123456789',
	@hire_date = '2021-05-13',
	@salary = '2',
	@manager = '1',
	@job = 'AppDevJr',
	@department = '600100'


DROP PROCEDURE SP_update_profile
SELECT * FROM tbl_employee
SELECT * FROM tbl_departments
SELECT * FROM tbl_salary
