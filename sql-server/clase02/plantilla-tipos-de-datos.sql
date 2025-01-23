-- Tipos de datos: Plantilla de datos

USE oti
GO

-- Plantilla para el dni
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_dni'
)
DROP TYPE td_dni
GO
CREATE TYPE td_dni FROM CHAR(8)
GO

-- Plantilla para el ruc
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_ruc'
)
DROP TYPE td_ruc
GO
CREATE TYPE td_ruc FROM CHAR(11)
GO

-- Plantilla para el código
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_codigo'
)
DROP TYPE td_codigo
GO
CREATE TYPE td_codigo FROM INT
GO

-- Plantilla para el apellido según RENIEC
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_apellido'
)
DROP TYPE td_apellido
GO
CREATE TYPE td_apellido FROM VARCHAR(40)
GO

-- Plantilla para el nombre según RENIEC
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_nombre'
)
DROP TYPE td_nombre
GO
CREATE TYPE td_nombre FROM VARCHAR(35)
GO

-- Plantilla para la razón social de una empresa
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_razon_social'
)
DROP TYPE td_razon_social
GO
CREATE TYPE td_razon_social FROM VARCHAR(150)
GO

-- Plantilla para el estado (activo 1, desactivo 0) pero microsoft coloca al revés (activo 0, malogrado 1)
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_estado'
)
DROP TYPE td_estado
GO
CREATE TYPE td_estado FROM BIT
GO

-- Plantilla para el sexo o genero
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_sexo'
)
DROP TYPE td_sexo
GO
CREATE TYPE td_sexo FROM BIT
GO

-- Plantilla para el correo
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_correo'
)
DROP TYPE td_correo
GO
CREATE TYPE td_correo FROM VARCHAR(50)
GO

-- Plantilla para el telefono
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_telefono'
)
DROP TYPE td_telefono
GO
CREATE TYPE td_telefono FROM VARCHAR(20)
GO

-- Plantilla para la dirección
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_direccion'
)
DROP TYPE td_direccion
GO
CREATE TYPE td_direccion FROM VARCHAR(200)
GO

-- Plantilla para la moneda
IF EXISTS
(
	SELECT name
	FROM systypes
	WHERE name = 'td_moneda'
)
DROP TYPE td_moneda
GO
CREATE TYPE td_moneda FROM DECIMAL(19, 2)
GO

-- Consulta de tipos de datos creados
SELECT 
	t2.name + ':' + t1.name + 
	CASE t2.xprec
		WHEN 0 THEN '('+LTRIM(t2.length)+')'
		ELSE
			CASE t2.xscale
				WHEN 0 THEN ''
				ELSE '('+LTRIM(t2.xprec)+','+LTRIM(t2.xscale)+')'
			END
	END AS 'Tipo de dato'
FROM systypes t1
INNER JOIN systypes t2
ON t1.xusertype = t2.xtype
WHERE t2.name like 'td%'
ORDER BY 1