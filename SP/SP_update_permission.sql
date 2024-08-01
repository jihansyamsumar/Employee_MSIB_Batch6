SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update data permission
-- =============================================
CREATE PROCEDURE SP_update_permission(
	@id int,
	@name VARCHAR(30)
)AS
BEGIN
	UPDATE tbl_permission
	SET
		name = COALESCE(@name, name)
	WHERE
		id = @id;

	PRINT 'Permission Updated!'

END
