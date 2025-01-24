 -- ¿Cuantos apellidos paternos contienen dos espacios en blanco?
USE pvl
GO
SELECT *
FROM Beneficiario
WHERE pat_ben_vc like '%  %'

-- ¿Cómo se puede mostrar un beneficiario con un código específico en SQL?
GO
SELECT *
FROM Beneficiario
WHERE cod_ben_in = 1000

-- ¿Qué consulta se usaría para mostrar a los beneficiarios que tengan un DNI de exactamente 8 dígitos del 0 al 9?
GO
SELECT *
FROM Beneficiario
WHERE LEN(dni_ben_ch) = 8

-- ¿Qué resultado se obtiene al usar WHERE SUBSTRING(nom_ben_vc,4,1) BETWEEN 'J' AND 'P' en una consulta?
GO
SELECT
	SUBSTRING(nom_ben_vc,4,1),
	nom_ben_vc
FROM Beneficiario
-- Comienzas del 4 carácter entre J Y P
WHERE SUBSTRING(nom_ben_vc,4,1) BETWEEN 'J' AND 'P'