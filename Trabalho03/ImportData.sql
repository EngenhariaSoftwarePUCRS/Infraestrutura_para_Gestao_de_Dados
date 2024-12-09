COPY area_type
    FROM 'mbdump/mbdump/area_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY artist_type
    FROM 'mbdump/mbdump/artist_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY event_type
    FROM 'mbdump/mbdump/event_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY instrument_type
    FROM 'mbdump/mbdump/instrument_type'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY gender
    FROM 'mbdump/mbdump/gender'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY genre
    FROM 'mbdump/mbdump/genre'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY area
    FROM 'mbdump/mbdump/area'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY artist
    FROM 'mbdump/mbdump/artist'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY event
    FROM 'mbdump/mbdump/event'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);

COPY instrument
    FROM 'mbdump/mbdump/instrument'
    WITH (FORMAT csv, DELIMITER E'\t', NULL '', HEADER false);
