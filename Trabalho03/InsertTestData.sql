SET client_min_messages TO 'WARNING';

/*INSERT INTO area (id, gid, name, type) VALUES
  (221, '8a754a16-0027-3a29-b6d7-2b40ea0481ed', 'United Kingdom', 1),
  (222, '489ce91b-6658-3307-9877-795b68554c98', 'United States', 1);*/

-- MusicBrainz System Entities
INSERT INTO artist (id, gid, name, sort_name, type) VALUES
    (1, '89ad4ac3-39f7-470e-963a-56509c546377', 'Various Artists', 'Various Artists', 3),
    (2, 'c06aa285-520e-40c0-b776-83d2c9e8a6d1', 'Deleted Artist', 'Deleted Artist', 3);

INSERT INTO artist (area, begin_area, begin_date_day, begin_date_month, begin_date_year, comment, edits_pending, end_area, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type) VALUES
    (222, NULL, NULL, NULL, 1983, '', 0, NULL, NULL, NULL, NULL, '0', 1, 'fa263cb3-205f-4a7f-91e1-94e3df52abe8', 196418, '2011-08-18 11:37:18.247651-05', 'Jimmy Edgar', 'Edgar, Jimmy', 1),
    (221, NULL, NULL, NULL, NULL, 'UK electronic artist', 0, NULL, NULL, NULL, NULL, '0', 1, 'e4787c4e-0b1a-48bd-b9a0-b0427391d293', 514734, '2014-06-06 12:43:54.273108-05', 'patten', 'patten', 1);

-- Test Artist
INSERT INTO artist
    (id, gid, name, sort_name, type, gender, area,
     begin_area, end_area,
     begin_date_year, begin_date_month, begin_date_day,
     end_date_year, end_date_month, end_date_day, comment)
    VALUES
    (3, '745c079d-374e-4436-9448-da92dedef3ce', 'Test Artist', 'Artist, Test', 1, 1, 221, 221, 221,
     2008, 01, 02, 2009, 03, 04, 'Yet Another Test Artist');

INSERT INTO artist (id, gid, name, sort_name) VALUES
    (4, '945c079d-374e-4436-9448-da92dedef3cf', 'Queen', 'Queen'),
    (5, '5441c29d-3602-4898-b1a1-b77fa23b8e50', 'David Bowie', 'David Bowie');

-- Test artist name triggers
INSERT INTO artist (id, gid, name, sort_name) VALUES (100, '24c94140-456b-11de-8a39-0800200c9a66', 'Shared Name', 'Shared Name');
INSERT INTO artist (id, gid, name, sort_name) VALUES (101, '374d65d0-456b-11de-8a39-0800200c9a66', 'Name', 'Sort Name');

INSERT INTO artist (id, gid, name, sort_name) VALUES (6, 'a45c079d-374e-4436-9448-da92dedef3cf', 'ABBA', 'ABBA');

INSERT INTO artist (id, gid, name, sort_name, begin_date_year, begin_date_month, begin_date_day, type)
    VALUES (7, '4b585938-f271-45e2-b19a-91c634b5e396', 'Kate Bush', 'Bush, Kate', 1958, 7, 30, 1);

INSERT INTO artist (id, gid, name, sort_name)
    VALUES
    (8, 'e2a083a9-9942-4d6e-b4d2-8397320b95f7', 'Test Alias', 'Kate Bush');
INSERT INTO artist (id, gid, name, sort_name, comment) VALUES
    (9, '2fed031c-0e89-406e-b9f0-3d192637907a', 'Test Alias', 'Kate Bush', 'Second');

INSERT INTO event (id, gid, name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day, time, type, cancelled, setlist, comment, ended)
    VALUES (59357, 'ca1d24c1-1999-46fd-8a95-3d4108df5cb2', 'BBC Open Music Prom', 2022, 9, 1, 2022, 9, 1, '19:30:00', 1, 'f', NULL, '2022, Prom 60', 't');

SET client_min_messages TO 'NOTICE';