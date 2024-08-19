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
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (9, 'Arthur Nory', 'M', TO_DATE('1993-09-18', 'YYYY-MM-DD'), 2);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (10, 'Thiago Braz', 'M', TO_DATE('1993-12-16', 'YYYY-MM-DD'), 2);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (11, 'Allyson Felix', 'F', TO_DATE('1985-11-18', 'YYYY-MM-DD'), 1);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (12, 'Caeleb Dressel', 'M', TO_DATE('1996-08-16', 'YYYY-MM-DD'), 1);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (13, 'Chen Long', 'M', TO_DATE('1989-01-18', 'YYYY-MM-DD'), 4);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (14, 'Liu Xiang', 'F', TO_DATE('1996-07-01', 'YYYY-MM-DD'), 4);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (15, 'Mack Horton', 'M', TO_DATE('1996-04-25', 'YYYY-MM-DD'), 7);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (16, 'Ariarne Titmus', 'F', TO_DATE('2000-09-07', 'YYYY-MM-DD'), 7);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (17, 'Florent Manaudou', 'M', TO_DATE('1990-11-12', 'YYYY-MM-DD'), 8);
INSERT INTO ATLETA (id, nome, genero, data_nascimento, id_pais) VALUES (18, 'Marie Wattel', 'F', TO_DATE('1997-06-22', 'YYYY-MM-DD'), 8);

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
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (1, 9, 5);  -- Arthur Nory 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (3, 10, 10); -- Thiago Braz 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (3, 11, 7); -- Allyson Felix 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (4, 12, 6); -- Caeleb Dressel
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (5, 13, 8); -- Chen Long 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (5, 14, 9); -- Liu Xiang 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (4, 15, 4); -- Mack Horton 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (4, 16, 2); -- Ariarne Titmus 
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (6, 17, 3); -- Florent Manaudou
INSERT INTO TIME_ATLETA (id_time, id_atleta, numero) VALUES (6, 18, 1); -- Marie Wattel

INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (1, 'Women''s Artistic Gymnastics All-Around', 'F', 3);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (2, 'Women''s Artistic Gymnastics Vault', 'F', 3);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (3, 'Women''s Artistic Gymnastics Floor', 'F', 3);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (4, 'Women''s Judo 57kg', 'F', 9);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (5, 'Men''s 100m', 'M', 1);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (6, 'Men''s 200m', 'M', 1);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (7, 'Women''s 100m Backstroke', 'F', 2);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (8, 'Women''s 200m Butterfly', 'F', 2);
INSERT INTO EVENTO (id, descricao, genero, id_esporte) VALUES (9, 'Men''s 400m Individual Medley', 'M', 2);

-- Rebeca Andrade (Ouro em Ginástica Artística - All-Around)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (1, 'O', 1, 1, 1);
-- Simone Biles (Ouro em Ginástica Artística - Vault)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (2, 'O', 2, 2, 2);
-- Flavia Saraiva (Bronze em Ginástica Artística - Floor)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (3, 'B', 3, 1, 3);
-- Rafaela Silva (Ouro em Judô - 57kg)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (4, 'O', 4, 1, 4);
-- Noah Lyles (Ouro em Atletismo - 200m)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (5, 'O', 6, 3, 5);
-- Kaylee McKeown (Ouro em Natação - 100m Costas)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (6, 'O', 7, 4, 6);
-- Zhang Yufei (Ouro em Natação - 200m Borboleta)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (7, 'O', 8, 5, 7);
-- Léon Marchand (Ouro em Natação - 400m Medley)
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (8, 'O', 9, 6, 8);
-- Arthur Nory - Bronze em Ginástica Artística - Floor
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (9, 'B', 3, 1, 9);
-- Thiago Braz - Prata em Atletismo - Salto com Vara
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (10, 'P', 6, 3, 10);
-- Allyson Felix - Prata em Atletismo - 400m
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (11, 'P', 6, 3, 11);
-- Caeleb Dressel - Bronze em Natação - 100m Livre
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (12, 'B', 7, 4, 12);
-- Chen Long - Bronze em Natação - 200m Borboleta
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (13, 'B', 8, 5, 13);
-- Liu Xiang - Prata em Natação - 100m Costas
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (14, 'P', 7, 5, 14);
-- Mack Horton - Prata em Natação - 400m Livre
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (15, 'P', 9, 4, 15);
-- Ariarne Titmus - Bronze em Natação - 200m Livre
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (16, 'B', 8, 4, 16);
-- Florent Manaudou - Prata em Natação - 50m Livre
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (17, 'P', 9, 6, 17);
-- Marie Wattel - Bronze em Natação - 100m Borboleta
INSERT INTO MEDALHA (id, metal, id_evento, id_time, id_atleta) VALUES (18, 'B', 8, 6, 18);
