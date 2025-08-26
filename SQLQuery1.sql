CREATE DATABASE Caixa;
USE Caixa;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    CPF CHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL
	);

INSERT INTO Clientes (Nome, CPF, DataNascimento)
VALUES 
('Ana Clara da Silva', '12345678901', '1990-05-10'),
('Bruno Souza Lima', '23456789012', '1985-11-23'),
('Carlos Eduardo Ramos', '34567890123', '1978-03-15'),
('Daniela Rocha Vieira', '45678901234', '1992-07-08'),
('Eduardo Martins Alves', '56789012345', '1980-12-30'),
('Fernanda Castro Nunes', '67890123456', '1995-01-18'),
('Gustavo Henrique Dias', '78901234567', '1988-09-04'),
('Helena Pires Couto', '89012345678', '1993-06-21'),
('Isabela Fernandes Braga', '90123456789', '1999-04-13'),
('João Pedro Almeida', '01234567890', '1983-08-27');

CREATE TABLE Contas (
    Numero_Conta INT PRIMARY KEY IDENTITY(1,1)NOT NULL,
    ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID) NOT NULL,
    Saldo DECIMAL(10,2) NOT NULL
);

INSERT INTO Contas (ID_Cliente, Saldo)
VALUES 
(1, 1500.00),
(2, 2450.50),
(3, 1200.00),
(4, 300.75),
(5, 987.65),
(6, 3500.00),
(7, 499.99),
(8, 8000.00),
(9, 150.25),
(10, 2200.00);

CREATE TABLE Transacoes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Conta_Origem INT FOREIGN KEY REFERENCES Contas(Numero_Conta) NOT NULL,
    Conta_Destino INT FOREIGN KEY REFERENCES Contas(Numero_Conta) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Data_Hora DATETIME DEFAULT GETDATE()
);

INSERT INTO Transacoes (Conta_Origem, Conta_Destino, Valor)
VALUES 
(1, 2, 200.00),
(3, 4, 75.50),
(5, 6, 320.00),
(7, 8, 150.25),
(9, 10, 60.00),
(2, 1, 50.00);

select * from Transacoes;