USE locadora_veiculo;

-- MARCAS
INSERT INTO marcas (nome) VALUES
('Toyota'),
('Honda'),
('Chevrolet'),
('Volkswagen'),
('Hyundai');

-- MODELOS
INSERT INTO modelos (nome, id_Marca) VALUES
('Corolla',1),
('Hilux',1),
('Civic',2),
('Onix',3),
('Cruze',3),
('Golf',4),
('HB20',5),
('T-Cross',4);

-- CATEGORIAS
INSERT INTO categorias (nome) VALUES
('Sedan'),
('Hatch'),
('SUV'),
('Pickup');

-- SITUAÇÃO
INSERT INTO situacao (nome) VALUES
('Disponível'),
('Alugado'),
('Manutenção');

-- CORES
INSERT INTO cores (nome) VALUES
('Branco'),
('Preto'),
('Prata'),
('Vermelho'),
('Azul');

-- CARGOS
INSERT INTO cargos (nome) VALUES
('Atendente'),
('Gerente'),
('Supervisor');

-- FUNCIONÁRIOS
INSERT INTO funcionarios(nome,id_Cargo,salario) VALUES
('João Silva',1,2500.00),
('Maria Souza',2,5500.00),
('Carlos Lima',1,2700.00),
('Fernanda Alves',3,4300.00),
('Pedro Santos',1,2600.00);

-- CLIENTES
INSERT INTO clientes(nome,CPF,telefone,CNH) VALUES
('Ana Costa','11111111111','11911111111','00000000001'),
('Bruno Lima','22222222222','11922222222','00000000002'),
('Carla Souza','33333333333','11933333333','00000000003'),
('Daniel Rocha','44444444444','11944444444','00000000004'),
('Eduardo Alves','55555555555','11955555555','00000000005'),
('Fernanda Silva','66666666666','11966666666','00000000006'),
('Gabriel Martins','77777777777','11977777777','00000000007'),
('Helena Costa','88888888888','11988888888','00000000008');

-- VEÍCULOS
INSERT INTO veiculos
(id_Modelo,ano,id_Cor,valorDiaria,id_Categoria,id_Situacao)
VALUES
(1,2023,1,180.00,1,1),
(2,2024,2,350.00,4,2),
(3,2022,3,170.00,1,1),
(4,2023,4,120.00,2,2),
(5,2021,2,190.00,1,1),
(6,2020,3,200.00,2,3),
(7,2024,5,150.00,2,1),
(8,2025,1,260.00,3,1);

-- LOCAÇÕES
INSERT INTO locacao
(dataRetirada,dataDevolucao,valorTotal,id_Cliente,id_Funcionario,id_Veiculo)
VALUES
('2025-01-10','2025-01-15',900.00,1,1,1),
('2025-01-18','2025-01-22',1400.00,2,2,2),
('2025-02-05','2025-02-10',850.00,3,1,3),
('2025-02-12','2025-02-15',360.00,4,3,4),
('2025-03-01','2025-03-07',1140.00,5,2,5),
('2025-03-20','2025-03-25',1000.00,6,4,6),
('2025-04-02','2025-04-06',600.00,7,5,7),
('2025-04-10','2025-04-15',1300.00,8,2,8),
('2025-05-01','2025-05-05',720.00,1,3,4),
('2025-05-15','2025-05-20',900.00,3,1,7),
('2025-06-02','2025-06-06',1040.00,5,5,8),
('2025-06-18','2025-06-22',700.00,2,4,3);
