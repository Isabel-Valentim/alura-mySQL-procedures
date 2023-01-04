USE `sucos_vendas`;

#incluir produto
DROP procedure IF EXISTS `inclui_produto`;

DELIMITER $$
USE `sucos_vendas`$$

CREATE PROCEDURE `inclui_produto` (vCodigo varchar(50), vNome varchar(50) , vSabor varchar(50) , vTamnho varchar(50) , vEmbalagem varchar(50) , vPreco varchar(50))
BEGIN

INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,
NOME_DO_PRODUTO,
SABOR,
TAMANHO,
EMBALAGEM,
PRECO_DE_LISTA)
		VALUES (vCodigo, 
        vNome, 
        vSabor,  
        vTamnho, 
        vEmbalagem, 
        vPreco);

END$$

DELIMITER ;


#select 

DROP procedure IF EXISTS `select_sabor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `select_sabor` ()
BEGIN
	SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END$$

DELIMITER ;


DROP procedure IF EXISTS `manipulacao_de_dados`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `manipulacao_de_dados` ()
BEGIN
		call inclui_produto('3122', 'Produto', 'Manfa', '700 ml', 'Garrafa', '7.5'); 
        
		call select_sabor;
        
		UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

		call select_sabor;

		DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

		call select_sabor;


END$$

DELIMITER ;

call manipulacao_de_dados;

