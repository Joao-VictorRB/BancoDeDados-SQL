CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE LIVROS(
 idLivro INT PRIMARY KEY AUTO_INCREMENT,
 nomeLivro VARCHAR(100) NOT NULL,
 nomeAutor VARCHAR(255) NOT NULL,
 sexoAutor CHAR(1) NOT NULL,
 numPag INT NOT NULL,
 nomeEditora VARCHAR(60) NOT NULL,
 valorLivro FLOAT(10,2) NOT NULL,
 estadoEditora CHAR(2) NOT NULL,
 anoPublicacao YEAR NOT NULL
);

INSERT INTO LIVROS (nomeLivro, nomeAutor, sexoAutor, numPag, nomeEditora, valorLivro, estadoEditora, anoPublicacao)
VALUES 
('Engenharia de Dados Moderna', 'Carlos Silva', 'M', 420, 'TechBooks', 89.90, 'SP', 2022),
('Fundamentos de Python', 'Ana Souza', 'F', 310, 'CodePress', 69.90, 'RJ', 2021),
('SQL para Análise de Dados', 'Ricardo Oliveira', 'M', 280, 'DataHouse', 59.90, 'MG', 2020),
('Big Data na Prática', 'Fernanda Lima', 'F', 510, 'Analytics Editora', 119.90, 'SP', 2023),
('Arquitetura de Dados', 'Marcelo Costa', 'M', 390, 'InfoBooks', 79.90, 'RS', 2019),
('Machine Learning Essencial', 'Juliana Alves', 'F', 450, 'TechBooks', 99.90, 'PR', 2022),
('Data Warehouse Completo', 'Paulo Mendes', 'M', 620, 'DataHouse', 129.90, 'SC', 2018),
('Introdução ao Spark', 'Camila Rocha', 'F', 340, 'CodePress', 74.90, 'BA', 2021),
('Airflow para ETL', 'Gustavo Martins', 'M', 290, 'Analytics Editora', 64.90, 'PE', 2023),
('Cloud para Dados', 'Beatriz Ferreira', 'F', 370, 'InfoBooks', 84.90, 'CE', 2020),
('Estatística Aplicada', 'Eduardo Santos', 'M', 410, 'Saber Editorial', 72.90, 'GO', 2019),
('Ciência de Dados em Ação', 'Mariana Castro', 'F', 480, 'TechBooks', 109.90, 'SP', 2024),
('Modelagem Dimensional', 'Rafael Pereira', 'M', 350, 'DataHouse', 68.90, 'MG', 2021),
('ETL Profissional', 'Larissa Gomes', 'F', 300, 'CodePress', 61.90, 'RJ', 2022),
('Governança de Dados', 'Felipe Araújo', 'M', 430, 'Analytics Editora', 94.90, 'DF', 2023);


SELECT * FROM LIVROS;
SELECT nomeLivro, nomeEditora FROM LIVROS;
SELECT nomeLivro, estadoEditora FROM LIVROS WHERE sexoAutor = 'M';
SELECT nomeLivro, numPag FROM LIVROS WHERE sexoAutor = 'F';
SELECT valorLivro FROM LIVROS WHERE estadoEditora = 'SP';
SELECT  * FROM LIVROS WHERE sexoAutor = 'M' AND estadoEditora = 'SP' OR estadoEditora = 'RJ';
