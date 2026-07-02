CREATE DATABASE Faculdade;
USE Faculdade;

CREATE TABLE alunos (
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    curso VARCHAR(100) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE professores (
    idProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    disciplina VARCHAR(100) NOT NULL
);

CREATE TABLE disciplinas (
    idDisciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargaHoraria INT NOT NULL,
    idProfessor INT,
    FOREIGN KEY (idProfessor) REFERENCES professores(idProfessor)
);

CREATE TABLE matriculas (
    idMatricula INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT NOT NULL,
    idDisciplina INT NOT NULL,
    nota DECIMAL(4,2),
    frequencia DECIMAL(5,2),

    FOREIGN KEY (idAluno) REFERENCES alunos(idAluno),
    FOREIGN KEY (idDisciplina) REFERENCES disciplinas(idDisciplina)
);
