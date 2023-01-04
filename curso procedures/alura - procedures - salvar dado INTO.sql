DROP procedure IF EXISTS `acha_sabor_produto`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN

	DECLARE vSabor VARCHAR(50);
	select sabor into vSabor from tabela_de_produtos
	where CODIGO_DO_PRODUTO = vProduto; 
    
-- BEGIN 
-- END;
 
END$$

DELIMITER ;

call acha_sabor_produto('1000889');

