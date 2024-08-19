-- 05. Listar os países que não tiveram nenhum atleta disputando nos eventos desta Olimpíada.

SELECT P.NOME
FROM PAIS P
WHERE P.ID NOT IN
    (
        SELECT DISTINCT P.ID
        FROM PAIS P
            JOIN ATLETA A
                ON A.ID_PAIS = P.ID
    )
;