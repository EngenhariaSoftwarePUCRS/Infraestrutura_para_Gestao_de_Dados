COPY area_type
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/area_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY area
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/area'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY artist
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/artist'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY artist_type
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/artist_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY event_type
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/event_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY event
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/event'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY gender
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/gender'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY genre
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/genre'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY instrument_type
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/instrument_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY instrument
    FROM 'E:/Infraestrutura_para_Gestao_de_Dados/Trabalho03/mbdump/mbdump/instrument'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);