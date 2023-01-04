-- USAR CASE

select * from tabela_de_produtos;

USE `sucos_vendas`;
DROP procedure IF EXISTS `tipo_de_sabor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `tipo_de_sabor` (vproduto VARCHAR(10))
BEGIN


declare vSabor VARCHAR(50); 

SELECT SABOR INTO vSabor from tabela_de_produtos
where codigo_do_produto = vproduto;

CASE vSabor
WHEN  'Lima/Limão' then select 'Cítrico' ; 
WHEN 'Laranja' then select 'Cítrico' ; 
ELSE select 'OUTROS';
END CASE; 


END$$

DELIMITER ;

CALL tipo_de_sabor('1000889')


-- outra maneira de escrever
CASE
WHEN vSabor = 'Lima/Limão' then select 'Cítrico' ; 
WHEN vSabor = 'Laranja' then select 'Cítrico' ; 

