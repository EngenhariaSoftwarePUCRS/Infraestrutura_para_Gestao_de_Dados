USE avioes;

SELECT airplane_id, airplane_type
FROM avioes_por_capacidade
WHERE capacity = 335;

SELECT flight_no, departure, arrival
FROM avioes_por_id_e_dia
WHERE airplane_id = 409 AND day_of_week = 'Saturday Sunday';
