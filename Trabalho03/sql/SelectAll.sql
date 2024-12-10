SELECT * FROM area_type;

SELECT * FROM artist_type;

SELECT * FROM event_type;

SELECT * FROM instrument_type;

SELECT * FROM gender;

SELECT * FROM genre LIMIT 10;

SELECT * FROM area LIMIT 10;

SELECT * FROM artist LIMIT 10;

SELECT * FROM artist
WHERE (
    comment LIKE '%"%'
    OR name LIKE '%"%'
    OR sort_name LIKE '%"%'
);

SELECT * FROM event LIMIT 10;

SELECT * FROM instrument LIMIT 10;

SELECT * FROM link_type LIMIT 10;

SELECT * FROM link LIMIT 10;

SELECT * FROM l_artist_event LIMIT 10;

SELECT * FROM l_artist_genre LIMIT 10;

SELECT * FROM l_artist_instrument LIMIT 10;

SELECT COUNT(*) FROM area_type;
SELECT COUNT(*) FROM artist_type;
SELECT COUNT(*) FROM event_type;
SELECT COUNT(*) FROM instrument_type;
SELECT COUNT(*) FROM gender;
SELECT COUNT(*) FROM genre;
SELECT COUNT(*) FROM area;
SELECT COUNT(*) FROM artist;
SELECT COUNT(*) FROM event;
SELECT COUNT(*) FROM instrument;
SELECT COUNT(*) FROM link_type;
SELECT COUNT(*) FROM link;
SELECT COUNT(*) FROM l_artist_event;
SELECT COUNT(*) FROM l_artist_genre;
SELECT COUNT(*) FROM l_artist_instrument;
