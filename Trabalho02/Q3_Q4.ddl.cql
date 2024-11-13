CREATE KEYSPACE IF NOT EXISTS avioes
WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
}
AND DURABLE_WRITES = FALSE;
-- DROP KEYSPACE IF EXISTS avioes;

USE avioes;

CREATE TABLE avioes_por_capacidade (
    capacity INT,
    airplane_id INT,
    airplane_type TEXT,
    PRIMARY KEY (capacity, airplane_id),
);

CREATE TABLE voos_por_aviao_id_e_dia (
    airplane_id INT,
    day_of_week TEXT,
    flight_no TEXT,
    departure TIME,
    arrival TIME,
    PRIMARY KEY (airplane_id, (day_of_week, flight_no))
);
