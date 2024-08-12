INSERT INTO ESPORTE (id, sigla, nome) VALUES (1, 'ATH', 'Atletismo');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (2, 'SWI', 'Natação');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (3, 'GYM', 'Ginástica Artística');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (4, 'BAS', 'Basquete');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (5, 'VOL', 'Vôlei');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (6, 'FOO', 'Futebol');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (7, 'TEN', 'Tênis');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (8, 'BOX', 'Boxe');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (9, 'CYL', 'Ciclismo');
INSERT INTO ESPORTE (id, sigla, nome) VALUES (10, 'ROW', 'Remo');
 
INSERT INTO PAIS (id, sigla, nome) VALUES (1, 'USA', 'Estados Unidos');
INSERT INTO PAIS (id, sigla, nome) VALUES (2, 'BRA', 'Brasil');
INSERT INTO PAIS (id, sigla, nome) VALUES (3, 'RUS', 'Rússia');
INSERT INTO PAIS (id, sigla, nome) VALUES (4, 'CHN', 'China');
INSERT INTO PAIS (id, sigla, nome) VALUES (5, 'GBR', 'Reino Unido');
INSERT INTO PAIS (id, sigla, nome) VALUES (6, 'JPN', 'Japão');
INSERT INTO PAIS (id, sigla, nome) VALUES (7, 'AUS', 'Austrália');
INSERT INTO PAIS (id, sigla, nome) VALUES (8, 'FRA', 'França');
INSERT INTO PAIS (id, sigla, nome) VALUES (9, 'GER', 'Alemanha');
INSERT INTO PAIS (id, sigla, nome) VALUES (10, 'CAN', 'Canadá');
 
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (1, 'Rebeca Andrade', 'F', TO_DATE('1999-05-08', 'YYYY-MM-DD'), 2);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (2, 'Simone Biles', 'F', TO_DATE('1997-03-14', 'YYYY-MM-DD'), 1);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (3, 'Flavia Saraiva', 'F', TO_DATE('1999-09-30', 'YYYY-MM-DD'), 2);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (4, 'Rafaela Silva', 'F', TO_DATE('1992-04-24', 'YYYY-MM-DD'), 2);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (5, 'Noah Lyles', 'M', TO_DATE('1997-07-18', 'YYYY-MM-DD'), 1);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (6, 'Kaylee McKeown', 'F', TO_DATE('2001-07-12', 'YYYY-MM-DD'), 7);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (7, 'Zhang Yufei', 'F', TO_DATE('1998-04-19', 'YYYY-MM-DD'), 4);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (8, 'Léon Marchand', 'M', TO_DATE('2002-05-17', 'YYYY-MM-DD'), 8);
 
INSERT INTO TIME (id, id_pais, descricao) VALUES (1, 2, 'Brasil Gymnastics Team');
INSERT INTO TIME (id, id_pais, descricao) VALUES (2, 1, 'USA Gymnastics Team');
INSERT INTO TIME (id, id_pais, descricao) VALUES (3, 1, 'USA Athletics Team');
INSERT INTO TIME (id, id_pais, descricao) VALUES (4, 7, 'Australia Swimming Team');
INSERT INTO TIME (id, id_pais, descricao) VALUES (5, 4, 'China Swimming Team');
INSERT INTO TIME (id, id_pais, descricao) VALUES (6, 8, 'France Swimming Team');
 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (1, 1, 1); -- Rebeca Andrade
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (1, 3, 2); -- Flavia Saraiva
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (2, 2, 3); -- Simone Biles
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (3, 5, 4); -- Noah Lyles
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (4, 6, 5); -- Kaylee McKeown
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (5, 7, 6); -- Zhang Yufei
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (6, 8, 7); -- Léon Marchand
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (1, 4, 8); -- Rafaela Silva
 
-- Eventos de Ginástica para Rebeca Andrade, Simone Biles, Flavia Saraiva
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (1, 'Women''s Artistic Gymnastics All-Around', 'F', 3);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (2, 'Women''s Artistic Gymnastics Vault', 'F', 3);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (3, 'Women''s Artistic Gymnastics Floor', 'F', 3);
 
-- Evento de Judô para Rafaela Silva
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (4, 'Women''s Judo 57kg', 'F', 9);
 
-- Eventos de Atletismo para Noah Lyles
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (5, 'Men''s 100m', 'M', 1);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (6, 'Men''s 200m', 'M', 1);
 
-- Eventos de Natação para Kaylee McKeown, Zhang Yufei, Léon Marchand
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (7, 'Women''s 100m Backstroke', 'F', 2);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (8, 'Women''s 200m Butterfly', 'F', 2);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (9, 'Men''s 400m Individual Medley', 'M', 2);
