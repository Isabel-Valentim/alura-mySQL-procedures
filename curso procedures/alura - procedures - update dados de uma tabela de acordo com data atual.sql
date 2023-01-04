/*Crie uma Stored procedure que atualize a idade dos clientes.
 Lembrando que o comando para calcular a idade, na tabela 
 Tabela_de_Clientes é: */

USE `sucos_vendas`;
DROP procedure IF EXISTS `exercicio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `exercicio` ()
BEGIN

UPDATE tabela_de_clientes set idade  = timestampdiff(YEAR, DATA_DE_NASCIMENTO, curdate());
select * from sucos_vendas.tabela_de_clientes;
END$$

DELIMITER ;

call exercicio; 



