USE `sucos_vendas`;
DROP procedure IF EXISTS `ifelse`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `ifelse` (varCpf varchar(20))
BEGIN
	declare resultado varchar(50);
	declare vDtaNascimento DATE; 
    
    SELECT DATA_DE_NASCIMENTO INTO vDtaNascimento FROM tabela_de_clientes
    where cpf = varCpf;
    
    if vDtaNascimento < 20000101 then 
		set resultado = 'Cliente velho';
    else 
		set resultado = 'Cliente novo';
    end if; 
    
    Select Resultado;
END$$

DELIMITER ;

call ifelse('1471156710')
