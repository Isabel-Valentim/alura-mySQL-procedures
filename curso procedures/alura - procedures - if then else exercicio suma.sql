use sucos_vendas;
SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301';

--
/*
Construa uma Stored Procedure chamada 
Comparativo_Vendas que compara as vendas em 
duas datas (Estas duas datas serão parâmetros da SP). 
Se a variação percentual destas vendas for maior que 10% 
a resposta deve ser ‘Verde’. Se for entre -10% e 10% 
deve retornar ‘Amarela1. Se o retorno form menor que 
-10% deve retornar ‘Vermelho’.*/

USE `sucos_vendas`;
DROP procedure IF EXISTS `Comparativo_vendas`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Comparativo_vendas` (dataA date, dataB date)
BEGIN

DECLARE totalVendaA VARCHAR(10); 
DECLARE totalVendaB VARCHAR(10); 
DECLARE RESULTADO FLOAT;
DECLARE MENSAGEM VARCHAR(10);

select SUM(B.QUANTIDADE * B.PRECO) into totalVendaA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = dataA;

select SUM(B.QUANTIDADE * B.PRECO) into totalVendaB FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = dataB;

SET RESULTADO  = (totalVendaA/totalVendaB)*100;

IF RESULTADO > 10 then 
	SET MENSAGEM  = 'VERDE';
ELSEIF RESULTADO > -10 AND RESULTADO <= 10 THEN
	SET MENSAGEM = 'AMARELA';
ELSE
	SET MENSAGEM = 'VERMELHO';
END IF;

SELECT MENSAGEM; 
END$$

DELIMITER ;




