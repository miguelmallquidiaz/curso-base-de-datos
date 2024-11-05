USE empresa
GO
IF EXISTS
(
	-- Como consultar un esquema
	SELECT *
	FROM sys.schemas s
	INNER JOIN sys.tables t
	ON s.schema_id = t.schema_id
	WHERE
		s.name = 'Personal'
		AND
		t.name = 'Rol'
)
-- Eliminar una tabla
DROP TABLE Personal.Rol
GO
CREATE TABLE Personal.Rol
(
	cod_rol_in INT PRIMARY KEY,
	cod_rol_ch CHAR(5),
	nom_rol_cv VARCHAR(20),
)
GO

-- Insertar un registro
INSERT INTO Personal.Rol(cod_rol_in, cod_rol_ch, nom_rol_cv) VALUES (5, 'R0005', 'Ventas')
INSERT INTO Personal.Rol(cod_rol_in, cod_rol_ch, nom_rol_cv) VALUES (2, 'R0002', 'Almacén')
INSERT INTO Personal.Rol(cod_rol_in, cod_rol_ch, nom_rol_cv) VALUES (8, 'R0008', 'Personal')
GO
-- Cuanto el sql server utiliza de procesador y de disco
SET SHOWPLAN_ALL ON
GO
SELECT *
FROM Personal.Rol
GO
SET SHOWPLAN_ALL OFF


-- Esquemas de información

USE master
GO
SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

-- Vistas del sistemas
USE master
GO
SELECT * 
FROM sys.tables
GO

