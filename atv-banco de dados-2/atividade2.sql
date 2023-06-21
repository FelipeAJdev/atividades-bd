-- CRIAÇÃO DO BANCO DE DADOS

CREATE DATABASE SupremeNutritionDB;
USE SupremeNutritionDB;

-- CRIANÇÃO DAS TABELAS "Produtos", "Clientes" e "Pedidos"

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


-- TRIGGER ATUALIZARA DISPONIBBILIDADE DO ESTOQUE 
--APÓS NOVO REGISTRO NA TABELA PEDIDOS,

CREATE TRIGGER atualizar_estoque AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE qtd_atual INT;
    DECLARE qtd_pedido INT;

    SELECT estoque INTO qtd_atual FROM Produtos WHERE id = NEW.produto_id;

    SELECT quantidade INTO qtd_pedido FROM Pedidos WHERE id = NEW.id;

    SET qtd_atual = qtd_atual - qtd_pedido;

    UPDATE Produtos SET estoque = qtd_atual WHERE id = NEW.produto_id;
END;
