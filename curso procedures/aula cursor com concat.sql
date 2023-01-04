USE `sucos_vendas`;
DROP procedure IF EXISTS `novo_exercicio_cursor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `novo_exercicio_cursor` ()
BEGIN

DECLARE fim_do_cursor INT DEFAULT 0; 
DECLARE vNome, vEndereco VARCHAR(150);
DECLARE vCidade, vEstado, vCep VARCHAR (50);

DECLARE C CURSOR FOR

SELECT nome, endereco_1, cidade, estado, cep
FROM tabela_de_clientes
LIMIT 5;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1; 
OPEN C;

WHILE fim_do_cursor = 0

do

fetch C INTO vNome, vEndereco, vCidade, vEstado, vCep;

if fim_do_cursor = 0 then 
select concat(vNome,', ', 'Endereço: ', vEndereco, ', ', vCidade, ' - ', vEstado, ' CEP: ', vCep); 
END IF;
END while; 

close C; 


END$$

DELIMITER ;

CALL novo_exercicio_cursor();