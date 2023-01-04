USE `sucos_vendas`;
DROP procedure IF EXISTS `novo`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `novo` (vendedor varchar(50), comissao char(4))
BEGIN

UPDATE tabela_de_vendedores 
Set percentual_comissao = comissao 
where nome = vendedor;

select * from tabela_de_vendedores;
END$$

DELIMITER ;

--

drop PROCEDURE if exists reajuste_comissao; 

USE `sucos_vendas`;
DROP procedure IF EXISTS `reajuste_comissao`;

DELIMITER $$
USE `sucos_vendas`$$

CREATE PROCEDURE `reajuste_comissao` (vPercent FLOAT)
BEGIN
UPDATE tabela_de_vendedores SET percentual_comissao = percentual_comissao * (1 + vPercent);
END$$

DELIMITER ;

call reajuste_comissao('Pericles Alves', 0.99)

