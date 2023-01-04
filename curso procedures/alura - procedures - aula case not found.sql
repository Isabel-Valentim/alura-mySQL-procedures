
USE `sucos_vendas`;
DROP PROCEDURE IF EXISTS `tipo_de_sabor_ERRO` ; 
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `tipo_de_sabor_ERRO` (vproduto VARCHAR(10))
BEGIN


declare vSabor VARCHAR(50); 
DEclare msgErro VARCHAR(30); 

DECLARE CONTINUE HANDLER FOR 1339
SET msgErro = 'o case não está completo';

SELECT SABOR INTO vSabor from tabela_de_produtos
where codigo_do_produto = vproduto;

CASE vSabor
WHEN  'Lima/Limão' then select 'Cítrico' ; 
WHEN 'Laranja' then select 'Cítrico' ; 
END CASE; 
select msgErro; 

END$$

DELIMITER ;

CALL tipo_de_sabor_ERRO('1000889')

