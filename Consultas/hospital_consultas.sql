SELECT 
	COUNT(*) AS QtdPacientes
FROM pacientes;


SELECT 
	COUNT(*) AS QtdMedicos
FROM medicos;


SELECT 
	COUNT(*) AS QtdConsultas
FROM consultas;


SELECT 
	TRUNCATE(AVG(valorConsulta),2) AS ValorMedioConsulta
FROM consultas;


SELECT 
	TRUNCATE(SUM(valorConsulta),2) AS GanhosBruto
FROM consultas;


SELECT 
	MAX(valorConsulta) AS MaiorValor
FROM consultas;


SELECT 
	MIN(valorConsulta) AS MenorValor
FROM consultas;


SELECT 
	COUNT(*) AS Total, 
    TRUNCATE(AVG(valorConsulta),2) AS Media, 
    MIN(valorConsulta) AS Menor, 
    MAX(valorConsulta) AS Maior, 
    TRUNCATE(SUM(valorConsulta),2) AS Arrecadacao
FROM consultas; 


SELECT 
	COUNT(*) AS PacientesMulheres
FROM pacientes
WHERE sexo = 'F';


SELECT 
	COUNT(*) AS MedicosCardiologistas
FROM medicos
WHERE especialidade = 'Cardiologia';


SELECT 
	TRUNCATE(AVG(valorConsulta),2) AS ValorMedioAcima_200
FROM consultas
WHERE valorConsulta > 200;


SELECT 
	TRUNCATE(SUM(valorConsulta),2) AS GanhosBrutoAcimaDe_250
FROM consultas
WHERE valorConsulta > 250;


SELECT 
	MAX(valorConsulta) AS MaiorValorDepoisDaData
FROM consultas
WHERE dataConsulta > '2025-06-01';


SELECT 
	MIN(valorConsulta) AS MenorValorDepoisDaData
FROM consultas
WHERE dataConsulta > '2025-06-01';