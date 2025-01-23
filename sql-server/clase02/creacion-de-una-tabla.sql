USE oti
GO
IF EXISTS
(
	SELECT *
	FROM sys.schemas s
	INNER JOIN sys.tables t
	ON s.schema_id = t.schema_id
	WHERE 
		s.name = 'Personal'
		AND
		t.name = 'rol'
)
DROP TABLE Personal.rol
GO
CREATE TABLE Personal.rol
(
	-- UTILIZAR LOS TIPOS DE DATOS CREADOS
	cod_rol_in INT 
	CONSTRAINT pk_personal_rol_cod_rol_in
	PRIMARY KEY NOT NULL,
	cod_rol_ch CHAR(5)
	CONSTRAINT ak_personal_rol_cod_rol_ch
	UNIQUE NOT NULL,
	nom_rol_vc [dbo].[td_nombre]
)
GO

-- Otra forma de crearlo
GO
CREATE TABLE Personal.rol
(
	-- UTILIZAR LOS TIPOS DE DATOS CREADOS
	cod_rol_in INT NOT NULL,
	cod_rol_ch CHAR(5) NOT NULL,
	nom_rol_vc [dbo].[td_nombre] NOT NULL,

	CONSTRAINT pk_personal_rol_cod_rol_in
	PRIMARY KEY (cod_rol_in),
	CONSTRAINT ak_personal_rol_cod_rol_ch
	UNIQUE (cod_rol_ch)
)

-- MODIFICAR CUANDO UNA TABLA ESTA CREADA
ALTER TABLE Personal.rol
ADD CONSTRAINT pk_td_codigo_cod_rol_in
PRIMARY KEY (cod_rol_in)


-- Insertar un valor a la tabla
INSERT INTO Personal.rol(cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(5, 'R0005', 'Ventas');
GO
INSERT INTO Personal.rol(cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(3, 'R0003', 'Almacén');
GO
INSERT INTO Personal.rol(cod_rol_in, cod_rol_ch, nom_rol_vc)
VALUES(8, 'R0008', 'Transportes');
GO


-- TABLE SCAN
-- EVALUAR EL PLAN DE CONSULTA DEL SELECT
SET SHOWPLAN_ALL ON
GO
-- Consulta a la tabla rol
SELECT * FROM Personal.rol
GO
SET SHOWPLAN_ALL OFF
GO

-- Eliminar datos de una tabla a partir del id
DELETE FROM Personal.rol
	WHERE cod_rol_in = 5


-- Asignarle el esquema en vez de dbo solamente se puede ejecutar 1 vez
USE oti
GO
ALTER SCHEMA Personal TRANSFER dbo.rol