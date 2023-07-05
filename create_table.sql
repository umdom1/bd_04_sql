CREATE TABLE IF NOT EXISTS performer
(
	performer_id integer PRIMARY KEY,
  	performer_name varchar(20) NOT NULL
);

CREATE TABLE if NOT EXISTS genre
(
	genre_id integer PRIMARY KEY,
  	genre_name varchar(40) UNIQUE NOT NULL,
  	desckription varchar(128) NOT NULL
);

CREATE TABLE if NOT EXISTS album
(
	album_id integer PRIMARY KEY,
  	album_name varchar(40) NOT NULL,
  	album_year numeric(4,0)
);

CREATE TABLE IF NOT EXISTS track
(
	track_id integer PRIMARY KEY,
  	track_name varchar(40) Not NULL,
  	duration decimal(4,1) NOT NULL,
  	album_id integer REFERENCES album(album_id) NOT NULL
);

CREATE TABLE if not EXISTS collection
(
	collection_id integer PRIMARY KEY,
  	collection_name varchar(40) NOT NULL,
  	collection_year numeric(4,0)
);

CREATE TABLE if NOT exists performer_ganre
(
	performer_id integer REFERENCES performer(performer_id) NOT NULL,
  	genre_id integer REFERENCES genre(genre_id) NOT NULL,
  	
  	CONSTRAINT performer_ganre_pkey PRIMARY KEY (performer_id, genre_id)
);

CREATE table if not EXISTS genre_album
(
	genre_id integer REFERENCES genre(genre_id) NOT NULL,
  	album_id integer REFERENCES album(album_id) not NULL,
  
  	CONSTRAINT genre_album_pkey PRIMARY KEY (genre_id, album_id)
);

CREATE table if not EXISTS track_collection
(
	track_id integer REFERENCES track(track_id) NOT NULL,
  	collection_id integer REFERENCES collection(collection_id) NOT NULL,
  
  	CONSTRAINT track_collection_pkey PRIMARY key (track_id, collection_id)
)