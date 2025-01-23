USE oti
GO
-- SCHEMA Ventas
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Ventas'
)
DROP SCHEMA Ventas
GO
CREATE SCHEMA Ventas AUTHORIZATION dbo;
GO

-- SCHEMA Almacen
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Almacen'
)
DROP SCHEMA Almacen
GO
CREATE SCHEMA Almacen AUTHORIZATION dbo;
GO

-- SCHEMA Facturacion
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Facturacion'
)
DROP SCHEMA Facturacion
GO
CREATE SCHEMA Facturacion AUTHORIZATION dbo;
GO

-- SCHEMA Cobranzas
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Cobranzas'
)
DROP SCHEMA Cobranzas
GO
CREATE SCHEMA Cobranzas AUTHORIZATION dbo;
GO

-- SCHEMA Compras
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Compras'
)
DROP SCHEMA Compras
GO
CREATE SCHEMA Compras AUTHORIZATION dbo;
GO

-- SCHEMA Pagos
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Pagos'
)
DROP SCHEMA Pagos
GO
CREATE SCHEMA Pagos AUTHORIZATION dbo;
GO

-- SCHEMA Personal
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Personal'
)
DROP SCHEMA Personal
GO
CREATE SCHEMA Personal AUTHORIZATION dbo;
GO

-- SCHEMA Transporte
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Transporte'
)
DROP SCHEMA Transporte
GO
CREATE SCHEMA Transporte AUTHORIZATION dbo;
GO

-- SCHEMA Sistemas
IF EXISTS
(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Sistemas'
)
DROP SCHEMA Sistemas
GO
CREATE SCHEMA Sistemas AUTHORIZATION dbo;
GO

-- Ver los esquemas creados por el usuario
SELECT name
FROM sys.schemas
WHERE principal_id != schema_id
ORDER BY name