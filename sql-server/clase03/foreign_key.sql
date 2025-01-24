USE NorthwindSQL
GO
IF EXISTS
(
	SELECT name
	FROM sys.foreign_keys
	WHERE name = 'fk_personal_empleado_rol_cod_rol_in'
)
ALTER TABLE Personal.empleados
DROP CONSTRAINT fk_personal_empleado_rol_cod_rol_in
GO
ALTER TABLE Personal.empleados
ADD CONSTRAINT fk_personal_empleado_rol_cod_rol_in
FOREIGN KEY (cod_rol_in)
REFERENCES Personal.rol (cod_rol_in)
GO
