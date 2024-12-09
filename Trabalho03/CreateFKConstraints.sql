--\set ON_ERROR_STOP 1

ALTER TABLE area
   ADD CONSTRAINT area_fk_type
   FOREIGN KEY (type)
   REFERENCES area_type(id);

ALTER TABLE area_type
   ADD CONSTRAINT area_type_fk_parent
   FOREIGN KEY (parent)
   REFERENCES area_type(id);

ALTER TABLE artist
   ADD CONSTRAINT artist_fk_type
   FOREIGN KEY (type)
   REFERENCES artist_type(id);

ALTER TABLE artist
   ADD CONSTRAINT artist_fk_area
   FOREIGN KEY (area)
   REFERENCES area(id);

ALTER TABLE artist
   ADD CONSTRAINT artist_fk_gender
   FOREIGN KEY (gender)
   REFERENCES gender(id);

ALTER TABLE artist
   ADD CONSTRAINT artist_fk_begin_area
   FOREIGN KEY (begin_area)
   REFERENCES area(id);

ALTER TABLE artist
   ADD CONSTRAINT artist_fk_end_area
   FOREIGN KEY (end_area)
   REFERENCES area(id);

ALTER TABLE artist_type
   ADD CONSTRAINT artist_type_fk_parent
   FOREIGN KEY (parent)
   REFERENCES artist_type(id);

ALTER TABLE event
   ADD CONSTRAINT event_fk_type
   FOREIGN KEY (type)
   REFERENCES event_type(id);

ALTER TABLE event_type
   ADD CONSTRAINT event_type_fk_parent
   FOREIGN KEY (parent)
   REFERENCES event_type(id);

ALTER TABLE gender
   ADD CONSTRAINT gender_fk_parent
   FOREIGN KEY (parent)
   REFERENCES gender(id);

ALTER TABLE instrument
   ADD CONSTRAINT instrument_fk_type
   FOREIGN KEY (type)
   REFERENCES instrument_type(id);

ALTER TABLE instrument_type
   ADD CONSTRAINT instrument_type_fk_parent
   FOREIGN KEY (parent)
   REFERENCES instrument_type(id);
