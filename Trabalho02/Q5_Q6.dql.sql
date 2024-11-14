USE passageiros;

SELECT passenger_id, firstname, lastname
FROM passageiros_por_sobrenome
WHERE lastname = 'Schmidt';

SELECT sex, country, seat_no
FROM detalhes_passageiros_por_id
WHERE passenger_id = 4418;
