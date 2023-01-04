-- while condição
-- do statement
-- end while;

CREATE TABLE TAB_LOOPING(id INT); 


USE `sucos_vendas`;
DROP procedure IF EXISTS `looping_while`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `looping_while` (vNumInicial INT, vNumFinal INT)
BEGIN
DECLARE vContador INT; 

DELETE FROM TAB_LOOPING; -- LIMPAR TABELA
SET vContador = vNumInicial;
while vContador <= vNumFinal
do
	 insert into TAB_LOOPING (ID) VALUES(vContador);
	set vContador = vContador + 1;
end while; 

SELECT * FROM TAB_looping;

END$$

DELIMITER ;

CALL looping_while(1,18)
