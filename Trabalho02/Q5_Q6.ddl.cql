CREATE KEYSPACE IF NOT EXISTS passageiros
WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
}
AND DURABLE_WRITES = FALSE;
-- DROP KEYSPACE IF EXISTS passageiros;

USE passageiros;

CREATE TABLE passageiros_por_sobrenome (
    lastname TEXT,
    passenger_id INT,
    firstname TEXT,
    PRIMARY KEY (lastname, passenger_id)
);

CREATE TABLE detalhes_passageiros_por_id (
    passenger_id INT,
    sex TEXT,
    country TEXT,
    seat_no TEXT,
    PRIMARY KEY (passenger_id)
);
