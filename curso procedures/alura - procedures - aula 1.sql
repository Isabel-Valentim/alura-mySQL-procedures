#sql não é estruturada - sem if, loop, else

USE `sucos_vendas`;
DROP procedure IF EXISTS `hello_world`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `hello_world` ()
BEGIN
/*comentário
de duas linhas*/
-- comentário de uma linha
SELECT 'Hello World!' as Resultado;
END$$

DELIMITER ;

call hello_world;


-- variáveis: 
-- tipos: varchar, integer, decimal, date, timestamp

USE `sucos_vendas`;
DROP procedure IF EXISTS `exibe_variavel`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `exibe_variavel` ()
BEGIN

declare texto, texto_2 varchar(20) default 'olhaisso';
declare i integer default 10;
declare d decimal(4,2) default 56.12;
declare dt date default '2019-03-01';
declare ts datetime default localtimestamp; 


select texto;
set texto_2 = 'masolhaissoaqui';
select texto_2;
select i;
select d;
select dt;
select ts;

END$$

DELIMITER ;

call exibe_variavel;




