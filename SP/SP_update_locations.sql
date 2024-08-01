SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Irvandhar
-- Create date: 09/06/2024
-- Description:	Update data locations
-- =============================================
CREATE PROCEDURE SP_update_locations
(
    @id INT,
    @street_address VARCHAR(40) = NULL,
    @postal_code VARCHAR(12) = NULL,
    @city VARCHAR(30),
    @state_province VARCHAR(25) = NULL
)
AS
BEGIN
    UPDATE tbl_locations
    SET
        street_address = COALESCE(@street_address, street_address),
        postal_code = COALESCE(@postal_code, postal_code),
        city = COALESCE(@city, city),
        state_province = COALESCE(@state_province, state_province)
    WHERE
        id = @id;

    PRINT 'Locations Updated!';
END;

