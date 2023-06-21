-- SOMA O TOTAL DE CLIENTES CADASTRADOS NA LOJA DURANTE UM DIA.
CREATE FUNCTION RelatorioCadastroClientes(data_pesquisa DATE) RETURNS INT
BEGIN
    DECLARE total_clientes INT;
    SELECT COUNT(*) INTO total_clientes
    FROM Clientes
    WHERE DATE(data_cadastro) = data_pesquisa;
    RETURN total_clientes;
END;

-- EXIBE A QUANTIDADE DE CADASTROS REALIZADOS NO DIA SELECIONADO
SELECT RelatorioCadastroClientes('1997-10-29');

