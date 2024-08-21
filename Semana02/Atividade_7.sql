-- 07. Listar o total de medalhas de cada tipo (ouro, prata, bronze) por país.

/*
SELECT
    P.NOME,
    M.METAL,
    COUNT(M.ID) AS QTD_MEDALHAS
FROM MEDALHA M
    INNER JOIN TIME T
        ON T.ID = M.ID_TIME
    RIGHT JOIN PAIS P
        ON P.ID = T.ID_PAIS
GROUP BY
    P.NOME,
    M.METAL
ORDER BY
    M.METAL,
    QTD_MEDALHAS DESC
;
*/

SELECT
    P.NOME
    ,SUM(CASE WHEN M.METAL = 'O' THEN 1 ELSE 0 END) AS Ouro
    ,SUM(CASE WHEN M.METAL = 'P' THEN 1 ELSE 0 END) AS Prata
    ,SUM(CASE WHEN M.METAL = 'B' THEN 1 ELSE 0 END) AS Bronze
    ,COUNT(M.METAL) AS Total
FROM MEDALHA M
    INNER JOIN TIME T
        ON T.ID = M.ID_TIME
    RIGHT JOIN PAIS P
        ON P.ID = T.ID_PAIS
GROUP BY
    P.NOME
ORDER BY
    Ouro DESC
    ,Prata DESC
    ,Bronze DESC
    ,Total
;