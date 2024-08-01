CREATE VIEW vw_country AS
SELECT c.id,
		c.name,
		c.region
FROM tbl_countries c
JOIN tbl_regions r ON c.id = r.id

SELECT * FROM vw_country