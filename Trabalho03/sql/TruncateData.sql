DELETE FROM l_artist_instrument;

DELETE FROM l_artist_genre;

DELETE FROM l_artist_event;

DELETE FROM link;

DELETE FROM link_type;

DELETE FROM instrument;

DELETE FROM event;

DELETE FROM artist
WHERE (
    comment LIKE '%"%'
    OR name LIKE '%"%'
    OR sort_name LIKE '%"%'
);

DELETE FROM area;

DELETE FROM genre;

DELETE FROM gender;

DELETE FROM instrument_type;

DELETE FROM event_type;

DELETE FROM artist_type;

DELETE FROM area_type;
