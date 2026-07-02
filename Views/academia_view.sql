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