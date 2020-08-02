SELECT TOP 5 spatial_reference_id, unit_of_measure 
FROM sys.spatial_reference_systems

DECLARE @shapepoly geometry
SET @shapepoly = geometry::STGeomFromText('POLYGON((0 2, 10 3, 3 4, 0 2))',
4326);
SELECT @shapepoly

