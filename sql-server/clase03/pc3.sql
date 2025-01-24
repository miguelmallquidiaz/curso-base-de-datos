 -- �Cuantos apellidos paternos contienen dos espacios en blanco?
USE pvl
GO
SELECT *
FROM Beneficiario
WHERE pat_ben_vc like '%  %'

-- �C�mo se puede mostrar un beneficiario con un c�digo espec�fico en SQL?
GO
SELECT *
FROM Beneficiario
WHERE cod_ben_in = 1000

-- �Qu� consulta se usar�a para mostrar a los beneficiarios que tengan un DNI de exactamente 8 d�gitos del 0 al 9?
GO
SELECT *
FROM Beneficiario
WHERE LEN(dni_ben_ch) = 8

-- �Qu� resultado se obtiene al usar WHERE SUBSTRING(nom_ben_vc,4,1) BETWEEN 'J' AND 'P' en una consulta?
GO
SELECT
	SUBSTRING(nom_ben_vc,4,1),
	nom_ben_vc
FROM Beneficiario
-- Comienzas del 4 car�cter entre J Y P
WHERE SUBSTRING(nom_ben_vc,4,1) BETWEEN 'J' AND 'P'