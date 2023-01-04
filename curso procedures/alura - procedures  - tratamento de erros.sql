#administrar os erros

USE `sucos_vendas`;
DROP procedure IF EXISTS `novo`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `novo` (vendedor varchar(50), comissao char(4))
BEGIN

DECLARE mensagem VARCHAR(50);
-- se houver erro 1062, break, e comando
DECLARE EXIT HANDLER FOR 1062

BEGIN 

SET mensagem = 'Problema de Chave Primária';
Select mensagem;


END; 
--
UPDATE tabela_de_vendedores 
Set percentual_comissao = comissao 
where nome = vendedor;

SET mensagem = 'Novo Registro incluído com sucesso';
Select mensagem;


select * from tabela_de_vendedores;
END$$

DELIMITER ;
