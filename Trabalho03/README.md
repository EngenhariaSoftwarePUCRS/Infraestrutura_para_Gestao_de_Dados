## T3 | Etapa 1 | Seleção e modelagem de dados

### Primeira fonte de dados

[MusicBrainz Database](https://musicbrainz.org/doc/MusicBrainz_Database)

The MusicBrainz Database is built on the PostgreSQL relational database engine and contains all of MusicBrainz' music metadata. This data includes information about artists, release groups, releases, recordings, works, and labels, as well as the many relationships between them. The database also contains a full history of all the changes that the MusicBrainz community has made to the data.

#### Data dumps

https://data.metabrainz.org/pub/musicbrainz/data/fullexport/20241127-001710/

#### Esquema lógico/físico do banco de dados relacional

![MusicBrainz Official Schema](https://musicbrainz.org/doc/MusicBrainz_Database/Schema)

Overview
The SQL scripts that create the schema can be found in our [source code repository](https://github.com/metabrainz/musicbrainz-server/tree/master/admin/sql).

The database is structured around primary entities which can be edited, searched for, referred to by MBID, and linked to each other through [relationships](https://musicbrainz.org/doc/Relationships) or foreign key constraints in some case. Secondary entities cannot be linked through relationships, instead they are directly linked through foreign key constraints only. Each primary entity type has a main table sometimes accompanied by complementary tables of which a few are unique but most are common.

- The first diagram below shows the main tables for primary entity types and unique tables connecting these tables, that is, beyond relationships. The main tables are highlighted. All tables are shortened to focus on foreign key constraints.
- The second diagram additionally shows the main tables for primary entity types and tables unique to some of these, that is, beyond aliases, annotations, edits, redirects, relationships, ratings, tags.

![MusicBrainz Entity Network Overview](./images/entity_network_overview.svg)

![MusicBrainz Entity Network Details](./images/entity_network_details.svg)

Primary entities
Each primary entity has a main table with the same name as the entity, containing its basic data.

**Artist**
![Artist](./images/artist_entity_details.svg)
Tables for the “artist” core entity type properties	An artist is generally a musician, a group of musicians, or another music professional (composer, engineer, illustrator, producer, etc.)
The tables artist_release and artist_release_group are materialized (m).

**Event**
![Event](./images/event_entity_details.svg)
Tables for the “event” core entity type properties	An event refers to an organised event which people can attend, and is relevant to MusicBrainz. Generally this means live performances, like concerts and festivals.

**Genre**
![Genre](./images/genre_entity_details.svg)
Tables for the “genre” core entity type properties	A genre is a descriptor for the style and conventions followed by a piece of music.

**Instrument**
![Instrument](./images/instrument_entity_details.svg)
Tables for the “instrument” core entity type properties	Instruments are devices created or adapted to make musical sounds. We also list common instrument groupings (such as string quartet) as instruments.

#### Elaboração do script SQL-DDL para criação das tabelas

#### Elaboração do script SQL-DML para inserção de dados nas tabelas
