INSERT INTO PLANOS (nomePlano, valorMensal) VALUES
('Basico', 79.90),
('Plus', 119.90),
('Premium', 179.90);

-- ALUNOS
INSERT INTO ALUNOS (nome, telefone) VALUES
('João Silva', '(11)99999-1111'),
('Maria Oliveira', '(11)99999-2222'),
('Pedro Santos', '(11)99999-3333'),
('Ana Souza', '(11)99999-4444'),
('Lucas Lima', '(11)99999-5555'),
('Juliana Costa', '(11)99999-6666'),
('Carlos Mendes', '(11)99999-7777'),
('Fernanda Rocha', '(11)99999-8888'),
('Bruno Alves', '(11)99999-9999'),
('Camila Ferreira', '(11)99999-0000');

-- MATRICULAS
INSERT INTO MATRICULA (dataMatricula, id_Aluno, id_Plano) VALUES
('2025-01-10', 1, 1),
('2025-01-15', 2, 2),
('2025-02-01', 3, 3),
('2025-02-18', 4, 1),
('2025-03-05', 5, 2),
('2025-03-20', 6, 3),
('2025-04-12', 7, 1),
('2025-05-01', 8, 2);