CREATE VIEW vw_job AS
SELECT id, title,min_salary,max_salary
FROM tbl_jobs;

SELECT * FROM vw_job
