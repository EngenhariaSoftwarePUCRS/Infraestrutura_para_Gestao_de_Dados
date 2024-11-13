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

/*Q3
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (335, 388, 'Boeing 747');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (200, 406, 'Boeing 767');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (115, 407, 'Douglas DC-9');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (114, 415, 'Boeing 737');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (50, 423, 'Embraer-ERJ-145-Familie');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (380, 454, 'McDonnell Douglas DC-10');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (50, 455, 'Embraer-ERJ-145-Familie');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (335, 463, 'Boeing 747');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (78, 475, 'Bombardier Q Series');
INSERT INTO avioes.avioes_por_capacidade (capacity, airplane_id, airplane_type) VALUES (50, 493, 'Embraer-ERJ-145-Familie');
*/

/*Q4
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (399, 'Tuesday Thursday Saturday ', '639764', '2023-07-08 20:38:15', '2023-05-19 12:52:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (401, 'Monday Tuesday Thursday Friday Saturday ', '385752', '2024-03-28 18:12:05', '2022-11-19 11:41:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (405, 'Tuesday Wednesday Thursday Sunday ', '639727', '2023-04-10 08:58:43', '2023-12-18 15:40:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (409, 'Tuesday Thursday Saturday ', '639739', '2023-05-18 11:25:01', '2023-05-18 13:31:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (409, 'Saturday Sunday ', '639739', '2023-05-18 11:25:01', '2023-05-18 13:31:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (409, 'Monday Tuesday Wednesday Sunday ', '639739', '2023-05-18 11:25:01', '2023-05-18 13:31:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (409, 'Monday Tuesday Wednesday Sunday ', '639726', '2020-12-02 06:27:44', '2023-05-19 00:45:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (409, 'Monday Wednesday Thursday Friday Saturday ', '639726', '2020-12-02 06:27:44', '2023-05-19 00:45:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (410, 'Monday Tuesday Wednesday Thursday ', '639772', '2023-08-29 18:49:50', '2023-01-19 10:32:00');
INSERT INTO avioes.voos_por_aviao_id_e_dia (airplane_id, day_of_week, flight_no, departure, arrival) VALUES (410, 'Tuesday Friday Saturday ', '385751', '2021-10-30 20:01:55', '2023-05-19 13:28:00');
*/
