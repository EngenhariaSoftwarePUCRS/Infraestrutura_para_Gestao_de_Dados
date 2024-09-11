-- 1. Listar o CPF e o nome das pessoas físicas com mais de 18 anos de idade.
SELECT
    pf.cpf
    ,c.nome
    ,FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) as idade
FROM cliente c
JOIN pessoa_fisica pf
    ON pf.cod_cliente = c.cod_cliente
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) > 18
;
