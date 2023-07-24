-- Количество исполнителей в каждом жанре
SELECT COUNT(performer_name), genre_name
FROM performer_ganre
INNER JOIN performer ON performer_ganre.performer_id = performer.performer_id
INNER JOIN genre ON performer_ganre.genre_id = genre.genre_id
GROUP BY genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(track_id)
FROM album
INNER JOIN track ON album.album_id = track.album_id
WHERE album_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT album_name, AVG(duration)
FROM album
INNER JOIN track ON album.album_id = track.album_id
GROUP BY album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT performer_name
FROM performer
WHERE performer_name NOT IN(
SELECT performer_name
FROM album
INNER JOIN performer_album ON album.album_id = performer_album.album_id
INNER JOIN performer ON performer_album.performer_id = performer.performer_id
WHERE album_year = 2020)

--Названия сборников, в которых присутствует конкретный исполнитель ('Виктор Цой')
SELECT collection_name, performer_name
FROM collection
INNER JOIN track_collection ON collection.collection_id = track_collection.collection_id
INNER JOIN track ON track_collection.track_id = track.track_id
INNER JOIN album ON track.album_id = album.album_id
INNER JOIN performer_album ON album.album_id = performer_album.album_id
INNER JOIN performer ON performer_album.performer_id = performer.performer_id
WHERE performer_name = 'Виктор Цой'
GROUP BY performer_name, collection_name















