/*
DELETE FROM l_artist_instrument;
DELETE FROM l_artist_genre;
DELETE FROM l_artist_event;
DELETE FROM link;
DELETE FROM link_type;
DELETE FROM event;
DELETE FROM area;
DELETE FROM genre;
DELETE FROM gender;
DELETE FROM instrument_type;
DELETE FROM event_type;
DELETE FROM artist_type;
DELETE FROM area_type;
*/

DELETE FROM area_type
WHERE 
    name LIKE '%"%' OR
    description LIKE '%"%';

DELETE FROM area
WHERE 
    name LIKE '%"%' OR
    comment LIKE '%"%';

DELETE FROM artist
WHERE 
    name LIKE '%"%' OR
    sort_name LIKE '%"%' OR
    comment LIKE '%"%';

DELETE FROM artist_type
WHERE 
    name LIKE '%"%' OR
    description LIKE '%"%';

DELETE FROM event
WHERE type IN (
    SELECT id
    FROM event_type
    WHERE 
        name LIKE '%"%' OR
        description LIKE '%"%'
);

DELETE FROM event_type
WHERE 
    name LIKE '%"%' OR
    description LIKE '%"%';

DELETE FROM event
WHERE 
    name LIKE '%"%' OR
    setlist LIKE '%"%' OR
    comment LIKE '%"%';

DELETE FROM gender
WHERE 
    name LIKE '%"%' OR
    description LIKE '%"%';

DELETE FROM genre
WHERE 
    name LIKE '%"%' OR
    comment LIKE '%"%';

DELETE FROM instrument_type
WHERE 
    name LIKE '%"%' OR
    description LIKE '%"%';

DELETE FROM instrument
WHERE 
    name LIKE '%"%' OR
    comment LIKE '%"%' OR
    description LIKE '%"%';

UPDATE link_type
SET parent = NULL
WHERE parent IN (
    SELECT id FROM link_type WHERE description LIKE '%/%'
);

-- Now delete from link where link_type is referenced
DELETE FROM link
WHERE link.link_type IN (
    SELECT id FROM link_type WHERE description LIKE '%/%'
);

-- Delete from link_type where description contains a slash
DELETE FROM link_type
WHERE description LIKE '%/%';

-- DELETE FROM link_type
-- WHERE 
--     entity_type0 LIKE '%"%' OR
--     entity_type1 LIKE '%"%' OR
--     name LIKE '%"%' OR
--     description LIKE '%"%' OR
--     link_phrase LIKE '%"%' OR
--     reverse_link_phrase LIKE '%"%' OR
--     long_link_phrase LIKE '%"%';

DELETE FROM l_artist_event
WHERE 
    entity0_credit LIKE '%"%' OR
    entity1_credit LIKE '%"%';

DELETE FROM l_artist_genre
WHERE 
    entity0_credit LIKE '%"%' OR
    entity1_credit LIKE '%"%';

DELETE FROM l_artist_instrument
WHERE 
    entity0_credit LIKE '%"%' OR
    entity1_credit LIKE '%"%';

/*
DROP TABLE public.l_artist_instrument;
DROP TABLE public.l_artist_genre;
DROP TABLE public.l_artist_event;
DROP TABLE public.link;
DROP TABLE public.link_type;
DROP TABLE public.instrument;
DROP TABLE public.event;
DROP TABLE public.artist;
DROP TABLE public.area;
DROP TABLE public.genre;
DROP TABLE public.gender;
DROP TABLE public.instrument_type;
DROP TABLE public.event_type;
DROP TABLE public.artist_type;
DROP TABLE public.area_type;
*/