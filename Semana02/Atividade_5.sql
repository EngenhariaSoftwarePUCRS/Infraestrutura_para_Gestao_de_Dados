-- 05. Listar os pa�ses que n�o tiveram nenhum atleta disputando nos eventos desta Olimp�ada.

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