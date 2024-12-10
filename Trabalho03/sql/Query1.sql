SELECT 
    ARTIST.name AS artist_name,
    GENRE.name AS genre_name,
    BILLBOARD.songs.value.name AS song_name,
    BILLBOARD.songs.value.weeksOnBoard.value.rank AS song_rank
FROM OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.artist.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS ARTIST
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.genre.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ',', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS GENRE
    ON ARTIST.genre_id = GENRE.id
INNER JOIN OPENROWSET(
	BULK 'https://infradbgrupol.dfs.core.windows.net/dados-grupol/public.billboard.txt',
    FORMAT = 'CSV', FIELDTERMINATOR = ';', FIELDQUOTE = '"', HEADER_ROW = TRUE, ROWTERMINATOR = '\n', PARSER_VERSION = '2.0'
) AS BILLBOARD
    ON ARTIST.name = BILLBOARD.name;
