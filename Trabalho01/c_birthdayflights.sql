-- Listar o numero do voo, o nome do aeroporto de saida e o nome do aeroporto de destino, o nome completo (primeiro e ultimo nome) e o assento de cada passageiro, para todos os voos que partem no dia do seu aniversario (do seu mesmo, caro aluno, e nao o do passageiro) neste ano (caso a consulta nao retorne nenhuma linha, faca para o dia subsequente ate encontrar uma data que retorne alguma linha). [resposta sugerida = 106 linhas para o dia 25/03/2024]

SELECT
    f.flightno AS flight_number
    ,afrom.name AS departure_airport
    ,ato.name AS arrival_airport
    ,p.firstname || ' ' || p.lastname AS fullname
    ,b.seat
    ,f.departure
    --DISTINCT(TRUNC(f.departure))
FROM
    AIR_FLIGHTS f
        JOIN AIR_AIRPORTS afrom
            ON f.from_airport_id = afrom.airport_id
        JOIN AIR_AIRPORTS ato
            ON f.to_airport_id = ato.airport_id
        JOIN AIR_BOOKINGS b
            ON f.flight_id = b.flight_id
        JOIN AIR_PASSENGERS p
            ON b.passenger_id = p.passenger_id
WHERE
    /*EXTRACT(YEAR FROM f.departure) = 2024
    AND EXTRACT(MONTH FROM f.departure) = 4*/
    TRUNC(f.departure) = TO_DATE('2024-04-04', 'YYYY-MM-DD')
    --TRUNC(f.departure) = TO_DATE('2024-04-02', 'YYYY-MM-DD')
    --TRUNC(f.departure) = TO_DATE('2021-07-08', 'YYYY-MM-DD')
    --TRUNC(f.departure) = TO_DATE('2024-03-25', 'YYYY-MM-DD')
ORDER BY
    f.departure
    ,TO_NUMBER(REGEXP_SUBSTR(b.seat, '^[0-9]+'))
;
