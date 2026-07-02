CREATE DATABASE Comercio;
USE Comercio;

CREATE TABLE Clientes(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
	CPF CHAR(11) NOT NULL UNIQUE,
	email VARCHAR(100) UNIQUE,
	telefone CHAR(14) UNIQUE
);

CREATE TABLE Funcionarios(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Cargo VARCHAR(100) NOT NULL,
	Salario DECIMAL(10,2) NOT NULL CHECK(Salario >= 0),
	Data_admissao DATE NOT NULL
);

CREATE TABLE Categoria(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Produtos(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	id_Categoria INT NOT NULL,
	Preco DECIMAL(10,2) NOT NULL CHECK(Preco >= 0),
	Qtd_estoque INT NOT NULL CHECK(Qtd_estoque >= 0),
    
    FOREIGN KEY(id_Categoria) REFERENCES Categoria(idCategoria)
);


CREATE TABLE Vendas(
	idVenda INT PRIMARY KEY AUTO_INCREMENT,
	DataVenda DATE NOT NULL,
	Valortotal DECIMAL(10,2) NOT NULL CHECK(Valortotal >= 0),
    id_Cliente INT NOT NULL,
    id_Funcionario INT NOT NULL,
    
    FOREIGN KEY(id_Cliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY(id_Funcionario) REFERENCES Funcionarios(idFuncionario)
);

CREATE TABLE VendaProduto(
	idVendaProduto INT PRIMARY KEY AUTO_INCREMENT,
    id_Vendas INT NOT NULL,
    id_Produto INT NOT NULL,
    Qtd INT NOT NULL CHECK(Qtd > 0),
    PrecoUnitario DECIMAL(10,2) NOT NULL CHECK(PrecoUnitario >= 0),
    
    FOREIGN KEY(id_Vendas) REFERENCES Vendas(idVenda),
    FOREIGN KEY(id_Produto) REFERENCES Produtos(idProduto),
    
    UNIQUE(id_Vendas, id_Produto)
);
