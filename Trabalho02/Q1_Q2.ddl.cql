CREATE KEYSPACE IF NOT EXISTS companias_aereas 
  WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
  }
AND DURABLE_WRITES = FALSE;
-- DROP KEYSPACE IF EXISTS companias_aereas;

USE companias_aereas;

CREATE TABLE compania_aerea_por_nome (
    airline_name TEXT,
    airline_id INT,
    iata TEXT,
    PRIMARY KEY (airline_name)
);

CREATE TABLE compania_aerea_por_iata (
    iata TEXT,
    airport_name TEXT,
    city TEXT,
    PRIMARY KEY (iata)
);
