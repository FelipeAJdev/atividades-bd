-- Proprosta: Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.

--  CRIA UM RELATÓRIO DIÁRIO DA QUANTIDADE DE PRODUTOS COMPRADOS POR DIA COM BASE NA TABELA "PEDIDOS"
CREATE PROCEDURE RelatorioDeVendas(IN data_pesquisa DATE)
BEGIN
    SELECT data_pedido, COUNT(*) AS quantidade_produtos
    FROM Pedidos
    WHERE data_pedido = data_pesquisa
    GROUP BY data_pedido;
END;


-- O COMANDO BUSCA O RELATORIO DOS PRODUTOS COMPRADOS NA DATA SELECIONADA

CALL RelatorioDeVendas('2023-06-20');
