CREATE DATABASE locadora_veiculo;
USE locadora_veiculo;

CREATE TABLE clientes(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    CNH CHAR(11) NOT NULL UNIQUE
    
);

CREATE TABLE marcas(
	idMarca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE modelos(
	idModelo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_Marca INT NOT NULL,
    
    FOREIGN KEY (id_Marca) REFERENCES marcas(idMarca)
);

CREATE TABLE categorias(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE situacao(
	idSituacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE cores(
	idCor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE veiculos(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_Modelo INT NOT NULL,
    ano YEAR NOT NULL,
    id_Cor INT NOT NULL,
    valorDiaria DECIMAL(7,2) NOT NULL CHECK(valorDiaria > 0),
    id_Categoria INT NOT NULL,
    id_Situacao INT NOT NULL,
    
    FOREIGN KEY (id_Modelo) REFERENCES modelos(idModelo),
    FOREIGN KEY (id_Cor) REFERENCES cores(idCor),
    FOREIGN KEY (id_Categoria) REFERENCES categorias(idCategoria),
    FOREIGN KEY (id_Situacao) REFERENCES situacao(idSituacao)
);

CREATE TABLE cargos(
	idCargo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE funcionarios(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_Cargo INT NOT NULL,
    salario DECIMAL(7,2) NOT NULL CHECK(salario > 0),
    
    FOREIGN KEY (id_Cargo) REFERENCES cargos(idCargo)
);

CREATE TABLE locacao(
	idLocacao INT PRIMARY KEY AUTO_INCREMENT,
    dataRetirada DATE NOT NULL,
    dataDevolucao DATE NOT NULL,
    valorTotal DECIMAL(7,2) NOT NULL CHECK(valorTotal > 0),
    id_Cliente INT NOT NULL,
    id_Funcionario INT NOT NULL,
    id_Veiculo INT NOT NULL,
    
    CONSTRAINT check_data_valida CHECK(dataRetirada <= dataDevolucao),
    
    FOREIGN KEY (id_Cliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (id_Funcionario) REFERENCES funcionarios(idFuncionario),
    FOREIGN KEY (id_Veiculo) REFERENCES veiculos(idVeiculo)
);
