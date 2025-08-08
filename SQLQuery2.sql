Create Database senai;

use senai;

CREATE TABLE docentes (
    id INT PRIMARY KEY identity(1,1),
    nome VARCHAR(100),
    salario DECIMAL(10,2)
);

CREATE TABLE cursos (
    id INT PRIMARY KEY identity(1,1),
    nome VARCHAR(100),
    carga_horaria INT,
    id_docente INT
);

INSERT INTO docentes (nome, salario) VALUES 
('Jorge', 3500.00),
('Silva', 4200.50),
('Ryan', 3900.75);

INSERT INTO cursos (nome, carga_horaria, id_docente) VALUES
('Desenvolvimento Web', 120, 1),
('Full Stack', 1000, 2),
('Redes de Computadores', 150, 3),
('Eletrica', 80, 1);

SELECT * FROM docentes;

SELECT * FROM cursos WHERE carga_horaria > 100;

SELECT 
    cursos.nome AS nome_curso,
    docentes.nome AS nome_docente
FROM 
    cursos
JOIN 
    docentes ON cursos.id_docente = docentes.id;