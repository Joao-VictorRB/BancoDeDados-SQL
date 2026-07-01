USE Faculdade;

-- ALUNOS
INSERT INTO alunos (nome, curso, idade) VALUES
('João Silva', 'Ciência da Computação', 20),
('Maria Oliveira', 'Administração', 22),
('Pedro Santos', 'Engenharia Civil', 21),
('Ana Costa', 'Direito', 23),
('Lucas Almeida', 'Ciência da Computação', 19),
('Beatriz Souza', 'Psicologia', 24),
('Carlos Ferreira', 'Engenharia Civil', 20),
('Fernanda Lima', 'Administração', 21),
('Rafael Gomes', 'Direito', 22),
('Juliana Martins', 'Psicologia', 20);

-- PROFESSORES
INSERT INTO professores (nome, disciplina) VALUES
('Ricardo Mendes', 'Banco de Dados'),
('Patrícia Alves', 'Algoritmos'),
('Marcos Rocha', 'Cálculo'),
('Camila Nunes', 'Direito Civil'),
('Eduardo Costa', 'Psicologia Geral');

-- DISCIPLINAS
INSERT INTO disciplinas (nome, cargaHoraria, idProfessor) VALUES
('Banco de Dados', 80, 1),
('Algoritmos', 60, 2),
('Cálculo I', 80, 3),
('Direito Civil', 60, 4),
('Psicologia Geral', 60, 5),
('Estrutura de Dados', 80, 2),
('Matemática Discreta', 60, 3);

-- MATRICULAS
INSERT INTO matriculas (idAluno, idDisciplina, nota, frequencia) VALUES
(1, 1, 8.5, 90),
(1, 2, 7.8, 85),
(2, 3, 6.5, 80),
(3, 3, 9.2, 95),
(4, 4, 8.0, 88),
(5, 1, 5.5, 70),
(5, 6, 7.0, 82),
(6, 5, 9.5, 98),
(7, 3, 6.8, 75),
(8, 2, 8.9, 91),
(9, 4, 7.2, 86),
(10, 5, 8.7, 93),
(2, 2, 7.4, 84),
(3, 1, 6.9, 79),
(4, 3, 5.8, 68);
