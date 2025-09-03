CREATE DATABASE ProvadorVirtual;
USE ProvadorVirtual;

CREATE TABLE Usuarios (
	usuario_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(254) NOT NULL,
	cpf NVARCHAR(11) NOT NULL
);

CREATE TABLE Produtos (
    produto_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
	tamanho NVARCHAR (1) NOT NULL,
	cor NVARCHAR (50) NOT NULL,
	estoque INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE InteracoesProvador (
    inte_pro_id INT IDENTITY(1,1) PRIMARY KEY,
	usuario_id INT,
	produto_id INT,
    nome NVARCHAR(254) NOT NULL,

	FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id),
	FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

CREATE TABLE AvaliacoesProdutos (
    avaliacao_id INT IDENTITY(1,1) PRIMARY KEY,
	usuario_id INT NOT NULL,
	produto_id INT NOT NULL,
    qtd_estrela INT NOT NULL,

	CONSTRAINT limite_Qtd_Estrela CHECK (qtd_estrela >= 1 AND qtd_estrela <= 5),
	FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id),
	FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

CREATE TABLE VariacoesProduto(
	Variacao_id INT IDENTITY(1,1) PRIMARY KEY,
	produto_id INT,
	tamanho NVARCHAR (5) NOT NULL,
	cor NVARCHAR (50) NOT NULL,
	estoque INT NOT NULL,

	FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);


ALTER TABLE Produtos DROP COLUMN tamanho;
ALTER TABLE Produtos DROP COLUMN cor;
ALTER TABLE Produtos DROP COLUMN estoque;


INSERT INTO Usuarios (nome, cpf) VALUES
('Ana Souza', '12345678901'),
('Bruno Lima', '23456789012'),
('Carla Mendes', '34567890123'),
('Diego Rocha', '45678901234'),
('Eduarda Silva', '56789012345')

INSERT INTO Produtos (nome, preco) VALUES
('Blusa de Linho', 39.90),
('Calça Jeans', 129.90),
('Vestido Midi Floral', 89.90),
('Jaqueta Couro', 199.90),
('Tênis Esportivo', 249.90);

INSERT INTO VariacoesProduto (produto_id, tamanho, cor, estoque) VALUES
(1, 'P', 'Branco', 10),
(1, 'M', 'Preto', 15),
(2, 'G', 'Azul', 5),
(3, 'M', 'Rosa', 8),
(4, 'M', 'Preto', 3),
(5, '42', 'Branco', 6)

INSERT INTO InteracoesProvador (usuario_id, produto_id, nome) VALUES
(1, 1, 'Experimentou no provador'),
(2, 2, 'Adicionou ao carrinho'),
(3, 3, 'Comprou'),
(4, 4, 'Experimentou no provador'),
(5, 5, 'Experimentou no provador')

INSERT INTO AvaliacoesProdutos (usuario_id, produto_id, qtd_estrela) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 3),
(4, 4, 5),
(5, 5, 4),
(1, 2, 4),
(2, 3, 5),
(2, 4, 3),
(3, 5, 4),
(4, 1, 2),
(5, 2, 5);

SELECT * FROM VariacoesProduto;

UPDATE VariacoesProduto
SET estoque = 25
WHERE Variacao_id = 2;

DELETE AvaliacoesProdutos 
WHERE avaliacao_id = 3;


SELECT 
    p.nome AS nome_produto,
    vp.tamanho,
    vp.cor,
    vp.estoque
FROM 
    VariacoesProduto vp
INNER JOIN 
    Produtos p ON vp.produto_id = p.produto_id
WHERE 
    p.nome = 'Blusa de Linho';


SELECT 
	p.nome AS nome_produto,
    AVG(qtd_estrela) As media_avaliacao
FROM 
    AvaliacoesProdutos ap
INNER JOIN 
    Produtos p ON ap.produto_id = p.produto_id
GROUP BY
	p.nome
ORDER BY 
	media_avaliacao DESC;

SELECT 
    p.nome AS nome_produto,
    ap.qtd_estrela AS nota
FROM 
    AvaliacoesProdutos ap
INNER JOIN 
    Produtos p ON ap.produto_id = p.produto_id
WHERE 
    ap.usuario_id = 2;