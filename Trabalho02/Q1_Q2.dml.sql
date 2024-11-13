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

/*Q1
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Angola Airlines', 4, 'AN');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Denmark Airlines', 23, 'DE');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Equatorial Guinea Ai', 29, 'EQ');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Gabon Airlines', 36, 'GA');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Georgia Airlines', 37, 'GE');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Iran Airlines', 47, 'IR');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Jerusalem Airlines', 52, 'JE');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Kyrgyzstan Airlines', 59, 'KY');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Moldova Airlines', 67, 'MO');
INSERT INTO companias_aereas.compania_aerea_por_nome (airline_name, airline_id, iata) VALUES ('Western Samoa Airlin', 109, 'WE');
*/
