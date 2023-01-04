/*Crie uma Stored Procedure usando um cursor 
para achar o valor total do faturamento para um mês e um ano.

Dicas:

Declare três variáveis: Uma que recebe a quantidade,
 outra o preço e uma terceira que irá acumular o faturamento; 
 Faça um loop no cursor e vá somando o faturamento de cada nota; 
 Exiba o valor total do limite; Lembrando a consulta que obter o
 faturamento dentro de um mês e ano.
*/

SELECT INF.QUANTIDADE, INF.PRECO FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN NOTAS_FISCAIS  NF ON NF.NUMERO = INF.NUMERO
WHERE MONTH(NF.DATA_VENDA) = 1 AND YEAR(NF.DATA_VENDA) = 2017


-- res

CREATE PROCEDURE `mais_um_campo`()
BEGIN
DECLARE QUANTIDADE INT;
DECLARE PRECO FLOAT;
DECLARE FATURAMENTOACUM FLOAT;
DECLARE fim_do_cursor INT;
DECLARE c CURSOR FOR
SELECT INF.QUANTIDADE, INF.PRECO FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN NOTAS_FISCAIS  NF ON NF.NUMERO = INF.NUMERO
WHERE MONTH(NF.DATA_VENDA) = 1 AND YEAR(NF.DATA_VENDA) = 2017;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;
OPEN c;
SET fim_do_cursor = 0;
SET FATURAMENTOACUM = 0;
WHILE fim_do_cursor = 0
DO
FETCH c INTO QUANTIDADE, PRECO;
IF fim_do_cursor = 0 THEN
SET FATURAMENTOACUM = FATURAMENTOACUM + (QUANTIDADE * PRECO);
END IF;
END WHILE;
CLOSE c;
SELECT FATURAMENTOACUM;
END