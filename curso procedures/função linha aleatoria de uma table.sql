USE `sucos_vendas`;
DROP function IF EXISTS `f_cliente_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_cliente_aleatorio` ()
RETURNS VARCHAR(11)
BEGIN
	DECLARE retorno VARCHAR(11);
    
    DECLARE num_max_tabela int; 
    DECLARE numAl INT; 
    
    select count(*) into num_max_tabela from tabela_de_clientes; 
    
    SET numAl = numero_aleatorio(1, num_max_tabela);
    

    
    --  se usar limit 12, 1 
    -- significa selecionar a linha 13
    
    -- se coloca 1,1  dá zero resultado null
    -- se colocar 0,1 da a primeira linha
    
    set numAl = numAl -1;
    
    select CPF INTO retorno from tabela_de_clientes
	limit numAl, 1; 
    
RETURN retorno;
END$$

DELIMITER ;

select f_cliente_aleatorio(); 
