SELECT DISTINCT
    'INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (' ||
    airplane.capacity || ', ' ||
    airplane.airplane_id || ', ' ||
    '''' || TRIM(airplane_type.name) || ''');'
FROM
    ACAMPOS.AIR_AIRPLANES airplane
        JOIN ACAMPOS.AIR_AIRPLANE_TYPES airplane_type
            ON airplane.airplane_type_id = airplane_type.airplane_type_id
;

SELECT DISTINCT
    'INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (' ||
    airplane.airplaneId || ', ' ||
    '''' || 
        (CASE WHEN schedule.monday THEN 'Monday ' ELSE '' END ||
         CASE WHEN schedule.tuesday THEN 'Tuesday ' ELSE '' END ||
         CASE WHEN schedule.wednesday THEN 'Wednesday ' ELSE '' END ||
         CASE WHEN schedule.thursday THEN 'Thursday ' ELSE '' END ||
         CASE WHEN schedule.friday THEN 'Friday ' ELSE '' END ||
         CASE WHEN schedule.saturday THEN 'Saturday ' ELSE '' END ||
         CASE WHEN schedule.sunday THEN 'Sunday ' ELSE '' END) ||
    ''', ' ||
    '''' || TRIM(flight.flight_id) || ''', ' ||
    '''' || TO_CHAR(flight.departure, 'hh24:mi:ss') || ''', ' ||
    '''' || TO_CHAR(flight.arrival, 'hh24:mi:ss') || ''');'
FROM
    ACAMPOS.AIR_FLIGHTS flight
        JOIN ACAMPOS.AIR_AIRPLANES airplane
            ON flight.airplane_id = airplane.airplane_id
        JOIN ACAMPOS.AIR_FLIGHTS_SCHEDULES schedule
            ON flight.flight_id = schedule.flightno
;
