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
	filename = 'C:\db\empresa_dat.mdf', --extensi�n es el mdf
	size = 30MB, --tama�o inicial tener 5 a�os anteriores
	maxsize =  50MB, -- Tama�o m�ximo
	filegrowth = 10MB
)
LOG ON --El log de transaciones puede ocurri errores
(
	name = empresa_log,
	filename = 'C:\db\empresa_log.ldf', --extensi�n es el mdf
	size = 10MB, --tama�o inicial para 5 a�os
	maxsize =  UNLIMITED, -- Tama�o m�ximo
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

/*Esquemas 

Ventas
Facturacion
Compras
Cobranza
Almacen
Pagos
Personal
Sistemas
Transportes

*/
USE empresa
GO
IF EXISTS(
	SELECT name
	FROM sys.schemas
	WHERE name = 'Transportes'
)
DROP SCHEMA Transportes
GO
CREATE SCHEMA Transportes
Go
SELECT name
FROM sys.schemas
WHERE principal_id <> schema_id --esquemas creados por el usuario
GO