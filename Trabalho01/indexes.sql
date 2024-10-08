/*
Quando criar um indice:
Se coluna aparece com frequencia em WHERE ou JOIN ou e SELETIVA (filtra muitos dados)

SELECT COUNT(DISTINCT coluna) / COUNT(*) FROM tabela;
Se resultado for muito proximo de 1, nao e seletiva, ou seja, nao vale a pena criar indice
*/

-- Create indexes for the AIR_PASSENGERS_DETAILS table
-- SELECT COUNT(DISTINCT sex) / COUNT(*) FROM AIR_PASSENGERS_DETAILS;
CREATE INDEX idx_air_p_details_sex
    ON AIR_PASSENGERS_DETAILS(sex);

-- SELECT COUNT(DISTINCT birthdate) / COUNT(*) FROM AIR_PASSENGERS_DETAILS;
CREATE INDEX idx_air_p_details_birthdate
    ON AIR_PASSENGERS_DETAILS(birthdate);

-- SELECT COUNT(DISTINCT country) / COUNT(*) FROM AIR_PASSENGERS_DETAILS;
CREATE INDEX idx_air_p_details_country
    ON AIR_PASSENGERS_DETAILS(country);

-- Create indexes for the AIR_AIRPORTS_GEO table
-- SELECT COUNT(DISTINCT country) / COUNT(*) FROM AIR_AIRPORTS_GEO;
CREATE INDEX idx_air_airports_geo_country
    ON AIR_AIRPORTS_GEO(country);

-- SELECT COUNT(DISTINCT city) / COUNT(*) FROM AIR_AIRPORTS_GEO;
/*CREATE INDEX idx_air_airports_geo_city
    ON AIR_AIRPORTS_GEO(city);*/

-- Create indexes for the AIR_FLIGHTS table
-- SELECT COUNT(DISTINCT departure) / COUNT(*) FROM AIR_FLIGHTS;
/*CREATE INDEX idx_air_flights_departure
    ON AIR_FLIGHTS(departure);*/

-- SELECT COUNT(DISTINCT TRUNC(departure)) / COUNT(*) FROM AIR_FLIGHTS;
CREATE INDEX idx_air_f_departure_trunc
    ON AIR_FLIGHTS(TRUNC(departure));

-- SELECT COUNT(DISTINCT TO_CHAR(departure, 'DY')) / COUNT(*) FROM AIR_FLIGHTS;
CREATE INDEX idx_air_f_departure_char
    ON AIR_FLIGHTS(TO_CHAR(departure, 'DY'));

-- SELECT COUNT(DISTINCT EXTRACT(MONTH FROM arrival)) / COUNT(*) FROM AIR_FLIGHTS;
CREATE INDEX idx_air_f_arrival_month
    ON AIR_FLIGHTS(EXTRACT(MONTH FROM arrival));

-- SELECT COUNT(DISTINCT flightno) / COUNT(*) FROM AIR_FLIGHTS;
/*CREATE INDEX idx_air_f_flightno
    ON AIR_FLIGHTS(flightno);*/

-- SELECT COUNT(DISTINCT airline_id) / COUNT(*) FROM AIR_FLIGHTS;
CREATE INDEX idx_air_f_airline_id
    ON AIR_FLIGHTS(airline_id);

-- SELECT COUNT(DISTINCT from_airport_id) / COUNT(*) FROM AIR_FLIGHTS;
/*CREATE INDEX idx_air_f_from_airport_id
    ON AIR_FLIGHTS(from_airport_id);*/

-- SELECT COUNT(DISTINCT to_airport_id) / COUNT(*) FROM AIR_FLIGHTS;
/*CREATE INDEX idx_air_f_to_airport_id
    ON AIR_FLIGHTS(to_airport_id);*/

-- SELECT COUNT(DISTINCT airplane_id) / COUNT(*) FROM AIR_FLIGHTS;
/*CREATE INDEX idx_air_f_airplane_id
    ON AIR_FLIGHTS(airplane_id);*/

-- Create indexes for the AIR_BOOKINGS table
-- SELECT COUNT(DISTINCT TO_NUMBER(REGEXP_SUBSTR(seat, '^[0-9]+'))) / COUNT(*) FROM AIR_BOOKINGS;
CREATE INDEX idx_air_bookings_n_regex_seat
    ON AIR_BOOKINGS(TO_NUMBER(REGEXP_SUBSTR(seat, '^[0-9]+')));

-- SELECT COUNT(DISTINCT passenger_id) / COUNT(*) FROM AIR_BOOKINGS;
CREATE INDEX idx_air_bookings_passenger_id
    ON AIR_BOOKINGS(passenger_id);

-- SELECT COUNT(DISTINCT flight_id) / COUNT(*) FROM AIR_BOOKINGS;
CREATE INDEX idx_air_bookings_flight_id
    ON AIR_BOOKINGS(flight_id);

-- Create indexes for the AIR_AIRPLANES table
-- SELECT COUNT(DISTINCT airline_id) / COUNT(*) FROM AIR_AIRPLANES;
CREATE INDEX idx_air_airplanes_airline_id
    ON AIR_AIRPLANES(airline_id);

-- SELECT COUNT(DISTINCT airplane_type_id) / COUNT(*) FROM AIR_AIRPLANES;
CREATE INDEX idx_air_a_airplane_type_id
    ON AIR_AIRPLANES(airplane_type_id);

-- Create indexes for the AIR_FLIGHTS_SCHEDULES table
-- SELECT COUNT(DISTINCT airline_id) / COUNT(*) FROM AIR_FLIGHTS_SCHEDULES;
CREATE INDEX idx_air_f_s_airline_id
    ON AIR_FLIGHTS_SCHEDULES(airline_id);
