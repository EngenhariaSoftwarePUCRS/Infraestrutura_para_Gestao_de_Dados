SELECT DISTINCT
    'INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (' ||
    airplane.capacity || ', ' ||
    airplane.airplane_id || ', ' ||
    '''' || TRIM(airplaneType.name) || ''');'
FROM
    ACAMPOS.AIR_AIRPLANES airplane
        JOIN ACAMPOS.AIR_AIRPLANE_TYPES airplaneType
            ON airplane.airplane_type_id = airplaneType.airplane_type_id
;

SELECT DISTINCT
    'INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (' ||
    airplane.airplane_id || ', ' ||
    '''' || 
        (CASE WHEN schedule.monday = 1 THEN 'Monday ' ELSE '' END ||
         CASE WHEN schedule.tuesday = 1 THEN 'Tuesday ' ELSE '' END ||
         CASE WHEN schedule.wednesday = 1 THEN 'Wednesday ' ELSE '' END ||
         CASE WHEN schedule.thursday = 1 THEN 'Thursday ' ELSE '' END ||
         CASE WHEN schedule.friday = 1 THEN 'Friday ' ELSE '' END ||
         CASE WHEN schedule.saturday = 1 THEN 'Saturday ' ELSE '' END ||
         CASE WHEN schedule.sunday = 1 THEN 'Sunday ' ELSE '' END) ||
    ''', ' ||
    '''' || TRIM(flight.flight_id) || ''', ' ||
    '''' || TO_CHAR(flight.departure, 'YYYY-MM-DD HH24:MI:SS') || ''', ' ||
    '''' || TO_CHAR(flight.arrival, 'YYYY-MM-DD HH24:MI:SS') || ''');'
FROM
    ACAMPOS.AIR_FLIGHTS flight
        JOIN ACAMPOS.AIR_AIRPLANES airplane
            ON flight.airplane_id = airplane.airplane_id
        JOIN ACAMPOS.AIR_FLIGHTS_SCHEDULES schedule
            ON flight.airline_id = schedule.airline_id
;
