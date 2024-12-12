/* Maior ranking de cada música da Billboard */
SELECT 
    ARTIST.name AS artist_name,
    BILLBOARD.songs AS song_name,
    MAX(BILLBOARD.rank) AS max_rank
FROM OPENROWSET(
BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) WITH (
    [name] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8
) AS ARTIST
INNER JOIN OPENROWSET(
BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.billboard.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ';', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) WITH (
    [name] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
    [songs] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
    [rank] INTEGER
) AS BILLBOARD
    ON ARTIST.name = BILLBOARD.name
GROUP BY ARTIST.name, BILLBOARD.songs;