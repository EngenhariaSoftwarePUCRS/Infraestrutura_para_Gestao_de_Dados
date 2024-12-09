--\set ON_ERROR_STOP 1

ALTER TABLE area ADD CONSTRAINT area_pkey PRIMARY KEY (id);
ALTER TABLE area_type ADD CONSTRAINT area_type_pkey PRIMARY KEY (id);
ALTER TABLE artist ADD CONSTRAINT artist_pkey PRIMARY KEY (id);
ALTER TABLE artist_type ADD CONSTRAINT artist_type_pkey PRIMARY KEY (id);
ALTER TABLE event_type ADD CONSTRAINT event_type_pkey PRIMARY KEY (id);
ALTER TABLE gender ADD CONSTRAINT gender_pkey PRIMARY KEY (id);
ALTER TABLE genre ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
ALTER TABLE instrument ADD CONSTRAINT instrument_pkey PRIMARY KEY (id);
ALTER TABLE instrument_type ADD CONSTRAINT instrument_type_pkey PRIMARY KEY (id);
