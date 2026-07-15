SELECT 
	C.nome AS Cliente,
    L.valorTotal AS ValorTotal 
FROM locacao AS L
INNER JOIN clientes AS C
ON L.id_Cliente = C.idCliente
WHERE L.Valortotal = (
	SELECT MAX(ValorTotal) 
    FROM locacao
);

--------------------------------------------

SELECT 
	M.nome AS Modelo,
    V.valorDiaria
FROM veiculos AS V
INNER JOIN modelos AS M 
	ON V.id_Modelo = M.idModelo
WHERE valorDiaria > (
	SELECT AVG(valorDiaria) FROM veiculos)
ORDER BY M.nome;

------------------------------------------------

SELECT 
	C.nome AS Cliente,
    L.valorTotal
FROM locacao AS L
INNER JOIN clientes AS C
	ON L.id_Cliente = C.idCliente
WHERE valorTotal < (
	SELECT AVG(valorTotal) FROM locacao
) ORDER BY C.nome;

-----------------------------------------

SELECT 
	F.nome AS Funcionario,
    L.valorTotal
FROM locacao AS L
INNER JOIN funcionarios AS F
	ON L.id_Funcionario = F.idFuncionario
WHERE valorTotal = (
	SELECT MAX(valorTotal) FROM locacao)
ORDER BY F.nome;

----------------------------------------------------

SELECT 
	M.nome AS Modelo,
    V.ano, V.valorDiaria
FROM veiculos AS V
INNER JOIN modelos AS M
	ON V.id_Modelo = M.idModelo
WHERE V.idVeiculo NOT IN(
	SELECT id_Veiculo FROM locacao
	) 
ORDER BY M.nome;

-----------------------------------------


SELECT 
	C.nome AS clientes
FROM clientes AS C
WHERE idCliente IN(
	SELECT id_Cliente 
    FROM locacao 
		GROUP BY id_Cliente HAVING COUNT(*) > 1 
	)
ORDER BY C.nome;

---------------------------------------------------

SELECT
	F.nome,
    C.nome
FROM funcionarios AS F
INNER JOIN cargos AS C
	ON F.id_Cargo = C.idCargo
WHERE F.idFuncionario NOT IN(
		SELECT id_Funcionario 
        FROM locacao
	)
ORDER BY F.nome;

-------------------------------------------

SELECT 
	M.nome AS modelos,
    V.valorDiaria
FROM veiculos AS V
INNER JOIN modelos AS M
	ON V.id_Modelo = M.idModelo
WHERE V.valorDiaria > (
	SELECT MIN(valorDiaria) FROM veiculos
	)
ORDER BY valorDiaria DESC;
