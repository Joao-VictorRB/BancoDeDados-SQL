SELECT * FROM clientes;
SELECT nome, email FROM clientes;
SELECT * FROM produtos WHERE Preco > 100;
SELECT * FROM funcionarios WHERE Salario > 3500;
SELECT * FROM produtos WHERE Qtd_estoque < 20;
SELECT * FROM vendas WHERE DataVenda BETWEEN  '2025-03-01' AND '2025-03-31';


SELECT * FROM produtos ORDER BY preco DESC;
SELECT * FROM clientes ORDER BY nome;
SELECT * FROM produtos ORDER BY Qtd_estoque DESC LIMIT 10;


SELECT * FROM produtos ORDER BY Preco DESC LIMIT 5;
SELECT * FROM funcionarios ORDER BY Salario DESC LIMIT 3;


SELECT COUNT(*) AS Qtd_Clientes FROM clientes;
SELECT MAX(Salario) AS Maior_Salario FROM funcionarios;
SELECT MIN(Preco) AS Menor_Preço FROM produtos;
SELECT AVG(Preco) AS Média FROM produtos;
SELECT SUM(Preco * Qtd_estoque) AS totalEstoque FROM produtos;
SELECT * FROM produtos;


SELECT id_Categoria AS Categoria, COUNT(*) AS Quantidade FROM produtos GROUP BY id_Categoria;
SELECT id_Categoria AS Categoria ,AVG(Preco) AS PrecoMedio  FROM produtos GROUP BY id_Categoria;
SELECT COUNT(idFuncionario) AS QtdFuncionario, Cargo FROM funcionarios GROUP BY Cargo;
SELECT  id_Cliente AS Cliente, COUNT(idVenda) AS QtdVendas FROM Vendas GROUP BY id_Cliente;


SELECT * FROM Clientes WHERE nome LIKE 'Cliente 1%';
SELECT * FROM Produtos WHERE nome LIKE '%5';
SELECT * FROM funcionarios WHERE cargo LIKE '%Ger%';

SELECT * FROM Produtos WHERE preco BETWEEN 50 AND 150 ORDER BY Preco DESC;
SELECT * FROM Produtos WHERE id_Categoria IN(2,4,8) ORDER BY id_Categoria DESC;
SELECT * FROM Vendas WHERE DataVenda BETWEEN '2025-06-01' AND '2025-08-31'  ORDER BY DataVenda;
   
SELECT C.nome, V.idVenda, V.DataVenda 
FROM Clientes AS C
INNER JOIN Vendas AS V
ON C.idCliente = V.id_Cliente ORDER BY C.nome;

SELECT F.nome, V.idVenda, V.DataVenda 
FROM Funcionarios AS F
INNER JOIN Vendas AS V
ON F.idFuncionario = V.id_Funcionario ORDER BY F.nome;