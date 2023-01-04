USE `sucos_vendas`;
DROP procedure IF EXISTS `cursor_primeiro`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursor_primeiro` ()
BEGIN
declare vNome VARCHAR(50); 
declare fimDoCursor INT DEFAULT(0); 

DECLARE  c CURSOR FOR SELECT nome FROM tabela_de_clientes LIMIT 4;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimDoCursor = 1;
OPEN c;

while fimDoCursor =0 Do

FETCH c INTO vNome;
SELECT vNome;

End while; 

 CLOSE c; 

END$$

DELIMITER ;

call cursor_primeiro()