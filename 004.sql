CREATE DATABASE Academia;
USE Academia;

CREATE TABLE ALUNOS(
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT  NULL,
    telefone VARCHAR(14) NOT NULL
);


CREATE TABLE PLANOS(
	idPlano INT PRIMARY KEY AUTO_INCREMENT,
    nomePlano VARCHAR(10) NOT NULL CHECK(nomePlano IN('Basico','Plus','Premium')),
    valorMensal DECIMAL(10,2) NOT NULL CHECK(valorMensal > 0)
);


CREATE TABLE MATRICULAS(
	idMatricula INT PRIMARY KEY AUTO_INCREMENT,
	dataMatricula DATE NOT NULL,
    
    id_Aluno INT NOT NULL,
    id_Plano INT NOT NULL,
    
    FOREIGN KEY(id_Aluno) REFERENCES ALUNOS(idAluno),
    FOREIGN KEY(id_Plano) REFERENCES PLANOS(idPlano)
)


SELECT * FROM alunos;
SELECT * FROM matriculas;
SELECT * FROM planos;

CREATE VIEW V_NomePlanoValor AS
SELECT 
	A.nome,
    IFNULL(P.nomePlano,'---') AS Plano, IFNULL(P.valorMensal,'---') AS valorMensal
FROM matriculas AS M
RIGHT JOIN alunos AS A
ON  M.id_Aluno = A.idAluno
LEFT JOIN planos AS P
ON M.id_Plano = P.idPlano ORDER BY A.nome;

SELECT * FROM V_NomePlanoValor;


CREATE VIEW V_NomeDtMatriculaPlanoValor AS
SELECT 
	A.nome,
    IFNULL(M.dataMatricula,'---') AS dataMatricula,
    IFNULL(P.nomePlano,'---') AS Plano, IFNULL(P.valorMensal,'---') AS valorMensal
FROM matriculas AS M
RIGHT JOIN alunos AS A
ON  M.id_Aluno = A.idAluno
LEFT JOIN planos AS P
ON M.id_Plano = P.idPlano ORDER BY A.nome;

SELECT * FROM V_NomeDtMatriculaPlanoValor;