CREATE DATABASE LojaExemplo;

USE LojaExemplo;

CREATE TABLE Clientes (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    email NVARCHAR(100)
);

CREATE TABLE Produtos (
    produto_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedidos (
    pedido_id INT IDENTITY(1,1) PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    data_pedido DATE DEFAULT GETDATE(),

    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);



INSERT INTO Clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Carlos Lima', 'carlos@email.com');


INSERT INTO Produtos (nome, preco) VALUES
('Notebook', 3500.00),
('Teclado', 150.00),
('Mouse', 80.00),
('Monitor', 900.00);


INSERT INTO Pedidos (cliente_id, produto_id) VALUES
(1, 1),  
(1, 3),  
(2, 2),  
(3, 4);  



SELECT 
    c.nome AS nome_Cliente,
    p.nome AS nome_Produto
FROM 
    Pedidos pe
INNER JOIN Clientes c ON c.cliente_id = pe.cliente_id
INNER JOIN Produtos p ON p.produto_id = pe.produto_id;
