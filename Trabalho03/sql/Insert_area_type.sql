INSERT INTO area_type (id, name, parent, child_order, description, gid) VALUES
('1', 'Country', NULL, '1', 'Country is used for areas included (or previously included) in ISO 3166-1, e.g. United States.', '06dd0ae4-8c74-30bb-b43d-95dcedf961de'),
('2', 'Subdivision', NULL, '2', 'Subdivision is used for the main administrative divisions of a country, e.g. California, Ontario, Okinawa. These are considered when displaying the parent areas for a given area.', 'fd3d44c5-80a1-3842-9745-2c4972d35afa'),
('7', 'County', NULL, '7', 'County is used for smaller administrative divisions of a country which are not the main administrative divisions but are also not municipalities, e.g. counties in the USA. These are not considered when displaying the parent areas for a given area.', 'bcecec27-8bdb-3e00-8254-d948dda502fa'),
('4', 'Municipality', NULL, '4', 'Municipality is used for small administrative divisions which, for urban municipalities, often contain a single city and a few surrounding villages. Rural municipalities typically group several villages together.', '17246454-5ac4-36a1-b81a-4753eb2dab20'),
('3', 'City', NULL, '3', 'City is used for settlements of any size, including towns and villages.', '6fd8f29a-3d0a-32fc-980d-ea697b69da78'),
('5', 'District', NULL, '5', 'District is used for a division of a large city, e.g. Queens.', '84039871-5e47-38ca-a66a-45e512c8290f'),
('6', 'Island', NULL, '6', 'Island is used for islands and atolls which don''t form subdivisions of their own, e.g. Skye. These are not considered when displaying the parent areas for a given area.', '3f8e7b66-058b-369b-9834-ffa5fcba5641'),
('8', 'Military base', NULL, '8', 'Used for any military bases that are large enough to be considered an area, not just a place.', 'bbb27bc1-f21c-42a9-89ce-e9d986d60b46'),
('9', 'Indigenous territory / reserve', NULL, '9', 'Used for semi-autonomous territories governed by indigenous peoples, such as Indian reserves/reservations in North America and indigenous territories in Central and South America.', '9bdda430-e4d4-464a-94a9-084a452ea8ea');