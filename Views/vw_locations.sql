/*vw_location*/
CREATE VIEW vw_locations AS
SELECT id, street_address, postal_code, city, state_province, country
FROM tbl_locations;

SELECT * FROM vw_locations;