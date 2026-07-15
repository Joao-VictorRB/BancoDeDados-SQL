CREATE DATABASE hospital;
USE hospital;

CREATE TABLE pacientes(
	idPaciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL,
    sexo CHAR(1) CHECK(sexo IN('M','F','I')) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE medicos(
	idMedico INT PRIMARY KEY AUTO_INCREMENT,
    nome Varchar(100) NOT NULL,
    especialidade Varchar(100) NOT NULL,
    CRM VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE consultas(
	idConsulta INT PRIMARY KEY AUTO_INCREMENT,
    dataConsulta DATE NOT NULL,
    horaConsulta TIME NOT NULL,
    valorConsulta DECIMAL(7,2) NOT NULL CHECK (valorConsulta > 0),
	
    id_Paciente INT NOT NULL,
    id_Medico INT NOT NULL,
	
    FOREIGN KEY (id_Paciente) REFERENCES pacientes(idPaciente),
    FOREIGN KEY (id_Medico) REFERENCES medicos(idMedico)
);
