/*

Crie uma Stored Procedure que, baseado em uma data, contamos o número de notas fiscais. 
Se houverem mais que 70 notas exibimos a mensagem: ‘Muita nota’. Ou então exibimos a mensagem ‘Pouca nota’.
Também exibir o número de notas. Chame esta Stored Procedure de Testa_Numero_Notas.

A data a ser usada para testar a nota será um parâmetro da Stored Procedure.

*/

USE `sucos_vendas`;
DROP procedure IF EXISTS `qtdNotas`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `qtdNotas` (DATANOTA varchar(20))
BEGIN
DECLARE NUMNOTAS INT;
    SELECT COUNT(*) INTO NUMNOTAS FROM NOTAS_FISCAIS WHERE DATA_VENDA = DATANOTA;
    IF NUMNOTAS > 70 THEN
        SELECT 'Muita Nota', NUMNOTAS;
    ELSE
        SELECT 'Pouca Nota', NUMNOTAS;
    END IF;
END$$

DELIMITER ;

