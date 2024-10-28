/*MASTER**/

-- Consulta de las bases de datos en nuestro servidor
SELECT *
FROM [DESKTOP-U65ULCF].master.dbo.sysdatabases

USE master
GO
SELECT * 
FROM sysdatabases

-- Consulta de los objetos de la base de datos
SELECT *
FROM sysobjects

-- Consultar los usuarios en nuestra base de datos
SELECT *
FROM sysusers

/*MODEL*/
CREATE DATABASE empresa

USE master
GO
IF EXISTS
(
	SELECT name
	FROM sysdatabases
	WHERE name = 'empresa'
)
DROP DATABASE empresa
GO

CREATE DATABASE empresa
ON PRIMARY(
	name = empresa_dat,
	filename = 'C:\db\empresa_dat.mdf', --extensión es el mdf
	size = 30MB, --tamaño inicial tener 5 años anteriores
	maxsize =  50MB, -- Tamaño máximo
	filegrowth = 10MB
)
LOG ON --El log de transaciones puede ocurri errores
(
	name = empresa_log,
	filename = 'C:\db\empresa_log.ldf', --extensión es el mdf
	size = 10MB, --tamaño inicial para 5 años
	maxsize =  UNLIMITED, -- Tamaño máximo
	filegrowth = 10%
)
GO

/*tempdb*/

-- Tabla local
USE empresa
GO
CREATE TABLE #TC
(
	sol MONEY,
	dol MONEY
)
GO
SELECT * FROM #TC
GO

-- Tabla global se puede compartir
USE empresa
GO
CREATE TABLE ##TC
(
	sol MONEY,
	dol MONEY
)
GO
SELECT * FROM ##TC
GO

/*Esquemas*/
USE empresa
GO
IF EXISTS(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Compras'
)
DROP SCHEMA Compras
GO
CREATE SCHEMA Compras
Go
SELECT name
FROM sys.schemas
WHERE principal_id <> schema_id --esquemas creados por el usuario
GO