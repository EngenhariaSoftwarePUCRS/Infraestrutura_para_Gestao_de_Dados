SELECT DISTINCT
    'INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES (' ||
    '''' || TRIM(airline_name) || ''', ' ||
    airline_id || ', ' ||
    '''' || TRIM(iata) || ''');'
FROM
    ACAMPOS.AIR_AIRLINES
;

SELECT DISTINCT
    'INSERT INTO companias_aereas.compania_aerea_por_iata (iata, airport_name, city) VALUES (' ||
    '''' || TRIM(airline.iata) || ''', ' ||
    '''' || TRIM(airport.name) || ''', ' ||
    '''' || TRIM(airportGeo.city) || ''');'
FROM
    ACAMPOS.AIR_AIRLINES airline
        JOIN ACAMPOS.AIR_AIRPORTS airport
            ON airline.iata = airport.iata
        JOIN ACAMPOS.AIR_AIRPORTS_GEO airportGeo
            ON airport.airport_id = airportGeo.airport_id
;
