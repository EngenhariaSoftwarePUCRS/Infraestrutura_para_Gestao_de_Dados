--\set ON_ERROR_STOP 1
BEGIN;

CREATE UNIQUE INDEX area_type_idx_gid ON area_type (gid);

CREATE UNIQUE INDEX area_idx_gid ON area (gid);
CREATE INDEX area_idx_name ON area (name);

CREATE UNIQUE INDEX artist_idx_gid ON artist (gid);
CREATE INDEX artist_idx_name ON artist (name);
CREATE INDEX artist_idx_sort_name ON artist (sort_name);
CREATE INDEX artist_idx_area ON artist (area);
CREATE INDEX artist_idx_begin_area ON artist (begin_area);
CREATE INDEX artist_idx_end_area ON artist (end_area);

CREATE UNIQUE INDEX artist_idx_null_comment ON artist (name) WHERE comment IS NULL;
CREATE UNIQUE INDEX artist_idx_uniq_name_comment ON artist (name, comment) WHERE comment IS NOT NULL;

CREATE UNIQUE INDEX artist_type_idx_gid ON artist_type (gid);

CREATE UNIQUE INDEX event_type_idx_gid ON event_type (gid);

CREATE UNIQUE INDEX gender_idx_gid ON gender (gid);

CREATE UNIQUE INDEX genre_idx_gid ON genre (gid);
CREATE UNIQUE INDEX genre_idx_name ON genre (LOWER(name));

CREATE UNIQUE INDEX instrument_type_idx_gid ON instrument_type (gid);

CREATE UNIQUE INDEX event_idx_gid ON event (gid);
CREATE INDEX event_idx_name ON event (name);

CREATE UNIQUE INDEX instrument_idx_gid ON instrument (gid);
CREATE INDEX instrument_idx_name ON instrument (name);

CREATE UNIQUE INDEX link_type_idx_gid ON link_type (gid);

CREATE INDEX link_idx_type_attr ON link (link_type, attribute_count);

CREATE UNIQUE INDEX l_artist_event_idx_uniq ON l_artist_event (entity0, entity1, link, link_order);
CREATE UNIQUE INDEX l_artist_genre_idx_uniq ON l_artist_genre (entity0, entity1, link, link_order);
CREATE UNIQUE INDEX l_artist_instrument_idx_uniq ON l_artist_instrument (entity0, entity1, link, link_order);

CREATE INDEX l_artist_event_idx_entity1 ON l_artist_event (entity1);
CREATE INDEX l_artist_genre_idx_entity1 ON l_artist_genre (entity1);
CREATE INDEX l_artist_instrument_idx_entity1 ON l_artist_instrument (entity1);

COMMIT;

-- vi: set ts=4 sw=4 et :