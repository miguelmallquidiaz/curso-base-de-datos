-- Consultas de compatibilidad son antiguas pero utiles

SELECT *
FROM sysobjects
WHERE xtype = 'U' AND uid = 1

-- Consultas usando los esquemas de información

USE master
GO
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

-- Consultas utilizando las vistas del sistema

USE master
GO
SELECT *
FROM sys.tables

-- Consulta utilizando los procedimientos del sistema

USE master
GO
EXECUTE sys.sp_tables NULL, dbo, NULL, '''TABLE'''