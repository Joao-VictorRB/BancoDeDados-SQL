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

--------------------------------------------------------------------------------
    
SELECT * FROM alunos;
SELECT * FROM professores;
SELECT * FROM disciplinas;
SELECT * FROM matriculas;

DELIMITER $

CREATE PROCEDURE ListarAlunos()
BEGIN
	SELECT nome,curso,idade 
    FROM alunos 
    ORDER BY nome;
END $

CALL ListarAlunos();

----------------------------------------------------------

DELIMITER $ 

CREATE PROCEDURE AlunoById(p_idAluno INT)
BEGIN
		SELECT 
			nome,curso,idade 
		FROM alunos 
        WHERE idAluno = p_idAluno;
END $

CALL AlunoById(2);

-------------------------------------------------------

DELIMITER $

CREATE PROCEDURE AlunosByCurso(p_curso VARCHAR(100))
BEGIN
	SELECT  A.nome,D.nome, M.nota, M.frequencia
    FROM matriculas AS M
    INNER JOIN alunos AS A
        ON M.idAluno = A.idAluno
    INNER JOIN disciplinas AS D
        ON M.idDisciplina = D.idDisciplina
    WHERE D.nome = p_curso ORDER BY A.nome;

END $

DELIMITER ;

CALL AlunosByCurso('banco de dados');

---------------------------------------------

DELIMITER $

CREATE PROCEDURE CadAluno (p_nome VARCHAR(100), p_curso VARCHAR(100), p_idade INT)
BEGIN

	INSERT INTO alunos VALUES (NULL ,p_nome,p_curso,p_idade);

END $

DELIMITER ;

CALL CadAluno ('João Batista', 'Ciência da Computação', 20);

-------------------------------------------------------------

DELIMITER $

CREATE PROCEDURE UpdateIdadeAluno (p_idAluno INT, p_idade INT)
BEGIN
	
    UPDATE alunos
        SET idade = p_idade
    WHERE idAluno = p_idAluno;
 
END $

DELIMITER ;

CALL UpdateIdadeAluno(11, 21);

---------------------------------------------------------------

DELIMITER $

CREATE PROCEDURE UpdateNotaByIdMatricula (p_idMatricula INT, p_nota DECIMAL(4,2))
BEGIN
	UPDATE matriculas
        SET nota = p_nota
    WHERE idMatricula = p_idMatricula;
END $

DELIMITER ;

CALL UpdateNotaByIdMatricula(1, 10.00);

-----------------------------------------------------------------

DELIMITER $

CREATE PROCEDURE DeleteMatriculaById(p_idMatricula INT)
BEGIN

	DELETE FROM matriculas WHERE idMatricula = p_idMatricula;

END $

DELIMITER ;

CALL DeleteMatriculaById(15);

------------------------------------------------------------------

DELIMITER $

CREATE PROCEDURE HistoricoAluno(p_idAluno INT)
BEGIN
	
    SELECT 
		A.nome, A.curso,
		D.nome AS Disciplina,
		P.nome AS Professor,
		M.nota,M.frequencia
	FROM matriculas AS M
	INNER JOIN alunos AS A
		ON M.idAluno = A.idAluno
	INNER JOIN disciplinas AS D
		ON M.idDisciplina = D.idDisciplina
	INNER JOIN professores AS P
		ON D.idProfessor = P.idProfessor
	WHERE A.idAluno = p_idAluno;
	
END $

DELIMITER ;

CALL HistoricoAluno(7);
