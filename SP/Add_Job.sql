USE 
final_project_employee
GO
CREATE PROCEDURE AddJob
    @id NVARCHAR(50),
    @title NVARCHAR(255),
    @min_salary INT,
    @max_salary INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validasi job ID menggunakan fungsi func_id_job_match
    IF dbo.func_id_job_match(@id) = '0'
    BEGIN
        PRINT 'Invalid Job ID';
        RETURN;
    END

    -- Check if the job ID already exists
    IF EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @id)
    BEGIN
        PRINT 'Sorry, Job is already Exist';
    END
    ELSE
    BEGIN
        -- Insert the new job
        INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
        VALUES (@id, @title, @min_salary, @max_salary);

        PRINT 'Job Added';
    END
END
GO
