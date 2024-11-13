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
