DELIMITER $

CREATE PROCEDURE LocacoesByCliente(p_idCliente INT)
	BEGIN
		SELECT 
			C.nome AS Cliente,
			M.nome AS Modelo,
			L.dataRetirada, l.dataDevolucao, L.valorTotal
		FROM locacao AS L 
		INNER JOIN clientes AS C
			ON L.id_Cliente = C.idCliente
		INNER JOIN veiculos AS V 
			ON  L.id_Veiculo = V.idVeiculo
		INNER JOIN modelos AS M
			ON V.id_Modelo = M.idModelo
		WHERE C.idCliente = p_idCliente;
    END $
DELIMITER ;

CALL LocacoesByCliente(3);


DELIMITER $

CREATE PROCEDURE CadCliente(p_nome VARCHAR(100), 
							P_CPF VARCHAR(11),
                            p_telefone VARCHAR(15), 
                            p_CNH VARCHAR(11))
	BEGIN
		INSERT INTO 
			clientes (nome,CPF,telefone,CNH) 
		VALUES (p_nome,P_CPF,p_telefone,p_CNH);
	END $

DELIMITER ;

CALL CadCliente ('TESTE', '84723456721', '11959435586','84623856347');


DELIMITER $

CREATE PROCEDURE UpdateValorDiaria(p_idVeiculo INT, p_novoValor DECIMAL(7,2))
	BEGIN
		UPDATE veiculos
        SET valorDiaria = p_novoValor
        WHERE idVeiculo = p_idVeiculo;
    END $
    
DELIMITER ;

CALL UpdateValorDiaria(1, 200.00);


DELIMITER $

CREATE PROCEDURE DeleteLocacao(p_idLocacao INT)
	BEGIN
		DELETE FROM locacao
        WHERE idLocacao = p_idLocacao;
    END $

DELIMITER ;

CALL DeleteLocacao(4);


DELIMITER $

CREATE PROCEDURE VeiculosByCategoria(p_NomeCategoria VARCHAR(100))
	BEGIN
		SELECT 
			M.nome AS Modelo,
			Ma.nome AS Marca,
			C.nome AS Cor,
			V.ano, V.valorDiaria
		FROM veiculos AS V
		INNER JOIN modelos AS M
			ON V.id_Modelo = M.idModelo
		INNER JOIN marcas AS Ma
			ON  M.id_Marca = Ma.idMarca
		INNER JOIN cores AS C
			ON V.id_Cor = C.idCor
		INNER JOIN categorias AS CAT
			ON V.id_Categoria = CAT.idCategoria
		WHERE CAT.nome = p_NomeCategoria;
    END $

DELIMITER ;

CALL VeiculosByCategoria('Sedan');


DELIMITER $

CREATE PROCEDURE RelatorioFuncionario(p_idFuncionario INT)
	BEGIN
			SELECT 
				F.nome AS Funcionario,
				C.nome AS Cargo,
				COUNT(*) AS QtdLocacao, SUM(valorTotal) AS valorArrecadado, TRUNCATE(AVG(valorTotal),2) AS valorMedio
			FROM locacao AS L
			INNER JOIN funcionarios AS F
				ON L.id_Funcionario = F.idFuncionario
			INNER JOIN cargos AS C 
				ON  F.id_Cargo = C.idCargo
			WHERE F.idFuncionario = p_idFuncionario
			GROUP BY 
				F.nome,
				C.nome;
    END $

DELIMITER ;

CALL RelatorioFuncionario(1);
