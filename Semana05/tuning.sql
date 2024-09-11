SELECT *
FROM F_CLIENTE
WHERE nome LIKE 'Fernando%';
-- 0.02s

CREATE INDEX idx_cliente_nome
ON F_CLIENTE(nome);
-- DROP INDEX idx_cliente_nome;

-- 0.004s

SELECT *
FROM F_CLIENTE
WHERE LOWER(nome) LIKE 'fernando%';

CREATE INDEX idx_cliente_nome_lower ON F_CLIENTE(LOWER(nome));
-- DROP INDEX idx_cliente_nome_lower;

/*
Quando criar um índice:
Se coluna aparece com frequência em WHERE ou JOIN ou é SELETIVA (filtra muitos dados)

SELECT COUNT(DISTINCT coluna) / COUNT(*) FROM tabela;
Se resultado for muito próximo de 1, não é seletiva, ou seja, não vale a pena criar índice
*/
