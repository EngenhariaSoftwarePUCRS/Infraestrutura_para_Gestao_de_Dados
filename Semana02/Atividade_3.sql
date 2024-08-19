-- 03. Listar todos os eventos em que atletas do Brasil participaram.

SELECT
    E.DESCRICAO,
    E.GENERO
FROM EVENTO E
    JOIN MEDALHA M
        ON E.ID = M.ID_EVENTO
    JOIN ATLETA A
        ON M.ID_ATLETA = A.ID
    JOIN TIME T
        ON M.ID_TIME = T.ID
WHERE
    A.ID_PAIS = 2
    OR T.ID_PAIS = 2
;