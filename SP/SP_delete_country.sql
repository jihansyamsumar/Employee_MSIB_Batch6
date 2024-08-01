-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Country
-- =============================================

CREATE PROCEDURE SP_delete_country(
    @id char(3)
)AS
BEGIN
    DELETE FROM tbl_countries
    WHERE id = @id
END

EXEC SP_delete_country @id = 'ID'



SELECT * FROM tbl_countries

DROP PROCEDURE SP_delete_country