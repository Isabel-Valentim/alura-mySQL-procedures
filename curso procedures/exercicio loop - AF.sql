/*

Sabendo que a função abaixo soma de 1 dia uma data:

SELECT ADDDATE(DATA_VENDA, INTERVAL 1 DAY);

Faça uma Stored Procedure que,a partir do dia 01/01/2017,
iremos contar o número de notas fiscais até o dia 10/01/2017.
Devemos imprimir a data e o número de notas fiscais dia a dia. Chame esta Stored Procedure de Soma_Dias_Notas.

Dicas:

Declare variáveis do tipo DATE: Data inicial e final; 
Faça um loop testando se Data inicial < Data final; 
Imprima na saída do MYSQL a data e o número de notas. 
Não esquecer de converter as variáveis para VARCHAR; Some a data em 1 dia.
*/

CREATE PROCEDURE `Soma_Dias_Notas`()
BEGIN
DECLARE DATAINICIAL DATE;
DECLARE DATAFINAL DATE;
DECLARE NUMNOTAS INT;
SET DATAINICIAL = '20170101';
SET DATAFINAL = '20170110';
WHILE DATAINICIAL <= DATAFINAL
DO
SELECT COUNT(*) INTO NUMNOTAS  FROM notas_fiscais WHERE DATA_VENDA = DATAINICIAL;
SELECT concat(DATE_FORMAT(DATAINICIAL, '%d/%m/%Y'), '-' , CAST(NUMNOTAS as CHAR(50)));
SELECT ADDDATE(DATAINICIAL, INTERVAL 1 DAY) INTO DATAINICIAL;
END WHILE;

END