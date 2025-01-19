	-- 0 .. 14 -> El año se muestra en 2 cifras
	-- 100 .. 114 -> El año se muestra en 4 cifras
	-- Formato peruano 3
SELECT 
	CONVERT(VARCHAR, GETDATE(), 3)

-- Obtener el mes actual
SELECT
	CASE MONTH(GETDATE())
		WHEN 1 THEN 'Enero'
		WHEN 2 THEN 'Febrero'
		WHEN 3 THEN 'Marzo'
		WHEN 4 THEN 'Abril'
		WHEN 5 THEN 'Mayo'
		WHEN 6 THEN 'Junio'
		WHEN 7 THEN 'Julio'
		WHEN 8 THEN 'Agosto'
		WHEN 9 THEN 'Septiembre'
		WHEN 10 THEN 'Octubre'
		WHEN 11 THEN 'Noviembre'
		WHEN 12 THEN 'Diciembre'
	END
	as MES