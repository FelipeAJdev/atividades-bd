-- CRIANDO TABELAS PRODUTOS, CLIENTES E PEDIDOS

CREATE TABLE Produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(500),
  preco DECIMAL(10, 2),
  estoque INT
);

CREATE TABLE Clientes (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100),
  endereco VARCHAR(200),
  telefone VARCHAR(20)
);

CREATE TABLE Pedidos (
  id INT PRIMARY KEY,
  cliente_id INT,
  produto_id INT,
  quantidade INT,
  data_pedido DATE,
  FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
  FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);


-- INSERINDO DASDOS DE PRODUTOS DLIENTES E PEDIDOS
INSERT INTO Produtos (id, nome, descricao, preco, estoque)
VALUES
  (1, 'Whey Protein', 'Suplemento proteico para auxiliar no ganho de massa muscular.', 99.90, 50),
  (2, 'BCAA', 'Suplemento de aminoácidos essenciais para recuperação muscular.', 49.90, 100),
  (3, 'Creatina', 'Suplemento para aumentar a força e a explosão muscular.', 29.90, 80);

INSERT INTO Clientes (id, nome, email, endereco, telefone)
VALUES
  (1, 'João Silva', 'joao@example.com', 'Rua A, 123', '11111111'),
  (2, 'Maria Souza', 'maria@example.com', 'Av. B, 456', '22222222'),
  (3, 'Carlos Oliveira', 'carlos@example.com', 'Praça C, 789', '33333333');

INSERT INTO Pedidos (id, cliente_id, produto_id, quantidade, data_pedido)
VALUES
  (1, 1, 1, 2, '2023-06-20'),
  (2, 1, 2, 1, '2023-06-20'),
  (3, 2, 3, 3, '2023-06-19'),
  (4, 3, 1, 4, '2023-06-18');
