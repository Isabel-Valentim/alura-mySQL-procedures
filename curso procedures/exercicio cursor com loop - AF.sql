/*Crie uma Stored Procedure usando um 
cursor para achar o valor total de todos 
os créditos de todos os clientes. 
Chame esta SP de Limite_Creditos.

Dicas:

Declare duas variáveis: 
Uma que recebe o limite de crédito 
do cursor e outra o limite de crédito 
total; Faça um loop no cursor e vá 
somando na variável limite de crédito 
total o valor do limite de cada cliente; 
Exiba o valor total do limite.

*/

CREATE PROCEDURE `Limite_creditos`()
BEGIN
DECLARE LIMITECREDITO FLOAT;
DECLARE LIMITECREDITOACUM FLOAT;
DECLARE fim_do_cursor INT;
DECLARE c CURSOR FOR SELECT LIMITE_DE_CREDITO FROM Tabela_de_Clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;
SET fim_do_cursor = 0;
SET LIMITECREDITOACUM = 0;
SET LIMITECREDITO = 0;
OPEN c;
WHILE fim_do_cursor = 0
DO
FETCH c INTO LIMITECREDITO;
    IF fim_do_cursor = 0 THEN
        SET LIMITECREDITOACUM = LIMITECREDITOACUM + LIMITECREDITO;
    END IF;
END WHILE;
SELECT LIMITECREDITOACUM;
CLOSE c;
END