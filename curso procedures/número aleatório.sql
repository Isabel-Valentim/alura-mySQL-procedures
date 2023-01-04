-- exercicio prático

select rand(); 
-- número aleatório entre 0 e 1


-- para achar um número dentro de um intervalo 
-- aleatorio * (max - min +1) + min 

-- exemplo

select floor(rand() * (300 - 1 + 1) + 1);
-- floor arredonda


