-- TEMA: Consultas y Agrupamiento

USE pvl
GO

-- ALIAS EN LOS CAMPOS
SELECT 
	cod_cen_aco_ti Código,
	nom_cen_aco_vc as 'Centro de Acipio'
FROM CentroAcopio

SELECT 
	cod_cen_aco_ti Código,
	"Centro de Acipio" = nom_cen_aco_vc
FROM CentroAcopio


-- Mostrar todos los apellido paternos que comiencen con la letra y

SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like 'y%'

-- Mostrar todos los apellido paternos que termine con la letra y

SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like '%y'

-- Mostrar todos los apellido paternos que contengan la palabra AMOR
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like '%AMOR%'

/*
Mostrar todos los apellido paternos cuyo tercer caracter sea
la letra s. _: Reemplaza un solo caracter o número.
*/
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like '__S%'

/*
Mostrar todos los apellido paternos cuyo tercer caracter sea
la letra S, R, M . _: Reemplaza un solo caracter o número.
*/
SELECT
	SUBSTRING(pat_ben_vc, 3, 1) AS letra,
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like '__[SRM]%'
ORDER BY 1


/*
Mostrar todos los apellido paternos cuyo tercer caracter sea
la letra en el rango J al P. _: Reemplaza un solo caracter o número.
*/
SELECT
	SUBSTRING(pat_ben_vc, 3, 1) AS letra,
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario
WHERE pat_ben_vc like '__[J-P]%'
ORDER BY 1

/*
Mostrar todos los apellido paternos cuyo tercer caracter no sea
la letra en el rango J al P. _: Reemplaza un solo caracter o número.
*/
SELECT
	SUBSTRING(pat_ben_vc, 3, 1) AS letra,
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE pat_ben_vc like '__[^J-P]%'
ORDER BY 1

-- otra forma

SELECT
	SUBSTRING(pat_ben_vc, 3, 1) AS letra,
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE pat_ben_vc not like '__[J-P]%'
ORDER BY 1


-- Mostrar el beneficiario que tiene el código 1000
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE cod_ben_in = 1000
ORDER BY 1

-- Mostrar el beneficiario que tiene el código 10, 100 y 1000
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE cod_ben_in IN (10, 100, 1000)
ORDER BY 1

-- Mostrar el beneficiario con código 10 al 20
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE cod_ben_in BETWEEN 10 AND 20
ORDER BY 1

-- Mostrar a los beneficiarios que tengan dni
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc
FROM Beneficiario	
WHERE len(dni_ben_ch) = 8	
ORDER BY 1

-- Mostrar los beneficiarios que hayan nacido el 06/06/1996
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc,
	fec_nac_ben_da
FROM Beneficiario	
-- AÑO - MES- DÍA
WHERE fec_nac_ben_da = '19960606'
ORDER BY 1

-- Otra forma
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc,
	fec_nac_ben_da
FROM Beneficiario	
-- AÑO - MES- DÍA
WHERE fec_nac_ben_da = '1996-06-06'
ORDER BY 1


-- Otra forma
SELECT
	cod_ben_in,
	pat_ben_vc,
	mat_ben_vc,
	nom_ben_vc,
	fec_nac_ben_da
FROM Beneficiario	
WHERE fec_nac_ben_da = CONVERT(DATE, '06/06/1996', 103)
ORDER BY 1