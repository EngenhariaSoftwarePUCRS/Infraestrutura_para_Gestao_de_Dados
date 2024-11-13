SELECT DISTINCT
    'INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES (' ||
    '''' || TRIM(lastname) || ''', ' ||
    passenger_id || ', ' ||
    '''' || TRIM(firstname) || ''');'
FROM
    ACAMPOS.AIR_PASSENGERS
;

SELECT DISTINCT
    'INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (' ||
    passenger.passenger_id || ', ' ||
    '''' || TRIM(passengerDetails.sex) || ''', ' ||
    '''' || TRIM(passengerDetails.country) || ''', ' ||
    '''' || TRIM(booking.seat) || ''');'
FROM
    ACAMPOS.AIR_PASSENGERS passenger
        JOIN ACAMPOS.AIR_PASSENGERS_DETAILS passengerDetails
            ON passenger.passenger_id = passengerDetails.passenger_id
        JOIN ACAMPOS.AIR_BOOKINGS booking
            ON passenger.passenger_id = booking.passenger_id
;

/*Q5
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Tolkan', 236, 'James');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Troell', 257, 'Jan');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Bancroft', 273, 'Anne');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Davis', 328, 'Skeeter');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Pilote', 341, 'Pierre');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Schmidt', 351, 'Joe');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Legrand', 359, 'Michel');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Mandan', 360, 'Robert');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Wyler', 368, 'Gretchen');
INSERT INTO passageiros.passageiros_por_sobrenome (lastname, passenger_id, firstname) VALUES ('Blasingame', 371, 'Don');
*/

/*Q6
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (33609, 'w', 'MYANMAR', '5G');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (4418, 'm', 'ARGENTINA', '3F');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (27683, 'm', 'BRAZIL', '1A');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (2388, 'm', 'UNITED STATES', '15B');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (35750, 'm', 'UNITED STATES', '10F');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (11860, 'm', 'GHANA', '8B');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (7434, 'm', 'CANADA', '8F');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (29814, 'm', 'AUSTRALIA', '18F');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (22330, 'm', 'UNITED STATES', '18B');
INSERT INTO passageiros.detalhes_passageiros_por_id (passenger_id, sex, country, seat_no) VALUES (1978, 'm', 'ITALY', '17E');
*/
