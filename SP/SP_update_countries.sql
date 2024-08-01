SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update data countries
-- =============================================
CREATE PROCEDURE SP_update_countries(
	@id int,
	@name VARCHAR(30)
)AS
BEGIN
	UPDATE tbl_countries
	SET
		name = COALESCE(@name, name)
	WHERE
		id = @id;

	PRINT 'Locations Updated!'

END
