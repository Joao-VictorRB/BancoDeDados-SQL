CREATE VIEW V_Locacoes AS
	SELECT 
		C.nome AS Cliente,
        M.nome AS Modelo,
        F.nome AS Funcionario,
        L.dataRetirada,
        L.dataDevolucao,
        L.valorTotal
	FROM locacao as L
    INNER JOIN funcionarios AS F
		ON L.id_Funcionario = F.idFuncionario
	INNER JOIN clientes AS C
		ON L.id_Cliente = C.idCliente
	INNER JOIN veiculos AS V
		ON L.id_Veiculo = V.idVeiculo
	INNER JOIN modelos AS M
		ON V.id_Modelo = M.idModelo;
        
--------------------------------------------------

CREATE VIEW V_VeiculosDisponiveis AS
	SELECT 
		M.nome AS Modelo,
        MR.nome AS Marca,
        CAT.nome AS Categoria,
        C.nome AS Cor,
        V.valorDiaria
	FROM veiculos AS V
    INNER JOIN modelos AS M
		ON V.id_Modelo = M.idModelo
	INNER JOIN marcas AS MR
		ON M.id_Marca = MR.idMarca
	INNER JOIN categorias AS CAT
		ON V.id_Categoria = CAT.idCategoria
	INNER JOIN cores AS C
		ON V.id_Cor = C.idCor
	INNER JOIN situacao AS S
		ON V.id_Situacao = S.idSituacao
	WHERE S.nome = 'Disponível';
    
-----------------------------------------

CREATE VIEW V_HistoricoCliente AS
	SELECT 
		C.nome AS Cliente,
        M.nome AS Modelo,
        MC. nome AS Marca,
        L.dataRetirada,
        L.dataDevolucao,
        L.valorTotal
	FROM locacao AS L
	INNER JOIN clientes AS C
		ON L.id_Cliente = C.idCliente
	INNER JOIN veiculos AS V
		ON L.id_Veiculo = V.idVeiculo
	INNER JOIN modelos AS M
		ON V.id_Modelo = M.idModelo
	INNER JOIN marcas AS MC
		ON M.id_Marca = MC.idMarca;

-------------------------------------------
    
CREATE VIEW V_FaturamentoFuncionario AS
	SELECT 
		F.nome AS Funcionario,
        C.nome AS Cargo,
        COUNT(*) AS QtdLocacao,
        SUM(valorTotal) AS ValorArrecadado
	FROM locacao AS L
    INNER JOIN funcionarios AS F
		ON L.id_Funcionario = F.idFuncionario
	INNER JOIN cargos as C
		ON F.id_Cargo = C.idCargo
	GROUP BY F.idFuncionario, C.idCargo;