-- 01. Listar todos os atletas que ganharam medalhas de ouro e o nome do evento em que competiram.

SELECT
    A.NOME,
    E.DESCRICAO
FROM ATLETA A
    JOIN MEDALHA M
        ON M.ID_ATLETA = A.ID
    JOIN EVENTO E
        ON E.ID = M.ID_EVENTO
WHERE M.METAL = 'O'
;