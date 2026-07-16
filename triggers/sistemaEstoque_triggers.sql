DELIMITER $ 

CREATE TRIGGER t_novoProduto
AFTER INSERT 
ON produtos
FOR EACH ROW
BEGIN
	INSERT INTO movimentacoes VALUES(NULL,NEW.idProduto,'Cadastro','Produto cadastrado',NOW());
END$

DELIMITER ;

INSERT INTO produtos (nome, preco, estoque) VALUES(' Ip´hone 17', 1300.00, 10);

DELIMITER $

CREATE TRIGGER updateValor
AFTER UPDATE
ON produtos
FOR EACH ROW
BEGIN
	UPDATE movimentacoes
    SET id_Produto = OLD.idProduto,
        tipoMovimentacao = 'Atualização',
        descricao = CONCAT('BEFORE:', OLD.preco, 'AFTER: ',NEW.preco),
        dataMovimentacao = NOW()
	WHERE id_Produto = OLD.idProduto;
END$

DELIMITER ;

UPDATE produtos SET  preco = 4000.00 WHERE idProduto = 9;


DELIMITER $

CREATE TRIGGER HistoricoDelete
AFTER DELETE
ON produtos
FOR EACH ROW
BEGIN

	INSERT INTO movimentacoes VALUES(NULL,OLD.idProduto,'Exclusão','Produto removido',NOW());

END $

DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_BeforeInsertProduto
BEFORE INSERT
ON produtos
FOR EACH ROW
BEGIN

    IF NEW.preco < 1.00 THEN
        SET NEW.preco = 1.00;
    END IF;

    IF NEW.estoque < 0 THEN
        SET NEW.estoque = 0;
    END IF;

END $

DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_BeforeUpdateProduto
BEFORE UPDATE
ON produtos
FOR EACH ROW
BEGIN

    IF NEW.preco < 1.00 THEN
        SET NEW.preco = 1.00;
    END IF;

    IF NEW.estoque < 0 THEN
        SET NEW.estoque = 0;
    END IF;

END $

DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_AfterUpdateEstoque
AFTER UPDATE
ON produtos
FOR EACH ROW
BEGIN

    INSERT INTO movimentacoes
    VALUES(
        NULL,
        NEW.idProduto,
        'Estoque',
        CONCAT(
            'Estoque alterado de ',
            OLD.estoque,
            ' para ',
            NEW.estoque
        ),
        NOW()
    );

END $

DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_AfterInsertProdutoDescricao
AFTER INSERT
ON produtos
FOR EACH ROW
BEGIN

    INSERT INTO movimentacoes
    VALUES(
        NULL,
        NEW.idProduto,
        'Cadastro',
        CONCAT(
            'Produto ',
            NEW.nome,
            ' cadastrado com estoque inicial de ',
            NEW.estoque,
            ' unidades.'
        ),
        NOW()
    );

END $

DELIMITER ;

DELIMITER $

CREATE TRIGGER trg_AfterDeleteProdutoDescricao
AFTER DELETE
ON produtos
FOR EACH ROW
BEGIN

    INSERT INTO movimentacoes
    VALUES(
        NULL,
        OLD.idProduto,
        'Exclusão',
        CONCAT(
            'Produto ',
            OLD.nome,
            ' removido. Preço: ',
            OLD.preco,
            ' | Estoque: ',
            OLD.estoque
        ),
        NOW()
    );

END $

DELIMITER ;
