USE NorthwindSQL
GO
IF EXISTS
(
	SELECT s.name, t.name, c.name
	FROM sys.schemas s
	INNER JOIN sys.tables t
	ON s.schema_id = t.schema_id
	INNER JOIN sys.columns c
	ON t.object_id = c.object_id
	WHERE
		s.name = 'Personal'
		AND
		t.name = 'Empleados'
		AND
		c.name = 'pwd_emp_vb'
)
ALTER TABLE [Personal].[Empleados]
DROP COLUMN pwd_emp_vb
-- Modificar la tabla
ALTER TABLE [Personal].[Empleados]
-- Para crear un campo de tipo contraseña
ADD pwd_emp_vb VARBINARY(128)
GO
SELECT *
FROM [Personal].[Empleados]
GO

-- Antes de hacer un update se hace un select para ver
-- el resulado la Encriptación es de 128
SELECT pwd_emp_vb, PWDENCRYPT(dni_emp_ch)
FROM Personal.Empleados

-- Realizar el update
UPDATE [Personal].[Empleados]
SET 
	pwd_emp_vb = PWDENCRYPT(dni_emp_ch),
	est_emp_bi = 1,
	[Datos adjuntos] = NULL,
	Compañía = 'Northwind Traders',
	[Dirección de correo electrónico] = 
	-- Obtener el primer caracter del nombre
	-- Si tiene acento lo reemplazas
	LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(LEFT(Nombre, 1) + Apellidos, 'á', 'a'),
			'é', 'e'),'í', 'i'),'Ó','O'),'ú', 'u'),' ', '_')
	+ '@nortwindtraders.com')
GO
SELECT *
FROM Personal.Empleados