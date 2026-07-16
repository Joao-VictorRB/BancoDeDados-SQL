CREATE DATABASE sistema_estoque;
USE sistema_estoque;

CREATE TABLE produtos(
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK(preco > 0),
    estoque INT NOT NULL CHECK(estoque >= 0)
);

CREATE TABLE movimentacoes(
    idMovimentacao INT PRIMARY KEY AUTO_INCREMENT,
    id_Produto INT,
    tipoMovimentacao VARCHAR(30) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    dataMovimentacao DATETIME NOT NULL
);