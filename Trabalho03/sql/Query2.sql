/* Artistas americanos com músicas na Billboard */
SELECT 
    ARTIST.name
FROM OPENROWSET(
BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.area.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) WITH (
    [name] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
    [id] INTEGER
) AS AREA
INNER JOIN OPENROWSET(
BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) WITH (
    [name] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
    [area] INTEGER
) AS ARTIST
    ON AREA.id = ARTIST.area
INNER JOIN OPENROWSET(
BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.billboard.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ';', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) WITH (
    [name] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8
) AS BILLBOARD
    ON ARTIST.name = BILLBOARD.name
WHERE AREA.name = 'United States';