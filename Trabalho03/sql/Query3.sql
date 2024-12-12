/* Músicas na Billboard no ano de 2021 */
SELECT 
    ARTIST.name AS artist_name,
    BILLBOARD.rank AS rank,
    BILLBOARD.date AS rank_date
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
    [rank] INTEGER,
    [date] DATE
) AS BILLBOARD
    ON ARTIST.name = BILLBOARD.name
WHERE BILLBOARD.date BETWEEN '2021-01-01' AND '2021-12-31';