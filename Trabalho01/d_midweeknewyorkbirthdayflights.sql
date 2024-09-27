-- Listar o nome da companhia aerea bem como a data e a hora de saida de todos os voos que chegam para a cidade de 'NEW YORK' que partem às terças, quartas ou quintas-feiras, no mês do seu aniversário  (caso a consulta não retorne nenhuma linha, faça para o mês subsequente até encontrar um mês que retorne alguma linha). [resposta sugerida = 1 linha para o mês de março de 2024]

SELECT
    a.airline_name
    ,f.departure
FROM
    AIR_FLIGHTS f
        JOIN AIR_AIRLINES a
            ON f.airline_id = a.airline_id
        JOIN AIR_AIRPORTS ap
            ON f.to_airport_id = ap.airport_id
        JOIN AIR_AIRPORTS_GEO apg
            ON ap.airport_id = apg.airport_id
WHERE
    TO_CHAR(f.departure, 'DY') IN ('TUE', 'WED', 'THU')
    AND apg.CITY LIKE 'NEW YORK%'
    AND EXTRACT(MONTH FROM f.arrival) = 5
;
