-- Listar o nome da companhia aerea, o identificador da aeronave, o nome do tipo de aeronave e o número de todos os voos operados por essa companhia aérea (independentemente de a aeronave ser de sua propriedade) que saem E chegam em aeroportos localizados no país 'BRAZIL'. [resposta sugerida = 8 linhas]

SELECT
    airlines.airline_name
    ,planes.airplane_id
    ,types.name AS airplane_type
    ,flights.flightno
FROM
    AIR_AIRLINES airlines
        JOIN AIR_AIRPLANES planes
            ON airlines.airline_id = planes.airline_id
        JOIN AIR_AIRPLANE_TYPES types
            ON planes.airplane_type_id = types.airplane_type_id
        JOIN AIR_FLIGHTS flights
            ON planes.airplane_id = flights.airplane_id
        JOIN AIR_AIRPORTS airports_from
            ON flights.from_airport_id = airports_from.airport_id
        JOIN AIR_AIRPORTS airports_to
            ON flights.to_airport_id = airports_to.airport_id
        JOIN AIR_AIRPORTS_GEO airports_geo_from
            ON airports_from.airport_id = airports_geo_from.airport_id
        JOIN AIR_AIRPORTS_GEO airports_geo_to
            ON airports_to.airport_id = airports_geo_to.airport_id
WHERE
    airports_geo_from.country = 'BRAZIL'
    AND airports_geo_to.country = 'BRAZIL'
;
