CREATE DATABASE Funcionarios;
USE Funcionarios;

CREATE TABLE funcionarios(
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL,
    sexo CHAR(1) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);
-- EXPLAIN ANALYZE

SELECT * FROM funcionarios ORDER BY idFuncionario;
SELECT * FROM funcionarios WHERE departamento = 'Compras' OR departamento = 'Produção';
SELECT nome, email, departamento FROM funcionarios WHERE (departamento = 'RH' OR departamento = 'Administrativo') AND sexo = 'F' ORDER BY nome;
SELECT * FROM funcionarios WHERE sexo = 'M' OR departamento = 'TI' ORDER BY nome;
