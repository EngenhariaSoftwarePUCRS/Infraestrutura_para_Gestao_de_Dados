-- area_type
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.area_type.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS area_type;

-- area
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.area.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS area;

-- artist
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS artist;

-- artist_type
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist_type.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS artist_type;

-- event_type
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.event_type.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS event_type;

-- event
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.event.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS event;

-- gender
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.gender.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS gender;

-- genre
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.genre.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS genre;

-- instrument_type
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.instrument_type.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS instrument_type;

-- instrument
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.instrument.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS instrument;

-- link_type
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.link_type.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS link_type
WHERE description NOT LIKE '%/%';

-- link
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.link.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS link;

-- l_artist_event
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.l_artist_event.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS l_artist_event;

-- l_artist_genre
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.l_artist_genre.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS l_artist_genre;

-- l_artist_instrument
SELECT COUNT(*)
FROM OPENROWSET(
    BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.l_artist_instrument.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS l_artist_instrument;