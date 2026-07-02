-- EXPLAIN ANALYZE

SELECT 
    * 
FROM funcionarios 
ORDER BY idFuncionario;


SELECT 
    * 
FROM funcionarios 
WHERE departamento = 'Compras' OR departamento = 'Produção';


SELECT 
    nome, email, departamento 
FROM funcionarios 
WHERE (departamento = 'RH' OR departamento = 'Administrativo') AND sexo = 'F' 
ORDER BY nome;


SELECT 
    * 
FROM funcionarios 
WHERE sexo = 'M' OR departamento = 'TI' 
ORDER BY nome;
