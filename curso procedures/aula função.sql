-- AULA FUNÇÃO


USE `sucos_vendas`;
DROP function IF EXISTS `sabor_achar`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `sabor_achar` (sabor varchar(20))
RETURNS varchar(20)
BEGIN
	declare retorno varchar(20) DEFAULT "";
    
    case sabor
    when 'lima/limão' then set retorno = 'Cítrico'; 
    else set retorno = 'outros';
    end case; 
    
RETURN retorno;
END$$

DELIMITER ;

select sabor_achar('laranja');

select nome_do_produto, sabor, sabor_achar(sabor) as tipo from
tabela_de_produtos;