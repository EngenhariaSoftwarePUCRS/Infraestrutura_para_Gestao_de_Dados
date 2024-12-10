SELECT 
    ARTIST.name AS artist_name,
    INSTRUMENT.name AS instrument_name,
    BILLBOARD.songs.value.name AS song_name,
    BILLBOARD.songs.value.weeksOnBoard.value.rank AS rank,
    BILLBOARD.songs.value.weeksOnBoard.value.date AS rank_date
FROM OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS ARTIST
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.instrument.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS INSTRUMENT
	ON ARTIST.instrument_id = INSTRUMENT.id
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.billboard.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ';', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS BILLBOARD
    ON ARTIST.name = BILLBOARD.name;
