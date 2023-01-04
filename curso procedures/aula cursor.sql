-- cursor é como se fosse um select into 
-- mas com mais de uma linha ou mais de uma coluna

USE `sucos_vendas`;
DROP procedure IF EXISTS `cursor_primeiro`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursor_primeiro` ()
BEGIN
declare vNome VARCHAR(50); 
DECLARE  c CURSOR FOR SELECT nome FROM tabela_de_clientes limit 4;
OPEN c;
FETCH c INTO vNome;
SELECT vNome;
FETCH c INTO vNome;
SELECT vNome;
FETCH c INTO vNome;
SELECT vNome;
FETCH c INTO vNome;
SELECT vNome;
END$$

DELIMITER ;

call cursor_primeiro()




