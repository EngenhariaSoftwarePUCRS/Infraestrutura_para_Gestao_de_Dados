USE companias_aereas;

SELECT *
FROM compania_aerea_por_nome
WHERE airline_name = 'Jerusalem Airlines';

SELECT airport_name, city
FROM compania_aerea_por_iata
WHERE iata = 'JE';
