SELECT 
    AREA.name AS area_name,
    EVENT.name AS event_name,
    ARTIST.name AS artist_name,
    EVENT.begin_date_year AS event_year
FROM OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.area.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS AREA
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.event.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS EVENT
    ON AREA.id = EVENT.area_id
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS ARTIST
    ON EVENT.artist_id = ARTIST.id;
