--\set ON_ERROR_STOP 1
BEGIN;

ALTER TABLE area          ADD CHECK (controlled_for_whitespace(comment));
ALTER TABLE artist        ADD CHECK (controlled_for_whitespace(comment));
ALTER TABLE event         ADD CHECK (controlled_for_whitespace(comment));
ALTER TABLE instrument    ADD CHECK (controlled_for_whitespace(comment));

ALTER TABLE area
  ADD CONSTRAINT control_for_whitespace CHECK (controlled_for_whitespace(name)),
  ADD CONSTRAINT only_non_empty CHECK (name != '');

ALTER TABLE artist
  ADD CONSTRAINT control_for_whitespace CHECK (controlled_for_whitespace(name)),
  ADD CONSTRAINT only_non_empty CHECK (name != ''),
  ADD CONSTRAINT control_for_whitespace_sort_name CHECK (controlled_for_whitespace(sort_name)),
  ADD CONSTRAINT only_non_empty_sort_name CHECK (sort_name != '');

ALTER TABLE event
  ADD CONSTRAINT control_for_whitespace CHECK (controlled_for_whitespace(name));

ALTER TABLE instrument
  ADD CONSTRAINT control_for_whitespace CHECK (controlled_for_whitespace(name)),
  ADD CONSTRAINT only_non_empty CHECK (name != '');

ALTER TABLE artist
ADD CONSTRAINT group_type_implies_null_gender CHECK (
  (gender IS NULL AND type IN (2, 5, 6))
  OR type NOT IN (2, 5, 6)
  OR type IS NULL
);

ALTER TABLE artist ADD CONSTRAINT artist_va_check
    CHECK (id <> 1 OR
           (type = 3 AND
            gender IS NULL AND
            area IS NULL AND
            begin_area IS NULL AND
            end_area IS NULL AND
            begin_date_year IS NULL AND
            begin_date_month IS NULL AND
            begin_date_day IS NULL AND
            end_date_year IS NULL AND
            end_date_month IS NULL AND
            end_date_day IS NULL));

COMMIT;
