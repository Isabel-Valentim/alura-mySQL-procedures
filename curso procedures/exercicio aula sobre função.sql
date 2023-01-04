
/*
Crie uma tabela chamada TABELA_ALEATORIOS. O comando para cria-la é mostrado abaixo:

CREATE TABLE TABELA_ALEATORIOS(NUMERO INT);

Faça uma SP (Chame-a de Tabela_Numeros) que use um loop para gravar nesta 
tabela 100 números aleatórios entre 0 e 1000. Depois liste numa consulta esta tabela.

(Use a função f_numero_aleatorio criado no vídeo desta aula).

*/

CREATE PROCEDURE `Tabela_Numeros`()
BEGIN
DECLARE CONTADOR INT;
DECLARE CONTMAXIMO INT;
SET CONTADOR = 1;
SET CONTMAXIMO = 100;
DELETE FROM TABELA_ALEATORIOS;
WHILE CONTADOR <= CONTMAXIMO
DO
INSERT INTO TABELA_ALEATORIOS (NUMERO) VALUES (f_numero_aleatorio(0,1000));
SET CONTADOR = CONTADOR + 1;
END WHILE;
SELECT * FROM TABELA_ALEATORIOS;
END