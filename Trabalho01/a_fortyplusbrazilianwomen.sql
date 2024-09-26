-- Listar o nome completo (primeiro nome + último nome), a idade e a cidade de todos os passageiros do sexo feminino (sex='w') com mais de 40 anos, residentes no país 'BRAZIL'. [resposta sugerida = 141 linhas]

SELECT
    p.firstname || ' ' || p.lastname AS fullname
    ,TRUNC(
        MONTHS_BETWEEN(SYSDATE, pd.birthdate) / 12,0
    ) AS age
    ,pd.city
FROM
    AIR_PASSENGERS p
        JOIN AIR_PASSENGERS_DETAILS pd
            ON p.passenger_id = pd.passenger_id
WHERE
    pd.sex = 'w'
    AND pd.birthdate <= ADD_MONTHS(SYSDATE, -40 * 12)
    AND pd.country = 'BRAZIL'
;
