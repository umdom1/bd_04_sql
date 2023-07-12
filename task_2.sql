-- Название и продолжительность самого длительного трека
SELECT track_name, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name
FROM track
WHERE duration/60 >= 3.5;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name, collection_year
FROM collection
WHERE collection_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT performer_name
FROM performer
WHERE performer_name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name
FROM track
WHERE track_name ILIKE 'мой %'
OR track_name ILIKE '% мой %'
OR track_name ILIKE '% мой'
OR LOWER(track_name) = 'мой'





