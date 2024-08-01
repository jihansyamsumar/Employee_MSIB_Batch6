-- =============================================
-- Author:		Jihan 
-- Description:	Delete data Locations
-- =============================================


CREATE PROCEDURE SP_delete_locations(
    @id INT
)AS
BEGIN
    DELETE FROM tbl_locations
    WHERE id = @id
END

EXEC SP_delete_locations @id = 500200

SELECT * FROM tbl_locations