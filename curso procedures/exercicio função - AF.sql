CREATE PROCEDURE `sp_numero_notas` ()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END

/*
Transforme esta SP em uma função onde passamos 
como parâmetro da data e retornamos o número de notas. 
Chame esta função de NumeroNotas.
 Após a criação da função teste seu uso com um SELECT.
 
 */
 
 -- resposta
 
 CREATE FUNCTION `numero_notas` (DATA DATE)
RETURNS INTEGER
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = DATA;
RETURN NUMNOTAS;
END