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
