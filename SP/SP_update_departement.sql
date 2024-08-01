SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update data departmen
-- =============================================
CREATE PROCEDURE SP_update_department(
	@id int,
	@name VARCHAR(30)
)AS
BEGIN
	UPDATE tbl_departments
	SET
		name = COALESCE(@name, name)
	WHERE
		id = @id;

	PRINT 'Departments Updated!'

END
