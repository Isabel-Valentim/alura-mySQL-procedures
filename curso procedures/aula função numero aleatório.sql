
USE `sucos_vendas`;
DROP function IF EXISTS `f_numero_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_numero_aleatorio` (min int, max int)
RETURNS integer
BEGIN

	declare retorno INT; 
    
	select floor(rand() * (max - min + 1) + min) into retorno;


RETURN retorno;
END$$

DELIMITER ;

select f_numero_aleatorio(15, 16)